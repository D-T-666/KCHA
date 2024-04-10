#import "@local/hw:0.1.0": *

#show: homework(
  theme,
  subject: "Introduction to Optimization",
  title: "Homework",
  week: 2
)

#let problem = problem(theme: theme)

= Homework Assignment #text(theme.faded)[Not graded]

#problem[
  #set enum(numbering: colored-numbering("(a)", color: theme.tcum))
  + First calculate the gradient
    $ f(x_1, x_2) = (4x_1^2-x_2)^2 = 16x_1^4 - 8x_1^2x_2 + x_2^2 ==> nabla f(x_1, x_2) =  angle.l 64x_1^3-16x_1x_2, -8x_1^2+2x_2 angle.r. $
    At stationary points, $nabla f(x) = 0$
    $ nabla f(x_1,x_2)=angle.l 64x_1^3-16x_1x_2,-8x_1^2+2x_2 angle.r=0==>cases(64x_1^3-16x_1x_2=0, -8x_1^2+2x_2=0)=>4x_1^2=x_2. $
    At such points, $f(u, 4u^2) = 0$ This means that all points ${(u, 4u^2) : u in RR}$ are 
    stationary points.
    $ H_f(x_1, x_2) = mat(192x_1^2-16x_2, -16x_1; -16x_1, 2) ==> H_f(u, 4u^2) = 2 mat(64u^2, -8u; -8u, 1), det(H_f(u, 4u^2)) = 0 $
    so second derivative test is not suitable for this example. If we let $d in RR^2$ be an arbitrary
    non-zero vector we can write
    $
      f(x+d) 
      &= (4(x_1+d_1)^2-(x_2+d_2))^2 \
      &= (4x_1^2-x_2+8x_1d_1+4d_1^2-d_2)^2 \
      &= (4x_1^2-x_2)^2+2(4x_1^2-x_2)(8x_1d_1+4d_1^2-2x_2d_2-d_2^2)+(8x_1d_1+4d_1^2-2x_2d_2-d_2^2)^2
    $
    and in the case where $4x_1^2 = x_2$ we get that
    $
      f(x+d) 
      &= (4x_1^2-x_2)^2+2(4x_1^2-x_2)(8x_1d_1+4d_1^2-2x_2d_2-d_2^2)+(8x_1d_1+4d_1^2-2x_2d_2-d_2^2)^2 \
      &= 0+0+(8x_1d_1+4d_1^2-2x_2d_2-d_2^2)^2 \
      &>= 0.
    $
    Therefore the minimum of $f$ is $0$ and is attained at points ${(u, 4u^2) : u in RR}$. 
]

#problem[
  #proof[
    Let $S = {x in RR^n: f(x) <= f(y)}$ be a sub-level set for some $y$ and $a, b in S$
    such that $f(a) = f(b)$. Since $f$ is convex, i.e. $(1-lambda)f(a) + lambda f(b) >= f((1-lambda)a + lambda b)$ 
    if some $c$ is on the line between $a$ and $b$, $f(c) <= f(a) = f(b)$ meaning that if $S$ 
    contains $a$ and $b$ it will also contain $c$.
  ]
]

#problem[
  #set enum(numbering: colored-numbering("(a)", color: theme.tcum))
  + #proof[
      $
        f(g((1-lambda)a+lambda b)) &<= f((1-lambda)g(a)+lambda g(b)) & #text(theme.faded)[(by convexity and monotonousity)]\
        &<=(1-lambda)f(g(a))+lambda f(g(b))
      $
    ]
  + #proof[
      Let $f(x) = e^(-x) , g(x) = x^2, f(g(x)) = e^(-x^2)$. At points $-1$ and $1$ value of the
      function is $f(g(-1)) = f(g(1)) = e^(-1)$ which is evidently less than the value at 
      $0$ which is $f(g(0)) = e^0$ therby contradicting the convexity.
    ]
]

#problem[
  Let $accent(x, macron)$ and $accent(y, macron)$ be the optimizers of the problem and $lambda in (0, 1)$. 
    Then, by convexity of $f(x)$, we know that any point $c = (1-lambda)x+lambda y$ gives us 
    $
        f(c) <= (1-lambda)f(x)+lambda f(y) = f(x) = f(y)
    $
    and since $f(x) <= f(a) forall a in K$ we get that $f(c) = f(x) = f(y) ==>c in {x in K : f(x) <= f(y) forall y in K}$.
]

= Graded Homework Assignment

#problem[
  $f(x_1, x_2) = x_1^2 - 5x_1x_2^2 + 5x_2^4 $
  #set enum(numbering: colored-numbering("(a)", color: theme.tcum))

  + To determine all stationary points of $f$, first we find
    $ nabla f(x_1, x_2)=angle.l 2x_1-5x_2^2, -10x_1x_2+20x_2^3 angle.r $
    then we find such $(x_1, x_2)$ that $nabla f(x_1, x_2) = 0$
    $ 
        cases(2x_1 - 5x_2^2 = 0, -10x_1x_2 + 20x_2^3 = 0)
        ==>
        cases(2x_1 - 5x_2^2 = 0, -x_1 + 2x_2^2 = 0)
        ==>
        cases(x_1 = 0, x_2 = 0)
    $

  +
    - $f(x_1, 0) = x_1^2$. $accent(x, macron)_1 = 0$ is a global minimizer
      since $0^2 <= x_1^2$ for all $x_1$.
    - $f(0, x_2) = 5x_2^4$. $accent(x, macron)_2 = 0$ is a global minimizer 
      since $5 dot 0^4 <= 5 dot x_2^4$ for all $x_2$.

  + We know that $accent(x, macron) = 0$ is a stationary point. We need to find the Hessian of $f$
    $ H_f(x_1, x_2) = mat(2, -10x_2; -10x_2, -10x_1+50x_2^2) $
    Now we just plug in $accent(x, macron)=0$ and obtain
    $ H_f(0, 0) = mat(2,0;0,0) $
    the we find the eigenvalues
    $ det(H_f-lambda I) = lambda (2 - lambda) = 0 ==> lambda = 0, 2. $
    This means that $H_f(0,0)$ is positive semi-definite and that doesn't tell us anthing about
    the class of the stationary point.
    
    Consider the curves
    - $A = {(2u^2, u) : u in RR}$
      $ f(2u^2, u) = 4u^4 - 10u^4 + 5u^4 = -u^4 $
    - $B = {(u, 0) : u in RR}$
      $ f(B) = {u^2 - 5u dot 0 + 5 dot 0^4 : u in RR} = {u^2 : u in RR} $
    
    It's clear that $accent(x, macron)$ has values both greater and lower than $f(accent(x, macron)) = 0$. This means that the point $accent(x, macron)$ is a saddle point.
    @gp1 also illustrates that quite well.
    #let original = read("2-1-1.svg")
    #let changed = original.replace(
      "rgb(  0,   0,   1)", // blue
      theme.fg.to-hex(),
    ).replace(
      "rgb(0,0,1)", // blue
      theme.fg.to-hex(),
    ).replace(
      "rgb(  0,   0,   2)", // blue
      theme.tcum.to-hex(),
    ).replace(
      "rgb(0,0,2)", // blue
      theme.tcum.to-hex(),
    )

    #align(center)[#figure(
      image.decode(changed, width: 10cm),
      caption: [plot of $f$ near $(0,0)$]
    ) <gp1>]
]

#problem[
  - $f$ is bounded below $<== b in {A y : y in RR^n}$
    #proof[
      let $b = A y$
      $ 
        f(x) &= x^T A x + 2 b^T x + c \
              &= x^T A x + 2 y^T A x + c \
              &= angle.l A^(1 / 2)(x + y), A^(1/2)(x + y) angle.r - y^T A y + c \ 
              &= underbrace((x+y)^T A (x+y), >=0 #text(theme.faded)[(P#text(theme.faded.darken(50%))[T]SD)]) - underbrace(y^T A y + c, "constant") \
              &>= -y^T A y + c
      $
    ]
  - $f$ is bounded below $==> b in {A y : y in RR^n}$
    #proof[
      Since $A$ is positive semi-definite and not positive definite, assume $det(A) = 0$ and
      $ker(A) != {0}$. If we let $x in ker(A)$ we get
      $
        f(x) &= x^T A x + 2b^T x + c \
              &= 0 + 2b^T x + c.
      $
      From here we observe that if $b$ were to be of the form $A y$ we would have
      $
        f(x) &= 2b^T x + c \
              &= 2y^T underbrace(A x, = 0) + c \ 
              &= c
      $
      but otherwise, $f(x)$ would be a linear function in respect to $x$ which is not
      bounded from below.
    ]
]
    
  
#problem[
  #set enum(numbering: colored-numbering("1.", color: theme.tcum))
  + Let $a = (1, 0)$ and $b = (-1, 0)$, $||a||^2 = ||b||^2 = 1$ therefore $a, b  in A$. 
    The midpoint is $c = (0, 0)$ has $||c||^2 = 0 eq.not 1 ==> c in.not A$. $A$ is not convex.
  + #proof[Let $a, b in RR^n$ and $a_max, b_max <= 1 <==> a, b in B$. Now take the midpoint
    $c$ of $a$ and $b$, 
    $ c = ((a_1 + b_1)/2, (a_2 + b_2)/2, ..., (a_n + b_n)/2). $ 
    We can
    safely assume that $a_i = a_max forall i$ and $b_i = b_max forall i$ giving us 
    $ c = ((a_max + b_max)/2, (a_max + b_max)/2, ..., (a_max + b_max)/2) $
    from which it's clear
    that $c_max=(a_max+b_max) 2$. We now prove that $(a_max + b_max)/2 <= max{a_max, b_max}$.
    Assume $a_max >= b_max$, we get
    $ (a_max + b_max)/2 &<= a_max \
      a_max + b_max &<= 2a_max \
      b_max &<= a_max $
    ]
  + Let $a = (10, 0)$ and $b = (0, 10)$, $min a = min b = 0  <= 1$ therefore $a, b  in C$.
    The midpoint is $c = (5, 5)$ has $min c = 5 lt.eq.not 1 ==> c in.not C$. $C$ is not convex.
]
#problem[
  #proof[
  - $f$ is convex $==> g_(x,d)$ is convex.

    $ g_(x,d)((1-lambda)a+lambda b) &= f(x+((1-lambda)a+lambda b)d) \
                          &= f((1-lambda)(x+a d)+lambda(x+b d)) \
                          &<= (1-lambda)f(x+a d)+lambda f(x+b d) \
                          &= (1-lambda)g_(x,d)(a) + lambda g_(x,d)(b) $
  - $f$ is convex $<== g_(x,d)$ is convex.

    $ f((1-lambda)a+lambda b) &= g_(a,b-a)((1-lambda) dot 0 + lambda dot 1) \
                    &<= (1-lambda)g_(a,b-a)(0) + lambda g_(a,b-a)(1) \
                    &= (1-lambda)f(a) + lambda f(b) $
  ]
]
