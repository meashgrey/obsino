package concept

thermal_system: {
  content: #"""
    A *thermodynamic system* is a geometric region of space or a finite collection
    of matter that we choose to study *separately* from its *surroundings*. We
    call the combination of system and its surrounding as *universe*.

    #align(center)[
      #table(
        columns: 4,
        align: (center, center, center, left),
        [Type], [Matter exchange], [Energy exchange], [Example],

        [*Isolated system*], [❌], [❌],
        [A sealed, rigid, perfectly insulated container],

        [*Closed system*], [❌], [✅],
        [A sealed piston that can exchange heat or work],

        [*Open system*], [✅], [✅],
        [A flowing fluid in a pipe that can exchange energy]
      )
    ]

    A system's state is described by macroscopic properties such as pressure,
    volume, and temperature. A system is in *thermodynamic equilibrium* when its
    macroscopic state is steady and it has no unbalanced gradients driving
    spontaneous macroscopic change. Heat and work are two ways energy can cross
    the system boundary; equilibrium is not defined merely by the absence of work.

    In equilibrium:

    - No net macroscopic flow of matter
    - No net heat flow
    - No spontaneous macroscopic change in the system's state
  """#
  related: [
    "law/thermodynamic-zeroth-law"
  ]
}
