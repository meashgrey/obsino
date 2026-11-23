package specific

sulfonamide_trimethoprim: {
  content: #"""
    *Sulfonamides and trimethoprim* inhibit two consecutive reactions in the
    microbial folate pathway. Sulfonamides are structural analogues of
    para-aminobenzoic acid (PABA) and inhibit dihydropteroate synthase (DHPS);
    trimethoprim selectively inhibits bacterial dihydrofolate reductase (DHFR).
    Their combination is known as co-trimoxazole (TMP–SMX).

    == The folate biosynthetic pathway

    Many bacteria synthesize folate de novo, whereas humans obtain folate from
    the diet and lack DHPS. Bacterial DHPS couples PABA to
    6-hydroxymethyl-7,8-dihydropterin pyrophosphate, producing dihydropteroate.
    Addition of glutamate subsequently yields dihydrofolate (DHF).
    NADPH-dependent DHFR reduces DHF to tetrahydrofolate (THF).
    THF derivatives transfer one-carbon units required for purine and
    thymidylate biosynthesis, linking folate availability to DNA replication.

    #align(center)[
      #figure(
        box(
          width: 74%,
          inset: 9pt,
          stroke: 0.6pt + luma(170),
          radius: 5pt,
          align(center)[
            *PABA + activated dihydropterin* \
            #text(size: 9pt, fill: rgb("#a33b36"))[DHPS inhibited by sulfonamides] \
            $↓$ \
            *Dihydropteroate* \
            $↓$ \
            *Dihydrofolate (DHF)* \
            #text(size: 9pt, fill: rgb("#a33b36"))[DHFR inhibited by trimethoprim] \
            $↓$ \
            *Tetrahydrofolate (THF)* \
            $↓$ \
            Purines and thymidylate
          ],
        ),
        caption: [Simplified bacterial folate pathway. The two drug targets are successive enzymes, not the same active site.]
      )
    ]

    == PABA mimicry and competitive inhibition of DHPS

    The para-amino group and the substituted aromatic ring of sulfanilamide
    resemble PABA. In many sulfonamides, the sulfonamide group mimics aspects
    of the PABA carboxylate recognition geometry. The drug competes with PABA
    at the DHPS substrate-binding region. Certain sulfonamides can also act
    as alternative substrates, yielding nonproductive pterin adducts. Thus
    competition is a useful kinetic description, but the mechanism need not
    consist exclusively of reversible occupancy without chemistry.

    #align(center)[
      #figure(
        michem.smiles("Nc1ccc(C(=O)O)cc1", style: michem.style(font: "Libertinus Serif"), width: 23%),
        caption: [PABA, the natural DHPS substrate.]
      )
    ]
    #align(center)[
      #figure(
        michem.smiles("Nc1ccc(S(=O)(=O)N)cc1", style: michem.style(font: "Libertinus Serif"), width: 23%),
        caption: [Sulfanilamide, the parent antibacterial sulfonamide.]
      )
    ]
    #align(center)[
      #figure(
        michem.smiles("Cc1noc(NS(=O)(=O)c2ccc(N)cc2)c1", style: michem.style(font: "Libertinus Serif"), width: 27%),
        caption: [Sulfamethoxazole (SMX), an N1-heterocyclic sulfonamide.]
      )
    ]

    == Trimethoprim and selective DHFR inhibition

    DHFR catalyzes hydride transfer from NADPH to DHF, enabling regeneration
    of reduced folate cofactors. Trimethoprim is a 2,4-diaminopyrimidine
    inhibitor that binds bacterial DHFR with substantially greater affinity
    than typical human DHFR. Its protonation and hydrogen-bonding pattern
    supports recognition in the DHFR active site. Unlike sulfonamides,
    trimethoprim does not compete with PABA at DHPS: it targets the next
    reductive step. Drug-specific DHFR resistance can arise from altered
    chromosomal enzymes or acquired dfr genes.

    #align(center)[
      #figure(
        michem.smiles("COc1cc(Cc2cnc(N)nc2N)cc(OC)c1OC", style: michem.style(font: "Libertinus Serif"), width: 30%),
        caption: [Trimethoprim: the diaminopyrimidine core and trimethoxybenzyl substituent.]
      )
    ]

    == Sequential blockade and clinical significance

    In susceptible organisms, SMX lowers the supply of DHF precursors while
    trimethoprim impairs conversion of existing DHF into THF. In combination,
    these steps can produce synergistic inhibition of one-carbon metabolism
    and nucleotide synthesis. The effect can be bactericidal for some
    organism–concentration combinations, although it is not universal.
    Co-trimoxazole is used for selected susceptible bacterial infections and
    for Pneumocystis jirovecii pneumonia. Organism susceptibility, resistance
    epidemiology, and adverse reactions govern its clinical use.

    Sulfonamide resistance includes acquisition of sul1, sul2, or sul3
    genes encoding drug-insensitive DHPS variants, as well as changes in
    permeability and metabolism. Trimethoprim resistance commonly involves
    resistant DHFR variants. Combining the drugs does not eliminate the
    possibility of resistance to either or both agents.

    == Structural and historical context

    Prontosil was identified as an antibacterial azo dye in the 1930s;
    metabolic cleavage released active sulfanilamide. Subsequent discovery
    of PABA antagonism established a foundational example of antimetabolite
    chemotherapy. The structural literature on DHPS and DHFR enables
    inspection of substrate pockets, inhibitors, and resistance determinants.
    See the public structural databases and open-access articles below;
    deposited protein structures should be distinguished from schematic
    illustrations and from ligand-bound versus apo models.

    == References and public biological illustrations

    - #link("https://www.rcsb.org/")[RCSB Protein Data Bank: searchable experimentally determined DHPS and DHFR structures]
    - #link("https://www.ebi.ac.uk/pdbe/")[PDBe: molecular structure views and ligand interaction resources]
    - #link("https://www.kegg.jp/pathway/map00790")[KEGG folate biosynthesis pathway diagram]
    - #link("https://pubchem.ncbi.nlm.nih.gov/compound/Sulfamethoxazole")[PubChem: sulfamethoxazole]
    - #link("https://pubchem.ncbi.nlm.nih.gov/compound/Trimethoprim")[PubChem: trimethoprim]
  """#
  related: ["concept/medicinal-chemistry"]
  external_link: [
    "https://www.kegg.jp/pathway/map00790",
    "https://www.rcsb.org/",
    "https://pubchem.ncbi.nlm.nih.gov/compound/Sulfamethoxazole",
    "https://pubchem.ncbi.nlm.nih.gov/compound/Trimethoprim"
  ]
}
