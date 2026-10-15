package specific

uniformly_charged_plane_with_circular_hole: {
  content: """
    Special case 2: Keep the inner radius $R_1=a>0$ and let the outer radius
    grow without bound. The annulus becomes an infinite charged plane with a
    circular hole of radius $a$ centered on the symmetry axis.

    Taking $R_2 → infinity$ in the annulus axis-field formula gives:

    $ ub(E)_x(x) = (σ x)/(2 ε_0 sqrt(x^2 + a^2)) hat(ub(x)) $

    At the center of the hole, $x=0$, symmetry gives zero field. Far from the
    plane, where $abs(x) >> a$, the hole becomes negligible and the field
    approaches that of a uniformly charged infinite plane,
    $abs(σ)/(2 ε_0)$.

    For the meridional heatmap, integrate directly over the charged plane
    outside the hole. The radial coordinate is mapped from a finite interval
    to $[R_1, infinity)$, so the full infinite surface is included without
    subtracting the removed disk or introducing a finite outer cutoff. Rust
    evaluates the Coulomb contributions and creates the heatmap; the pale
    overlay marks the charged plane outside the opening. A small softening
    length regularizes samples close to the ideal charged surface.

    \(figure_part_uniformly_charged_plane_with_circular_hole)
  """
  figure_part_uniformly_charged_plane_with_circular_hole: #"""
    #include "assets/typst/uniformly-charged-plane-with-circular-hole-heatmap-clio.typ"
  """#
  related: [
    "concept/continuous-charge-distribution",
    "concept/electric-field-strength",
    "law/coulomb-law",
    "law/electric-field-superposition-principle",
    "specific/uniformly-charged-annulus-axis-field",
    "specific/uniformly-charged-disk-axis-field"
  ]
}
