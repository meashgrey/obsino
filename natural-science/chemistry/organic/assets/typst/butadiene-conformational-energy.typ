#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot

#align(center)[
  #figure(
    cetz.canvas({
      import cetz.draw: *

      let energy(angle) = if angle <= 0.5 {
        6.5 * (1 - calc.pow(1 - 2 * angle, 2))
      } else {
        2.9 + 3.6 * (1 - calc.pow(2 * angle - 1, 2))
      }

      plot.plot(
        size: (9, 5),
        x-label: [Rotation about C2–C3],
        y-label: [Relative energy ($"kcal mol"^(-1)$)],
        x-min: 0,
        x-max: 1,
        y-min: 0,
        y-max: 7,
        x-tick-step: none,
        y-tick-step: none,
        {
          plot.add(
            domain: (0, 1),
            energy,
            style: (stroke: (paint: blue, thickness: 1.4pt)),
          )
          plot.add-hline(
            2.9,
            6.5,
            min: 0,
            max: 1,
            style: (stroke: (paint: gray, dash: "dashed", thickness: 0.6pt)),
          )
          plot.annotate({
            content((0.08, 0.45), [*s*-trans])
            content((0.82, 3.35), [*s*-cis])
            content((0.49, 6.7), [TS])
            content((0.03, 3.05), [2.9])
            content((0.03, 6.65), [6.5])
          })
        },
      )
    }),
    caption: [Approximate conformational energy profile of buta-1,3-diene.],
  )
]
