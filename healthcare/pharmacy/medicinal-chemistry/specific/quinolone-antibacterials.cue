package specific

quinolone_antibacterials: {
  content: #"""
    *Quinolone antibacterials* are synthetic agents that target bacterial type IIA DNA
    topoisomerases, principally DNA gyrase and topoisomerase IV. Their defining
    mechanism is stabilization of the covalent enzyme–DNA cleavage intermediate:
    quinolones are *topoisomerase poisons*, rather than simply competitive inhibitors
    of the ATP-binding site. This entry belongs to the antibacterial drug class.

    == Why bacteria require type IIA topoisomerases

    During DNA replication and transcription, local duplex unwinding generates
    positive supercoils ahead of the moving polymerase. DNA gyrase (GyrA2GyrB2)
    uses ATP-dependent double-strand passage to introduce negative supercoils
    and relieve torsional stress. Topoisomerase IV (ParC2ParE2) is particularly
    important for decatenating newly replicated circular chromosomes and also
    relaxes DNA. The principal drug target depends on bacterial species and
    compound: gyrase commonly dominates in Gram-negative bacteria, whereas
    topoisomerase IV is often the more sensitive target in Gram-positive bacteria.

    #align(center)[
      #figure(
        image("figures://quinolone-gyrase-cycle", width: 57%),
        caption: [ATP-dependent DNA gyrase strand-passage cycle, including the G-segment and T-segment. Spencer and Panda, Biomedicines 11, 371 (2023), Figure 1, CC BY 4.0.]
      )
    ]

    == Catalytic cycle and quinolone poisoning

    A gate DNA duplex (G-segment) binds the enzyme and is transiently cleaved
    on both strands. The catalytic tyrosines form phosphotyrosyl linkages to the
    DNA 5-prime ends, while a transported duplex (T-segment) passes through the
    opened gate. The G-segment is subsequently religated, and the enzyme resets
    for another catalytic cycle. Quinolones bind preferentially at the cleaved
    DNA–enzyme interface, intercalating between bases close to the break and
    reducing the rate of religation. The trapped complex blocks polymerases and
    other DNA-processing machinery; collisions and subsequent processing can
    generate persistent chromosome breaks. DNA-damage responses, including
    SOS induction, accompany this process. Sufficient DNA damage results in
    bactericidal activity.

    #align(center)[
      #figure(
        image("figures://quinolone-gyrase-bound", width: 59%),
        caption: [Ciprofloxacin in a mycobacterial gyrase–DNA cleavage complex (PDB 5BTC), illustrating drug intercalation at the DNA cleavage interface. Spencer and Panda (2023), Figure 3, CC BY 4.0.]
      )
    ]

    == Structural pharmacophore and molecular recognition

    In conventional 4-quinolone antibacterials, the C3 carboxylate and C4
    carbonyl constitute a crucial keto-acid pharmacophore. These oxygen atoms
    coordinate a noncatalytic magnesium ion, whose hydration shell forms
    hydrogen bonds with a conserved serine and acidic residue of the enzyme.
    In Escherichia coli GyrA these residues are Ser83 and Asp87; the
    corresponding positions in Acinetobacter baumannii ParC are Ser84 and
    Glu88. This *water–metal ion bridge* helps position the drug in the
    protein–DNA cleavage interface. Drug–DNA base stacking provides additional
    recognition. The noncatalytic bridge magnesium should be distinguished
    from metal ions participating directly in the cleavage chemistry.

    #align(center)[
      #figure(
        image("figures://quinolone-metal-bridge", width: 55%),
        caption: [Structural arrangement of a fluoroquinolone, hydrated Mg2+, and conserved topoisomerase residues. Aldred et al., Mechanism of Quinolone Action and Resistance (2014), Figure 5; source article linked below.]
      )
    ]

    == Representative molecules and structure–activity relationships

    Nalidixic acid is an early nonfluorinated 1,8-naphthyridone, used historically
    for susceptible urinary pathogens. Norfloxacin introduces a C6 fluorine and
    C7 piperazine; ciprofloxacin replaces the N1 ethyl group with cyclopropyl
    while retaining C6 fluorine and C7 piperazine. Levofloxacin is the active
    S-enantiomer of ofloxacin, with a fused oxygen-containing ring.
    Moxifloxacin includes C8 methoxy and a bicyclic C7 amine substituent.
    Generation labels differ between reference systems, so structural features
    and individual drug spectra are more reproducible descriptors than a
    generation number.

    #align(center)[
      #figure(
        michem.smiles(
          "CCn1cc(C(=O)O)c(=O)c2ccc(C)nc21",
          style: michem.style(font: "Libertinus Serif"),
          width: 24%,
        ),
        caption: [Nalidixic acid: an early nonfluorinated naphthyridone antibacterial.]
      )
    ]

    #align(center)[
      #figure(
        michem.smiles(
          "O=C(O)C1=CN(CC2CC2)C2=CC(N3CCNCC3)=C(F)C=C2C1=O",
          style: michem.style(font: "Libertinus Serif"),
          width: 29%,
        ),
        caption: [Ciprofloxacin: N1 cyclopropyl, C6 fluoro, and C7 piperazinyl substituents.]
      )
    ]

    Substitution at N1, C7, and C8 can modulate antibacterial potency, target
    preference, permeability, efflux susceptibility, pharmacokinetics, and
    adverse effects. A C6 fluorine is important in many classic fluoroquinolones,
    but is not a universal requirement for activity. The C3/C4 keto-acid
    interaction is comparatively conserved among traditional quinolones.

    == Resistance and selectivity

    Mutations in the quinolone-resistance-determining regions (QRDRs) of GyrA
    or ParC can weaken the water–metal ion bridge or change drug positioning.
    E. coli GyrA Ser83 and Asp87 are important examples. Additional resistance
    mechanisms include reduced entry through outer-membrane porins, increased
    efflux, and plasmid-mediated Qnr proteins that protect topoisomerases.
    Multiple mechanisms may accumulate in one isolate.

    Human cells possess type II DNA topoisomerases, but the structural
    environment responsible for typical quinolone recognition differs from
    bacterial gyrase and topoisomerase IV. This contributes to selective
    antibacterial activity. Fluoroquinolones nevertheless have clinically
    significant adverse effects, including tendinopathy, peripheral neuropathy,
    central nervous system effects, and drug-specific QT prolongation.

    == References

    - #link("https://pmc.ncbi.nlm.nih.gov/articles/PMC9953508/")[Spencer and Panda (2023), DNA Gyrase as a Target for Quinolones]
    - #link("https://pmc.ncbi.nlm.nih.gov/articles/PMC3985860/")[Aldred et al. (2014), Mechanism of Quinolone Action and Resistance]
    - #link("https://pmc.ncbi.nlm.nih.gov/articles/PMC9917921/")[Role of the Water–Metal Ion Bridge in E. coli Gyrase (2023)]
    - #link("https://pmc.ncbi.nlm.nih.gov/articles/PMC4686662/")[Structural basis of gyrase inhibition by moxifloxacin (2015)]
    - #link("https://www.rcsb.org/structure/2XKK")[RCSB PDB 2XKK: A. baumannii topoisomerase IV–DNA–moxifloxacin]
    - #link("https://www.rcsb.org/structure/5BTC")[RCSB PDB 5BTC: mycobacterial gyrase–DNA–ciprofloxacin]
  """#
  related: ["concept/medicinal-chemistry"]
  external_link: [
    "https://pmc.ncbi.nlm.nih.gov/articles/PMC9953508/",
    "https://pmc.ncbi.nlm.nih.gov/articles/PMC3985860/",
    "https://pmc.ncbi.nlm.nih.gov/articles/PMC9917921/",
    "https://www.rcsb.org/structure/2XKK"
  ]
}
