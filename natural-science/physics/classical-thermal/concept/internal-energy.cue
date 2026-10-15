package concept

internal_energy: {
  content: #"""
    The *internal energy* $U$ of a system is the total microscopic energy of its
    particles, including their motion and their interactions with one another.
    It does not include the kinetic or potential energy of the system as a whole
    due to its bulk motion or position in an external field.

    Internal energy is a *state function*: its value is determined by the state
    of the system, and its change depends only on the initial and final states.
    It is an extensive property, so the internal energies of separate parts add
    to give the internal energy of the combined system.

    In the classical ideal-gas model, particles are treated as having no
    intermolecular potential energy except during collisions. The gas's
    internal energy is therefore associated with the kinetic energy of its
    particles.
  """#
  related: [
    "concept/state-function",
    "concept/ideal-gas",
    "concept/heat-and-work",
    "law/thermodynamic-first-law",
  ]
}
