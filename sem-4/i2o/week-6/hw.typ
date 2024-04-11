#import "@local/hw:0.1.0": *

// #let theme = color_theme(dark)

#show: homework(
  theme,
  subject: "Introduction to Optimization",
  title: "Homework",
  week: 4
)
#set par(justify: false)

#set enum(numbering: colored-numbering("a)"))
#let hrt = themed-items(theme).hr

#let graded-problem = problem(theme: theme, numbering: "I.1:", counter-name: "graded-problem")
#let problem = problem(theme: theme, numbering: "1.1:")
#let solution = solution(theme: theme)

#graded-problem(title: [Minimization and the Armijo Step Size Rule])[
  Let $f(x) = 1/2 x^T C x + c^T x$ with a symmetric and positive definite matrix 
  $C in RR^(n times n)$ and $c in RR^n$. Moreover, let $s in RR^n$ be a
  descent direction of $f$ at a point $x in RR^n$ and $sigma^* >= 0$ be
  the exact line search step size, i.e. $f(x + sigma^*) = 
  min_(sigma >= 0) f(x + sigma s)$.

  1. Show that $f$ is strictly convex.
  2. Show that $sigma^* > 0$ holds.
  3. What form (linear, quadratic, ...) does the function $phi.alt(sigma)
    = f(x + sigma s)$ have? Use Taylor expansion of $phi.alt$ about $sigma = 0$
    and deduct that $sigma^*$ is well defined and uniquely determined.
  4. Show that for all /*[*/ $gamma in (0, 1/2]$ the choice $sigma = sigma^*$
    satisfies the sufficient decrease condition
    $ f(x + sigma s) - f(x) <= gamma sigma nabla f(x)^T s, $
    though, that this is not the case for $gamma > 1/2$.
  5. Sketch the graph of $phi.alt$ and use it to illustrate the statement 
    discussed in #text(fill: theme.tcum)[d)]
]
#solution[
  1. The hessian of $f$ is $H_f (x) = C$ which is given to be symmetric 
    positive definite implying that the function $f$ is strictly convex.
  2. Since $s$ is a descent direction of $f$ we know that $nabla f (x)^T s 
    < 0$. By continuity of $f$, we know that there exists $epsilon > 0$ such
    that $f(x + epsilon s) < f(x)$ therefore the exact line search would have
    found that $epsilon$, i.e $sigma^* >= epsilon > 0$.
  3. The taylor expansion follows
    $ phi.alt(sigma) 
      &= f(x) + sigma nabla f(x)^T s + 1/2 sigma^2 s^T H_f (x) s \
      &= f(x) + sigma (x^T C + c^T)^T s + 1/2 sigma^2 s^T C s $
    which is a quadratic equation in terms of $sigma$. We have to show that
    $ overbrace(-nabla f(x)^T s, >0 "(descent direction)") / 
      underbrace(s^T H_f (x) s, >0 "(positive definite)") > 0. $
  4. We first express
    $ phi.alt'(sigma) = sigma s^T C s + nabla f(x)^T s $
    and now we can rewrite the condition to be
    $ phi.alt(sigma) - phi.alt(0) <= gamma sigma phi.alt'(0) 
      quad&==>quad
      (phi.alt(sigma)-phi.alt(0))/sigma <= gamma phi.alt'(0) $
    Let $g(sigma) = phi.alt(sigma^* - sigma)$ allowing us to write
    $ (g(0)-g(sigma^*))/sigma^* <= gamma phi.alt'(0) quad==>quad
      (g(sigma^*) - g(0))/sigma^* >= gamma g'(sigma^*) $
    Now let $g(sigma) = a sigma^2 + c$ (with $g'(sigma) = 2 a sigma$) since we know that $g(x)$ is a quadratic
    function and the minimum is at $sigma = 0$ the coefficient of the linear 
    term will be $0$. So
    $ a sigma^* = (a (sigma^*)^2 + c - c)/sigma^* = (g(sigma^*) - g(0))/sigma^* >=
      gamma g'(sigma^*)
      = gamma (2 a sigma^*) 
      \ arrow.b.double \
      cancel(a) sigma^* >= 2 gamma cancel(a) sigma^*
      \ arrow.b.double \
      1/2 >= gamma $
  5. 
    #align(center, move(
      dy: -4em,
      figure(
      image("1-5.svg", format: "svg", width: 24em)
    )))
][done]

#graded-problem(title: [Application of the Wolfe-Powell Rule])[
  1. The first Wolfe-Powell condition (sufficient decrease condition) requires
    $ f(x^k + sigma_k s^k) - f(x^k) <= gamma sigma_k nabla f(x^k)^T s^k. $
    What is the maximum step length $sigma_k$ that satisfies the condition,
    given that $f(x) = 5 + x_1^2 + x_2^2, x^k = vec(-1, -1), s^k = vec(1, 0),$
    and $gamma = 10^(-4)$.
  2. Given a general descent algorithm with the Wolfe-Powell step size rule,
    provide an example to show that the set
    $ {
      t in RR : #block(inset: 4pt, stack(
        spacing: 6pt,
        [$nabla f(x + sigma s)^T s >= eta nabla f(x)^T s$ and],
        $f(x + sigma s) - f(x) <= gamma sigma nabla f(x)^T s$
      ))
    } $ 
    may be empty if $0 < gamma < eta < 1$. I.e., that under these conditions
    no step size can be found. 
    
    #emph[Hint:] Think of a one-dimensional example.
]
#solution[
  1. $ f(x^k + sigma_k s^k) - f(x^k) &<= gamma sigma_k nabla f(x^k)^T s^k 
  \ arrow.b.double \
      f(vec(-1, -1) + sigma_k vec(1, 0)) - f(vec(-1, -1)) &<=
      10^(-4) sigma_k nabla f(vec(-1,-1))^T vec(1, 0) 
      $$ arrow.b.double \
      f(sigma_k - 1, -1) - f(-1, -1) &<= 
      sigma_k 10^(-4) dot nabla f(-1, -1)^T vec(1, 0) 
      \ arrow.b.double \
      cancel(5) + sigma_k^2 - 2 sigma_k + cancel(1 + 1) - cancel(5) - cancel(1 - 1)
      &<= sigma_k (-2 dot 10^(-4)) 
      \ arrow.b.double \
      sigma_k (2 - 2 dot 10^(-4)) - sigma_k^2 >= 0 
      \ arrow.b.double \ 
      sigma_k ((2 - 2 dot 10^(-4)) - sigma_k) >= 0 
      \ arrow.b.double \
      (2 - 2 dot 10^(-4)) >= sigma_k >= 0 $
  2. Consider the example $f(x) = x$, then $nabla f(x)^T s = -1$. Take 
    $x = 1, s = -1$. We these into the conditions to get
    $ cases(1 dot (-1) >= eta dot (-1), 1-sigma-1<=-gamma sigma) 
      ==>
      cases(1 <= eta, 1 >= gamma) $
    and since $eta < 1$ this is a counter example.
][done]

#graded-problem[
  Let $f(x) = 1/2 x^T C x + c^T x + gamma$ with a symmetric positive definite
  matrix $C in RR^(n times n), c in RR^n$, and $gamma in RR$. Show that Gradient
  Descent Method with exact line search step size reaches the global minimum 
  $accent(x, macron) = -C^(-1)c$ in exactly one step if the initial point $x^0$
  is chosen such that $nabla f(x^0)$ is an eigenvector of $C$. What does this 
  imply for a strategy to choose the initial point in a diagonally scaled Gradient
  Descent Method?
]
#solution[
  We find
  $ nabla f(x) = C x + c $
  and from past excercises we know that
  $ sigma^* = (norm(nabla f(x^0))^2) / (nabla f(x^0)^T C nabla f(x^0)) = 1 / lambda $
  now we can write
  $ x^1 
    &= x^0 - 1/lambda nabla f(x) \ 
    &= x^0 - 1/lambda C^(-1) C nabla f(x) \
    &= x^0 - C^(-1) nabla f(x) \ 
    &= x^0 - C^(-1) (C x^0 + c) \
    &= x^0 - x^0 - C^(-1) c \
    &= C^(-1) c. $
  This result means that when using diagonal scaling it's probably best to 
  chose initial points which are the eigenvectors of the scaling matrix. 
][done]
