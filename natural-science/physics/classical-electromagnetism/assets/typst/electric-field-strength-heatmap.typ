#let samples-x = 121
#let samples-y = 91
#let cell-size = 1.86pt
#let half-width = 2
#let half-height = 1.5
#let charge-offset = 0.7
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

#let heatmap-cells = range(samples-x * samples-y).map(index => {
  let x-index = calc.rem(index, samples-x)
  let y-index = calc.floor(index / samples-x)
  let x = (x-index - (samples-x - 1) / 2) * half-width / ((samples-x - 1) / 2)
  let y = ((samples-y - 1) / 2 - y-index) * half-height / ((samples-y - 1) / 2)

  let dx-positive = x + charge-offset
  let raw-distance-squared-positive = dx-positive * dx-positive + y * y
  let distance-squared-positive = if raw-distance-squared-positive < 0.025 {
    0.025
  } else {
    raw-distance-squared-positive
  }

  let dx-negative = x - charge-offset
  let raw-distance-squared-negative = dx-negative * dx-negative + y * y
  let distance-squared-negative = if raw-distance-squared-negative < 0.025 {
    0.025
  } else {
    raw-distance-squared-negative
  }

  let field-x = (
    dx-positive / calc.pow(distance-squared-positive, 1.5)
      - dx-negative / calc.pow(distance-squared-negative, 1.5)
  )
  let field-y = (
    y / calc.pow(distance-squared-positive, 1.5)
      - y / calc.pow(distance-squared-negative, 1.5)
  )
  let magnitude = if (
    raw-distance-squared-positive < 0.025
      or raw-distance-squared-negative < 0.025
  ) {
    10
  } else {
    calc.sqrt(field-x * field-x + field-y * field-y)
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
    caption: [Field magnitude around a dipole (+q on the left, −q on the right);
      warmer colors show a stronger field.],
  )
]
