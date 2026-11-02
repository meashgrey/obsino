#import "@preview/michem:0.1.0" as michem

#align(center)[
  #michem.compound-grid(
    michem.compound("C=C([O-])C", name: [O-centered contributor]),
    michem.compound("CC(=O)[CH2-]", name: [C-centered contributor]),
    columns: 2,
    font: "Libertinus Serif",
    atom-size: 9pt,
    label-size: 9pt,
    bond-length: 20pt,
    gutter: 24pt,
  )
]
