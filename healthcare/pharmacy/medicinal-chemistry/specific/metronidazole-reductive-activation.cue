package specific

metronidazole_reductive_activation: {
  content: #"""
    *Metronidazole* is a 5-nitroimidazole antimicrobial agent with activity
    against many obligate anaerobic bacteria and selected protozoa. It is
    a bioreductively activated compound: intracellular electron transfer
    converts the nitro substituent into reactive intermediates that impair
    microbial viability.

    == Chemical structure and activation requirement

    #align(center)[
      #figure(
        michem.smiles(
          "Cc1ncc([N+](=O)[O-])n1CCO",
          style: michem.style(font: "Libertinus Serif"),
          width: 26%,
        ),
        caption: [Metronidazole, 1-(2-hydroxyethyl)-2-methyl-5-nitroimidazole.
          The nitro group is the bioreductive activation handle.]
      )
    ]

    The drug enters susceptible cells largely by diffusion. Low-potential
    electron-transfer systems, including reduced ferredoxin in organisms
    possessing pyruvate:ferredoxin oxidoreductase (PFOR), can donate electrons
    to its nitro group. PFOR is particularly well studied in anaerobic
    protozoa; anaerobic bacteria may use different reductases and electron
    donors. Thus PFOR is an illustrative pathway, not a universal bacterial
    requirement.

    == Reduction chemistry and oxygen dependence

    The initial one-electron reduction can be represented schematically as

    $ "R-NO"_2 + e^- arrow.r "R-NO"_2^(bullet -) $

    The resulting nitro radical anion may undergo further reductions to
    nitroso and hydroxylamine derivatives. The proportions and identities
    of biologically active intermediates vary with organism and conditions.
    Molecular oxygen can reoxidize the nitro radical anion:

    $ "R-NO"_2^(bullet -) + "O"_2 arrow.r "R-NO"_2 + "O"_2^(bullet -) $

    This oxygen-dependent futile redox cycle competes with productive
    activation and contributes to the drug's selectivity for anaerobic
    organisms.

    #align(center)[
      #figure(
        block(width: 64%, inset: 8pt, stroke: 0.5pt + luma(170))[
          #align(center)[
            *Pyruvate oxidation / reduced electron carriers* \
            $arrow.down$ \
            *Metronidazole nitro-group reduction* \
            $arrow.down$ \
            *Reactive reduced intermediates* \
            $arrow.down$ \
            *DNA damage and impaired nucleic-acid synthesis*
          ]
        ],
        caption: [Simplified bioreductive activation scheme. The electron
          donors and intermediates differ among susceptible organisms.]
      )
    ]

    == Cellular injury and antibacterial selectivity

    Reduced metronidazole species interact with DNA and are associated
    with strand breaks, disrupted nucleic-acid synthesis, and bacterial
    killing. Additional thiol and protein reactions may contribute,
    although the exact lethal chemistry remains incompletely resolved.
    Metronidazole is not a direct inhibitor of DNA gyrase or a conventional
    competitive inhibitor of DNA polymerase.

    Oxygen exposure, altered reductive activation, changes in uptake,
    drug inactivation, and enhanced DNA repair can influence resistance
    and susceptibility. Clinically, metronidazole is generally bactericidal
    against susceptible anaerobic bacteria and is also used for several
    protozoal infections.

    == Published biochemical illustrations

    The mechanism diagrams in the following publications depict the
    reduction intermediates and electron-transfer pathways. These links
    are retained as figure sources rather than embedding unverified image
    endpoints in the compiled handbook:

    - #link("https://pmc.ncbi.nlm.nih.gov/articles/PMC13711503/")[Mechanistic insights into metronidazole activation (2026), Figures 1 and 2]
    - #link("https://www.accessdata.fda.gov/drugsatfda_docs/nda/2017/209363Orig1s000MicroR.pdf")[FDA microbiology review (2017), Figure 2: anaerobic redox activation]
    - #link("https://pmc.ncbi.nlm.nih.gov/articles/PMC1045807/")[Edwards (1980), mechanisms of selective toxicity]
    - #link("https://www.accessdata.fda.gov/drugsatfda_docs/label/2024/020334s015lbl.pdf")[FDA metronidazole labeling: mechanism and resistance]
  """#
  related: ["concept/medicinal-chemistry"]
  external_link: [
    "https://pmc.ncbi.nlm.nih.gov/articles/PMC13711503/",
    "https://pmc.ncbi.nlm.nih.gov/articles/PMC1045807/",
    "https://www.accessdata.fda.gov/drugsatfda_docs/nda/2017/209363Orig1s000MicroR.pdf"
  ]
}
