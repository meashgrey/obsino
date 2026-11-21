package specific

nucleoside_analog_antivirals: {
	content: #"""
		*Nucleoside and nucleotide analogue antivirals* are antiviral drugs that
		mimic the natural substrates used to synthesize viral DNA or RNA. The parent
		nucleoside analogue resembles a nucleobase plus a sugar-like scaffold;
		cellular or virus-encoded kinases convert it to nucleotide forms that can
		interact with a viral polymerase. Nucleotide-analogue prodrugs, such as
		remdesivir, deliver a masked nucleotide precursor that is metabolically
		converted to the active triphosphate. This class is pharmacologically
		classified as antiviral drugs.

		== How polymerase inhibition works

		The active triphosphate analogue competes with the corresponding natural
		nucleotide triphosphate for recognition by a viral DNA polymerase or an
		RNA-dependent RNA polymerase (RdRp). Depending on the analogue and the
		polymerase, inhibition can occur because the analogue occupies the catalytic
		site, is incorporated into the growing nucleic-acid chain, stalls further
		translocation or extension, or promotes an error-prone product. These are
		related but distinct mechanisms; not every polymerase-targeting analogue
		acts only as a competitive inhibitor, and incorporation does not always
		cause immediate chain termination.

		#align(center)[
		  #figure(
		    image("figures://antiviral-acyclovir-mechanism", width: 62%),
		    caption: [Acyclovir is activated preferentially in herpesvirus-infected cells, then inhibits viral DNA polymerase and terminates DNA-chain extension. Mechanism diagram by Luigi Albert Maria, Wikimedia Commons, CC BY-SA 4.0.]
		  )
		]

		Acyclovir illustrates a DNA-directed mechanism. It is a guanosine-like
		purine nucleoside analogue. Herpes simplex virus and varicella-zoster virus
		thymidine kinase phosphorylates it to the monophosphate; host kinases then
		produce the diphosphate and active triphosphate. Acyclovir triphosphate
		competes with dGTP at viral DNA polymerase and can be incorporated into viral
		DNA. Because acyclovir lacks the sugar 3′-hydroxyl needed to attach the next
		nucleotide, incorporation terminates extension; the terminated primer can
		also form a dead-end complex with the polymerase. Preferential activation by
		viral thymidine kinase and stronger use by the viral polymerase help explain
		its selectivity for infected cells.

		Idoxuridine and trifluridine are pyrimidine nucleoside analogues related to
		thymidine. Their activation can involve host-cell kinases as well as viral
		metabolism, and their metabolites can enter host DNA synthesis. This weakens
		infection-specific selectivity and contributes to cytotoxicity; idoxuridine
		is therefore used mainly as a topical ophthalmic antiviral. This history
		does not mean that all pyrimidine analogues are poorly selective. Selectivity
		depends on the combined preferences of the activating enzymes, the viral and
		cellular polymerases, and the analogue's intracellular fate.

		== RNA polymerase example: remdesivir

		Remdesivir is an adenosine nucleotide-analogue prodrug. After cell entry,
		metabolism yields its active triphosphate, which competes with ATP for
		incorporation by coronavirus RdRp. In SARS-CoV-2 polymerase, incorporation
		does not simply stop extension at once: the remdesivir residue permits
		several further nucleotides to be added, after which its 1′-cyano substituent
		creates a steric barrier to RNA translocation and stalls synthesis. Thus,
		this is a delayed-translocation or delayed-chain-termination mechanism,
		distinct from acyclovir's immediate DNA-chain termination.

		#align(center)[
		  #figure(
		    image("figures://antiviral-remdesivir-rdrp", width: 62%),
		    caption: [Structural analysis of remdesivir-induced RNA polymerase stalling. Reproduced from Figure 3 of Kokic et al. (2021), under CC BY 4.0.]
		  )
		]

		These examples show why nucleoside-analogue antivirals are described as
		substrate mimics rather than as one uniform class of simple polymerase
		blockers. Their common design principle is resemblance to a natural
		nucleotide substrate; the exact molecular event after binding depends on
		the virus, the polymerase, and the analogue's activation pathway.

		== References

		- #link("https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=0de2f5c7-9e75-4bdf-9c28-e026cc6694b4")[DailyMed: Acyclovir tablet label]
		- #link("https://doi.org/10.1016/S0021-9258(18)83248-3")[Reardon and Spector (1989), *Herpes simplex virus type 1 DNA polymerase: Mechanism of inhibition by acyclovir triphosphate*, *Journal of Biological Chemistry* 264:6127–6137]
		- #link("https://doi.org/10.1038/s41467-020-20542-0")[Gordon et al. (2021), *Mechanism of SARS-CoV-2 polymerase stalling by remdesivir*, *Nature Communications* 12:279]
		- #link("https://commons.wikimedia.org/wiki/File:Mechanism_of_acyclovir_action.png")[Acyclovir mechanism figure, Wikimedia Commons, CC BY-SA 4.0]
		- #link("https://www.nature.com/articles/s41467-020-20542-0")[Kokic et al. (2021), *Mechanism of SARS-CoV-2 polymerase stalling by remdesivir*, *Nature Communications* 12:279, Figure 3, CC BY 4.0]
		"""#
	related: ["concept/medicinal-chemistry"]
	external_link: [
		"https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=0de2f5c7-9e75-4bdf-9c28-e026cc6694b4",
		"https://doi.org/10.1016/S0021-9258(18)83248-3",
		"https://doi.org/10.1038/s41467-020-20542-0",
		"https://commons.wikimedia.org/wiki/File:Mechanism_of_acyclovir_action.png",
		"https://www.nature.com/articles/s41467-020-20542-0",
	]
}
