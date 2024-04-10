#import "@local/hw:0.1.0": *

#show: homework(
  theme,
  subject: "Numerical Analysis",
  title: "Homework",
  week: 6
)

#let (problem, solution, ..) = themed-items(theme)
#set rect(width: 100%)
#set enum(numbering: colored-numbering("(a)"))

#problem[
  Use Lagrange interpolation to find a polynomial that passes through the points:

  + $vec(0, 1), vec(2, 3), vec(3, 0)$

  + $vec(-1, 0), vec(2, 1), vec(3, 1), vec(5, 2)$
]
#solution[
  $ P(x) &= sum_(i=0)^n y_i dot l_i(x) wide
    l_i(x) &= product_(j=0,j!=i)^(n) (x - x_j)/(x_i - x_j) $

  + $ l_0(x) &= (x-2)/(0-2) * (x-3)/(0-3) = 1/6 (x - 3) (x - 2)  \
      l_1(x) &= (x-0)/(2-0) * (x-3)/(2-3) = 1/2 x (3 - x) \
      l_2(x) &= (x-0)/(3-0) * (x-2)/(3-2) = 1/3 x (x - 2) $
    so $ P(x) 
      &= 1 dot l_0(x) + 3 dot l_1(x) + 0 dot l_2(x) \
      &= 1/6 (x-2)(x-3) + 3/2 x(3 - x) \
      &= (-4 x - 1) (1/3 x - 1) $
  + $ l_0(x) &= (x-2)/(-1-2) dot (x-3)/(-1-3) dot (x-5)/(-1-5) = -1/72 (x - 5) (x - 3) (x - 2) \
      l_1(x) &= (x+1)/(2+1) dot (x-3)/(2-3) dot (x-5)/(2-5) = 1/9 (x + 1) (x - 5) (x - 3) \
      l_2(x) &= (x+1)/(3+1) dot (x-2)/(3-2) dot (x-5)/(3-5) = -1/8 (x + 1) (x - 5) (x - 2) \
      l_3(x) &= (x+1)/(5+1) dot (x-2)/(5-2) dot (x-3)/(5-3) = 1/36 (x + 1) (x - 3) (x - 2) $
    so $ P(x)
      &= 0 dot l_0(x) + 1 dot l_1(x) + 1 dot l_2(x) + 2 dot l_3(x) \
      &= 1/9 (x + 1) (x - 5) (x - 3) - 1/8 (x + 1) (x - 5) (x - 2) + 1/18 (x + 1) (x - 3) (x - 2) \
      &= 1/24 x^3 - 1/4 x^2 + 11/24 x + 3/4 $
][done]

#problem[
  Use Newton's divided differences to find the interpolating polynomials
  of the points in Exercise $1$.
]
#solution[
  + 
    $ f[0] &= f(0) = 1 \
      f[0, 2] &= (f(2) - f(0))/(2-0) = (3 - 1)/2 = 1 \
      f[0, 2, 3] 
        &= (f[2, 3] - f[0, 2])/(3-0) \
        &= ((f(3)-f(2))/(3-2) - 1)/(3-0) \
        &= ((0-3)/(3-2) - 1)/(3-0)
        = -4/3 $
    So the polynomial would look like
    $ P(x) 
      &= f[0] + f[0, 2](x - 0) + f[0, 2, 3](x - 0)(x - 2) \
      &= 1 + (x - 0) - 4/3 (x - 0)(x - 2) \
      &= -4/3 x^2 + 11/3 x + 1 $

  + $ f[-1] 
      &= f(-1) = 0 \
      f[-1, 2] 
      &= (f(2) - f(-1))/(2+1) = (1 - 0)/(2+1) = 1/3 \
      f[-1, 2, 3] 
      &= (f[2, 3] - f[-1, 2])/(3+1) \
      &= ((f(3) - f(2))/(3-2) - 1/3)/(3+1) ´
      = ((1 - 1)/(3-2) - 1/3)/(3+1) 
      = -1/12 \
      f[-1, 2, 3, 5]
      &= (f[2, 3, 5] - f[-1, 2, 3])/(5+1) \
      &= ((f[3, 5] - f[2, 3])/(5-2) + 1/12)/(5+1) \
      &= (((f(5)-f(3))/(5-3) - (f(3) - f(2))/(3-2))/(5-2) + 1/12)/(5+1) \
      &= (((2-1)/(5-3) - (1 - 1)/(3-2))/(5-2) + 1/12)/(5+1) 
      = ((1/2 - 0)/(3) + 1/12)/(6) = (1/6 + 1/12)/6 = 1/24 $
    Therefore the polynomial would be
    #show math.equation: set text(size: 9pt)
    $ P(x) 
      &= f[-1] + f[-1,2](x+1) + f[-1,2,3](x+1)(x-2) + f[-1,2,3,5](x+1)(x-2)(x-3)\
      &= 1/3 (x+1) - 1/12 (x+1)(x-2) + 1/24 (x+1)(x-2)(x-3) \
      &= 1/24 x^3 - 1/4 x^2 + 11/24 x + 3/4 $
][done]

#problem[
  Find $P(0)$, where $P(x)$ is the degree 10 polynomial that is zero at 
  $x = 1, ..., 10$ and satisfies $P(12) = 44$.
]
#solution[
  We can take $P(x) = product_(i=1)^10 (x-i)$ since it's zero at points 
  $x = 1, ..., 10$. However, it's $P(12) = (11!)$ at $x = 24$ so we just scale
  it by $44/(11!)$ to get $P(x) = 44/(11!) product_(i=1)^10 (x-i)$ which gives
  $P(0) = 44/(11!) 10! = 44/11 = 4$.
][done]

#problem[
  Can a degree 3 polynomial intersect a degree 4 polynomial in exactly
  five points? Explain.
]
#solution[
  We can reformulate the qeustion as folows. Let $P(x)$ be a degree 3 polynomial
  and $Q(x)$ be a degree 4 polynomial. The intersection points of $P(x)$ and $Q(x)$
  are the same as the roots of $P(x)-Q(x)$. For a polynomial to have $n$ roots,
  it must be of order $n$. So we can ask if $P(x)-Q(x)$ is of order at least 5.
  Which it clearly isn't.
][done]

#problem[
  Write down the degree 25 polynomial that passes through the points
  $vec(1, -1), vec(2, -2), ..., vec(25, -25)$ and has constant term equal to $25$.
]
#solution[
  If we take $P(x) = product_(i = 1)^(25) (x-i)$ we know that $P(x) = 0$ for all
  $x in [1:25]$. We also know that at $x=0, P(x) = -25!$ so we can divide $P(x)$
  by $-24!$ to make $P(0) = 25$. we can also subtract $x$ so that $P(x) = -x 
  forall x in [1:25]$. Finally we get
  $ P(x) = (product_(i=1)^25 (x-i))/(-24!) - x. $ 
][done]

#problem[
  Prove that the characteristic polynomials $l_i in PP_n$ defined as
  $l_i (x) = product_(j=0,j!=i)^n (x-x_j)/(x_i-x_j)$ where $i = 0, ..., n$ 
  form a basis for $PP_n$.
]
#solution[
  It's clear that 
  $ l_i (x_k) = cases(1 thick &"if" i = k, 0 & "otherwise") thick$
  meaning that 
  $ a dot l_i (x_k) + b dot l_j (x_k) = cases(a quad & "if" k = i, b & "if" k = j, 0 & "otherwise") $
  and in general
  $ sum_(i=0)^n c_i dot l_i (x_k) = c_k $
  So we have a way of defining values of a degree $n$ polynomial at $n+1$ points
  by specifying the corresponding $c_i$-s therefore ${l_i : i = 0, 1, ..., n}$ 
  forms a basis of $PP_n$
][done]

#problem[
  Prove the recursive relation $f[x_0, ..., x_n] =
  (f [x_1,...,x_n] -f [x_0,...,x_(n-1)]) / (x_n-x_0), thick n ≥ 1$ for Newton's
  divided differences.
]
#solution[
  By the Newton's divided difference formula the interpolating polynomial for 
  the given points $x_2, x_3, ... , x_(k-1), x_1, x_k$ is 
  $ P_1(x) =& f[x_2] + f[x_2, x_3](x - x_2) + 
    dots.c + f[x_2, x_3, ..., x_(k-1), x_1](x-x_2)dots.c(x-x_(k-1))\
    &+f[x_2,x_3,...,x_(k-1),x_1,x_k](x-x_2)dots.c(x-x_(k-1))(x-x_1) $
  and the interpolating polynomial of points $x_2, x_3, ... , x_(k-1), x_k, x_1$
  $ P_2(x) =& f[x_2] + f[x_2, x_3](x - x_2) + 
    dots.c + f[x_2, x_3, ..., x_(k-1), x_k](x-x_2)dots.c(x-x_(k-1))\
    &+f[x_2,x_3,...,x_(k-1),x_k,x_1](x-x_2)dots.c(x-x_(k-1))(x-x_k) $
  By uniqueness, $P_1 = P_2$ . Setting $P_1(x_k) = P_2(x_k)$ and canceling terms 
  yields
  $ f[x_2,...,x_(k-1),x_1](x_k-x_2)dots.c(x_k-x_(k-1))+
    f[x_2,...,x_(k-1),x_1,x_k](x_k-x_2)dots.c\ (x_k-x_(k-1))(x_k-x_1)
    =
    f[x_2,...,x_(k-1),x_k](x_k-x_2)dots.c(x_k-x_(k-1)) $
  or
  $ f[x_2,...,x_(k-1),x_1] + f[x_2,...,x_(k-1),x_1,x_k](x_k-x_1) = 
    f[x_2,...,x_k]. $
  since $f[x_1, x_2, ..., x_k] = f[sigma(x_1), sigma(x_2), ..., sigma(x_k)]$
  for any permutation $sigma$ of $x_i$, the above equation can be rearanged to
  $ f[x_0, ..., x_n] = (f [x_1,...,x_n] -f [x_0,...,x_(n-1)]) / (x_n-x_0). $
][done]
