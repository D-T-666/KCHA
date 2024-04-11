#import "@local/hw:0.1.0": *
#import "@preview/tablex:0.0.8": *

#show: homework(
  theme,
  subject: smallcaps[Theory of Computation],
  title: smallcaps[Excercise for TTF],
  week: 7
)

#let (problem, solution, hr, ..) = themed-items(theme)
#let cx = cellx(fill: theme.tcum, "")

#problem[
  Give a precise mathematical description of the Turing machine $T$ with input 
  symbols $Sigma = {#`0`, #`1`}$ informally given by the following.

  #emph[
    If $T$ is given a tape with a finite run of consecutive `1`s and is started 
    on the leftmost cell of the run, it will erase all the `1`s and then stop. 
    If $T$ is started on a tape consisting entirely of `1`s, it will never stop.
  ]
]
#solution[
  Let $Z = {z_0, z_e}, E = {z_e}$ and $delta$ be defined as
  $ delta(z_0, a) = cases(
    (z_0, B, R) quad & "if" a = 1, 
    (z_e, a, N) &"otherwise".
  ) $
][done]

#problem[
  Construct a two-tape Turing machine that simulates a deterministic push down 
  automaton.
]
#solution[
  Let $M = (Z, Sigma, Gamma, delta, z_0, Z_A)$ be a DPDA and 
  $N = (Z_T, Sigma union Gamma, delta_T, z_0, Z_A)$ where 
  $Z_T = Z union Z times Gamma$ the corresponding Turing
  machine. The states can will be the same, the alphabet will be the union of 
  the both of the alphabets of the DPDA, the transition function will be 
  modified, but the starting and the accepting states will be the same.

  The first tape will be the whole input and the second tape will be used as the
  stack of the DPDA. Now for every $z in Z, a in Sigma, s in Gamma$ define
  $ delta_T (z, a, s) = cases(
    ((z', s'), a, s, R, R) quad &"if" (z', "push" s') = delta(z, a, s),
    (z', a, B, R, L) quad &"if" (z', "pop") = delta(z, a, s),
    (z', a, s, R, N) quad &"if" (z', "push" epsilon) = delta(z, a, s)
  ) $
  and 
  $ delta_T ((z, s), a_1, a_2) = (z, a_1, s, N, N). $
][done]

#problem[
  What follows are the exercises from the lecture on a Turing machine. See the 
  mentioned lecture for precise definitions.

  1. Describe Turing machine "next state" relation $tack$ for $k = 2$ tapes. You 
    can aslo try for $k > 2$.
  2. Construct a Turing machine which shifts inscription $w in {0, 1, \#}^*$
    of tape one cell to the left. Is your machine regular?
]
#solution[
  + 
    #figure(
      box(radius: 1em, clip: true, stroke: theme.fg + 0.5pt, image("lecture.jpg")),
      caption: [slide 15 of 08-turing-machines],
      gap: 6pt
    )
    #let zz = text(fill: theme.tcum, $z$)
    #let zzz = text(fill: theme.tcum, $z'$)
    We can take the set of configurations to be $ K_2 =(A^* circle.small Z 
    circle.small A^*)^2, $ i.e., tuples of configurations where $ k = 
    vec(u_1 b_1 zz a_1 v_1, u_2 b_2 zz a_2 v_2) $ means
    - non-blank part of the tapes 1 and 2 are substrings of $u_1 b_1 a_1 v_1$ 
      and $u_2 b_2 a_2 v_2$ respectively.
    - heads of the tapes are on $a_1$ and $a_2$, respectively.
    - the state for both tapes is $z$.
    Now the next state relation $tack$ would be defined as such:
    $ vec(u_1 b_1 zz a_1 v_1, u_2 b_2 zz a_2 v_2) tack
      vec(
        cases(
          u_1 zzz b_1 c_1 v_1 wide 
          & delta(z, a_1, a_2) = (zzz, c_1, a_2, L, m_2),
          u_1 b_1 zzz c_1 v_1 wide 
          & delta(z, a_1, a_2) = (zzz, c_1, a_2, N, m_2),
          u_1 b_1 c_1 zzz v_1 wide 
          & delta(z, a_1, a_2) = (zzz, c_1, a_2, R, m_2)
        ),
        cases(
          u_2 zzz b_2 c_2 v_2 wide 
          & delta(z, a_1, a_2) = (zzz, c_1, c_2, m_1, L),
          u_2 b_2 zzz c_2 v_2 wide 
          & delta(z, a_1, a_2) = (zzz, c_1, c_2, m_1, N),
          u_2 b_2 c_2 zzz v_2 wide 
          & delta(z, a_1, a_2) = (zzz, c_1, c_2, m_1, R)
        )
      ). $
  + 
    - Let $A = {0, 1, \#}$. Now define $ M = (A union {z_0, z_1, z_e}, A, delta, z_0, 
      {z_e}) $ and the transition function
      $ delta(z_0, a) &= (z_0, a, R) \
        delta(z_0, B) &= (z_1, B, L) \
        delta(z_1, a) &= (a, B, L) \
        delta(z, a) &= (a, z, L) wide & "where" z &in A \
        delta(z, B) &= (z_e, z, L) & "where" z &in A union {z_1}. $
    - This machine #emph[is] regular.
][done]

#problem[
  Turing machine $M$ to have accepting states $Z_A$ and rejecting states $Z_R$. 
  $M$ is acceptor for $L$ if for all $w$,
  $ w in L arrow.l.r.double.long M "started with" w "halts in an accepting state." $
  So rejection is now possible by halting in a rejecting state or by not 
  halting.

  Show: a language has an acceptor in the sense of the new definition if and 
  only if it has an acceptor in the sense of the definition of the lecture on 
  non-computable functions.
]
#solution[

]
