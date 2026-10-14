package concept

multipole_expansion: {
  content: """
    For point charges $q_i$ at positions $ub(r)_i$, the exact electric
    potential and field at an observation point $ub(r)$ are sums of the
    contributions from every charge. In vacuum, with
    $k_e = 1/(4 π ε_0)$:

    $ V(ub(r)) = k_e sum_i (q_i)/(abs(ub(r) - ub(r)_i)) $

    $ ub(E)(ub(r)) = k_e sum_i (q_i (ub(r) - ub(r)_i))/(abs(ub(r) - ub(r)_i)^3) $

    A *multipole expansion* approximates these sums far from the whole
    charge system. Choose an origin near the charges, let $a$ be the greatest
    distance of any charge from that origin, and let $r = abs(ub(r))$. When
    $r >> a$, expand each distance factor in powers of the small ratio
    $abs(ub(r)_i)/r$. The potential begins:

    $ V(ub(r)) ≈ k_e ((Q)/(r) + (ub(p) dot hat(ub(r)))/(r^2) + (1/(2 r^3)) sum_i q_i (3 (hat(ub(r)) dot ub(r)_i)^2 - abs(ub(r)_i)^2) + dots) $

    Here $Q = sum_i q_i$ is the total charge, and
    $ub(p) = sum_i q_i ub(r)_i$ is the dipole moment about the chosen origin.
    The first term is the *monopole* contribution; the next is the *dipole*
    contribution. The following term is the quadrupole contribution.

    Differentiating the first two terms gives the leading far-field electric
    field:

    $ ub(E)(ub(r)) ≈ k_e ((Q)/(r^2) hat(ub(r)) + (3 (ub(p) dot hat(ub(r))) hat(ub(r)) - ub(p))/(r^3)) $

    If $Q != 0$, the monopole term dominates and the field falls as $1/r^2$.
    If the charges sum to zero, that term vanishes; a nonzero dipole moment
    then gives a field falling as $1/r^3$. If both the total charge and dipole
    moment vanish, the quadrupole term or a still higher term determines the
    leading field; a quadrupole field falls as $1/r^4$.

    The expansion is useful when $r$ is much larger than the charge system.
    Close to the charges, use the exact sum instead. The heatmap below shows
    the exact field magnitude for one asymmetric four-charge example: $+2q$
    at $(-0.8, 0.6)$, $-q$ at $(0.75, 0.55)$, $+q$ at $(0.35, -0.75)$, and
    $-q$ at $(-0.65, -0.70)$. Coordinates are in diagram units; colors show
    relative magnitude on a logarithmic scale, not field direction.

    \(figure_part_multipole_expansion)
  """
  figure_part_multipole_expansion: #"""
    #let multipole-heatmap = "assets/typst/multipoint-charge-field-heatmap.typ"
    #scale(80%, reflow: true)[
      #eval(
        str(read(multipole-heatmap)),
        mode: "markup"
      )
    ]
  """#
  related: [
    "concept/point-charge",
    "concept/electric-field-strength",
    "concept/electric-dipole",
    "law/coulomb-law",
    "law/electric-field-superposition-principle"
  ]
}
