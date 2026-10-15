package concept

degrees_of_freedom: {
  content: #"""
    A *degree of freedom* is an independent way for a molecule to store energy.
    In classical thermal physics, each independent quadratic term in the energy
    contributes one degree of freedom. A vibrational mode has both kinetic and
    potential energy terms, so it contributes two degrees of freedom when active.

    The table counts active energy degrees of freedom. Vibrations are effectively
    frozen at sufficiently low temperatures because of quantum effects; at high
    temperatures, the classical count applies.

    #align(center)[
      #table(
        columns: 5,
        align: (left, ) + (center, ) * 4,

        [Type],
        [Translational],
        [Rotational],
        [Vibrational modes],
        [Total degrees of freedom],

        [Single atom], [3], [0], [0], [3],
        [Diatomic molecule (vibrations frozen)], [3], [2], [0], [5],
        [Diatomic molecule (vibration active)], [3], [2], [1], [7],
        [Linear molecule with $N$ atoms (vibrations frozen)], [3], [2], [0], [5],
        [Linear molecule with $N$ atoms (all vibrations active)], [3], [2], [$3 N - 5$], [$6 N - 5$],
        [Nonlinear molecule with $N$ atoms (vibrations frozen)], [3], [3], [0], [6],
        [Nonlinear molecule with $N$ atoms (all vibrations active)], [3], [3], [$3 N - 6$], [$6 N - 6$]
      )
    ]

    Here $N$ is the number of atoms in the molecule. A linear molecule has two
    rotational degrees of freedom because rotation about its molecular axis has
    a much smaller moment of inertia and is usually neglected. This follows from
    its geometry, not from whether its bonds are single or double.
  """#
  related: [
    "law/equipartition-theorem"
  ]
}
