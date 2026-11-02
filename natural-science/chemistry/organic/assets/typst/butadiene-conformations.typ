#import "@preview/michem:0.1.0" as michem

#let structure-style = michem.style(font: "Libertinus Serif") + (
  "font-size": 12,
  "bond-length": 20pt / 0.75pt,
)

#let s-trans = michem.smiles-input("C=CC=C", positions: (
  (-0.5, 0.866),
  (0, 0),
  (1, 0),
  (1.5, -0.866),
))
#let s-cis = michem.smiles-input("C=CC=C", positions: (
  (-0.5, 0.866),
  (0, 0),
  (1, 0),
  (1.5, 0.866),
))

#align(center)[
  #michem.compound-grid(
    michem.compound(s-trans, name: [*s*-trans]),
    michem.compound(s-cis, name: [*s*-cis]),
    columns: 2,
    font: "Libertinus Serif",
    atom-size: 9pt,
    label-size: 10pt,
    bond-length: 20pt,
    gutter: 36pt,
  )
]
