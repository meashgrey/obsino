#import "@preview/cetz:0.5.2"

#align(center)[
  #figure(
    cetz.canvas({
      import cetz.draw: *
      let ink = rgb("#355d78")
      let arrow-color = rgb("#b45577")
      let pale = rgb("#f5f8fa")

      let x-of = (column) => 1.3 + (column - 1) * 1.8
      let y-of = (row) => 6.3 - (row - 1) * 0.9

      content((0.55, 7.0), [$n$])
      for (column, label) in ((1, "s"), (2, "p"), (3, "d"), (4, "f")) {
        content((x-of(column), 7.0), text(weight: "bold")[#label])
      }
      for row in range(1, 8) {
        content((0.55, y-of(row)), text(weight: "bold")[#str(row)])
      }

      // Draw each diagonal-rule sweep before the cells, so arrows stay in the gaps.
      let sweeps = (
        ((2, 2), (3, 1)),
        ((3, 2), (4, 1)),
        ((3, 3), (4, 2)), ((4, 2), (5, 1)),
        ((4, 3), (5, 2)), ((5, 2), (6, 1)),
        ((4, 4), (5, 3)), ((5, 3), (6, 2)), ((6, 2), (7, 1)),
        ((5, 4), (6, 3)), ((6, 3), (7, 2)),
      )
      for ((source-row, source-column), (target-row, target-column)) in sweeps {
        let x1 = x-of(source-column)
        let y1 = y-of(source-row)
        let x2 = x-of(target-column)
        let y2 = y-of(target-row)
        line(
          (x1 - 0.48, y1 - 0.22),
          (x2 + 0.48, y2 + 0.22),
          stroke: 1.1pt + arrow-color,
          mark: (end: "stealth"),
        )
      }

      let orbitals = (
        (1, 1, "1s", "1"),
        (2, 1, "2s", "2"), (2, 2, "2p", "3"),
        (3, 1, "3s", "4"), (3, 2, "3p", "5"), (3, 3, "3d", "7"),
        (4, 1, "4s", "6"), (4, 2, "4p", "8"), (4, 3, "4d", "10"), (4, 4, "4f", "13"),
        (5, 1, "5s", "9"), (5, 2, "5p", "11"), (5, 3, "5d", "14"), (5, 4, "5f", "17"),
        (6, 1, "6s", "12"), (6, 2, "6p", "15"), (6, 3, "6d", "18"),
        (7, 1, "7s", "16"), (7, 2, "7p", "19"),
      )
      for (row, column, label, order) in orbitals {
        let x = x-of(column)
        let y = y-of(row)
        let orbital-color = if label == "4s" or label == "3d" { arrow-color } else { ink }
        rect((x - 0.48, y - 0.22), (x + 0.48, y + 0.22), fill: pale, stroke: gray + 0.5pt)
        content((x, y), text(weight: "bold", fill: orbital-color)[#label])
        content((x + 0.34, y + 0.13), text(size: 5pt, fill: arrow-color)[#order])
      }

      content((4.0, -0.15), [Follow the diagonal arrows; small numbers give the full filling order.])
      content((4.0, -0.55), [The chart is a mnemonic for the common approximate order.])
    }),
    caption: [Aufbau diagonal rule: subshells are arranged by shell in rows and by type in columns. Follow the diagonal sweeps from the top toward the bottom; the numbered sequence gives the usual filling order.],
  )
]
