#import "@local/hw:0.1.0": *

// #let theme = color_theme(dark)

#show: homework(
  theme,
  subject: "Introduction to Optimization",
  title: "Mock Quiz",
  week: 1
)
#set par(justify: false)

#set enum(numbering: colored-numbering("a)"))
#let hrt = themed-items(theme).hr

#let problemt = problem(theme: theme, numbering: "1.1:")

#problemt[
  1. We need to calculate $nabla f(x)$ and show that it is $0$ at
    $vec(0, 0)$. We write
    $ nabla f(x) = vec(2x_1, 3x_2^2) $
    which gives us $nabla f(0, 0) = vec(2 dot 0, 3 dot 0^2) = vec(0, 0)$.

  2. For $f$ to be convex, $H_f$ needs to be positive semi-definite 
    everywhere. We can calculate the hessian:
    $ H_f (x) = mat(2, 0; 0, 6x_2) $
    which has eigenvalues $2$ and $6x_2$ which is clearly not bounded by 
    zero from below, therefore $f$ is not convex. If $f$ were to be convex, 
    a local minimizer would also be a global minimizer, but that is not the case.

  3. For us to know that a point $x$ is local minimizer $nabla f(x) = 0$
    should hold and $H_f (x)$ should be positive definite. We know that
    $nabla f(0, 0) = 0$ and we can easily calculate $H_f (0)$ to be
    $mat(2, 0; 0, 0)$ which is positive semi-definite, not positive definite.
    This means that we have to show that there is no direction $s$ and 
    $epsilon > 0$ such that $f(0 + t s) < f(0) forall t in (0, epsilon)$.
    By looking at $f(x)$ it's easy to see that going in the direction
    $vec(0, -1)$ will lead to a decrease in the value of the function. We
    can check to get
    $ f(0 + vec(0, -t)) = f(0, -t) = -3t^3 < 0 = f(0) forall t in (0, epsilon). $


  4. For a function to be coercive $f(x)$ should tend to infinity as 
    $norm(x)$ tends to infinity. We can show that that's not the case by picking
    $x$ from the set ${(u, v) : u^2 = -v^3}$. This way, when $norm(x) -> oo$, 
    $f(x) = f(u, v) = u^2 + v^3 = 0$ stays $0$, therefore $f$ is not coercive.
]

#problemt[
  1. 
    - $x^1 = x^0 + 1/2 (- nabla f(x^0)) = vec(2, 2) - 1/2 vec(2, 4) = vec(1, 0)$

    - $x^2 = x^1 + 1/2 (- nabla f(x^1)) = vec(1, 0) - 1/2 vec(1, 0) = vec(1\/2, 0)$

    - $x^3 = x^2 + 1/2 (- nabla f(x^2)) = vec(1\/2, 0) - 1/2 vec(1\/2, 0) = vec(1\/4, 0)$

  2. The global minimum of $f$ is $0$. The iterates seem to not have zig-zaged 
    very much, however, it will take infinite iterations to converge to 
    the solution.
]

#pagebreak()
#problemt[
  1. 
    - $kappa(A) = 4 / 2 = 2$
    - $kappa(B) = 40 / 10 = 4$

  2. 
    - $A$: $sqrt(2)((2 - 1)/(2 + 1)) = sqrt(2)/3$
    - $B$: $sqrt(4)((4-1)/(4+1)) = 6/5$
  
  3.
    Since both examples are diagonal matrices, using $D_(i,i) = H_f (x^k)_(i,i)^(-1)$
    would give $D^(1/2) A D^(1/2) = I$ and also $D^(1/2) B D^(1/2) = I$ so
    $ sqrt(kappa(I))((kappa(I) - 1)/(kappa(I) + 1)) = sqrt(1)((1-1)/(1+1)) = 0. $
    meaning it would converge in one iteration.
]