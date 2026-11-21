package specific

hiv_antiretroviral_drugs: {
	content: #"""
            *Antiretroviral therapy* (ART) inhibits successive steps in the HIV replication
            cycle. HIV carries two copies of positive-sense single-stranded RNA. After
            entry into a susceptible cell, viral reverse transcriptase converts this RNA
            into DNA, and integrase inserts the viral DNA into a host chromosome. The
            integrated provirus can then use host transcription and translation machinery
            to produce viral RNA and proteins, which assemble, bud from the cell, and
            mature into infectious virions. The stages below connect these events with
            approved antiretroviral drug classes and representative agents. Approval and
            availability vary by jurisdiction; examples are not a treatment regimen.

            #align(center)[
              #figure(
                image("figures://hiv-replication-cycle", width: 52%),
                caption: [HIV replication-cycle schematic by Jmarchn, Wikimedia Commons, CC BY-SA 3.0. The schematic is unmodified; drug targets are described in the text.]
              )
            ]

            == 1. Attachment and membrane fusion

            The viral envelope protein gp120 first binds the CD4 receptor and then a
            chemokine coreceptor, usually CCR5 or CXCR4. These interactions trigger
            conformational changes in gp41 that drive fusion of the viral envelope with
            the host-cell membrane. Entry inhibitors interrupt different molecular
            contacts in this sequence. Maraviroc is a CCR5 antagonist that blocks CCR5
            and is active only against viruses using that coreceptor. Fostemsavir is a
            gp120 attachment inhibitor; ibalizumab binds CD4 and blocks a post-attachment
            step; enfuvirtide binds gp41 and prevents membrane fusion. Enfuvirtide is a
            historically important approved fusion inhibitor, although its commercial
            availability has changed in some jurisdictions.

            #align(center)[
              #figure(
                image("figures://hiv-attachment-fusion", width: 32%),
                caption: [HIV attachment and fusion; David S. Goodsell, Wellcome Collection, CC BY 4.0. #link("https://wellcomecollection.org/works/enep9d4h")[Source and licence].]
              )
            ]

            == 2. Capsid trafficking, uncoating, and nuclear import

            After fusion, the viral core enters the cytoplasm. Its capsid coordinates
            reverse transcription and intracellular trafficking, then undergoes
            remodelling that permits viral DNA to reach the nucleus. Lenacapavir binds
            the HIV capsid protein and disrupts capsid-dependent events at several stages,
            including nuclear import, reverse transcription, and formation of new capsids
            during assembly. It is a capsid inhibitor used with other antiretroviral
            drugs for treatment; the same molecule also has a separately approved
            pre-exposure-prophylaxis indication in the United States.

            #align(center)[
              #figure(
                image("figures://hiv-capsid-structure", width: 32%),
                caption: [HIV capsid structure assembled from p24; Thomas Splettstoesser, Wikimedia Commons, CC BY-SA 4.0. #link("https://commons.wikimedia.org/wiki/File:P24_HIV-capsid.png")[Source and licence].]
              )
            ]

            == 3. Reverse transcription

            HIV reverse transcriptase synthesizes DNA from the viral RNA template and
            then degrades the RNA strand through its RNase H activity while completing
            double-stranded viral DNA. Nucleos(t)ide reverse transcriptase inhibitors
            (NRTIs) are activated intracellularly and compete with natural nucleotide
            substrates. Once incorporated, many NRTI metabolites lack the geometry or
            functional group needed for continued DNA extension, causing chain
            termination. Examples include tenofovir (TDF or TAF), emtricitabine (FTC),
            lamivudine (3TC), abacavir (ABC), and zidovudine (AZT). Non-nucleoside reverse
            transcriptase inhibitors (NNRTIs), including doravirine, rilpivirine,
            etravirine, and efavirenz, bind an allosteric pocket on reverse transcriptase
            and inhibit its catalytic function without being incorporated into DNA.

            #align(center)[
              #figure(
                image("figures://hiv-reverse-transcription", width: 32%),
                caption: [HIV reverse transcription within the capsid; David S. Goodsell, Wellcome Collection, CC BY 4.0. #link("https://wellcomecollection.org/works/dractz5z")[Source and licence].]
              )
            ]

            == 4. Integration into the host genome

            The viral DNA-protein complex enters the nucleus, where HIV integrase catalyses
            strand transfer: viral DNA ends are joined to host chromosomal DNA. Integrase
            strand-transfer inhibitors (INSTIs) chelate catalytic metal ions in the
            integrase active site and prevent this joining reaction. Representative
            agents are bictegravir, dolutegravir, cabotegravir, raltegravir, and
            elvitegravir. The resulting integrated viral DNA is called a provirus.

            #align(center)[
              #figure(
                image("figures://hiv-integration", width: 32%),
                caption: [HIV nuclear entry and integration by integrase; David S. Goodsell, Wellcome Collection, CC BY 4.0. #link("https://wellcomecollection.org/works/ubp5tz9n")[Source and licence].]
              )
            ]

            == 5. Proviral transcription and latency

            Host RNA polymerase II transcribes the provirus into viral RNAs. Some full-
            length RNA molecules become genomes for progeny virions; alternatively spliced
            RNAs encode viral proteins. HIV regulatory proteins, including Tat and Rev,
            coordinate transcript elongation and RNA export. No approved standard ART
            class directly blocks proviral transcription or reliably eliminates latent
            provirus. Latency-reversing agents, such as histone deacetylase inhibitors,
            and latency-silencing approaches have been investigated, but neither has
            established a routine cure strategy.

            #align(center)[
              #figure(
                image("figures://hiv-transcription", width: 32%),
                caption: [HIV transcription from proviral DNA with Tat and host factors; David S. Goodsell, Wellcome Collection, CC BY 4.0. #link("https://wellcomecollection.org/works/gxdy6rt2")[Source and licence].]
              )
            ]

            == 6. Translation and viral protein processing

            Host ribosomes translate viral RNAs into polyproteins, principally Gag and
            Gag-Pol; Env is synthesized through the host secretory pathway and processed
            into envelope glycoproteins. There is no approved antiretroviral class whose
            primary mechanism is broadly blocking host ribosomal translation of HIV
            proteins. This reflects the challenge of inhibiting viral protein production
            without disrupting essential host protein synthesis. RNA-targeting agents
            and other expression-directed approaches remain investigational.

            #align(center)[
              #figure(
                image("figures://hiv-translation", width: 32%),
                caption: [Host ribosomes translate HIV RNA into Gag proteins; David S. Goodsell, Wellcome Collection, CC BY 4.0. #link("https://wellcomecollection.org/works/ueftx3yf")[Source and licence].]
              )
            ]

            == 7. Assembly and budding

            Gag, Gag-Pol, Env, and two copies of viral genomic RNA gather at the plasma
            membrane. Gag drives formation of an immature particle, which buds from the
            cell with help from host membrane-remodelling machinery. There is no approved
            drug class whose principal clinical target is the budding event itself.
            Capsid inhibitors such as lenacapavir also disrupt late capsid formation,
            linking their activity to this part of the cycle.

            #align(center)[
              #figure(
                image("figures://hiv-assembly-budding", width: 32%),
                caption: [HIV Gag-driven particle assembly and budding; David S. Goodsell, Wellcome Collection, CC BY 4.0. #link("https://wellcomecollection.org/works/ah34mcug")[Source and licence].]
              )
            ]

            == 8. Protease-mediated maturation

            After or during budding, HIV protease cleaves Gag and Gag-Pol polyproteins
            into functional viral proteins and enzymes. This cleavage reorganizes the
            particle into its mature infectious form. Protease inhibitors (PIs) occupy
            the protease active site and prevent productive polyprotein processing;
            examples include darunavir, atazanavir, and lopinavir. Ritonavir is itself a
            protease inhibitor, but is commonly given at a low dose as a pharmacokinetic
            booster; cobicistat is a booster without direct anti-HIV activity. Maturation
            inhibitors that interfere with Gag processing have also been studied, but no
            separate maturation-inhibitor class is part of routine approved ART.

            #align(center)[
              #figure(
                image("figures://hiv-maturation", width: 32%),
                caption: [HIV protease cleavage reorganizes the immature particle into a mature virion; David S. Goodsell, Wellcome Collection, CC BY 4.0. #link("https://wellcomecollection.org/works/temz6uyf")[Source and licence].]
              )
            ]

            == Combination therapy and the persistent reservoir

            A typical initial regimen combines agents that act at more than one step, most
            commonly an INSTI with two NRTIs; fixed-dose tablets can combine these agents.
            Simultaneous suppression of multiple replication steps reduces the amount of
            virus produced and makes escape through a single mutation less likely. ART
            can maintain plasma HIV RNA below the assay's detection limit, but latent
            proviruses persist in long-lived cells and can resume replication if treatment
            is stopped. Durable viral suppression is therefore distinct from eradication
            of the infection.

            == References

            - #link("https://hivinfo.nih.gov/understanding-hiv/fact-sheets/hiv-life-cycle")[NIH HIVinfo: The HIV Life Cycle]
            - #link("https://hivinfo.nih.gov/understanding-hiv/fact-sheets/fda-approved-hiv-medicines")[NIH HIVinfo: FDA-Approved HIV Medicines]
            - #link("https://clinicalinfo.hiv.gov/en/guidelines/hiv-clinical-guidelines-adult-and-adolescent-arv/principles-antiretroviral-therapy")[NIH Clinical Guidelines: Principles of Antiretroviral Therapy]
            - #link("https://commons.wikimedia.org/wiki/File:HIV-replication-cycle-en.svg")[HIV replication-cycle figure by Jmarchn, Wikimedia Commons, CC BY-SA 3.0]
            - #link("https://wellcomecollection.org/works/enep9d4h")[HIV attachment and fusion by David S. Goodsell, Wellcome Collection, CC BY 4.0]
            - #link("https://commons.wikimedia.org/wiki/File:P24_HIV-capsid.png")[HIV capsid structure by Thomas Splettstoesser, Wikimedia Commons, CC BY-SA 4.0]
            - #link("https://wellcomecollection.org/works/dractz5z")[HIV reverse transcription by David S. Goodsell, Wellcome Collection, CC BY 4.0]
            - #link("https://wellcomecollection.org/works/ubp5tz9n")[HIV integration by David S. Goodsell, Wellcome Collection, CC BY 4.0]
            - #link("https://wellcomecollection.org/works/gxdy6rt2")[HIV transcription by David S. Goodsell, Wellcome Collection, CC BY 4.0]
            - #link("https://wellcomecollection.org/works/ueftx3yf")[HIV translation by David S. Goodsell, Wellcome Collection, CC BY 4.0]
            - #link("https://wellcomecollection.org/works/ah34mcug")[HIV assembly and budding by David S. Goodsell, Wellcome Collection, CC BY 4.0]
            - #link("https://wellcomecollection.org/works/temz6uyf")[HIV maturation by David S. Goodsell, Wellcome Collection, CC BY 4.0]
        """#
	related: ["concept/medicinal-chemistry"]
	external_link: [
		"https://hivinfo.nih.gov/understanding-hiv/fact-sheets/hiv-life-cycle",
		"https://hivinfo.nih.gov/understanding-hiv/fact-sheets/fda-approved-hiv-medicines",
		"https://clinicalinfo.hiv.gov/en/guidelines/hiv-clinical-guidelines-adult-and-adolescent-arv/principles-antiretroviral-therapy",
		"https://commons.wikimedia.org/wiki/File:HIV-replication-cycle-en.svg",
		"https://wellcomecollection.org/works/enep9d4h",
		"https://commons.wikimedia.org/wiki/File:P24_HIV-capsid.png",
		"https://wellcomecollection.org/works/dractz5z",
		"https://wellcomecollection.org/works/ubp5tz9n",
		"https://wellcomecollection.org/works/gxdy6rt2",
		"https://wellcomecollection.org/works/ueftx3yf",
		"https://wellcomecollection.org/works/ah34mcug",
		"https://wellcomecollection.org/works/temz6uyf",
	]
}
