#set text(size: 8pt)
#set par(justify: true)
#set text(hyphenate: false, font: "Monaspace Radon Var", weight: 100)
#set page(margin: 1cm)
#show: d => columns(2, d)
#let argmin = math.op("argmin", limits: true)
#set math.equation(numbering: "(1)")
#show math.equation: set text(size: 7pt)

#import "@preview/ctheorems:1.1.2": *
#show: thmrules.with(qed-symbol: $square$)

#let theorem = thmbox("theorem", "Theorem", stroke: rgb("#ff8888")).with(numbering: none)
#let lemma = thmbox("lemma", "Lemma", stroke: rgb("#ff8888")).with(numbering: none)
#let proof = thmproof("proof", "Proof").with(numbering: none)
#let definition = thmbox("definition", "Definition", stroke: rgb("#8888ff")).with(numbering: none)
#let remark = thmbox("remark", "Remark").with(numbering: none)
#let example = thmbox("example", "Example", stroke: rgb("#88ff88")).with(numbering: none)
#let solution = thmbox("solution", "Solution").with(numbering: none)

If the function is twice differentiable and the Hessian is positive semidefinite
in the entire domain, then the function is convex. Note that the domain must be 
assumed to be convex too. If the Hessian has a negative eigenvalue at a point 
in the interior of the domain, then the function is not convex.
#definition[Descent direction][
  Let $f: RR^n -> RR$ be a continuously differentiable function and $x in RR^n$.
  A vector $s in RR^n without {0}$ is called a #strong[descent direction] of $f$ at
  $x$ if the directional derivative is negative, i.e. 
  $diff_s f(x) = nabla f(x)^T s < 0$.
]
#remark[
  Let us define the restriction of $f$ on the ray ${sigma in RR_0^+ : x+sigma s}$
  as $ phi: cases(RR_+ &-> RR, sigma &|-> phi(sigma) := f(x + sigma s)) $ then
  $nabla f(x)^T s = phi'(0)$ hence
  - $s in RR^n$ is a descent direction if and only if $phi'(0) < 0$
  - if $s$ is a descent direction, then $phi$ is strictly monotonously decreasing
    in a neighborhood of $sigma = 0$ (note, the reverse is not true).
]
#lemma[Descent poperty of descent direction][
  Let $f: RR^n -> RR$ be a continuously differentiable function, $x in RR^n$ and
  $s$ a descent direction of $f$ at $x$. Then there exists an $epsilon > 0$ such
  that /*[*/$ f(x + sigma s) < f(x) wide forall sigma in (0, epsilon] $/*)*/
]
#proof[
  Since $diff_s f(x) < 0$, it follows from the definition of the directional 
  derivative that, whne taking the right-handed limit only,
  $ diff_s f(x) = lim_(sigma->0^+) (f(x+sigma s)-f(x))/sigma = lim_(sigma->0^+)F(sigma) < 0. $
  By continuity of the limit process there is an $epsilon > 0$ such that at this
  value $F(epsilon) < 0$ holds and thus in particular for any /*[*/ $sigma in (0, epsilon]$
  it holds that
  $ (f(x+sigma s)-f(x))/sigma < 0 quad==>quad f(x + sigma s) < f(x) $
]
/ Constant step size: $sigma_k = sigma$ for all $k$.
  The main advantage of teh constatnt step size strategy is of course its
  simplicity, but at this point it is unclear how to choose the constant. 
  A large constant might cause the algorithm to be nondecreasing, and a small
  constant can cause slow onvergence of the method.

/ Exact line search: $sigma_k$ is a minimizer of $f$ along the ray $x^k + sigma s^k$
  $ sigma_k in argmin_(sigma >= 0) f(x^k + sigma s^k) $
  This seems attractive, from a first glance, but it is not always possible 
  to actually find the exact minimizer.

/ Backtracking: The method requires $S_0 > 0, beta in (0, 1)$ and 
  $gamma in (0, 1)$. The choice of $sigma_k$ is done by the following 
  procedure. Frist, set $sigma_k$ to the initial guess $S_0$. Then, while
  $ f(x^k) - f(x^k + sigma_k s^k) < -gamma sigma_k nabla f(x^k)^T s^k $
  we set $sigma_k = beta sigma_k$. In other words the step size is chosen as 
  $sigma_k = S_0 beta^(i_k)$, where $i_k$ is the smallest non-negative integer
  for which the condition
  $ f(x^k) - f(x^k+S_0 beta^(i_k)s^k) >= -gamma S_0 beta^(i_k)f(x^k)^T s^k $
  is satisfied. This gives a sequence $(S_0, S_0 beta, S_0 beta^2, S_0 beta^3, ...)$.

#lemma[Validity of the sufficient decrease condition][
  Let $U subset.eq RR^n$ be open, $f in cal(C)^1(U, RR), x in U$, and 
  $gamma in (0,1)$. Suppose $s in RR^n without {0}$ is a descent direction of 
  $f$ at $x$. Then there is a $epsilon > 0$ such that
  $ f(x) - f(x+sigma s) >= -gamma sigma nabla f(x)^T s wide forall sigma in [0, epsilon] $
]
#proof[
  The inequality holds for $sigma = 0$. Let $sigma > 0$. Since $f$ is continuously
  differentiable it follows with Talyor expansion that
  $ f(x + sigma s) = f(x) + sigma nabla f(x)^T s + o(sigma norm(s)), $
  where $x+sigma s in U$ and hence
  $ f(x) - f(x + sigma s) = -gamma sigma nabla f(x)^T s - 
    (1-gamma)sigma nabla f(x)^T s - o(sigma norm(s)). $ <vsdc>

  Since $s$ is a descent direction of $f$ at $x$ we have
  $ lim_(sigma->0^+) ((1-gamma)sigma nabla f(x)^T s + o(sigma norm(s)))/sigma
    = (1-gamma)nabla f(x)^T s < 0. $
  Hence, there is an $epsilon > 0$ such that for all /*[*/ $sigma in (0, epsilon]$
  the inequality
  $ (1-gamma)sigma nabla f(x)^T s - o(sigma norm(s)) < 0 $
  holds, which combined with @vsdc implies the desired result.
]

#definition[Steepest descent][
  Let $x in RR^n$ and $nabla f(x) != 0$. Let $accent(d, macron) in RR^n$ be the
  solution of the #strong[steepest descent problem]
  $ min_(d in RR^n, norm(d) = 1) nabla f(x)^T d $
  where $norm(dot)$ is the Euclidean norm (of course other norms can be considered
  as well). Every direction $s = lambda accent(d, macron)$ with $lambda > 0$ is 
  called a direction of #strong[steepest descent] with respect to the Euclidean
  norm.
]

#theorem[Solution of the steepest descent problem][
  Let $x in RR^n$ and $nabla f(x) != 0$. Then the steepest descent problem has
  the unique solution
  $ accent(d, macron) = - (nabla f(x))/norm(nabla f(x)). $
  This means that every direction $s = -lambda nabla f(x), lambda > 0$, is
  direction of steepest descent.
]

#example[1.2][
  Show, that for a continuous function $f : RR^n → RR$ with 
  $lim_(norm(x->oo)) f (x) = oo$ and for arbitrary $w in RR^n$ the level set
  $ cal(N)_f(w) = {x in RR^n : f(x) <= f(w)} $
  is compact.
]
#solution[
  - Closedness: implied by continuity of $f$.
  - Boundedness: assume there is some $w$ for which ${x in RR^n: f(x) <= f(w)}$ 
    is unbounded. Then there must be a sequence ${x^k}_(k in NN_0) subset S$ with
    $norm(x^k) -> oo$ but since $f$ is coercive, $lim_(norm(x)->oo)f(x)=oo$ which
    contradicts $f(x)<=f(w)$
]

#example[2.1.a][
  Let $f:RR->RR$ be a differentiable function. Show: if $accent(x, macron)$ is a
  local but not a global minimu of $f$, then $f$ posseses at least one additional
  stationary point $accent(x, hat)$ besides $accent(x, macron)$, i.e. at least 
  one point $accent(x, hat) != accent(x, macron)$ with $f'(x) = 0$.
]
#solution[
  There exists some $epsilon > 0$ with $f(x)>=f(accent(x, macron))$ for all 
  $x in B_epsilon (accent(x,macron))$ and some $accent(x, tilde) in RR$ with
  $f(accent(x,tilde))<f(accent(x,macron))$. 
]

#example[
  Let $f(x) = 1/2 x^T C x + c^T x$ a strictly convex function where $C in R^(n times n)$ positive definite.
  $ phi'(sigma_k) = (c+C(x^k+sigma_k s^k)) = 0. $
  we get
  $ sigma_k 
    &= -((c+C x^k)^T s^k)/((s^k)^T C s^k)
    = -(nabla f(x^k)^T s^k)/((s^k)^T C s^k) \
    &= (norm(nabla f(x^k))^2)/(nabla f(x^k)^T C nabla f(x^k))
    = (norm(s^k)^2)/((s^k)^T C s^k) $
]

#theorem[
  Let $f: RR^n -> RR$ be strictly convex and quadratic, i.e. 
  $f(x) = 1/2 x^T C x + c^T x$. Let the sequences ${x^k}_(k in NN_0)$ and 
  ${sigma_k}_(k in NN_0)$ be generated bt the gradient descent method with
  exact line search. Then it holds that
  $ f(x^(k+1)) - f(accent(x, macron)) <= 
    ((lambda_max (C) - lambda_min (C))/(lambda_max (C) - lambda_max (C)))^2
    dot (f(x^k) - f(accent(x, macron))) $
  $ norm(x^k - accent(x, macron)) <=
    sqrt((lambda_max (C))/(lambda_min (C))) dot ((lambda_max (C) - lambda_min (C))/(lambda_max (C) + lambda_min (C)))^k dot norm(x^0 - accent(x, macron)) $
  where $accent(x, macron) = -C^(-1) c$ is the global minimum of $f$ and 
  $lambda_max (C)$ and $lambda_min (C)$ are the larges and smallest eigenvalue
  of $C$, respectively. With the condition $kappa(C) = 
  (lambda_max (C))/(lambda_min (C))$ of the positive definite matrix $C$ the
  previous two inequalities can be expressed in the equivalent form:
  $ f(x^(k+1))-f(accent(x, macron)) <= ((kappa(C) - 1)/(kappa(C) + 1))^2
    dot (f(x^k) - f(accent(x, macron))), $
  $ norm(x^k - accent(x,macron)) <= sqrt(kappa(C)) dot 
    ((kappa(C) - 1)/(kappa(C) + 1))^k dot norm(x^0 - accent(x, macron)). $
]