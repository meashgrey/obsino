#import "/.lib/clio/lib.typ": *

#let inner-radius = 0.55
#let outer-radius = 1.35
#let source-plane = field-plane(
  horizontal: (0, 1, 0),
  vertical: (0, 0, 1),
)
#let palette = field-colors(
  range: (0, 25),
  scale: logarithmic-scale(reference: 1),
)
#let heatmap = electric-field-heatmap(
  (
    charged-annulus(
      inner-radius,
      outer-radius,
      plane: source-plane,
      radial-samples: 24,
      angular-samples: 48,
    ),
  ),
  grid: field-grid(
    resolution: (420, 315),
    bounds: (-2.4, 2.4, -1.8, 1.8),
  ),
  field: field-parameters(softening: 0.02),
  quantity: field-magnitude(),
  color: palette,
  source-overlay: source-overlay(color: "#fff0a6", thickness: 0.03),
  width: 5.3cm,
)

#figure(
  align(center)[#heatmap],
  caption: [Meridional section ($x$ horizontal, signed $y$ vertical). Relative field magnitude around a uniformly charged annulus; pale segments mark its cross-section at $x=0$, $R_1 ≤ abs(y) ≤ R_2$.],
  placement: none,
)
