#import "/.lib/clio/lib.typ": *

#let hole-radius = 0.7
#let source-plane = field-plane(
  horizontal: (0, 1, 0),
  vertical: (0, 0, 1),
)
#let heatmap = electric-field-heatmap(
  (
    charged-plane-with-hole(
      hole-radius,
      plane: source-plane,
      radial-samples: 24,
      angular-samples: 64,
    ),
  ),
  grid: field-grid(
    resolution: (564, 436),
    bounds: (-2.4, 2.4, -1.8, 1.8),
  ),
  field: field-parameters(softening: 0.02),
  quantity: field-magnitude(),
  color: field-colors(
    range: (0, 2 * calc.pi),
    scale: logarithmic-scale(reference: 1),
  ),
  source-overlay: source-overlay(color: "#fff0a6", thickness: 0.03),
  width: 8.3cm,
)

#figure(
  align(center)[
    #heatmap
    #v(4pt)
    #text(size: 8pt)[Meridional section ($x$ horizontal, signed $y$ vertical).]
  ],
  caption: [Relative field magnitude of a uniformly charged infinite plane with a circular hole. Pale segments mark the charged plane outside the opening.],
)
