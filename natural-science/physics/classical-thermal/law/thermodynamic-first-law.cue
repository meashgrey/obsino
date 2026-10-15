package law

thermodynamic_first_law: {
  content: #"""
    The *first law of thermodynamics* is the conservation of energy applied to a
    thermodynamic system. For a closed system, when changes in its macroscopic
    kinetic and potential energies are negligible, the change in internal
    energy is:

    $ Delta U = Q - W $

    Here $Q$ is the net heat transferred to the system and $W$ is the net work
    done by the system, using the sign convention in this handbook:

    - $Q > 0$ for heat absorbed by the system; $Q < 0$ for heat released.
    - $W > 0$ for work done by the system; $W < 0$ for work done on it by the
      surroundings.

    Heat supplied to the system increases its internal energy, while work done
    by the system transfers energy out. Work done on the system has $W < 0$ and
    therefore increases $U$ through the term $-W$. In a cyclic process, the
    system returns to its initial state, so $Delta U = 0$ and the net heat
    supplied equals the net work done by the system.
  """#
  related: [
    "concept/internal-energy",
    "concept/heat-and-work",
    "concept/thermodynamic-process",
  ]
}
