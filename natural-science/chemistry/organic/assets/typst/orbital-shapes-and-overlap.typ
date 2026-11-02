#import "@preview/cetz:0.5.2"

#align(center)[
  #figure(
    cetz.canvas({
      import cetz.draw: *

      let blue-fill = rgb("#b8dcf2")
      let pink-fill = rgb("#f4c8d7")
      let blue-stroke = rgb("#397da5") + 0.8pt
      let pink-stroke = rgb("#b45577") + 0.8pt

      // A p orbital has two lobes with opposite mathematical phase.
      circle((0, 0.8), radius: (0.34, 0.65), fill: blue-fill, stroke: blue-stroke)
      circle((0, -0.8), radius: (0.34, 0.65), fill: pink-fill, stroke: pink-stroke)
      circle((0, 0), radius: 0.08, fill: black, stroke: black)
      content((0, 0.8), "+")
      content((0, -0.8), "−")
      content((0, -2.0), [One $p$ orbital])

      // Sigma density lies along the internuclear axis.
      circle((4.5, 0), radius: (1.25, 0.34), fill: blue-fill, stroke: blue-stroke)
      circle((3.7, 0), radius: 0.09, fill: black, stroke: black)
      circle((5.3, 0), radius: 0.09, fill: black, stroke: black)
      line((3.7, 0), (5.3, 0), stroke: gray + 0.7pt)
      content((4.5, -0.9), [End-on overlap])
      content((4.5, -2.0), [σ bond: density on the axis])

      // Pi density forms above and below the internuclear axis.
      circle((10, 0.8), radius: (1.25, 0.42), fill: blue-fill, stroke: blue-stroke)
      circle((10, -0.8), radius: (1.25, 0.42), fill: pink-fill, stroke: pink-stroke)
      circle((9.2, 0), radius: 0.09, fill: black, stroke: black)
      circle((10.8, 0), radius: 0.09, fill: black, stroke: black)
      line((9.2, 0), (10.8, 0), stroke: gray + 0.7pt)
      content((10, 0.8), "+")
      content((10, -0.8), "−")
      content((10, -2.0), [π bond: side-on overlap])
    }),
    caption: [Simplified orbital shapes and σ/π overlap. The colored lobes show mathematical phase, not electric charge.],
  )
]
