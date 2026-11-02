#import "@preview/michem:0.1.0" as michem

#align(center)[
  #michem.compound-grid(
    michem.compound("CC", name: [Ethane: C–C, one σ bond]),
    michem.compound("C=C", name: [Ethene: C=C, one σ + one π bond]),
    columns: 2,
    font: "Libertinus Serif",
    atom-size: 9pt,
    label-size: 9pt,
    bond-length: 20pt,
    gutter: 24pt,
  )
]
