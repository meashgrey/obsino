#import "@preview/michem:0.1.0" as michem

#let structure-style = michem.style(font: "Libertinus Serif") + (
  "font-size": 12,
  "bond-length": 20pt / 0.75pt,
)
#let base-pair = michem.atom-ref("hydroxide", 0, offset: (-6, 0))
#figure(
  align(center)[
    #michem.mechanism(
      michem.mol(
        "acetone",
        michem.smiles-input("C(=O)(C[H])C", positions: (
          (0, 0),
          (0, 1),
          (1, -0.5),
          (2, -0.5),
          (-1, -0.5),
        )),
        at: (0pt, 0pt),
        style: structure-style,
      ),
      michem.mol(
        "hydroxide",
        "[OH-]",
        at: (65pt, 0pt),
        style: structure-style,
      ),
      michem.mol(
        "enolate",
        "CC(=C)[O-]",
        at: (160pt, 0pt),
        style: structure-style,
      ),
      michem.mol("water", "O", at: (220pt, 0pt), style: structure-style),
      michem.lone-pair(base-pair, angle: 180deg, separation: 3),
      michem.electron-arrow(
        base-pair,
        michem.atom-ref("acetone", 3),
        bend: 16,
      ),
      michem.electron-arrow(
        michem.bond-ref("acetone", 2, 3),
        michem.bond-ref("acetone", 0, 2),
        bend: -18,
      ),
      michem.electron-arrow(
        michem.bond-ref("acetone", 0, 1),
        michem.atom-ref("acetone", 1),
        bend: 18,
      ),
      michem.reaction-arrow(
        (105pt, 0pt),
        (120pt, 0pt),
      ),
      font: "Libertinus Serif",
      padding: 8pt,
    )
  ],
  caption: [Base-promoted deprotonation of acetone. The C-H bond electrons form
  the C=C bond, the carbonyl pi electrons move to oxygen, and hydroxide becomes water.],
)
