package concept

thermodynamic_process: {
  content: #"""
    A *thermodynamic process* is a change of a system from one state to another.
    Processes are often named for the property kept constant:

    - *Isothermal process*: The temperature remains constant. For a fixed
      amount of ideal gas, $p V$ remains constant. Heat may enter or leave the
      system to keep its temperature from changing.
    - *Isobaric process*: The pressure remains constant. For a fixed amount of
      ideal gas, $V / T$ remains constant, with temperature measured in kelvins.
    - *Isochoric process* (also called *isovolumetric process*): The volume
      remains constant. For a fixed amount of ideal gas, $p / T$ remains
      constant. Since the volume does not change, there is no expansion or
      compression work at the boundary.
    - *Adiabatic process*: No heat is transferred between the system and its
      surroundings. The temperature can still change, for example when a gas is
      compressed or allowed to expand.
    - *Cyclic process*: The system returns to its initial state after a sequence
      of changes. Every state function then has zero net change over the full
      cycle, although heat and work transfers over the cycle need not be zero.

    A process is *reversible* in the ideal limit if it can be reversed by an
    infinitesimal change in conditions so that both the system and its
    surroundings return to their initial states. Real processes are
    *irreversible* when effects such as friction, finite temperature
    differences, or unrestrained expansion prevent this exact restoration.
    Reversibility is a feature of how a process occurs, not a condition that
    must remain constant.

    The ideal-gas relations above apply only to a fixed amount of ideal gas.
    They follow from the ideal gas law and do not by themselves specify whether
    a process is reversible.
  """#
  related: [
    "concept/state-function",
    "concept/ideal-gas",
    "law/ideal-gas-law",
  ]
}
