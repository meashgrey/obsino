#let samples = 121
#let cell-size = 1.4pt
#let half-width = 2
#let max-field = 10

#let color-stops = (
  rgb("#163b78"),
  rgb("#3fa7a0"),
  rgb("#f0e65b"),
  rgb("#f6a13a"),
  rgb("#d94732"),
)

#let field-color(magnitude) = {
  let capped-magnitude = if magnitude > max-field {
    max-field
  } else {
    magnitude
  }
  let normalized = calc.log(1 + capped-magnitude) / calc.log(1 + max-field)
  let stop-position = normalized * (color-stops.len() - 1)
  let stop-index = if stop-position >= color-stops.len() - 1 {
    color-stops.len() - 2
  } else {
    calc.floor(stop-position)
  }
  let local-position = stop-position - stop-index

  color.mix(
    (color-stops.at(stop-index), 1 - local-position),
    (color-stops.at(stop-index + 1), local-position),
    space: oklab,
  )
}

#let heatmap-cells = range(samples * samples).map(index => {
  let x-index = calc.rem(index, samples)
  let y-index = calc.floor(index / samples)
  let x = (x-index - (samples - 1) / 2) * half-width / ((samples - 1) / 2)
  let y = ((samples - 1) / 2 - y-index) * half-width / ((samples - 1) / 2)
  let distance-squared = x * x + y * y
  let magnitude = if distance-squared < 0.1 {
    max-field
  } else {
    1 / distance-squared
  }
  let color = field-color(magnitude)

  box(width: cell-size, height: cell-size, fill: color, stroke: none)
})

#let legend-samples = 101
#let legend-cells = range(legend-samples).map(index => {
  let magnitude = max-field * index / (legend-samples - 1)
  box(width: 1.27pt, height: 7pt, fill: field-color(magnitude), stroke: none)
})

#align(center)[
  #figure(
    grid(
      columns: 1,
      row-gutter: 5pt,
      [
        #grid(
          columns: samples,
          column-gutter: 0pt,
          row-gutter: 0pt,
          ..heatmap-cells,
        )
      ],
      [#text(size: 8pt)[Log-scaled relative electric-field magnitude]],
      [
        #grid(
          columns: legend-samples,
          column-gutter: 0pt,
          row-gutter: 0pt,
          ..legend-cells,
        )
      ],
    ),
    caption: [Relative field magnitude around a positive point charge $+Q$ at
      the center. The ideal point-charge singularity is capped for display.],
  )
]
