package concept

atomic_and_molecular_orbitals: {
  content: """
    Atoms contain a small, positively charged nucleus and electrons around it.
    The terms shell, subshell, and orbital are introduced in the related
    concept on electron shells, subshells, and orbitals.
    Electrons do not travel on fixed miniature-planet paths. Quantum mechanics
    describes where an electron is likely to be found using an *orbital*
    (轨道): a wave-like state whose squared wavefunction gives a probability
    density.

    An orbital is not a physical track. It describes a region and pattern of
    electron probability. Each orbital can contain at most two electrons, with
    opposite spins. The simplest orbital is an *s orbital*, which is roughly
    spherical. A *p orbital* has two lobes on opposite sides of the nucleus.
    The two lobes have opposite mathematical phase, often marked + and −; these
    signs do not mean positive and negative electric charge.

    \(figure_part_orbital_shapes_and_overlap)

    A neutral carbon atom has six protons and six electrons. Two electrons are
    in the compact 1s orbital; the other four are its *valence electrons*, the
    electrons involved in bonding. In organic chemistry, a useful model for a
    carbon in a C=C double bond is *sp² hybridization*: three
    in-plane sp² orbitals form σ bonds, while one unhybridized p orbital stands
    perpendicular to the plane. Hybridization is a model for describing the
    bonding geometry, not a set of literal mechanical sticks.

    When atoms bond, their atomic orbitals combine to form *molecular orbitals*
    (分子轨道), which can extend over more than one atom. In a conjugated diene,
    the four neighboring p orbitals combine into four π molecular orbitals. The
    four π electrons occupy the two lower-energy bonding orbitals. Their
    electron density is spread across all four carbons, rather than confined to
    two separate C=C bonds.

    This orbital picture and the Lewis-structure picture of resonance describe
    the same delocalization from different viewpoints. See the related entries
    for σ and π bonds, dienes, and resonance in conjugated dienes.
  """
  figure_part_orbital_shapes_and_overlap: """
    #let orbital-figure = "assets/typst/orbital-shapes-and-overlap.typ"
    #eval(
      str(read(orbital-figure)),
      mode: "markup"
    )
  """
  related: [
    "concept/electron-shells-subshells-and-orbitals",
    "concept/sigma-and-pi-bonds",
    "concept/dienes-and-polyenes",
    "concept/resonance-in-conjugated-dienes",
  ]
}
