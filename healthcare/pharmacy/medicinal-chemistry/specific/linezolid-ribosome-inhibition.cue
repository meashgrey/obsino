package specific

linezolid_ribosome_inhibition: {
  content: #"""
    *Linezolid* is a synthetic oxazolidinone antibacterial agent that primarily
    targets susceptible Gram-positive bacteria, including methicillin-resistant
    Staphylococcus aureus and vancomycin-resistant enterococci. Its molecular
    target is the bacterial ribosome, rather than DNA replication or cell-wall
    synthesis.

    == The bacterial translation apparatus

    The bacterial 70S ribosome consists of a 30S small subunit containing 16S
    rRNA and a 50S large subunit containing 23S and 5S rRNAs. During canonical
    translation initiation, the 30S initiation complex positions the initiator
    formylmethionyl-tRNA at the P site; joining of the 50S subunit generates
    a 70S initiation complex. The A site subsequently accommodates incoming
    aminoacyl-tRNA, and the peptidyl transferase center (PTC) of the 50S
    subunit catalyzes peptide-bond formation. The PTC is formed primarily
    from domain V of 23S rRNA.

    == Binding of linezolid to the peptidyl transferase center

    Linezolid occupies a pocket in the A-site region of the 50S PTC, close
    to the aminoacyl end of incoming A-site tRNA. Structural analyses show
    that the drug overlaps the space required for correct accommodation
    of the tRNA acceptor end and can alter local 23S rRNA conformations.
    Consequently, productive tRNA positioning and peptide-bond formation
    are impaired. The resulting reduction in translation is especially
    associated with the formation of productive initiation complexes and
    early peptide synthesis, although ribosome-state- and nascent-peptide-
    dependent inhibition has also been observed. It is therefore inaccurate
    to describe the molecular mechanism solely as prevention of physical
    association between 30S and 50S subunits.

    #align(center)[
      #figure(
        image("figures://linezolid-ribosome-binding", width: 48%),
        caption: [Ribosome architecture and linezolid overlap with the A-site tRNA
          accommodation region in Staphylococcus aureus. Belousoff et al.,
          mBio 8, e00395-17 (2017), Figure 1. The panel includes a composite
          representation based on PDB 4WFA and 4V5D.]
      )
    ]

    == Chemical scaffold and molecular recognition

    Linezolid contains an oxazolidin-2-one heterocycle, a fluorinated
    aromatic ring, a morpholine substituent, and an acetamidomethyl side
    chain. Its antibacterial activity depends on the spatial organization
    and stereochemistry of this scaffold. The marketed drug has the
    (S)-configuration at the stereogenic carbon of the oxazolidinone ring.
    Unlike substrate analogues that compete with a soluble metabolic
    enzyme, linezolid recognizes a three-dimensional RNA-rich pocket
    in a macromolecular ribonucleoprotein assembly.

    #align(center)[
      #figure(
        michem.smiles(
          "CC(=O)NC[C@H]1CN(C(=O)O1)c2cc(F)c(N3CCOCC3)cc2",
          style: michem.style(font: "Libertinus Serif"),
          width: 31%,
        ),
        caption: [Linezolid: chiral oxazolidinone antibacterial scaffold.
          The SMILES encodes the stereogenic center; verify the rendered
          stereochemical orientation against the (S)-linezolid reference.]
      )
    ]

    == Selectivity and mitochondrial toxicity

    Cytosolic human ribosomes are 80S particles with a distinct rRNA
    architecture, providing an important basis for antibacterial
    selectivity. Human mitochondrial translation machinery retains
    bacterial evolutionary features and can also be affected by
    linezolid. Mitochondrial protein synthesis inhibition contributes
    mechanistically to adverse effects associated with prolonged
    exposure, including myelosuppression, peripheral or optic
    neuropathy, and lactic acidosis.

    == Resistance at the RNA binding site

    Mutations within domain V of 23S rRNA, notably G2576T in the
    conventional Escherichia coli numbering system, can reduce
    susceptibility to linezolid. The Cfr methyltransferase modifies
    A2503 in 23S rRNA and can interfere with recognition by multiple
    PTC-binding antibacterial classes. Acquired ABC-F ribosome
    protection proteins encoded by optrA and poxtA can also confer
    resistance. Changes in nearby ribosomal proteins, including L3
    and L4, can indirectly remodel the PTC. These mechanisms illustrate
    that resistance may arise through target mutation, enzymatic
    modification, or ribosome protection rather than drug destruction.

    == Pharmacological interpretation

    Linezolid is usually bacteriostatic against staphylococci and
    enterococci, although bactericidal effects can occur against
    susceptible streptococci. The distinction depends on organism
    and assay conditions. Its activity against resistant Gram-positive
    pathogens makes it clinically important, but treatment decisions
    require organism susceptibility and patient-specific safety review.

    == References

    - #link("https://pmc.ncbi.nlm.nih.gov/articles/PMC5424203/")[Belousoff et al. (2017), Structural Basis for Linezolid Binding Site Rearrangement in the Staphylococcus aureus Ribosome]
    - #link("https://pmc.ncbi.nlm.nih.gov/articles/PMC3264260/")[Long and Vester (2012), Resistance to Linezolid Caused by Modifications at Its Binding Site on the Ribosome]
    - #link("https://pmc.ncbi.nlm.nih.gov/articles/PMC4888801/")[Munita and Arias (2016), Mechanisms of Antibiotic Resistance]
    - #link("https://pmc.ncbi.nlm.nih.gov/articles/PMC11325235/")[Structural basis of Cfr-mediated antimicrobial resistance]
    - #link("https://www.rcsb.org/structure/4WFA")[RCSB PDB 4WFA: linezolid-bound bacterial ribosome]
    """#
  related: ["concept/medicinal-chemistry"]
  external_link: [
    "https://pmc.ncbi.nlm.nih.gov/articles/PMC5424203/",
    "https://pmc.ncbi.nlm.nih.gov/articles/PMC3264260/",
    "https://pmc.ncbi.nlm.nih.gov/articles/PMC4888801/",
    "https://www.rcsb.org/structure/4WFA",
  ]
}
