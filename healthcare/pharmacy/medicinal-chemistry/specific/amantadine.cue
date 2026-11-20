package specific

amantadine: {
  content: #"""
    *Amantadine* (1-adamantanamine; PubChem CID 2130) is an adamantane-class
    antiviral and a historically important inhibitor of the influenza A virus
    M2 proton channel. Its neutral molecular formula is $C_(10)H_(17)N$. The
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
        image("figures://amantadine-chemical-structure", width: 32%),
        caption: [Skeletal formula of amantadine]
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

    The case illustrates a central medicinal-chemistry lesson: high affinity for
    a defined molecular target does not guarantee durable clinical utility when
    the target can evolve under selection pressure. Amantadine is also used for
    non-antiviral indications, but those are outside this antiviral case study.

    References

    - #link("https://pubchem.ncbi.nlm.nih.gov/compound/2130")[PubChem compound record]
    - #link("https://pubmed.ncbi.nlm.nih.gov/18235503/")[Structural study of the influenza A M2 channel]
    - #link("https://www.cdc.gov/flu/treatment/antiviralresistance.html")[CDC antiviral-resistance guidance]
    - #link("https://commons.wikimedia.org/wiki/File:Amantadine.svg")[Amantadine structure image, Wikimedia Commons]
  """#
  related: ["concept/medicinal-chemistry"]
  external_link: [
    "https://pubchem.ncbi.nlm.nih.gov/compound/2130",
    "https://pubmed.ncbi.nlm.nih.gov/18235503/",
    "https://www.cdc.gov/flu/treatment/antiviralresistance.html",
    "https://commons.wikimedia.org/wiki/File:Amantadine.svg"
  ]
}
