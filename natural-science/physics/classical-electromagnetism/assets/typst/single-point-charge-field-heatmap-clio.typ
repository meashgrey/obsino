#import "/.lib/clio/lib.typ": *

#let palette = field-colors(
  range: (0, 10),
  scale: logarithmic-scale(reference: 1),
)
#let heatmap = electric-field-heatmap(
  (point-charge((0, 0, 0)),),
  grid: field-grid(
    resolution: (480, 480),
    bounds: (-2, 2, -2, 2),
  ),
  field: field-parameters(softening: 0.04),
  quantity: field-magnitude(),
  color: palette,
  source-overlay: source-overlay(color: "#fff0a6", thickness: 0.08),
  width: 6cm,
)

#figure(
  align(center)[#heatmap],
  caption: [Relative field magnitude around a positive point charge $+Q$ at the center; the pale disk marks the source.],
)
