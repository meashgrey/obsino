package concept

hunds_rule_and_subshell_energy_order: {
  content: """
    To write an atom's electron configuration, we need two ideas: how electrons
    occupy orbitals of the same energy (Hund's rule), and the order in which
    subshells of different energies fill (subshell energy order). These ideas
    build on shells, subshells, and orbitals.

    === Hund's rule: spread out before pairing

    A subshell such as $2p$ contains several orbitals with the same energy in
    an isolated atom. The three $2p$ orbitals are equal in energy, so they are
    called *degenerate orbitals*. Hund's rule says that electrons occupy these
    equal-energy orbitals one at a time, with parallel spins, before they pair
    up in one orbital.

    For carbon's $2p^2$, the two electrons go into two separate $p$ orbitals.
    They do not pair in the first orbital while another equal-energy orbital is
    empty. For oxygen's $2p^4$, three orbitals each receive one electron first;
    the fourth electron then pairs in one of them. Each orbital still holds at
    most two electrons, and a pair has opposite spins, as required by the Pauli
    exclusion principle.

    #align(center)[
      #table(
        columns: 3,
        align: (center, center, center),
        [Atom and subshell], [Orbital occupancy], [Unpaired electrons],
        [Carbon: $2p^2$], [□↑　□↑　□], [2],
        [Oxygen: $2p^4$], [□↑↓　□↑　□↑], [2],
      )
    ]

    These boxes show the three $p$ orbitals; each arrow represents one electron
    and its spin. For oxygen, any one of the three boxes may contain the pair:
    the three orbitals have equal energy. Hund's rule is about the lowest-energy
    arrangement within a set of equal-energy orbitals. It does not say that
    electrons always avoid pairing across different subshells.

    === Subshell energy order: fill the lower energy first

    The *Aufbau principle* is the general instruction to place electrons in the
    lowest-energy available orbitals first. In many-electron atoms, subshell
    energies depend on both shell number and subshell type. Electron shielding
    and penetration make the energies of subshells from different shells close
    enough to interleave. Therefore, electrons do not simply fill every
    subshell in order of shell number.

    A useful approximate filling order for many neutral atoms is:

    #align(center)[
      $1s < 2s < 2p < 3s < 3p < 4s < 3d < 4p < 5s < 4d < 5p < 6s$
    ]

    \(figure_part_aufbau_energy_order)

    The symbol $<$ here means "usually fills before" (lower energy in the
    relevant filling sequence). Notice the *energy interleaving*: $4s$ fills
    before $3d$, even though shell 4 is farther out than shell 3. This order is
    a practical guide, not an immutable ladder. The energies are close and
    change as electrons are added, so some atoms have exceptional ground-state
    configurations.

    For example, potassium is commonly written $["Ar"] 4s^1$ and calcium
    $["Ar"] 4s^2$; the $4s$ subshell starts filling before $3d$. Once the $3d$
    subshell is occupied, the relative energies shift. When transition-metal
    atoms form positive ions, $4s$ electrons are generally removed before
    $3d$ electrons. Thus, "fills first" does not always mean "is removed last."

    === How to use the two rules together

    First use the approximate energy order to choose which subshell receives
    the next electron. Then, when that subshell has multiple equal-energy
    orbitals, apply Hund's rule to distribute electrons among them. Finally,
    remember the Pauli rule: no orbital holds more than two electrons, and two
    electrons in one orbital have opposite spins.

    This gives the basic logic behind electron configurations. Organic
    chemistry uses these configurations to identify valence electrons and then
    uses bonding models, such as hybridization, to describe how those electrons
    form bonds.
  """
  figure_part_aufbau_energy_order: """
    #let aufbau-energy-order = "assets/typst/aufbau-energy-order.typ"
    #eval(
      str(read(aufbau-energy-order)),
      mode: "markup"
    )
  """
  related: [
    "concept/electron-shells-subshells-and-orbitals",
    "concept/atomic-and-molecular-orbitals",
  ]
}
