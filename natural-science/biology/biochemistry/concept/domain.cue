package concept

domain: {
  content: """
    A *protein domain* is a distinct, independently folded, stable structural unit
    within a polypeptide chain that typically folds autonomously, retains its
    characteristic three-dimensional structure even when separated from the rest
    of the protein, and often performs a specific biochemical or functional role
    (e.g. binding, catalysis, localization).

    - *$β$ barrel* is a single domain of $α$-hemolysin ($α$-溶血素, a toxin that
      kills a cell by creating a hole in its membrane) from the bacterium
      #math.italic("Staphylococcus aureus") (金黄葡萄球菌)

    \(figure_part_beta_barrel)
  """
  figure_part_beta_barrel: #"""
    #align(center)[
      #stack(dir: ltr)[
        #box(width: 70%)[
          #figure(
            image("figures://beta-barrel-in-extra-superfolder-gfp"),
            caption: "Beta Barrel in Extra-superfolder GFP"
          )
        ]
      ]
    ]
  """#
  related: [
    "concept/motif",
    "concept/tertiary-structure",
  ]
}
