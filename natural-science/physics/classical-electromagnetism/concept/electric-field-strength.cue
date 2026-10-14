package concept

electric_field_strength: {
  content: """
    *Electric field strength* $ub(E)$ at a point is the electric force per
    unit positive test charge placed at that point:

    $ ub(E) = ub(F)/q_0 $

    Here $ub(F)$ is the force on the test charge $q_0$. Electric field strength
    is a vector: its magnitude tells us how strong the electric effect is,
    while its direction is the direction a positive test charge would be
    pushed. Its SI unit is newtons per coulomb $"N"\\/"C"$, which is equivalent
    to volts per metre $"V"\\/"m"$.

    For a point charge $Q$, the field strength magnitude at distance $r$ in
    vacuum is:

    $ E = 1/(4 π ε_0) (|Q|) /r^2 $

    The field points away from a positive source charge and toward a negative
    one. When several charges are present, the total field at a point is found
    by combining the field contributions from each charge, including their
    directions.

    The heatmap below shows the *magnitude* of the electric field produced by
    a pair of equal and opposite point charges. Warmer colors indicate stronger
    fields. The color scale is logarithmic, so equal color steps do not mean
    equal changes in field strength. The colors do not show field direction.

    \(figure_part_electric_field_strength)
  """
  figure_part_electric_field_strength: #"""
    #let electric-field-heatmap = "assets/typst/electric-field-strength-heatmap.typ"
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
