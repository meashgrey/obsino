package concept

gas: {
  content: #"""
    A *gas* is a state of matter in which the particles are widely separated and
    move freely. Unlike a solid or liquid, a gas has no fixed shape, expands to
    fill any container and can be compressed easily. To describe a gas quantitatively
    we use state variables:

    - $p$: pressure, force per unit area
    - $V$: volume, the geometric space occupied by the gas
    - $T$: temperature, a state variable that characterizes thermal equilibrium
    - $n$: amount of substance, number of moles

    These variables are not independent; an equation of state relates them. For
    an ideal gas, that relation is the ideal gas law.
  """#
  related: [
    "concept/ideal-gas",
    "law/ideal-gas-law"
  ]
}
