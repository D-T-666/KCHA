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

#let problemt = problem(theme: theme, numbering: "1.1:")

#problemt[
  1. #proof[
      Let $P subset NN_0$ and $Q subset NN_0 without P$ 
      be the indices of the infinite subsequences of ${x^k}_(k in NN_0)$ that 
      converges to $accent(x, macron)$ and $accent(x, tilde)$ respectively.  

      W.L.O.G. assume that $f(accent(x, macron)) < f(accent(x, tilde))$. Since 
      ${x^k}_(k in NN_0)$ is strictly monotonously decreasing, by convergence,
      there will exist $i in NN$ such that 
      $ f(x^(i-1)) > f(accent(x, tilde)) >= f(x^i) $
      and again by monotonousity, $f(accent(x, tilde)) > f(x^j) forall j > i$
      and $abs(f(accent(x, tilde)) - f(x^j)) > 
      abs(f(accent(x, tilde)) - f(x^(j+1)))$, i.e. after $i$, difference between
      $f(accent(x, tilde))$ and $f(x^j)$ grows as $j -> oo$. This means that 
      the subsequence converging to $accent(x, tilde)$ would have to be before $x^j$ and therefore have a finite size, which is a contradiction (a finite
      sequence can't converge to anything).
    ]
  
  2. Since $f(x^(k+1)) < f(x^k)$ (strictly monotonously decreasing), any
    subsequence would converge to a value smaller than the value of $f$ 
    at any $x^k$.
    #todo(inline: true)[]
]

= Graded Homework Assignment

#let problemt = problem(theme: theme, numbering: "I.1:")

#problemt[
  #proof[
    Let $Q = mat(a, b; b, c), D = mat(1/a, 0; 0, 1/c)$, then 
    $D^(1/2) = mat(1/sqrt(a), 0; 0, 1/sqrt(c))$ and 
    $D^(1/2) Q D^(1/2) = mat(1, b/sqrt(a c); b/sqrt(a c), 1)$.

    Now we can write
    $ det(Q - lambda I) = (a - lambda)(c - lambda) - b^2 = lambda^2 - (a + c) lambda + a c  - b^2 $
    which gives eighenvalues $(a + c - sqrt((a-c)^2 + 4b^2))/2$ and $(a + c + sqrt((a-c)^2 + 4b^2))/2$.
    And 
    $ det(D^(1/2) Q D^(1/2) - lambda I) = (1 - lambda)^2 - (b/sqrt(a c))^2 - b^2 $
    with eighenvalues $1 - b/sqrt(a c)$ and $1 + b/sqrt(a c)$.

    We need to show that
    $ (cancel(2)(a + c + sqrt((a-c)^2 + 4b^2)))/(cancel(2)(a + c - sqrt((a-c)^2 + 4b^2))) >= (1 + b/sqrt(a c))/(1 - b/sqrt(a c)) $

    Let $x = a + c, y = sqrt((a - c)^2 + 4b^2), z = b / sqrt(a c)$. 
    We know that $x plus.minus y > 0$ and it's easy to show 
    that $1 plus.minus d > 0$. Now we need to show that

    $ (x + y)(1 - z) >= (x - y)(1 + z) 
      &<==> x + y - x z - y z >= x - y + x z - y z \
      &==> 2y >= 2x z \
      &==> sqrt((a - c)^2 + 4b^2) >= (a + c) b / sqrt(a c) \
      &==> a c ((a - c)^2 + 4b^2) >= (a + c)^2 b^2 \ 
      &==> a c (a - c)^2 >= (a + c)^2 b^2 - 4 a c b^2 \
      &==> a c (a - c)^2 >= (a - c)^2 b^2 \
      &==> a c >= b^2 $
    
    which is true since $det(Q) = a c - b^2 > 0$.
  ]
]

#problemt[
  1. 
    - $nabla accent(f, hat) (y) = nabla (f(T(y))) = nabla (f(B y + b)) = B^T nabla f(B y + b)$

    - $H_accent(f, hat) (y) = B^T H_f (B y + b) B quad$ from the slides.

  2. 
    Let $x_g = x + s$. Then,
    $ s
      &= T(y_g) - x \
      &= T(y - alpha nabla accent(f, hat)(y)) - x \
      &= B(y - alpha nabla accent(f, hat)(y)) + b - x \
      &= B y + b - alpha B nabla accent(f, hat)(y) - x \
      &= T(y) - alpha B B^T nabla f(x) - x \ 
      &= alpha B B^T nabla f(x) \ &arrow.double.b \
      x_g &= x + alpha B B^T nabla f(x) $
    and
    $ T^(-1)(x_g) 
      &= B^(-1)(x_g - b) \ 
      &= B^(-1)(x + s - b) \ 
      &= B^(-1)(x + alpha B B^T nabla f(x) - b) \ 
      &= B^(-1)(x - b) + alpha B^T nabla f(x) \ 
      &= y + alpha nabla accent(f, hat)(y) \ 
      &= y_g. $
    This means that a step $-alpha nabla accent(f, hat)(x)$ in the transformed space can be seen as a step in 
    the original space with the search direction $T(y_g) - x$. Now the linear system
    $ M s &= -nabla f(x) \ &arrow.double.b \
      M (-alpha B B^T nabla f(x)) &= - nabla f(x) \ &arrow.double.b \
      M alpha B B^T &= I \ &arrow.double.b \
      M &= (alpha B B^T)^(-1) \
      &= 1/alpha B^(-T) B^(-1) $
    So $M$ is positive semi-definite
  3. 
    $ T(y_g) &= x_g \ &arrow.double.b \
      T(y - alpha nabla accent(f, hat) (y)) &= x - alpha nabla f(x) \ &arrow.double.b \
      T(T^(-1)(x) - alpha nabla accent(f, hat) (T^(-1)(x))) &= x - alpha nabla f(x) \ &arrow.double.b \
      T(T^(-1)(x) - alpha B^T nabla f(T(T^(-1)(x)))) &= x - alpha nabla f(x) \ &arrow.double.b \
      T(T^(-1)(x) - alpha B^T nabla f(x)) &= x - alpha nabla f(x) \ &arrow.double.b \
      B(B^(-1)(x - b) - alpha B^T nabla f(x)) + b &= x - alpha nabla f(x) \ &arrow.double.b \ 
      x - alpha B B^T nabla f(x) &= x - alpha nabla f(x) \ &arrow.double.b \ 
      B B^T nabla f(x) &= nabla f(x) \ &arrow.double.b \
      B B^T &= I $
      
    Therefore $B$ must be an #emph[orthogonal] matrix
  4. 

]
