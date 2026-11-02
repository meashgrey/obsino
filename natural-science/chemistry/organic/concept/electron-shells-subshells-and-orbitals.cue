package concept

electron_shells_subshells_and_orbitals: {
  content: """
    An atom has a tiny nucleus containing protons and neutrons, with electrons
    described by quantum states around it. We organize these states into three
    nested levels: *shells*, *subshells*, and *orbitals*. These are labels for
    allowed electron states, not physical containers or paths around the
    nucleus.

    === 1. Shells: the main energy levels

    A *shell* is a group of electron states with the same principal quantum
    number, written $n = 1, 2, 3, ...$. A larger $n$ generally means the
    electron distribution extends farther from the nucleus and has higher
    energy. The first shell is closest to the nucleus; the second shell is
    farther out, on average.

    A shell can contain subshells, and each shell has a maximum capacity of
    $2n^2$ electrons: shell 1 can hold 2, shell 2 can hold 8, and shell 3 can
    hold 18. This is a capacity, not a rule that every atom fills one complete
    shell before any electron enters the next. The energies of subshells from
    neighboring shells can overlap, so electron filling follows energy order.

    === 2. Subshells: types within a shell

    A *subshell* is a group of orbitals within a shell. Subshells are named
    $s$, $p$, $d$, and $f$. The shell number comes first, so $1s$ means the
    $s$ subshell in shell 1, and $2p$ means the $p$ subshell in shell 2.
    Shell 1 has only $1s$; shell 2 has $2s$ and $2p$; shell 3 has $3s$,
    $3p$, and $3d$.

    The labels $s$, $p$, $d$, and $f$ distinguish subshell types and their
    characteristic angular shapes. They do not mean shells or individual
    orbitals. Each type contains a fixed number of orbitals:

    #let subshell-shapes = "assets/typst/subshell-orbital-shapes.typ"
    #eval(
      str(read(subshell-shapes)),
      mode: "markup"
    )

    #align(center)[
      #table(
        columns: 3,
        align: (center, center, center),
        [Subshell], [Number of orbitals], [Maximum electrons],
        [$s$], [1], [2],
        [$p$], [3], [6],
        [$d$], [5], [10],
        [$f$], [7], [14],
      )
    ]

    These drawings are simplified two-dimensional views of common orbital
    shapes. The two colors distinguish opposite wavefunction phases; they do
    not represent positive and negative electric charge. The orbitals in a
    subshell share a shape type but can point in different directions. The
    $f$ drawing shows one representative shape; $f$ orbitals have several
    possible shapes, some with a different number and arrangement of lobes.

    === 3. Orbitals: states that hold electrons

    An *orbital* is one allowed electron state in a subshell. It is described
    by a wavefunction; the squared magnitude of that wavefunction gives the
    probability density for finding the electron. An orbital drawing usually
    shows a boundary around a region where the electron is likely to be found.
    It is not a hard wall and does not show a route that the electron travels.

    Each orbital can hold at most two electrons. When two occupy the same
    orbital, they have opposite spin. A $p$ subshell has three orbitals, often
    labeled $p_x$, $p_y$, and $p_z$ to show three perpendicular orientations.
    Each can hold two electrons, so the whole $p$ subshell holds up to six.

    A $p$ orbital is often drawn as two lobes on opposite sides of the nucleus.
    The lobes have opposite *phase* (sometimes marked + and −). Those signs
    describe the wavefunction; they are not electric charges. This matters in
    bonding because orbitals with suitable shapes and phases can overlap.

    === 4. Example: the electrons in carbon

    A neutral carbon atom has six electrons. In its lowest-energy arrangement,
    they are written $1s^2 2s^2 2p^2$. The leading number names the shell, the
    letter names the subshell, and the superscript counts electrons in that
    subshell: $1s^2$ means two electrons in the $1s$ subshell.

    The $1s$ electrons are close to the nucleus and usually do not form the
    bonds discussed in introductory organic chemistry. The four electrons in
    shell 2 ($2s^2 2p^2$) are carbon's *valence electrons*. The $2p$ subshell
    has three separate orbitals; in the ground state, carbon's two $2p$
    electrons occupy separate orbitals before pairing. Bonding models such as
    hybridization then help describe how these valence states form molecular
    bonds.

    Keep the hierarchy straight: a shell contains subshells, a subshell
    contains orbitals, and each orbital holds up to two electrons. The next
    concept uses this vocabulary to explain atomic and molecular orbitals in
    covalent bonds.
  """
  related: [
    "concept/atomic-and-molecular-orbitals",
    "concept/sigma-and-pi-bonds",
  ]
}
