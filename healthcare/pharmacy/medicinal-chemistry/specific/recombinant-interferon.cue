package specific

recombinant_interferon: {
	content: #"""
		*Recombinant interferon* is a biologic drug produced by expressing an
		interferon-coding sequence in a host cell. Peginterferon alfa is a
		polyethylene-glycol (PEG)-conjugated form of recombinant interferon alfa.
		It is classified pharmacologically as an immunomodulatory antiviral
		biologic: it does not directly destroy virions, but changes host-cell gene
		expression to establish an antiviral state. The PEG chain is covalently
		attached after the interferon polypeptide has been produced; this chemical
		modification is distinct from recombinant DNA expression and generally
		slows clearance, prolonging systemic exposure. The FDA label describes
		peginterferon alfa-2a as a covalent conjugate of recombinant interferon
		alfa-2a and PEG, with a substantially longer terminal half-life than
		non-pegylated interferon alfa-2a.

		== Recombinant production and pegylation

		A coding sequence for a defined human interferon subtype, such as
		*IFNA2* encoding IFN-alpha-2b, is inserted into an expression vector. The
		vector is introduced into an appropriate host, commonly *Escherichia coli*
		for research-scale IFN-alpha production or a mammalian cell line when
		eukaryotic processing is needed. After expression, cells or culture medium
		are harvested according to whether the protein is intracellular or
		secreted. The interferon is isolated, purified, and tested for identity,
		purity, and biological activity. In bacterial IFN-alpha production, the
		protein can accumulate in inclusion bodies; those aggregates are isolated,
		solubilized, and refolded before final purification. The expression host
		and processing route affect folding, post-translational modifications,
		product heterogeneity, and downstream purification.

		For pegylation, activated PEG reagent is chemically coupled to the
		purified interferon at selected reactive groups, followed by separation
		of unconjugated protein and undesired conjugate species. The resulting
		product is characterized for conjugation site and stoichiometry, purity,
		potency, and pharmacokinetic properties. PEGylation changes the size and
		hydrodynamic behavior of the protein and can also affect receptor access;
		it is therefore a product-engineering modification, not a change in the
		interferon gene or a viral component. The specific conjugation chemistry
		and product profile depend on the drug product and manufacturing process.

		== Host-mediated antiviral mechanism

		Type I interferons, including IFN-alpha, bind the IFNAR1/IFNAR2 receptor
		complex on responsive cells. Receptor-associated JAK1 and TYK2 activate
		STAT1 and STAT2; together with IRF9, these transcription factors form
		ISGF3, which induces interferon-stimulated genes (ISGs). Fibroblasts are
		one example of cells that can respond to interferon, although the size and
		composition of the response depend on cell type and cellular state.

		Two antiviral effector systems illustrate how induced proteins interfere
		with viral RNA metabolism and translation. In the OAS/RNase L pathway,
		viral double-stranded RNA (dsRNA) activates 2'-5'-oligoadenylate synthetases
		(OAS). OAS enzymes use ATP to synthesize 2'-5'-linked oligoadenylates,
		called 2-5A. 2-5A binds latent RNase L and promotes its dimerization and
		activation. Active RNase L cleaves single-stranded viral and cellular RNA,
		which can reduce viral RNA availability and suppress translation. Because
		RNase L can also cleave host RNA, its activity is tightly regulated.
		Human OAS1, OAS2, and OAS3 are catalytically active; human OASL is a related
		but catalytically inactive protein.

		#align(center)[
		  #figure(
		    image("figures://interferon-oas-rnase-l", width: 68%),
		    caption: [OAS1 senses viral dsRNA and synthesizes 2-5A from ATP; 2-5A promotes RNase L dimerization, after which RNase L cleaves RNA. Reproduced from Figure 4 of Luan et al. (2024), under the Creative Commons Attribution (CC BY) license.]
		  )
		]

		In the PKR pathway, dsRNA binding promotes PKR dimerization and
		autophosphorylation. Active PKR phosphorylates eIF2-alpha, inhibiting
		translation initiation and reducing protein synthesis. This can restrict
		viral protein production, although it also affects host translation.
		These pathways are complementary, not interchangeable: OAS/RNase L
		promotes RNA cleavage, whereas PKR primarily inhibits translation through
		eIF2-alpha phosphorylation. Their relative contribution varies with the
		virus, the responding cell, and viral antagonism of innate immunity.

		#align(center)[
		  #figure(
		    image("figures://interferon-pkr", width: 68%),
		    caption: [Viral dsRNA activates PKR by promoting dimerization and autophosphorylation; active PKR phosphorylates eIF2-alpha and inhibits translation initiation. Reproduced from Figure 5 of Luan et al. (2024), under the Creative Commons Attribution (CC BY) license.]
		  )
		]

		The antiviral classification describes the drug's pharmacological action,
		not a claim that it is appropriate for every viral infection. Peginterferon
		alfa products have been used for selected viral diseases, including
		hepatitis B or C in particular clinical settings; indications and preferred
		regimens depend on the product label and current clinical guidance.

		== References

		- #link("https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=d9290e5b-6d40-2318-e053-2995a90a9916")[DailyMed: PEGASYS (peginterferon alfa-2a) label]
		- #link("https://www.frontiersin.org/journals/immunology/articles/10.3389/fimmu.2024.1287940/full")[Luan et al. (2024), *Innate immune responses to RNA: sensing and signaling*, *Frontiers in Immunology* 15:1287940]
		- #link("https://pmc.ncbi.nlm.nih.gov/articles/PMC8784902/")[Fazeli and Hezarjaribi (2022), *A Simplified Process for Purification and Refolding of Recombinant Human Interferon-alpha2b*, *Iranian Biomedical Journal* 26(1):85–90]
		"""#
	related: ["concept/medicinal-chemistry"]
	external_link: [
		"https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=d9290e5b-6d40-2318-e053-2995a90a9916",
		"https://www.frontiersin.org/journals/immunology/articles/10.3389/fimmu.2024.1287940/full",
		"https://pmc.ncbi.nlm.nih.gov/articles/PMC8784902/",
	]
}
