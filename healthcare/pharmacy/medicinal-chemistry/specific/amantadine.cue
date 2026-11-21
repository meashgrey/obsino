package specific

amantadine: {
  content: #"""
    *Amantadine* (1-adamantanamine; PubChem CID 2130) is an adamantane-class
    antiviral and a historically important inhibitor of the influenza A virus
    M2 proton channel. Its neutral molecular formula is $"C"_("10")"H"_("17")"N"$. The
    structure combines a compact, rigid, hydrophobic tricyclic adamantane cage
    with a primary amine at a bridgehead carbon. The amine is basic and is
    protonated to a substantial extent under physiological conditions; medicinal
    formulations commonly use the hydrochloride salt. The cage provides a
    hydrophobic surface suited to the transmembrane channel environment, while
    the amine contributes a polar, ionisable centre. These features make
    amantadine a useful example for discussing the balance between scaffold
    shape, hydrophobicity, and ionisation in drug design.

    #align(center)[
      #figure(
        michem.smiles(
          "NC12CC3CC(CC(C3)C1)C2",
          style: michem.style(font: "Libertinus Serif"),
          width: 12%,
        ),
        caption: [Amantadine skeletal structure drawn from SMILES with michem]
      )
    ]

    Influenza A M2 is a proton-selective channel in the viral envelope. During
    entry into a host cell, endosomal acidification activates M2-mediated proton
    conductance into the virion. Amantadine binds within the channel pore and
    blocks proton permeation, disrupting the acidification-dependent uncoating
    step and thereby inhibiting viral replication. Its antiviral spectrum is
    narrow: it acts against susceptible influenza A viruses and does not inhibit
    influenza B through the same target, whose BM2 channel is distinct.

    Resistance is the key limitation of this mechanism. Single amino-acid
    substitutions in the M2 transmembrane region can greatly reduce drug
    susceptibility; the S31N substitution is a well-known resistance marker.
    Because adamantane resistance is widespread among circulating seasonal
    influenza A viruses, the CDC states that amantadine and rimantadine are not
    currently recommended for influenza treatment or chemoprophylaxis in the
    United States. Its classification here as an antiviral describes its
    pharmacological class and historical mechanism, not a current treatment
    recommendation.

    In the wild-type M2 pore, the protonated amine of amantadine is positioned
    to form water-mediated hydrogen bonds with two waters in the Ala30 layer.
    The crystallographic model also resolves the surrounding pore waters near
    Gly34, showing how the inhibitor engages a structured solvent network and
    occupies the channel lumen. This interaction is water-mediated; the
    published structure does not establish a direct amantadine–Ala30 hydrogen
    bond.

    #align(center)[
      #figure(
        image("figures://amantadine-wt-water-network", width: 68%),
        caption: [Wild-type M2 bound to amantadine (PDB 6BKK): simulated water positions and crystallographic water density around Ala30, Gly34, and His37. Figure 5 from Thomaston et al., 2018.]
      )
    ]

    In the S31N mutant, the Asn31 side chains point into the pore and form a
    cyclic inter-subunit hydrogen-bond network bridged by a central water. The
    substitution also introduces additional polar bulk into the adamantane
    binding region and narrows the site. The structure below is the apo S31N
    channel (PDB 5C02), not an amantadine-bound mutant complex; it therefore
    depicts the mutation-associated network and structural basis for reduced
    adamantane susceptibility rather than direct drug contacts. A separate
    view in the same study overlays this mutant structure with the amantadine-
    bound wild-type structure.

    #align(center)[
      #figure(
        image("figures://amantadine-s31n-hbond-network", width: 68%),
        caption: [Apo S31N M2 (PDB 5C02): Asn31 residues form a hydrogen-bonded ring around a central water; the pore-water network continues toward His37. Figure 1 from Thomaston and DeGrado, 2016.]
      )
    ]

    The structural comparison below overlays apo S31N M2 (PDB 5C02) with
    amantadine-bound wild-type M2 (PDB 3C9J). It shows the mutation at position
    31 beside the drug-binding pose, complementing the apo network view above.

    #align(center)[
      #figure(
        image("figures://amantadine-s31n-overlay", width: 68%),
        caption: [Structural overlay of apo S31N M2 (green) with amantadine-bound wild-type M2 (pink), highlighting Asn31, Ser31, and amantadine. Figure 2a from Thomaston and DeGrado, 2016.]
      )
    ]

    The case illustrates a central medicinal-chemistry lesson: high affinity for
    a defined molecular target does not guarantee durable clinical utility when
    the target can evolve under selection pressure. Amantadine is also used for
    non-antiviral indications, but those are outside this antiviral case study.

    References

    - #link("https://pubchem.ncbi.nlm.nih.gov/compound/2130")[PubChem compound record]
    - #link("https://pmc.ncbi.nlm.nih.gov/articles/PMC6497056/")[Thomaston et al., 2018, high-resolution amantadine-bound M2 structures and water-mediated hydrogen bonds]
    - #link("https://pmc.ncbi.nlm.nih.gov/articles/PMC4972211/")[Thomaston and DeGrado, 2016, S31N M2 crystal structure and resistance-associated hydrogen-bond network]
    - #link("https://www.cdc.gov/flu/treatment/antiviralresistance.html")[CDC antiviral-resistance guidance]
  """#
  related: ["concept/medicinal-chemistry"]
  external_link: [
    "https://pubchem.ncbi.nlm.nih.gov/compound/2130",
    "https://pmc.ncbi.nlm.nih.gov/articles/PMC6497056/",
    "https://pmc.ncbi.nlm.nih.gov/articles/PMC4972211/",
    "https://www.cdc.gov/flu/treatment/antiviralresistance.html"
  ]
}
