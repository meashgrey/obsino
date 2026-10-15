package specific

uniformly_charged_disk_axis_field: {
  content: """
    Special case 1: Set the inner radius of a uniformly charged annulus to
    zero while keeping its outer radius $R$ finite. The charge distribution
    becomes a uniformly charged disk with surface density $σ$.

    Substitute $R_1=0$ and $R_2=R$ into the annulus axis-field result:

    $ ub(E)_x(x) = (σ x)/(2 ε_0) ((1)/(abs(x)) - (1)/(sqrt(x^2 + R^2))) hat(ub(x)), quad x != 0 $

    For $σ>0$, the field points away from the disk. The magnitude is the same
    on either side at equal distances. Far from the disk, it approaches the
    field of a point charge with the disk's total charge
    $Q = σ π R^2$.

    The point $x=0$ lies on the charged disk itself. The ideal zero-thickness
    model has opposite one-sided limits there, so its field on the surface is
    not defined; the symmetric average of the two limits is zero. In the
    meridional section, the disk appears as a finite segment along the signed
    $y$ direction. Clio evaluates the Coulomb integral in Rust, then returns
    the heatmap image to Typst for layout; the pale overlay marks the charged
    disk in the meridional section.

    \(figure_part_uniformly_charged_disk_axis_field)
  """
  figure_part_uniformly_charged_disk_axis_field: #"""
    #include "assets/typst/uniformly-charged-disk-heatmap-clio.typ"
  """#
  related: [
    "concept/continuous-charge-distribution",
    "concept/electric-field-strength",
    "law/coulomb-law",
    "law/electric-field-superposition-principle",
    "specific/uniformly-charged-annulus-axis-field"
  ]
}
