#import "@local/hw:0.1.0": *
#import "@preview/cetz:0.2.2"

#show: homework(
  theme,
  subject: "Numerical Analysis",
  title: "Homework",
  week: 7
)

#let (problem, solution, ..) = themed-items(theme)
#set rect(width: 100%)
#set enum(numbering: colored-numbering("(a)"))

#problem[
  List the Chebyshev interpolation nodes $x_1, ..., x_n$ in the interval 
  $[-1, 1], n = 6$ and find the upper bound for $abs((x - x_1) dot dots.c dot
  (x - x_n))$ on this interval.
]
#solution[
  The formula for the Chebyshev nodes on the interval $[-1, 1]$ is as follows
  $ x_i = cos((2k - 1)/(2n) pi), i = 1, 2, ..., n $
  and for $n = 6$ we get
  $ x_1 &= cos(1/12 pi) = 1/4 sqrt(2) + 1/4 sqrt(6), wide & 
    x_2 &= cos(3/12 pi) = 1/2 sqrt(2) \
    x_3 &= cos(5/12 pi) = -1/4 sqrt(2) + 1/4 sqrt(6), wide & 
    x_4 &= cos(7/12 pi) = -1/4 sqrt(6) + 1/4 sqrt(2) \
    x_5 &= cos(9/12 pi) = -1/2 sqrt(2), wide & 
    x_6 &= cos(11/12 pi) = -1/4 sqrt(6) - 1/4 sqrt(2) $
  #cetz.canvas({
    import cetz.plot
    import calc: *
    plot.plot(size: (14, 2), x-tick-step: 0.25, y-tick-step: 0.02, axis-style: "school-book", {
      plot.add-hline(1/32,-1/32)
      plot.add(domain: (-1, 1), samples: 100, x => 
        (x - cos(1/12 * pi)) *
        (x - cos(3/12 * pi)) *
        (x - cos(5/12 * pi)) *
        (x - cos(7/12 * pi)) *
        (x - cos(9/12 * pi)) *
        (x - cos(11/12* pi))
      )
    })
  })
  and the bound for $abs((x - x_1) dot dots.c dot (x - x_n))$ is 
  $ abs((1/4 sqrt(2) + 1/4 sqrt(6))&(1/2 sqrt(2))(-1/4 sqrt(2) + 1/4 sqrt(6))
    (-1/4 sqrt(6) + 1/4 sqrt(2))(-1/2 sqrt(2))(-1/4 sqrt(6) - 1/4 sqrt(2)))\
    &= abs(-(1/4 sqrt(2) + 1/4 sqrt(6))^2(1/2 sqrt(2))^2(-1/4 sqrt(2) + 1/4 sqrt(6))^2)\
    &= (1/4 sqrt(3) + 1/2)(1/2)(1/2 - 1/4 sqrt(3)) \
    &= (1/4 - 3/16)(1/2) 
    = 1/32 = #(1/32) $ 
][done]

#problem[
  Let $T_n (x)$ denote the degree $n$ Chebyshev polynomial. Find a formula for
  $T_n (0)$.
]
#solution[
  We know that $T_(n+1) (x) = 2 x T_n (x) - T_(n-1) (x)$ with $T_0 (x) = 1$ and
  $T_1 (x) = x$. For x = 0 it's just $T_(n+1) (0) = -T_(n-1) (0)$ with $T_0 (0) 
  = 1$ and $T_1 (0) = 0$ so it's clear that for every odd $n$ $T_n (0) = 0$ and
  for every even $n = 2k$ we get $T_(n) (0) = (-1)^k$.
][done]

#problem[
  Determine the following values

  + $T_999 (-1)$

  + $T_1000 (-1)$

  + $T_999 (0)$

  + $T_1000 (0)$
]
#solution[
  1. $T_999 (-1) = -1$
  2. $T_1000 (-1) = 1$
  3. $T_999 (0) = 0$
  
  4. $T_1000 (0) = 1$
][done]

#problem[
  Determine the Pade approximations with $k = l = 3$ for $f(x) = sin x$. Compare
  the results at $x_i = 0.1 i$, for $i = 0, 1, ..., 5$, with the exact results
  of the sixth Maclaurin polynomial.
]
#solution[
  We know that the Maclaurin expansion of $f(x) = sin x$ is as follows
  $ f(x) = x - x^3/3! + x^5/5! - x^7/7! + x^9/9! - dots.c $
  From this, we can write
  $ a_0 &= 0 wide &
    a_1 &= 1 \ 
    a_2 &= 0 &
    a_3 &= -1\/3! \
    a_4 &= 0 &
    a_5 &= 1\/5! \
    a_6 &= 0 $
  Now we need to solve the following system of equations
  $ sum_(i=0)^k a_i q_(k-i) = p_k, quad k = 0, 1, 2, 3 $
  and
  $ sum_(i=4)^k a_i q_(k-i) = 0, quad k = 4, 5, 6 $
  // where $N = n + m = 6$.
  // ...

  ეს არ გვისწავლია, ვერ გავიგე ზუსტად როგორ უნდა ვქნა
]