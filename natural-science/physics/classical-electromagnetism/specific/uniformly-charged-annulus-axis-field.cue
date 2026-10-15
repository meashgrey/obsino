package specific

uniformly_charged_annulus_axis_field: {
  content: """
    Consider an insulating annulus with uniform surface charge density $σ$,
    inner radius $R_1$, and outer radius $R_2$. Find the electric field at a
    point $P$ on its symmetry axis, a signed distance $x$ from the center.

    By rotational symmetry, contributions from opposite parts of the annulus
    cancel in directions perpendicular to the axis. Only the axial components
    add, so the field points along $hat(ub(x))$.

    Divide the annulus into thin circular strips of radius $s$ and width
    $"d"s$. A strip has area $"d"A = 2 π s "d"s$ and charge:

    $ "d"q = σ "d"A = 2 π σ s "d"s $

    Every point on a strip is the same distance
    $r = sqrt(x^2 + s^2)$ from $P$. The transverse field components cancel
    around that strip. The axial component of the field from its charge is:

    $ "d"E_x = k_e (x "d"q)/(r^3) = k_e (x "d"q)/((x^2 + s^2)^(3/2)) $

    Add the contributions of strips from the inner radius to the outer radius:

    $ E_x = 2 π k_e σ x integral_(R_1)^(R_2) (s "d"s)/((x^2 + s^2)^(3/2)) $

    Integrating gives the field at any point on the axis:

    $ ub(E)(x) = (σ x)/(2 ε_0) (1/sqrt(x^2 + R_1^2) - 1/sqrt(x^2 + R_2^2)) hat(ub(x)) $

    For positive $σ$ and $x>0$, the field points away from the annulus in the
    positive axial direction. For $x<0$, the signed factor $x$ reverses its
    direction. If $R_1>0$, the center $x=0$ lies in the hole and symmetry gives
    zero field there. If $R_1=0$, the center lies on the charged disk; the
    field has opposite one-sided limits there and is undefined on the ideal
    zero-thickness surface. Setting $R_1=0$ gives the disk limit.

    Because the annulus is rotationally symmetric about the $x$ axis, its
    field magnitude depends only on $x$ and the distance from that axis. The
    meridional $x y$ section therefore represents the full three-dimensional
    scalar field; rotating it around $x$ recovers the distribution. The annulus
    appears as two segments at $x=0$, where $R_1 ≤ abs(y) ≤ R_2$.

    Clio's Rust backend approximates the surface integral by summing Coulomb
    field vectors from area elements, then returns the PNG to Typst. A small
    softening length regularizes samples near the ideal charged surface; the
    pale overlay marks the source cross-section.

    \(figure_part_uniformly_charged_annulus_axis_field)
  """
  figure_part_uniformly_charged_annulus_axis_field: #"""
    #include "assets/typst/uniformly-charged-annulus-meridian-heatmap-clio.typ"
  """#
  related: [
    "concept/continuous-charge-distribution",
    "concept/electric-field-strength",
    "law/coulomb-law",
    "law/electric-field-superposition-principle"
  ]
}
