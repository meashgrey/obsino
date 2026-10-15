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
    volume, temperature, and composition. *Thermodynamic equilibrium* means
    these properties do not change spontaneously with time. It requires thermal,
    mechanical, chemical, and (when multiple phases are present) phase equilibrium:

    - *Thermal equilibrium*: There is no temperature difference driving a net
      transfer of heat within the system. When two systems in thermal contact
      are in equilibrium with each other, there is no net heat flow between them.
    - *Mechanical equilibrium*: There are no unbalanced forces causing bulk
      motion or continuing deformation. Pressure forces are balanced; in a
      gravitational field, pressure can vary with height while still balancing
      gravity.
    - *Chemical equilibrium*: The composition does not change through a net
      chemical reaction or the net transfer of a substance between regions.
      Reactions may continue microscopically, but their forward and reverse
      changes balance overall.
    - *Phase equilibrium*: When multiple phases of a substance coexist, there is
      no net transfer of matter from one phase to another, so the amount of each
      phase remains stable. For example, in a liquid-vapor equilibrium,
      evaporation and condensation balance overall.

    These conditions together prevent spontaneous macroscopic change. Heat and
    work describe ways energy can cross the system boundary; the absence of work
    alone does not establish equilibrium.
  """#
  related: [
    "law/thermodynamic-zeroth-law"
  ]
}
