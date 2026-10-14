package concept

electric_field_strength: {
  content: """
    *Electric field strength* $ub(E)$ at a point is the electric force per
    unit positive test charge placed at that point:

    $ ub(E) = (ub(F))/(q_0) $

    Here $ub(F)$ is the force on the test charge $q_0$. Electric field strength
    is a vector: its magnitude tells us how strong the electric effect is,
    while its direction is the direction a positive test charge would be
    pushed. Its SI unit is newtons per coulomb $"N"\\/"C"$, which is equivalent
    to volts per metre $"V"\\/"m"$.

    For a point charge $Q$ at position $ub(r)_Q$, define the displacement
    from the charge to the observation point as $ub(R) = ub(r) - ub(r)_Q$,
    with $R = abs(ub(R))$. In vacuum, Coulomb's law gives the field vector:

    $ ub(E)(ub(r)) = (1/(4 π ε_0)) (Q ub(R))/(R^3) $

    Its magnitude is $E = (1/(4 π ε_0)) (|Q|)/(R^2)$. A positive charge produces
    a field pointing away from it; a negative charge produces a field pointing
    toward it. The inverse-square relation means that doubling the distance
    reduces the field magnitude to one quarter.

    For example, a positive point charge of $1.0 "nC"$ produces a field about
    $0.30 "m"$ away with magnitude:

    $ E = k_e (|Q|)/(R^2) ≈ ((8.99 × 10^9)(1.0 × 10^(-9)))/((0.30)^2) "N"\/"C" ≈ 100 "N"\/"C" $

    The field at that point points away from the positive charge.

    When several charges are present, the total field at a point is found by
    combining the field contributions from each charge, including their
    directions.

    The heatmap below shows the *relative magnitude*, proportional to $(1)/(R^2)$,
    around one positive point charge at its center. Warmer colors indicate a
    stronger field; the logarithmic color scale makes weaker regions visible
    alongside the intense field close to the charge. The value is capped near
    the ideal point charge to display the singular center; the colors do not
    show field direction.

    \(figure_part_electric_field_strength)
  """
  figure_part_electric_field_strength: #"""
    #let electric-field-heatmap = "assets/typst/single-point-charge-field-heatmap.typ"
    #eval(
      str(read(electric-field-heatmap)),
      mode: "markup"
    )
  """#
  related: [
    "concept/electric-field",
    "concept/point-charge",
    "law/coulomb-law"
  ]
}
