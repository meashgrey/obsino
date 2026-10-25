package concept

alpha_carbon_acidity: {
  content: #"""
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

    #table(
      columns: 3,
      align: (center, center, center),
      [Compound], [Structure], [Approximate alpha-H $upright("pK")_a$],
      [Acetaldehyde], image("smiles://CC=O", width: 25mm), [16.7],
      [Acetone], image("smiles://CC(=O)C", width: 25mm), [19.3],
      [Acetophenone], image("smiles://CC(=O)c1ccccc1", width: 25mm), [18.3],
      [Cyclohexanone], image("smiles://O=C1CCCCC1", width: 25mm), [18.1],
    )

    === How an enolate forms

    A base removes an alpha proton. The electrons in the C-H bond form a
    carbon-carbon double bond while the carbonyl pi electrons move onto oxygen.
    The three curved-arrow steps happen together:

    - the base lone pair forms a bond to the alpha proton;
    - the C-H bond electrons form a bond between the alpha carbon and the
      carbonyl carbon;
    - the C=O pi electrons move to oxygen.

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
          scale: 1.5,
        ),
        michem.mol("hydroxide", "[OH-]", at: (65pt, 0pt), scale: 1.5),
        michem.mol(
          "enolate",
          "CC(=C)[O-]",
          at: (160pt, 0pt),
          scale: 1.5,
        ),
        michem.mol("water", "O", at: (220pt, 0pt), scale: 1.5),
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

    For acetone, the resulting enolate has two resonance contributors:

    #table(
      columns: 2,
      align: (center, center),
      [Negative charge drawn on oxygen], [Negative charge drawn on the alpha carbon],
      image("smiles://C=C([O-])C", width: 35mm),
      image("smiles://CC(=O)[CH2-]", width: 35mm),
    )

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
  """#
}
