#import "@preview/cetz:0.5.2"

#align(center)[
  #figure(
    cetz.canvas({
      import cetz.draw: *
      let blue = rgb("#8fc8e8")
      let rose = rgb("#e8a0b5")
      let outline = gray + 0.6pt

      // s: a spherical probability-cloud boundary in this 2D view.
      circle((0, 0), radius: 0.55, fill: blue, stroke: outline)
      circle((0, 0), radius: 0.06, fill: black, stroke: black)
      content((0, -1.05), [$s$: roughly spherical])

      // p: two lobes with opposite wavefunction phase.
      circle((4, 0.45), radius: (0.30, 0.48), fill: blue, stroke: outline)
      circle((4, -0.45), radius: (0.30, 0.48), fill: rose, stroke: outline)
      circle((4, 0), radius: 0.06, fill: black, stroke: black)
      content((4, -1.05), [$p$: two lobes])

      // d: four lobes are a common, but not universal, d-orbital shape.
      circle((8, 0.34), radius: (0.40, 0.40), fill: blue, stroke: outline)
      circle((8.68, 0.34), radius: (0.40, 0.40), fill: rose, stroke: outline)
      circle((8, -0.34), radius: (0.40, 0.40), fill: rose, stroke: outline)
      circle((8.68, -0.34), radius: (0.40, 0.40), fill: blue, stroke: outline)
      circle((8.34, 0), radius: 0.06, fill: black, stroke: black)
      content((8.34, -1.05), [$d$: often four lobes])

      // One schematic eight-lobed projection of an f orbital.
      circle((11.65, 0.46), radius: (0.20, 0.34), fill: blue, stroke: outline)
      circle((12.05, 0.46), radius: (0.20, 0.34), fill: rose, stroke: outline)
      circle((11.40, 0.20), radius: (0.34, 0.20), fill: rose, stroke: outline)
      circle((12.30, 0.20), radius: (0.34, 0.20), fill: blue, stroke: outline)
      circle((11.40, -0.20), radius: (0.34, 0.20), fill: blue, stroke: outline)
      circle((12.30, -0.20), radius: (0.34, 0.20), fill: rose, stroke: outline)
      circle((11.65, -0.46), radius: (0.20, 0.34), fill: rose, stroke: outline)
      circle((12.05, -0.46), radius: (0.20, 0.34), fill: blue, stroke: outline)
      circle((11.85, 0), radius: 0.06, fill: black, stroke: black)
      content((11.85, -1.05), [$f$: one complex shape])
    }),
    caption: [Simplified two-dimensional views of common $s$, $p$, and $d$ orbital shapes and one representative $f$ shape. Colors distinguish wavefunction phase, not electric charge.],
  )
]
