#import "@tcum/hw:0.1.2": *
#import "@tcum/i2cn:0.1.0": *

#show: hw

#problem[Formalizing multisets][
  Formalize $S in MM(cal(M))$ as a mapping
  $ S: cal(M) -> NN $
  where $S(m) = n$ means, that message $m$ is in a multiset
  $S$ exactly $n$ times.
  #footnote[
    Recall that we denote with $NN$ the natural numbers including $0$.
  ]
  How do you formalize for multisets $S$ and $T$ then
  1. $S$ contains the single message $m$
  2. $S union T$
  3. $S inter T$
  4. $S without T$
]

#solution[
  #show math.equation: set align(left)
  1. $ S(x) = cases(1 quad "if" x = m, 0 quad "if" x != m) $
  2. $ (S union T)(x) = S(x) + T(x) $
  3. $ (S inter T)(x) = min{S(x), T(x)} $
  4. $ (S without T)(x) = max{0, S(x) - T(x)} $
]

#problem[Simulating asynchronous communication by synchronous communication][
  We denote components $X$ of the system with asynchronous
  communication as on the slides and their counterparts (if
  existing) in the simulating system with synchronous
  communication by $tilde(X)$.

  - As the set of states we choose:
    $ tilde(Z)_p = Z_p times MM(cal(M)) $
    i.e. we include the simulated message buffer in the
    state of the simulating process.
  - for a send transition:
    $ c arr_p^s (x, m, d) "with" q = link_p (x) $
    and corresponding receive transition
    $ (e, m) arr_q^r f $
    of the simulated system we choose for all $S, T$
    $ (S, c) attach(->, t: tilde, tr: s, br: p) (x, m, S) "and"
      ((e, T), m) attach(->, t: tilde, tr: r, br: q) (f, T union {m}) $

  Specify for the simulating systems
  1. The send transition $attach(->, t: tilde, tr: s, br: p)$.
  2. The internal transition $attach(->, t: tilde, tr: i, br: p)$.
    Hint: you need rules for the sim
]

#problem[Schedules][
  Consider the system from exercise 1 of sheet 1. Prove or
  disprove: in every run of the system and for every natural
  number $n$ we eventually have $n in S$.
]

#solution[
  This statement is false. Part 2 of exercise 2 of sheet 1
  had us come up with a counterexample.
]

#problem[Norm Functions][
  Lemma 2 from the slides: There is a typo on the slides. The
  following condition is part of the definition of norm functions.
  - if $E$ terminates in a state $gamma$, the $P(gamma)$ holds
    in that state.
  Now prove: Let $f$ be a norm function for predicate $P$. Then for
  each execution of $E$ of system $S$ predicate $P(gamma)$ holds in
  some configuration of $E$.
]

#solution[
  #proof[
    We need to consider two cases:
    - *Execution is finite.* In this case, there will be a
      configuration $gamma$ in which the execution terminates and
      by the updated definition, the predicate will hold (i.e. $P(gamma)$).
    - *Execution is infinite.* In this case, we will have
      infinite configurations
      $ gamma_1 -> gamma_2 -> dots.c $
      Applying the norm function to each gives us the following:
      $ forall i > 1 -> f(gamma_(i-1)) > f(gamma_i) or P(gamma). $
      Since $(W, <)$ is a well ordering, there will always exist
      some $j$ where $f(gamma_(j-1)) gt.not f(gamma_j)$ and therefore
      $P(gamma_j)$.
  ]
]

#problem[Making the leader known][
  Modify the deterministic leader election algorithm with UIDs
  on a ring, such that
  - Computations on all nodes terminate (not necessarily at
    the same time)
  - Each node knows the UID of the elected leader at the time
    when its computation has terminated.
  For ring size $N$ estimate
  1. the total number of messages sent
  2. the number of steps until the last node terminates.
]

#solution[
  1. The total number of messages sent can vary very much.
    - *Minimum:* if the UIDs are assigned in an _ascending_ order
      $ i < j -> u_i < u_j $ 
      then the number of messages will be $N$.
    - *Maximum:* if the UIDs are assigned in a _descending_ order
      $ i < j -> u_j < u_i $
      then the number of messages sent will be $(N (N + 1)) / 2$.
    So the general answer is $O(N^2)$.
  2. It will take $N$ rounds for the leader to receive their
    own UID and by that time the UID will have gone through
    every other node. However, for the other nodes to know to
    terminate, the leader should inform them somehow. This
    will take at least $ceil(N / 2)$ steps (that's the case
    where the leader sends termination signals in both
    directions). So in total $N + ceil(N/2)$ or $O(N)$ steps
    should suffice.
]
