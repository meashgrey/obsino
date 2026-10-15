package concept

continuous_charge_distribution: {
  content: #"""
    A *continuous charge distribution* is a model in which charge is treated as
    spread smoothly through a region instead of being tracked as separate
    electrons, ions, or other particles. It is a useful approximation when a
    piece of matter contains many charged particles and the distances of
    interest are much larger than the spacing between them.

    We describe how much charge is present in a small piece of the region with
    a *charge density*:

    - Linear charge density $λ$: charge per unit length, measured in
      coulombs per metre ($"C"\/"m"$);
    - Surface charge density $σ$: charge per unit area, measured in
      coulombs per square metre ($"C"\/"m"^2$);
    - Volume charge density $ρ$: charge per unit volume, measured in
      coulombs per cubic metre ($"C"\/"m"^3$).

    For a uniform distribution, total charge is density multiplied by the
    length, area, or volume it fills. For example, a uniformly charged wire of
    length $L$ has charge $Q = λ L$.

    The model does not mean that electric charge has lost its particle-scale
    quantum nature. It replaces many tiny individual charges with a smooth
    description that makes their large-scale electric effects easier to
    calculate.
  """#
  related: ["concept/quantization-of-electric-charge"]
}
