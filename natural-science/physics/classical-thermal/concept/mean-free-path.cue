package concept

mean_free_path: {
  content: #"""
    *Mean free path* $λ$ is the average distance a molecule travels between two
    successive collisions. Mean free path and mean collision frequency are
    related by:

    $ λ = (⟨v⟩)/f $

    where $⟨v⟩$ is the *average speed* of the molecules.

    Let $n = N/V$ be the *number density*, where $N$ is the number of molecules
    and $V$ is the gas volume. The molecule sweeps out a *cylinder* of collision
    cross-section area $σ$ as it moves.

    A collision depends on the *relative velocity* of two molecules. For identical
    molecules in a Maxwellian gas, the mean relative speed is exactly
    $⟨v_"rel"⟩ = sqrt(2) ⟨v⟩$. This follows because the difference of two
    independently sampled Maxwellian velocity vectors is also Maxwellian; it is
    not obtained by equating a root-mean-square speed with a mean speed.

    In a short time $Δ t$, the expected number of collisions for one molecule is:

    $ Δ N_"collisions" = n σ ⟨v_"rel"⟩ Δ t = sqrt(2) n σ ⟨v⟩ Δ t $

    The collision frequency is $f = (Δ N_"coll")/(Δ t)$. Dividing the average
    distance traveled per unit time by the collision frequency gives the mean
    free path:

    $ λ = ⟨v⟩/f = 1/(sqrt(2) n σ) = 1/(sqrt(2) π d^2 n) $
  """#
  related: [
    "concept/mean-collision-frequency",
    "concept/collision-cross-section"
  ]
}
