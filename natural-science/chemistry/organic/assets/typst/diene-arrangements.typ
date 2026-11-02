#import "@preview/michem:0.1.0" as michem

#align(center)[
  #michem.compound-grid(
    michem.compound("C=C=C", name: [Cumulated\ allene]),
    michem.compound("C=CC=C", name: [Conjugated\ buta-1,3-diene]),
    michem.compound("C=CCC=C", name: [Isolated\ penta-1,4-diene]),
    columns: 3,
    font: "Libertinus Serif",
    atom-size: 9pt,
    label-size: 9pt,
    bond-length: 20pt,
    gutter: 18pt,
  )
]
