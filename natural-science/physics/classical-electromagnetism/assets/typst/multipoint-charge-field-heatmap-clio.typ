#import "/.lib/clio/lib.typ": *

#let charges = (
  point-charge((-0.8, 0.6, 0), charge: 2),
  point-charge((0.75, 0.55, 0), charge: -1),
  point-charge((0.35, -0.75, 0)),
  point-charge((-0.65, -0.7, 0), charge: -1),
)
#let palette = field-colors(
  range: (0, 12),
  scale: logarithmic-scale(reference: 1),
)
#let heatmap = electric-field-heatmap(
  charges,
  grid: field-grid(
    resolution: (460, 345),
    bounds: (-2.2, 2.2, -1.65, 1.65),
  ),
  field: field-parameters(softening: 0.04),
  quantity: field-magnitude(),
  color: palette,
  source-overlay: source-overlay(color: "#fff0a6", thickness: 0.08),
  width: 7.3cm,
)

#figure(
  align(center)[#heatmap],
  caption: [Electric-field magnitude for a four-charge system; pale disks identify the charge locations and signs are given in the text.],
)
