package concept

dienes_and_polyenes: {
  content: """
    Compounds containing two carbon–carbon double bonds are *dienes* (二烯),
    while compounds containing more than two are *polyenes* (多烯). Dienes are
    classified by the relative positions of their double bonds:

    \(figure_part_diene_arrangements)

    - *Cumulated dienes* (累积二烯) have adjacent double bonds that share one
      carbon atom. The simplest example is *propadiene* (丙二烯, allene),
      $"CH"_2="C"="CH"_2$. Its central carbon is $"sp"$-hybridized. The two
      unhybridized $p$ orbitals on this carbon are perpendicular, so the two
      terminal $π$ systems lie in perpendicular planes.

    - *Conjugated dienes* (共轭二烯) have alternating double and single bonds,
      as in *buta-1,3-diene* (1,3-丁二烯), $"CH"_2="CH"-"CH"="CH"_2$.
      Each of the four carbons has a $p$ orbital, and neighboring orbitals
      overlap across the chain. The four $π$ electrons are delocalized over all
      four carbons rather than confined to two separate double bonds. This
      overlap gives the central C–C bond some double-bond character and favors
      a nearly planar arrangement of the four carbon atoms.

    - *Isolated dienes* (孤立二烯) have double bonds separated by at least two
      single bonds, as in *penta-1,4-diene* (1,4-戊二烯),
      $"CH"_2="CH"-"CH"_2-"CH"="CH"_2$. The intervening $"sp"^3$ carbon has
      no unhybridized $p$ orbital to extend the overlap, so each double bond
      behaves approximately as an independent alkene.

    A quick way to distinguish the three arrangements is to count the single
    bonds between the double bonds: none means *cumulated*, one means
    *conjugated*, and two or more means *isolated*.
  """
  figure_part_diene_arrangements: #"""
    #let diene-arrangements = "assets/typst/diene-arrangements.typ"
    #eval(
      str(read(diene-arrangements)),
      mode: "markup"
    )
  """#
}
