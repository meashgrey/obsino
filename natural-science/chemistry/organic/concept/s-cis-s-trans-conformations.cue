package concept

s_cis_s_trans_conformations: {
  content: """
    *Buta-1,3-diene* (1,3-丁二烯) can rotate about its central C2–C3 single
    bond and adopt two important conformations. In the *s-cis* conformation,
    the two C=C bonds lie on the same side of the C2–C3 bond; in *s-trans*,
    they lie on opposite sides. Here, *s* refers to rotation about a single
    bond. These are conformations, not E/Z configurations.

    \(figure_part_butadiene_conformations)

    Both conformations retain conjugation when the four carbon atoms are
    coplanar. The C2–C3 bond is formally a single bond, but conjugation gives it
    partial double-bond character. Rotating around it disrupts the overlap of
    adjacent $p$ orbitals, creating a rotational energy barrier.

    The *s-trans* conformation is lower in energy than *s-cis* by approximately
    $2.9" kcal mol"^(-1)$, largely because the terminal groups experience less
    steric repulsion in *s-trans*. The energy profile shown below places the
    rotational transition state about $6.5" kcal mol"^(-1)$ above *s-trans*.
    Therefore, the reverse barrier from *s-cis* is about
    $6.5 - 2.9 = 3.6" kcal mol"^(-1)$. These are approximate values for the
    conditions represented in the lecture slide.

    \(figure_part_butadiene_conformational_energy)

    Rotation is fast at ordinary temperatures, so the conformers interconvert
    rather than being isolated as separate compounds. The *s-cis* geometry is
    especially important in the Diels–Alder reaction: it brings the two terminal
    diene carbons into the arrangement needed to form bonds to a dienophile.
    An *s-trans* diene must rotate to *s-cis* before it can react in this way.
  """
  figure_part_butadiene_conformations: """
    #let conformations = "assets/typst/butadiene-conformations.typ"
    #eval(
      str(read(conformations)),
      mode: "markup"
    )
  """
  figure_part_butadiene_conformational_energy: """
    #let conformational-energy = "assets/typst/butadiene-conformational-energy.typ"
    #eval(
      str(read(conformational-energy)),
      mode: "markup"
    )
  """
}
