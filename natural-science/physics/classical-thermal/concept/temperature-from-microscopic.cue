package concept

temperature_from_microscopic: {
  content: #"""
    Compare the equation from molecular pressure and ideal gas law:

    $ p V = n R T $

    where $n = N/N_A$ is the amount of substance in moles, $N$ is the number of
    molecules, $R = N_A k$ is the gas constant, and $k$ is Boltzmann's constant.
    Substituting into $p V = 2/3 N ⟨E_k⟩$ gives:

    $ 2/3 N ⟨E_k⟩ = n R T = (N/N_A)(N_A k) T = N k T $

    Thus, for an ideal gas in classical thermal equilibrium, the mean translational
    kinetic energy per molecule is:

    $ ⟨E_k⟩ = 3/2 k T $

    This gives one microscopic interpretation of temperature: it sets the mean
    translational kinetic energy per molecule in an ideal gas. Temperature is a
    property of the system, not of an individual molecule. The classical model
    predicts that this translational thermal energy tends to zero as $T → 0$; it
    does not describe quantum motion at absolute zero.
  """#
  related: [
    "concept/boltzmann-constant",
    "concept/average-translational-kinetic-energy",
    "law/ideal-gas-law"
  ]
}
