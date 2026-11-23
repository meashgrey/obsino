package law

conservation_of_momentum_law: {
  content: #"""
    Consider a system of $N$ particles. The $i$-th particle has mass $m_i$,
    velocity $ub(v)_i$ and momentum: $ub(p)_i = m_i ub(v)_i$.

    The total momentum of the system is defined as the vector sum of the
    individual momentum:

    $ ub(p) := ∑_(i=1)^N ub(p)_i = ∑_(i=1)^N m_i ub(v)_i $

    $ub(p)$ is a geometric vector, independent of any coordinate system and total
    momentum is a geometric measure of the system's overall state of motion.

    Forces acting on each particle in the system can be divided into two
    categories:

    - *Internal forces*: interactions between particles within the system. For
      example, the force on particle $i$ from particle $j$ is denoted as
      $ub(F)_(j→i)$;
    - *External forces*: forces originating from outside the system. The external
      force on particle is denoted $ub(F)_i^(("ext"))$.

    Newton's second law for the $i$-th particle:

    $ ("d"ub(p)_i)/("d"t) = ∑_(j≠i) ub(F)_(j→i) + ub(F)_i^(("ext")) $

    So the time derivative of the total momentum is:

    $ ("d"ub(p))/("d"t) & = ∑_(i=1)^N ("d"ub(p)_i) \ 
      & = ∑_(i=1)^N (∑_(j≠i) ub(F)_(j→i) + ub(F)_i^(("ext"))) \
      & = ∑_(i=1)^N ∑_(j≠i) ub(F)_(j→i) + ∑_(i=1)^N ub(F)_i^(("ext")) $
    
    *Internal force part*: For each pair $i$ and $j$ ($i ≠ j$), Newton's third
    law gives $ub(F)_(j→i) = -ub(F)_(i→j)$, thus in the sum each pair cancels:

    $ ∑_(i=1)^N ∑_(j≠i) ub(F)_(j→i) = ub(0) $

    *External force part*: Define the *net external force* as the vector sum of
    all external forces:

    $ ub(F)^(("ext")) := ∑_(i=1)^N ub(F)_i^(("ext")) $

    Therefore:

    $ ("d"ub(p))/("d"t) = ub(F)^(("ext")) $

    *Law of Conservation of Momentum*: When the net external force acting on a
    system is zero, the total momentum of the system remains constant. Geometric
    language statement: $ub(F)^(("ext")) = ub(0) ⇒ "d"ub(p)\/"d"t = ub(0) ⇒
    ub(p)(t) "is a constant vector"$.

    Integrate $"d"ub(p)\/"d"t = ub(F)^(("ext"))$ with respect to time:

    $ ∫_(t_1)^(t_2) ub(F)^(("ext")) "d"t = ub(p)(t_2) - ub(p)(t_1) $

    When $ub(F)^(("ext")) = ub(0)$, $ub(p)(t_2) = ub(p)(t_1)$. This also shows
    that the change in total momentum depends only on the impulse of external
    forces. When the total impulse of internal forces is zero, the total momentum
    of the system remains a constant.

    Two particles with masses $m_1$, $m_2$, velocities before collision $ub(v)_1$,
    $ub(v)_2$, after collision $ub(v)'_1$, $ub(v)'_2$. No external forces,
    $ub(F)^(("ext"))$, then:

    $ m_1 ub(v)_1 + m_2 ub(v)_2 = m_1 ub(v)'_1 + m_2 ub(v)'_2 $
    """#
  related: [
    "law/newton-second-law",
    "law/newton-third-law",
    "concept/momentum",
    "concept/impulse",
  ]
}
