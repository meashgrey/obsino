#import "/.lib/clio/lib.typ": *

#let charge-offset = 0.7
#let palette = field-colors(
  range: (0, 10),
  scale: logarithmic-scale(reference: 1),
)
#let heatmap = electric-field-heatmap(
  (
    point-charge((-charge-offset, 0, 0)),
    point-charge((charge-offset, 0, 0), charge: -1),
  ),
  grid: field-grid(
    resolution: (500, 375),
    bounds: (-2, 2, -1.5, 1.5),
  ),
  field: field-parameters(softening: 0.04),
  quantity: field-magnitude(),
  color: palette,
  source-overlay: source-overlay(color: "#fff0a6", thickness: 0.08),
  width: 7.9cm,
)

#figure(
  align(center)[#heatmap],
  caption: [Field magnitude around a dipole (+q on the left, −q on the right); warmer colors show a stronger field.],
)
