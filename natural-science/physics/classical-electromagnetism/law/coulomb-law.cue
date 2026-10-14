package law

coulomb_law: {
  content: #"""
    *Coulomb's law* describes the electric force between two point charges at
    rest in vacuum. If the charges are $q_1$ and $q_2$, and the distance
    between them is $r$, the force magnitude is:

    $ F = 1/(4 π ε_0) (|q_1 q_2|)/(r^2) = k_e (|q_1 q_2|)/(r^2) $

    Here $k_e = 1/(4 π ε_0)$ is the Coulomb constant, and $ε_0$ is the vacuum
    electric permittivity. Its 2022 CODATA value is approximately
    $8.8541878188 × 10^(-12) "F"\/"m"$. Equivalently, its unit is
    $"C"^2\/("N" ⋅ "m"^2)$. The value of $ε_0$ sets the strength of the electric
    force in vacuum in the SI system.

    The force acts along the line joining the charges. Charges with the same
    sign repel, while charges with opposite signs attract. The force grows
    when either charge is larger and becomes weaker with the square of the
    distance: doubling $r$ makes the force one quarter as large.

    The factor $4 π$ is part of the *rationalized* SI form of the law. In this
    convention, the geometrical factor associated with a sphere is kept
    explicitly in the equations. Rationalization is a choice about where
    factors of $4 π$ appear in the equations; it does not mean changing the
    physical force.
  """#
  related: ["concept/point-charge"]
  external_link: ["https://physics.nist.gov/cgi-bin/cuu/Value?eqep0="]
}
