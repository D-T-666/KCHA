#import "@local/hw:0.1.0": *
#import "@preview/tablex:0.0.8": *

#show: homework(
  theme,
  subject: smallcaps[Theory of Computation],
  title: smallcaps[Excercise for TTF],
  week: 4
)

#let (problem, hr, ..) = themed-items(theme)
#let cx = cellx(fill: theme.tcum, "")

#problem[
  #todo[]
  #todo[]
  #todo[]
]

#problem[
  The equivalent grammar in Chomsky normal form would be $({S, A, B, U, V, X, Y},{0, 1}, P, S)$ with productions
  $ S &-> X A, wide wide  & S &-> Y B, \
    A &-> Y S,            & B &-> X S, \
    A &-> 0,              & B &-> 1, \
    A &-> X U,            & B &-> Y V, \
    U &-> A A,            & V &-> B B, \
    X &-> 1,              & Y &-> 0. $
]

#problem[
  #set enum(numbering: colored-numbering("(1)"))
  1. Let $G_1 = (N_1, T_1, P_1, S_1)$ be a grammar with $L(G_1) = L$ and 
    $G_2 = (N_2, T_2, P_2, S_2)$ be a grammar with $L(G_2) = L'$. 
    The combined grammar 
    $ G = (
        N_1 union N_2 union {xi}, quad
        T_1 union T_2, quad
        P_1 union P_2 union {(xi, S_1), (xi, S_2)}, quad
        xi
      ) $
    would have $L(G) = L union L'$.

  2. Let $M = {#`a`^n #`b`^n #`c`^k:n,k in NN_0}, N = {#`a`^k #`b`^n #`c`^n: 
    n,k in NN_0}$ and $L = overline(M) union overline(N)$. Assume that the
    complement of a context free language is also context free. Then  
    $overline(M)$ and $overline(N)$ are context-free, therefore $L$ will be 
    context-free aswell. By our assumption $overline(L)$ should be context 
    free but we see that
    $ overline(L) = overline((overline(N) union overline(M))) = N sect M
      = underbrace({#`a`^n #`b`^n #`c`^n:n in NN_0}, "not context free"). $
    We have a contradiction --- complement of a context free grammar is not
    always context free.
]

#problem[
  #set enum(numbering: colored-numbering("(1)"))
  Let $M = (Zeta, Sigma, Gamma, delta, z_0, Zeta_A)$

  1. We can set $M' = (Zeta, Sigma, Gamma, delta', z_0, Zeta_A)$ and 
    $delta'(alpha, epsilon, beta) = cases(
      {(alpha, "pop")} wide & "if" alpha in Zeta_A and beta != epsilon,
      {} wide & "otherwise"
    )$

  2. We can set $M' = (Zeta, Sigma, Gamma, delta, z_0, Zeta)$. 
]

#problem[
  #proof[
    We can employ the construction:

    If a state transition wants to push a sequence of symbols on the store
    $ (omega, "push" A B C D) in delta(alpha, beta, gamma) $
    it would first transition through a sequence of intermediate states
    $ {(angle.l (alpha, omega, A B C D)_1 angle.r, "push" A)} &= delta(alpha, beta, gamma) \
      {(angle.l (alpha, omega, A B C D)_2 angle.r, "push" B)} &= delta(angle.l (alpha, omega, A B C D)_1 angle.r, epsilon, epsilon) \
      {(angle.l (alpha, omega, A B C D)_3 angle.r, "push" C)} &= delta(angle.l (alpha, omega, A B C D)_2 angle.r, epsilon, epsilon) \
      {(omega, "push" D)} &= delta(angle.l (alpha, omega, A B C D)_3 angle.r, epsilon, epsilon). $
    This way, the sequence $A B C D$ will get pushed on the store and the
    state will become $alpha$.
  ]
]