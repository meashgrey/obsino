#import "@preview/michem:0.1.0" as michem

#align(center)[
  #michem.compound-grid(
    michem.compound("CC=O", name: [Acetaldehyde\ α-H $upright("pK")_a ≈ 16.7$]),
    michem.compound("CC(=O)C", name: [Acetone\ α-H $upright("pK")_a ≈ 19.3$]),
    michem.compound("CC(=O)c1ccccc1", name: [Acetophenone\ α-H $upright("pK")_a ≈ 18.3$]),
    michem.compound("O=C1CCCCC1", name: [Cyclohexanone\ α-H $upright("pK")_a ≈ 18.1$]),
    columns: 2,
    font: "Libertinus Serif",
    atom-size: 9pt,
    label-size: 9pt,
    bond-length: 20pt,
    gutter: 24pt,
    row-gap: 18pt,
  )
]
