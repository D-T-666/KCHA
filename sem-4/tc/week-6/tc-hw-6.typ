#import "@local/hw:0.1.0": *
#import "@preview/tablex:0.0.8": *

#show: homework(
  theme,
  subject: smallcaps[Theory of Computation],
  title: smallcaps[Excercise for TTF],
  week: 6
)

#let (problem, solution, hr, ..) = themed-items(theme)
#let cx = cellx(fill: theme.tcum, "")

#problem[
  Show that Perdicate $x | y$, that is a function $|: NN_0 times NN_0 -> 
  {"true", "false"}$, given by $x|y = "true"$ if and only if $x$ divides
  $y$, is primitive recursive.
]
#solution[
  We can define
  $ x divides y = cases(
      1 & "if" x = y or y = 0,
      0 & "if" (x = 0 or y < x) and y != 0,
      x divides y-x quad & "if" y > x and x != 0, 
    ) $
  $ "divides"(x, y) &= C_(x = y or y = 0) (x, y) + C_(y > x and x != 0) (x, y) dot 
    "divides"(x, y minus.dot x) $
  Every operation and function used for this definition is primitive recursive,
  so the function itself is also primitive recursive.
][done]

#problem[
  In the Excercise for Week 5, you showed that a primitive recursive function $f$,
  the functions of #emph[bounded sum] and #emph[bounded product] of $f$, 
  respectively given by
  $ "bsum"_f (x_0, ..., x_(k-1), y) &= sum_(i=0)^y f(x_0, ..., x_(k-1), i) \
    "bprod"_f (x_0, ..., x_(k-1), y) &= product_(i=0)^y f(x_0, ..., x_(k-1), i) $ 
  are also primitive recursive.
  
  #h(1em) Now conclude (by proving) that primitive recursive predicates are 
  closed under #emph[bounded quantification]. That is, show that if $P$ on $NN_0^(k+1)$ 
  is a primitive recursive predicate, then so are the predicates 
  $forall z <= y (P(x_0, ..., x_(k-1), z) = "true")$ and 
  $exists z <= y (P(x_0, ..., x_(k-1), z) = "true")$.
]
#solution[
  - $forall z <= y (P(x_0, ..., x_(k-1), z) = "true") = "bforall"_P (x_0, ..., x_(k-1), y)$
    $ "bforall"_P (x_0, ..., x_(k-1), 0) &= "true" \
      "bforall"_P (x_0, ..., x_(k-1), y+1) &= C_P (x_0, ..., x_(k-1), y+1) dot "bforall"_P (x_0, ..., x_(k-1), y) $ 

  - $exists z <= y (P(x_0, ..., x_(k-1), z) = "true") = "bexists"_P (x_0, ..., x_(k-1), y)$
    $ "bexists"_P (x_0, ..., x_(k-1), 0) &= "false" \
      "bexists"_P (x_0, ..., x_(k-1), y+1) &= "sg"(C_P e(x_0, ..., x_(k-1), y+1) + "bexists"_P (x_0, ..., x_(k-1), y)) $
][done]

#problem(title: "*")[
  In the lecture we sketched a proof that not every computable function is 
  primitive recursive.
  + Where does this proof fail for $mu$-recursive functions?
  + Where does this proof fail if we only consider total (defined everywhere) 
    $mu$-recursive functions?
  Note that the set of $mu$-recursive functions, as well as its proper subset of 
  total $mu$-recursive functions are countably infinite.
]
#solution[
  + You can't add 1 to $Omega$.
  // + It can't be proven that $mu$-recursive functions are uncountably many since
  //   they are countable. Every $g(x)$ obtained by diagonalization is also 
  //   $mu$-recursive.
  2. It's imposible to create a parser that classifies total $mu$-recursive
    functions since if a function is undefined at some point, it will take 
    infinite time to know that.
][done]

#problem[
  What follows are the exercises from the lecture on Turing Machine. See the 
  mentioned lecture for precise definitions.

  Construct a Turing machine for
  + "decrementing binary numbers." That is, given an input of a binary number 
    $"bin"(n)$, it gives an output $"bin"(n - 1)$;
  + "concatenating tape inscriptions." That is two machines, one giving 
    `tape1 = tape1#tape2`. and the other `tape1 = tape2#tape1`.
  + "head and tail of tapes." That machines giving `tape2 = head(tape1)` 
    and `tape2 = tail(tape1)`.
]
#solution[
  For all of the machines $z_e$ is the end state and $z_0$ is the initial state

  + `tape1 = bin(int(tape1) - 1)`
    $ delta(z_0, a) &= (z_0, a, R) wide&
      delta(z_0, B) &= (q_0, B, L) \
      delta(q_0, 0) &= (q_0, 1, L) wide& 
      delta(q_0, 1) &= (q_1, 0, L) \
      delta(q_1, a) &= (q_1, a, L) wide&
      delta(q_1, B) &= (q_2, B, R) \
      delta(q_2, 0) &= (q_2, B, R) wide&
      delta(q_2, 1) &= (z_e, 1, N) \
      delta(q_2, B) &= (z_e, 0, N) $
  +
    - `tape1 = tape1#tape2`
      $ delta(z_0, a_1, a_2) &= (z_0, a_1, a_2, R, N) wide&
        delta(z_0, B, a_2) &= (z_1, \#, B, R, N) \
        delta(z_1, B, a_2) &= (z_1, a_2, B, R, R) wide&
        delta(z_1, B, B) &= (z_2, B, B, L, N) \
        delta(z_2, a_1, B) &= (z_2, a_1, B, L, N) wide&
        delta(z_2, B, B) &= (z_e, B, B, R, N) $

    - `tape1 = tape2#tape1`
      $ delta(z_0, a_1, a_2) &= (z_0, a_1, a_2, N, R) wide&
        delta(z_0, a_1, B) &= (z_1, a_1, \#, R, R) \
        delta(z_1, a_1, B) &= (z_1, B, a_1, R, R) wide&
        delta(z_1, B, B) &= (z_2, B, B, L, N) \
        delta(z_2, B, a_2) &= (z_2, a_2, B, L, N) wide&
        delta(z_2, B, B) &= (z_e, B, B, R, N) $

  +
    - `tape2 = head(tape1)`
      $ delta(z_0, a_1, a_2) &= (z_0, a_1, B, N, R) wide&
        delta(z_0, a_1, B) &= (z_1, B, a_1, R, N) \
        delta(z_1, a_1, a_2) &= (z_1, B, a_2, R, N) wide&
        delta(z_1, B, a_2) &= (z_e, B, a_2, N, N) $

    - `tape2 = tail(tape1)`
      $ delta(z_0, a_1, a_2) &= (z_0, a_1, B, R, R) wide&
        delta(z_0, a_1, B) &= (z_0, a_1, B, R, N) \
        delta(z_0, B, B) &= (z_1, B, B, L, N) wide&
        delta(z_1, a_1, B) &= (z_2, B, a_1, L, N) \
        delta(z_2, a_1, a_2) &= (z_2, B, a_2, L, N) wide&
        delta(z_2, B, a_2) &= (z_e, B, a_2, N, N) $
][done]