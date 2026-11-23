"""Apply the CUE formatter and use two spaces for each indentation level."""

import argparse
from os.path import commonprefix
from pathlib import Path
import re
import subprocess
import sys


ROOT = Path(__file__).resolve().parent.parent
# CUE multiline literals start after the opening delimiter's newline and
# close on a line whose whitespace prefix is removed from the decoded value.
OPEN = re.compile(r"(?<![\"'#])(?P<hashes>#*)(?P<quote>\"{3}|'{3})[ \t]*$")
INDENT = re.compile(r"[ \t]*")
TYPST_FIELD = re.compile(r"(?:content|figure_part(?:_\w+)?)\s*:")


def indent(line):
    return INDENT.match(line)[0]


def two_spaces(source):
    lines = iter(source.splitlines(keepends=True))
    output = []
    for line in lines:
        leading = indent(line)
        prefix = leading.replace("\t", "  ")
        rest = line[len(leading):]
        output.append(prefix + rest)
        opening = OPEN.search(rest.rstrip("\r\n"))
        if not opening or rest.startswith("//"):
            continue

        delimiter = opening["quote"] + opening["hashes"]
        body = []
        for body_line in lines:
            closing_prefix = indent(body_line)
            closing_text = body_line[len(closing_prefix):]
            if closing_text.startswith(delimiter):
                break
            body.append(body_line)
        else:
            raise ValueError("unclosed multiline literal")

        if any(line.strip() and not line.startswith(closing_prefix) for line in body):
            raise ValueError("multiline literal has inconsistent indentation")

        # Rebase the literal as a unit. Whitespace beyond the closing prefix
        # belongs to the payload and must survive, including code blocks.
        literal_prefix = prefix + "  "
        body_prefix = closing_prefix
        if TYPST_FIELD.match(rest):
            # A shared margin in a Typst fragment is source indentation.
            # Keep relative indentation inside lists, figures and code blocks.
            body_prefix = commonprefix([indent(line) for line in body if line.strip()])
        output.extend(
            literal_prefix + line[len(body_prefix):]
            if line.startswith(body_prefix) and line.strip("\r\n")
            else line
            for line in body
        )
        output.append(literal_prefix + closing_text)
    return "".join(output)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true", help="report files that need formatting")
    parser.add_argument("files", nargs="*", type=Path, help="default: Git-tracked .cue files")
    args = parser.parse_args()
    files = args.files
    if not files:
        tracked = subprocess.check_output(
            ["git", "ls-files", "-z", "--", "*.cue"], cwd=ROOT,
        )
        files = [ROOT / Path(name.decode()) for name in tracked.split(b"\0") if name]

    updates = []
    failed = False
    for file in files:
        try:
            source = file.read_text(encoding="utf-8")
            canonical = subprocess.run(
                ["cue", "fmt", "-"], input=source, text=True,
                capture_output=True, check=True,
            ).stdout
            formatted = two_spaces(canonical)
            if formatted != source:
                updates.append((file, formatted))
        except (OSError, ValueError, subprocess.CalledProcessError) as error:
            print(f"{file}: {getattr(error, 'stderr', None) or error}", file=sys.stderr)
            failed = True
    if failed:
        return 1
    for file, formatted in updates:
        if not args.check:
            file.write_text(formatted, encoding="utf-8")
        print(file.relative_to(ROOT) if file.is_relative_to(ROOT) else file)
    return int(args.check and bool(updates))


if __name__ == "__main__":
    sys.exit(main())
