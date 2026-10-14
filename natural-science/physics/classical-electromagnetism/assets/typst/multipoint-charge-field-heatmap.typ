#let samples-x = 121
#let samples-y = 91
#let cell-size = 1.7pt
#let half-width = 2.2
#let half-height = 1.65
#let max-field = 12
#let singularity-cutoff = 0.025

#let charges = (
  (-0.8, 0.6, 2),
  (0.75, 0.55, -1),
  (0.35, -0.75, 1),
  (-0.65, -0.7, -1),
)

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

#let heatmap-cells = range(samples-x * samples-y).map(index => {
  let x-index = calc.rem(index, samples-x)
  let y-index = calc.floor(index / samples-x)
  let x = ((x-index - (samples-x - 1) / 2) * half-width) / ((samples-x - 1) / 2)
  let y = (
    (((samples-y - 1) / 2 - y-index) * half-height) / ((samples-y - 1) / 2)
  )

  let fields = charges.fold((0, 0, false), (acc, charge) => {
    let dx = x - charge.at(0)
    let dy = y - charge.at(1)
    let raw-distance-squared = dx * dx + dy * dy
    let distance-squared = if raw-distance-squared < singularity-cutoff {
      singularity-cutoff
    } else {
      raw-distance-squared
    }
    let denominator = calc.pow(distance-squared, 1.5)
    let contribution-x = (charge.at(2) * dx) / denominator
    let contribution-y = (charge.at(2) * dy) / denominator

    (
      acc.at(0) + contribution-x,
      acc.at(1) + contribution-y,
      acc.at(2) or raw-distance-squared < singularity-cutoff,
    )
  })
  let magnitude = if fields.at(2) {
    max-field
  } else {
    calc.sqrt(fields.at(0) * fields.at(0) + fields.at(1) * fields.at(1))
  }
  let color = field-color(magnitude)

  box(width: cell-size, height: cell-size, fill: color, stroke: none)
})

#let legend-samples = 101
#let legend-cells = range(legend-samples).map(index => {
  let magnitude = (max-field * index) / (legend-samples - 1)
  box(width: 1.27pt, height: 7pt, fill: field-color(magnitude), stroke: none)
})

#align(center)[
  #figure(
    grid(
      columns: 1,
      row-gutter: 5pt,
      [
        #grid(
          columns: samples-x,
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
    caption: [Exact field magnitude for a four-charge system; warmer colors show
      a stronger field. The charge signs and locations are given in the text.],
  )
]
