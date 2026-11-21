package specific

nitrofurantoin_nitroreductase_activation: {
  content: #"""
    *Nitrofurantoin* is a synthetic 5-nitrofuran antibacterial used mainly
    for susceptible lower urinary tract infections. Its activity depends
    on bacterial enzymatic reduction of the nitro group, which generates
    chemically reactive products affecting multiple cellular processes.

    == Molecular structure

    #align(center)[
      #figure(
        michem.smiles(
          "O=C1NC(=O)N(/N=C/c2ccc([N+](=O)[O-])o2)C1",
          style: michem.style(font: "Libertinus Serif"),
          width: 33%,
        ),
        caption: [Nitrofurantoin, a nitrofuran linked through an imine
          to a hydantoin-derived ring. The nitrofuran group undergoes
          enzyme-mediated reductive activation.]
      )
    ]

    == Bacterial nitroreductases NfsA and NfsB

    In Escherichia coli, the FMN-dependent nitroreductases NfsA and NfsB
    are important for nitrofurantoin activation. They accept reducing
    equivalents from NADPH or NADH through their flavin cofactors and
    transfer electrons to the drug. Their principal reactions proceed
    through oxygen-insensitive two-electron reduction steps, distinct
    from the classic oxygen-sensitive one-electron activation pathway
    often described for metronidazole.

    Reduction of a nitro substituent can proceed through nitroso and
    hydroxylamine oxidation states. The products can react with DNA,
    proteins, and other cellular constituents; the contribution of
    each injury mechanism depends on the organism and biochemical
    conditions.

    #align(center)[
      #figure(
        block(width: 66%, inset: 8pt, stroke: 0.5pt + luma(170))[
          #align(center)[
            *NAD(P)H and FMN-dependent NfsA / NfsB* \
            ↓ \
            *Nitrofurantoin nitro-group reduction* \
            ↓ \
            *Reactive reduced intermediates* \
            ↓ \
            *DNA, protein, and metabolic damage*
          ]
        ],
        caption: [Schematic of nitrofurantoin activation and its
          distributed cellular effects, not a single-target inhibition
          mechanism.]
      )
    ]

    == Structural evidence and biochemical mechanism

    Crystal structures of E. coli NfsA and ligand-binding studies
    support the role of the FMN cofactor and substrate orientation
    during nitroaromatic reduction. A structural study includes a
    modeled nitrofurantoin complex in its Figure 6; a modeled pose
    should not be described as a directly observed ligand-bound
    crystal structure.

    #link("https://pmc.ncbi.nlm.nih.gov/articles/PMC8286842/")[
      The structures of E. coli NfsA bound to substrates and FMN
    ] provides published structural illustrations, including the
    reduction scheme (Figure 1) and modeled nitrofurantoin binding
    (Figure 6).

    == Multiple cellular targets and resistance

    Reduced nitrofurantoin products can interfere with bacterial
    DNA integrity, protein synthesis, and central metabolic enzyme
    function. This broad injury profile differs from linezolid,
    which binds a specific ribosomal RNA pocket. Loss-of-function
    mutations in nfsA and nfsB reduce activation and are established
    resistance mechanisms in E. coli. Alterations affecting flavin
    supply and other resistance determinants can also modify
    susceptibility.

    == Pharmacokinetic basis for clinical use

    Following oral administration, nitrofurantoin achieves useful
    concentrations in urine while systemic and renal tissue
    exposures are relatively limited. It is therefore used for
    susceptible lower urinary tract infection rather than
    pyelonephritis or bloodstream infection. This distinction
    illustrates that in vitro antibacterial activity alone does
    not determine the appropriate site of treatment.

    == Published figures and references

    - #link("https://pmc.ncbi.nlm.nih.gov/articles/PMC8286842/")[NfsA structural study (2021), Figures 1 and 6]
    - #link("https://pubmed.ncbi.nlm.nih.gov/39471786/")[Unlocking Nitrofurantoin (2024), Figure 2: mechanism and resistance]
    - #link("https://pmc.ncbi.nlm.nih.gov/articles/PMC10414118/")[Nitrofurantoin narrative review (2023), Figure 3: mode of action]
  """#
  related: ["concept/medicinal-chemistry"]
  external_link: [
    "https://pmc.ncbi.nlm.nih.gov/articles/PMC8286842/",
    "https://pubmed.ncbi.nlm.nih.gov/39471786/",
    "https://pmc.ncbi.nlm.nih.gov/articles/PMC10414118/"
  ]
}
