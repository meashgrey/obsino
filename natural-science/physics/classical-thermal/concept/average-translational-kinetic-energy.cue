package concept

average_translational_kinetic_energy: {
  content: #"""
    The *average translational kinetic energy* of a molecule is

    $ ⟨E_k⟩ = 1/2 m ⟨v^2⟩ $

    From the #link(<concept-pressure-from-molecular-collisions>)[pressure from
    molecular collisions], we know that:

    Here $N$ is the number of molecules. The kinetic-theory pressure relation is:

    $ p V = 1/3 N m ⟨v^2⟩ = 2/3 N (1/2 m ⟨v^2⟩) = 2/3 N ⟨E_k⟩ $

    so

    $ ⟨E_k⟩ = (3 p V)/(2 N) $
  """#
  related: [
    "concept/pressure-from-molecular-collisions",
    "concept/temperature-from-microscopic"
  ]
}
