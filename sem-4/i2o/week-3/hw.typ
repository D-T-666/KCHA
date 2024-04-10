#import "@local/hw:0.1.0": *

// #let theme = color_theme(dark)
// #set page(paper: "a5")

#show: homework(
  theme,
  subject: "Introduction to Optimization",
  title: "Homework",
  week: 3
)

#let (problem, hr, ..) = themed-items(theme)

// = Homework Assignment

#problem(title: [Directional Derivatives])[
  #set enum(numbering: colored-numbering("(a)", color: theme.tcum))
  + 
    - Partial: $nabla f(x_1, x_2) = (4x_1 + 3x_2, 3x_1 + 1)$

    - Directional: $nabla f(0, 0)^T d = vec(0, 1) dot vec(1, -1) = -1$

  + 
    - Partial: $nabla f(x_1, x_2) = (sin(x_2), x_1 dot cos(x_2))$

    - Directional: $nabla f(0, 0)^T d = vec(0, 0) dot vec(1, -1) = 0$

  +
    - Partial: $nabla f(x_1, x_2) = cases(
        ((2x_1^5x_2+2x_1x_2^3-4x_1^5x_2)/(x_1^4+x_2^2)^2, (x_1^2(x_1^4+x_2^2)-2x_1^2x_2^3) / (x_1^4+x_2^2)^2) quad & (x_1, x_2) != (0, 0), 
        (0, 0) quad & (x_1, x_2) = (0, 0)
      )$

    - Directional: $nabla f(0, 0)^T d = vec(0, 0) dot vec(1, -1) = 0$
]

#problem(title: [Local Optima Along Lines])[
  #figure(
    themed-svg(theme: theme, read("plots/1.svg"), width: 200pt), 
    caption: [$f(x, y) = 2x^4 - 3x^2y + y^2$]
  ) <2>

  #set enum(numbering: colored-numbering("(a)", color: theme.tcum))
  + $ nabla f(x, y) &= (8x^3 - 6x y, 2y - 2x^2) = 0 \
      &==> cases(8x^3 - 6x y = 0, 2y - 2x^2 = 0) \
      &==> cases(y = x^3, 8x^3-6x^3 = 0) \
      &==> cases(x = 0, y = 0) $

  + Let $x$ and $y$ be constants with $d = vec(x, y)$ and consider
    $ phi_d (sigma) 
      &= f(sigma x, sigma y) \
      &= 2sigma^4 x^4-3sigma^3 x^2 y^2 + sigma^2 y^2 \
      &= underbrace(sigma^2, >=0) (sigma^2 dot 2 x^4 - sigma dot 3 x^2 y^2 + y^2). $
    Now we just need to show that 
    $sigma^2 dot 2 x^4 - sigma dot 3 x^2 y^2 + y^2 >= 0. $
    Since 
    $ (3 x^2 y^2)^2 - 4 dot 2 x^4 dot y^2 
      &= 9 x^4 y^4 - 4 dot 2 x^4 dot y^2 \
      &= underbrace(x^4 y^2, >= 0) (9 y^2 - 4) 
      < 0 $
    $ ==> 9 y^2 - 4 < 0 &==>
      -2/3 < y < 2/3 $
    for all $y$ near $0$, $phi_d (sigma) > 0$ independent of $x$.

  + Since I just showed that $f$ is bounded from below in every direction near
    $vec(0, 0)$, $vec(0, 0)$ is a local minimum.
]

#problem(title: [Comparing the Efficiency of Step Size Rules])[
  #set enum(numbering: colored-numbering("(a)"))
  #grid(columns: (1fr, 1fr), column-gutter: 8%,
    [
      1. #themed-svg(theme: theme, read("plots/3-1.svg"), width: 100%)
        #v(1em)
        With $gamma = 0.5, beta = 1, S_0 = 1$, backtracking takes a 
        lot of iterations.
    ],

    [
      2. #themed-svg(theme: theme, read("plots/3-2.svg"), width: 100%)
        #v(1em)
        With $gamma = 0.1, beta = 0.5, S_0 = 1$, it takes 
        even more.
    ]
  )

  3. To the function along $x + sigma s$ so we do the following.
    $ phi_(x,k)(sigma) 
      &= (x + sigma s)^T A (x + sigma s) \ 
      &= (x^T + sigma s^T) A (x + sigma s) \ 
      &= x^T A x + 2 sigma s^T A x + sigma^2 s^T A s. \ $ 
    which is a simple quadratic equation with respect to $sigma$. The extremum
    of the parabola can be found by
    $ sigma 
      &= (-2 s^T A x) / (2 s^T A s). $

    This can be used for the exact line search method, which converges
    magnitudes faster than the backtracking method.

    #themed-svg(theme: theme, read("plots/3-3.svg"), width: 100%)
]

#pagebreak()

#problem(title: [Quadratic Problems])[
  $ f(x) = 1/2 x^T H x + b^T x + c $

  #set enum(numbering: colored-numbering("(a)", color: theme.tcum))
  + 
    - $nabla f(x) = 1/2 x^T (H + H^T) + b^T$

    - $H_f (x) = 1/2 (H + H^T)$

  + Since $x^T H x$ is a scalar, $x^T H x = (x^T H x)^T = x^T H^T x$ and so the function
    $f$ can be rewritten as $f(x) = 1/2 x^T H^T x + b^T x + c$.
    - $nabla f(x) = x^T H + b^T$

    - $H_f (x) = H$
    
  + Since in the case of $H$ being symmetric $nabla f(x) = x^T H + b^T$ and $H_f (x) = H$, if
    $H$ also turns out to be positive definite, the sufficient conditions of $#bar[x] = H^(-1) b$
    being the only local and also a global minimizer hold, thereby $f$ is convex.
  + 
    - $H = mat(5, 4; 4, 5), b = vec(-4, -3), c = 3, f(x_1, x_2) = g(x_1, x_2)$

    - $H$ is positive definite.
    - There will exist a unique minimizer.
    - $#bar[x] = H^(-1)b = 1/9 mat(-5, 4; 4, -5)vec(-4, -3) = vec(8 slash 9, -1 slash 9)$
]

#problem(title: [Source Localization Problem])[
  // In the Source Localization Problem we are given $m$ locations of sensors
  // $a_1, a_2, ..., a_m in RR^m$ and approximate distances $d_1, d_2, ..., d_m in RR_0^+$
  // between the sensors and an unknown 'source' located at $x in RR^n$:

  // #math.equation(numbering: "(1)", block: true, $ d_i approx norm(x - a_i)_2. $) <eq1>

  // The problem is to find $x$ given the locations and the approximate distances. 
  // A natural formulation as an optimization problem is to consider the non-linear
  // least squares problem

  // $ min_(x in RR^n) (f(x) := sum_(i=1)^m (norm(x - a_i)_2 - d_i)^2). $

  // We will denote the set of sensor positions by $A := {a_1, a_2, ..., a_m}$.
  // Show that the optimality condition $nabla f(x) = 0$ (for $x in.not A$) is
  // the same as

  // $ x = 1/m (sum_(i=1)^m a_i + sum_(i=1)^m d_i (x-a_i)/norm(x-a_i)_2). $

  // #hr

  First, rewrite $f$ 
  $ f(x)
    &= sum_(i=1)^m (norm(x - a_i)_2 - d_i)^2 \
    &= sum_(i=1)^m (norm(x - a_i)_2^2 - 2 d_i norm(x - a_i)_2 + d_i^2) \
    &= sum_(i=1)^m (sum_(j=1)^n (x_j - a_(i j))^2 - 2 d_i sqrt(sum_(j=1)^n (x_j - a_(i j))^2) + d_i^2) \
    &= sum_(i=1)^m (sum_(j=1)^n (x_j^2 - 2 x_j a_(i j) + a_(i j)^2) - 2 d_i sqrt(sum_(j=1)^n (x_j - a_(i j))^2) + d_i^2). $
  Then, take partial differential of $f$ with respect to every $x_j$ and
  $ diff / (diff x_j) f(x)
    &= sum_(i=1)^m ((2 x_j - 2 a_(i j)) - d_i (2 x_j - 2 a_(i j)) / sqrt(sum_(j=1)^n (x_j - a_(i j))^2)) \
    &= sum_(i=1)^m 2 (x_j - a_(i j) - d_i (x_j - a_(i j)) / norm(x - a_i)_2).  $
  Since every partial derivative must be zero at a stationary point, we get
  $ diff / (diff x_j) f(x) = 0 ==> quad m x_j &= sum_(i=1)^m (a_(i j) + d_i (x_j - a_(i j)) / norm(x - a_i)_2) ==> \ 
    x_j = 1/m (sum_(i=1)^m a_i + sum_(i=1)^m d_i (x_j-a_i)/norm(x-a_i)_2) ==>
    x &= 1/m (sum_(i=1)^m a_i + sum_(i=1)^m d_i (x-a_i)/norm(x-a_i)_2). $
]

#problem(title: [Performance of the Gradient Descent Method])[
  The objective function is
  $ f(x_1, x_2) = e^(x_1 + 3x_2 -0.1) + e^(x_1 - 3x_2 - 0.1) + e^(-x_1 + 0.1) $
  with the Gradient
  $ nabla f(x_1, x_2) = vec(
    e^(x_1 + 3x_2 -0.1) + e^(x_1 - 3x_2 - 0.1) - e^(-x_1 + 0.1),
    3 e^(x_1 + 3x_2 -0.1) - 3 e^(x_1 - 3x_2 - 0.1)
  ) $

  #themed-svg(theme: theme, read("plots/6.svg"), width: 100%)
  #themed-svg(theme: theme, read("plots/6-1.svg"), width: 100%)

  From the plots we see that at around 0.4 the number of iterations is the lowest.
]
