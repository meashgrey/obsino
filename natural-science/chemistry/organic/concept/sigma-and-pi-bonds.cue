package concept

sigma_and_pi_bonds: {
  content: """
    A covalent bond (共价键) forms when atoms share electrons. In a structural
    formula, one line represents one bond and two lines represent a double bond.

    A *sigma bond* ($σ$ bond, σ键) forms when orbitals overlap head-on along the
    line joining two nuclei. Every carbon–carbon single bond contains one σ
    bond. A *pi bond* ($π$ bond, π键) forms when two parallel $p$ orbitals
    overlap side by side. Its shared electron density lies above and below the
    line joining the nuclei.

    A carbon–carbon double bond therefore consists of *one σ bond and one π
    bond*; it is not two σ bonds. A triple bond consists of one σ bond and two
    π bonds.

    \(figure_part_sigma_pi_examples)

    Twisting a π bond out of alignment removes the side-by-side orbital overlap,
    so a double bond cannot rotate freely. The σ bond remains along the axis
    between the nuclei. This is why rotation around a C=C bond requires much
    more energy than rotation around a C–C single bond.

    In conjugated molecules, neighboring $p$ orbitals can overlap across several
    atoms. The π electrons then spread over that region instead of belonging to
    only one double bond. In 1,3-butadiene this gives the central C2–C3 bond
    partial double-bond character, as described by resonance contributors.
  """
  figure_part_sigma_pi_examples: """
    #let sigma-pi-examples = "assets/typst/sigma-pi-examples.typ"
    #eval(
      str(read(sigma-pi-examples)),
      mode: "markup"
    )
  """
  related: [
    "concept/atomic-and-molecular-orbitals",
    "concept/dienes-and-polyenes",
    "concept/resonance-in-conjugated-dienes",
  ]
}
