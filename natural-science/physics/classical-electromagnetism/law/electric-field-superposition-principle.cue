package law

electric_field_superposition_principle: {
  content: #"""
    The *principle of superposition of electric fields* says that the total
    electric field produced by several sources at a point is the vector sum of
    the fields produced there by each source separately. Each contribution is
    calculated as if the other source charges were absent:

    $ ub(E) = sum_i ub(E)_i $

    For point charges $q_i$ at positions $ub(r)_i$, the field at position
    $ub(r)$ is:

    $ ub(E)(ub(r)) = (1/(4 π ε_0)) sum_i (q_i (ub(r) - ub(r)_i))/(abs(ub(r) - ub(r)_i)^3) $

    The direction of each term follows the sign of its source charge: away
    from a positive charge and toward a negative charge. Add the vectors by
    combining their components, or use a scale drawing when there are only a
    few contributions. In general, adding only their magnitudes gives the
    wrong result because the fields can point in different directions.

    For a continuous charge distribution, the sum becomes an integral over
    small charge elements $"d"q$:

    $ ub(E)(ub(r)) = (1/(4 π ε_0)) integral ((ub(r) - ub(r)'))/(abs(ub(r) - ub(r)')^3) "d"q $

    Here $ub(r)'$ marks the position of each charge element. This integral
    adds the vector contribution from every part of the distribution. The
    principle applies to electrostatic fields in vacuum; it lets us build the
    field of a complicated arrangement from simpler, known fields.
  """#
  related: [
    "concept/electric-field",
    "concept/electric-field-strength",
    "concept/continuous-charge-distribution",
    "law/coulomb-law"
  ]
}
