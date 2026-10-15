#import "/.lib/clio/lib.typ": *

#let disk-radius = 1.2
#let source-plane = field-plane(
  horizontal: (0, 1, 0),
  vertical: (0, 0, 1),
)
#let palette = field-colors(
  range: (0, 10),
  scale: logarithmic-scale(reference: 1),
)
#let heatmap = electric-field-heatmap(
  (
    charged-disk(
      disk-radius,
      plane: source-plane,
      radial-samples: 20,
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
  width: 8.4cm,
)

#figure(
  align(center)[
    #heatmap
    #v(4pt)
    #text(size: 8pt)[Meridional section ($x$ horizontal, signed $y$ vertical).]
  ],
  caption: [Relative field magnitude around a uniformly charged disk. The pale segment marks the disk at $x=0$, $abs(y) ≤ R$.],
)
