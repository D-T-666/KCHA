#import "@local/hw:0.1.0": *
#import "@preview/tablex:0.0.8": *

#show: homework(
  theme,
  subject: smallcaps[Theory of Computation],
  title: smallcaps[Excercise for TTF],
  week: 5
)

#let (problem, hr, ..) = themed-items(theme)
#let cx = cellx(fill: theme.tcum, "")

#problem[
  Function $h: NN^2 -> NN$ which enumerates tuples of natural numbers can be written as $ h(a, b) = ((a+b-2)(a+b-1))/2 + b. $

  1. Let $f: A -> NN$ and $g: B -> NN$ be enumerations of $A$ and $B$.
    We can now construct a function $e: A times B -> NN$ which enumerates 
    $A times B$ as follows: $ e(a, b) = h(f(a), g(b)) $
  2. We can enumerate $NN^k$ as follows:
    $ f_1(n) &= n \
      f_k (n_1, n_2, ..., n_k) &= h(n_1, f_(k-1)(n_2, n_3, ..., n_k)) $
    and for $NN_0^k$ we can 
    $ g_1(n) &= n+1 \
      g_k (n_1, n_2, ..., n_k) &= h(n_1 + 1, g_(k-1)(n_2, n_3, ..., n_k)) $
    so $NN_0^k$ is enumerable.
  3. A subset of natural numbers $U$ can be represented by a sequence 
    ${a_i}_(i in NN)$ with $a_i = cases(1 quad & i in U, 0 & i in.not U) thick$
    so  he set of all subsets of natural numbers can be written as
    a sequence ${S_k}_(k in NN)$ of such sequences. Now we can employ 
    diagonalization to show that there will exist a sequence $D$ such that
    $exists.not k in NN : S_k = D$. To do this we just define $D$ as
    $D_i = (S_i)_i xor 1$. This way $D$ will be different from every $S_k$ 
    by at least one element.
  4. Similarly to #text(fill: theme.tcum)[c)], assume ${a_i}_(i in NN)$ is the
    sequence of digits of a real number. Let ${S_k}_(k in NN)$ be the sequence
    of all such real numbers. Construct ${d_i}_(i in NN)$ such that 
    $d_i != (S_i)_i$. This way $D$ will be different from every $S_k$ by at 
    least one element.
]
#problem[
  1. Let
    $ min(x, 0) &= 0 \
      min(0, y) &= 0 \
      min(x+1, y+1) &= s(min(x, y)) $
    and 
    $ max(x, 0) &= x \
      max(0, y) &= y \
      min(x+1, y+1) &= s(max(x, y)) $
  2. Let $"abs"(x, y) = abs(x - y)$
    $ "abs"(x, y) &= "sub"(max(x, y), min(x, y)) $
    now we need to define $"sub"(x, y)$
    $ "sub"(x, 0) &= x\
      "sub"(x, y+1) &= p("sub"(x, y)) $
    where
    $ p(0) &= 0 \
      p(x+1) &= x. $
]
#problem[
  - 
    $ q(x_0, ..., x_(k-1), y) &= S(p_k (x_0, ..., x_(k-1), y)) \
      h(x_0, ..., x_(k-1), y) &= f(p_1 (x_0, ..., x_(k-1), y), ..., p_(k-1) (x_0, ..., x_(k-1), y), q(x_0, ..., x_(k-1), y)) \
      g(x_0, ..., x_(k-1), y) &= "add"(p_k (x_0, ..., x_(k-1), y), h(x_0, ..., x_(k-1), y)) \
      "bsum"(x_0, ..., x_(k-1), 0) &= f(x_0, ..., x_(k-1), 0) \
      "bsum"(x_0, ..., x_(k-1), y+1) &= g(x_0, ..., x_(k-1), "bsum"(x_0, ..., x_(k-1), y), y) $
  - $ g(x_0, ..., x_(k-1), ) \
      "bprod"(x_0, ..., x_(k-1), 0) &= c_0 (x_0, ..., x_(k-1)) = 0 \ 
      "bprod"(x_0, ..., x_(k-1), y+1) &= "mult"(f(x_0, ..., x_(k-1), y+1), "bprod"(x_0, ..., x_(k-1), y)) $
]
#problem[
  First define a new successor-like function
  $ f(z, y, x) &= S(p_3(z, y, x)). $
  Now we can replace the successor in the recursion step with $f$
  $ "add"(0, x) &= p_1 (x) = x \
    "add"(y+1, x) &= f(x, y, "add"(x, y)) $

  Same here, just define a #emph[wrapper] for add
  $ g(z, y, x) &= "add"(p_3 (z, y, x), p_2 (z, y, x)). $

  and replace add with $g$ in the recursion step.
  $ "mult"(x, 0) &= c_0(x) = 0 \
    "mult"(x, y+1) &= g(y, x, "mult"(x, y)) $
]