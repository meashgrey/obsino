package concept

electric_dipole: {
  content: """
    An *electric dipole* is a pair of charges with equal magnitude and
    opposite signs, separated by a distance $d$. Its *electric dipole moment*
    is the vector:

    $ ub(p) = q ub(d) $

    Here $q$ is the magnitude of either charge, and $ub(d)$ points from the
    negative charge to the positive charge. The dipole moment therefore points
    from $-q$ toward $+q$, and its magnitude is $p = abs(ub(p)) = q d$.

    Put the midpoint at the origin, with $+q$ at $x=d/2$ and $-q$ at
    $x=-d/2$. At a point on the positive side of the axis, $r>d/2$, the two
    field contributions point in opposite directions, so their magnitudes
    subtract:

    $ E_"axis" = (k_e q)/((r-d/2)^2) - (k_e q)/((r+d/2)^2) $

    Combining the fractions and using $p = q d$ gives:

    $ E_"axis" = (2 k_e p r)/((r^2-(d/2)^2)^2) $

    For a general observation point $ub(r)$ measured from the midpoint, add
    the fields from charges at $±ub(d)/2$. This exact vector expression works
    everywhere except at the charges themselves:

    $ ub(E)(ub(r)) = k_e q (((ub(r) - (ub(d))/(2)))/(abs(ub(r) - (ub(d))/(2))^3) - ((ub(r) + (ub(d))/(2)))/(abs(ub(r) + (ub(d))/(2))^3)) $

    Far from the dipole, $r >> d$, let $θ$ be the angle between $ub(r)$ and
    the dipole moment. Resolve the field into its radial component $E_r$ and
    its angular component $E_θ$, which points toward increasing $θ$:

    $ E_r ≈ (2 k_e p cos θ)/(r^3), quad E_θ ≈ (k_e p sin θ)/(r^3), quad E ≈ (k_e p)/(r^3) sqrt(1 + 3 cos^2 θ) $

    On the axis, $θ=0$, this reduces to $E ≈ (2 k_e p)/(r^3)$. On the
    perpendicular bisector, $θ=π/2$, the magnitude is $E ≈ (k_e p)/(r^3)$
    and the field points opposite to the dipole moment. At any angle, doubling
    a sufficiently large distance reduces the far-field magnitude to about
    one eighth.

    The heatmap shows the field magnitude around an ideal dipole, with $+q$ on
    the left and $-q$ on the right. Warmer colors indicate a stronger field.
    It displays magnitude only; the direction comes from adding the two
    charge-field vectors, not from the color.

    \(figure_part_electric_dipole)
  """
  figure_part_electric_dipole: #"""
    #let dipole-heatmap = "assets/typst/electric-field-strength-heatmap-clio.typ"
    #scale(80%, reflow: true)[
      #eval(
        str(read(dipole-heatmap)),
        mode: "markup"
      )
    ]
  """#
  related: [
    "concept/electric-field-strength",
    "concept/point-charge",
    "law/coulomb-law",
    "law/electric-field-superposition-principle"
  ]
}
