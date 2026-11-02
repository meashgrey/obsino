package concept

alpha_carbon_acidity: {
  content: """
    A *carbonyl compound* contains a carbonyl group, $"C=O"$. The carbon directly
    attached to the carbonyl carbon is the *alpha carbon* ($"C"_alpha$), and a
    hydrogen bonded to it is an *alpha hydrogen*. Removing an alpha hydrogen
    forms a conjugate base called an *enolate ion*.

    === Comparing C-H acidity

    Acidity is compared using $upright("pK")_a$: a lower $upright("pK")_a$
    means a stronger acid. The values below are approximate; solvent and
    molecular structure affect the measured values, so comparisons are most
    reliable on the same reference scale.

    #table(
      columns: 3,
      align: (center, center, center),
      [Acidic C-H bond], [Example], [Approximate $upright("pK")_a$],
      [Alpha C-H next to a carbonyl], [Aldehydes and ketones], [16-20],
      [Terminal alkyne C-H], [R-C≡C-H], [25],
      [Vinylic C-H], [C=C-H], [44],
      [Alkane C-H], [C-C-H], [50],
    )

    The alpha C-H bond next to a carbonyl is more acidic than an ordinary
    alkene or alkane C-H bond. Its conjugate base is stabilized in two ways:
    the carbonyl group withdraws electron density inductively, and the
    negative charge can be delocalized by resonance onto the carbonyl oxygen.

    A terminal alkyne is more acidic than an alkene or an alkane because its
    conjugate base places the negative charge on an
    $upright("sp")$-hybridized carbon.
    The greater $s$ character holds electron density closer to the nucleus.
    This explains the trend
    $upright("sp") > upright("sp")^2 > upright("sp")^3$ in C-H acidity;
    carbonyl alpha-hydrogens are unusually acidic because their conjugate
    bases gain additional resonance stabilization.

    === Representative carbonyl compounds

    These approximate values illustrate how alpha-hydrogen acidity varies
    among carbonyl compounds. The alpha hydrogen is on the carbon adjacent to
    the $C=O$ group.

    \(figure_part_representative_carbonyl_compounds)

    === How an enolate forms

    A base removes an alpha proton. The electrons in the C-H bond form a
    carbon-carbon double bond while the carbonyl pi electrons move onto oxygen.
    The three curved-arrow steps happen together:

    - the base lone pair forms a bond to the alpha proton;
    - the C-H bond electrons form a bond between the alpha carbon and the
      carbonyl carbon;
    - the C=O pi electrons move to oxygen.

    \(figure_part_enolate_formation)

    For acetone, the resulting enolate has two resonance contributors:

    \(figure_part_enolate_resonance)

    These are *resonance contributors*, not two separate ions in equilibrium.
    The real enolate is a resonance hybrid with electron density shared across
    the oxygen-carbon-carbon framework. The oxygen-centered contributor is
    especially important because oxygen is more electronegative than carbon.

    Enolate formation is an acid-base equilibrium. A stronger base favors
    deprotonation when its conjugate acid has a higher $upright("pK")_a$ than the
    carbonyl compound's alpha hydrogen. Thus, although alpha hydrogens are
    much more acidic than alkane hydrogens, simple ketones still require a
    sufficiently strong base for substantial enolate formation.

    Greater alkyl substitution can stabilize an enolate's carbon-carbon double
    bond through hyperconjugation. This is one factor that can make a
    particular alpha hydrogen slightly more acidic, but substituent effects
    and solvation also matter; the trend should not be treated as a universal
    rule for all carbonyl compounds. For example, the endocyclic enolate of
    cyclohexanone has a more substituted carbon-carbon double bond than the
    enolate of acetone, which can contribute to its relative stabilization.
  """
  figure_part_representative_carbonyl_compounds: #"""
    #let representative-carbonyl-compounds = "assets/typst/representative-carbonyl-compounds.typ"
    #eval(
      str(read(representative-carbonyl-compounds)),
      mode: "markup"
    )
  """#
  figure_part_enolate_formation: #"""
    #let enolate-formation = "assets/typst/enolate-formation.typ"
    #eval(
      str(read(enolate-formation)),
      mode: "markup"
    )
  """#
  figure_part_enolate_resonance: #"""
    #let enolate-resonance = "assets/typst/enolate-resonance.typ"
    #eval(
      str(read(enolate-resonance)),
      mode: "markup"
    )
  """#
}
