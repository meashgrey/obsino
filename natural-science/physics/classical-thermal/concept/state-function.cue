package concept

state_function: {
  content: #"""
    A *state function* is a property whose value is determined by the current
    thermodynamic state of a system. Its change between two states depends only
    on the initial and final states, not on the process or path taken between
    them.

    Pressure, volume, temperature, and internal energy are examples of state
    functions. If a system returns to its initial state after a cycle, the net
    change in every state function is zero.

    If a state function depends on state variables $x_1, x_2, dots, x_n$, then
    its infinitesimal change is given by its *total differential*:

    $ upright(d)F = sum_(i=1)^n (partial F)/(partial x_i) upright(d)x_i $

    This expression accounts for the changes of all the variables on which
    $F$ depends. Since it comes from a function of state, integrating it along
    any path from state $A$ to state $B$ gives the same result:

    $ integral_A^B upright(d)F = F(B) - F(A) $

    Thus the change in a state function depends only on the endpoints. In
    contrast, heat and work are path-dependent transfers and are commonly
    written with $delta Q$ and $delta W$ rather than as differentials of state
    functions.

    State properties can also be classified by how they change when the system
    size changes:

    - *Extensive properties* (also called *capacity properties*) depend on the
      amount of matter. For separate parts of a system, their values add to give
      the value for the whole system. Mass, volume, internal energy, and amount
      of substance are examples.
    - *Intensive properties* do not depend on the amount of matter. Temperature,
      pressure, and density are examples. If two parts of a system are combined,
      an intensive property is generally not found by simply adding their values.

    Dividing an extensive property by the mass or amount of substance often
    gives an intensive property, such as specific volume or molar volume.

    *Heat* and *work* are different: they describe energy transferred during a
    process, and the amounts transferred can depend on the path. They are not
    properties stored in a state of the system.
  """#
  related: [
    "concept/thermal-system",
    "concept/gas",
  ]
}
