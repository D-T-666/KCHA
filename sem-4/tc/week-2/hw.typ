#import "@local/hw:0.1.0": *

#let theme = color_theme(dark)

#show: doc => homework(
  theme,
  subject: smallcaps[Theory of Computation],
  title: smallcaps[Week two],
  doc
)

#set rect(
  width: 100%,
  height: 100%,
  stroke: theme.faded + 0.5pt,
  radius: 0.5em,
  inset: 1em
)

+ To show that a language is not regular, we can use the pumping lemma and show that 
  a word of the form $a^n b^n$ can not be decomposed into $u v x$ such that $u v^i x in L$.
  We must consider all decompositions:

  - $u x v = (a^m)(a^k)(b^n), n = m + k$. We can see that if we pump $x$, the number of
    $a$s will be $m + i k$ which is not equal to $m + k = n$ thereby it's not in $L$.
  - $u x v = (a^m)(a^k b^l)(b^p), n = m + k = l + p$ If we pump $x$, we will get a word with 
    $k(i-1)$ number of $a$s after the first $b$ for all $i >= 2$ a thereby it's not in $L$.
  - $u x v = (a^n)(b^k)(b^m), n = m + k$ If we pump $x$, the number of $a$s will be 
    $m + i k$  which is not equal to $m + k = n$ thereby it's not in $L$.
+ #enumerate(num: "(1)", theme: theme)[
    + The NFA would be described as
      #grid(columns: (auto, auto, auto),
        $ M &= (Z, A, delta, z_0, Z_A) \ Z &= {z_0, z_1, z_2, z_3, z_4} \
          A &= {a, b} \ 
          Z_A &= {z_2, z_4} \
        $,
        $
          delta (z_0, x) &= cases({z_0, z_3} quad& "if" x = a, {z_0, z_1} quad& "if" x = b) \
          delta (z_1, x) &= cases({} quad& "if" x = a, {z_2} quad& "if" x = b)
        $,
        $ 
          delta (z_2, x) &= {z_2} \
          delta (z_3, x) &= cases({z_4} quad& "if" x = a, {} quad& "if" x = b) \
          delta (z_4, x) &= {z_4}.
        $
      )

    + M accepts all words that contain at least one `a` followed by another `a` or a
      `b` followed by another `b`.
  ]
+ #rect(height: auto, figure(
     dfa(theme: theme,
      "
        z_0, z_3, z_8 [shape=doublecircle, color=\""+theme.tcum.to-hex()+"\"]
        start -> z_0 [color=\""+theme.fg.to-hex()+"\"]
        z_0 -> z_4 -> z_5 -> z_6 -> z_7 -> z_8 -> z_4 [label=\"1\"]
        z_0 -> z_1 -> z_2 -> z_3 -> z_1 [label=\"1\"]
      ",
    ),
    caption: [NFA that accepts $L={1^i:i equiv 0 mod 3} union {1^i:i equiv 0 mod 5}$]
  )
  )
  
+ A counterexample would be an NFA that accepts all strings from alphabet 
  ${a, b}$ which end with $a$.
  #grid(
    columns: (50%, 50%),
    rows: (3cm),
    $ 
      Q_1 = {z_0, z_1}, quad Sigma_1 = {a, b}, quad F_1 = {z_1} \
      delta_1(z_0, x) = cases({z_1} "if" x = a, {z_0} "if" x = b) \
      delta_1(z_1, x) = cases({z_1} "if" x = a, {z_0} "if" x = b)
    $,
    rect(align(center + horizon, dfa(
      "
        z_1 [shape=doublecircle, color=\""+theme.tcum.to-hex()+"\"]
        start -> z_0
        z_0 -> z_1 [label=\"a\"]
        z_1 -> z_1 [label=\"a\"]
        z_1 -> z_0 [label=\"b\"]
        z_0 -> z_0 [label=\"b\"]
      ", theme: theme
    )))
  )

  while accepting $L(N_1) = {a, b}^* circle.small {a}$. 
  If we apply the given construction, we get
  #grid(
    columns: (50%, 50%),
    rows: (4cm),
    $ N = (Q, Sigma, delta, q, F), 
      quad Q = Q_1, \ 
      q = q_1,
      quad F = F_1 union {q_1}, 
      quad Sigma_epsilon = Sigma_1 union {epsilon} \ 
      delta_1(z_0, x) = cases({z_1} "if" x = a, {z_0} "if" x = b) \
      delta_1(z_1, x) = cases({z_1} "if" x = a, {z_0} "if" x = b, {z_0} "if" x = epsilon) 
    $,
    rect(
      align(center + horizon, dfa(theme: theme, "
        z_0 [shape=doublecircle, color=\""+theme.tcum.to-hex()+"\"]
        z_1 [shape=doublecircle, color=\""+theme.tcum.to-hex()+"\"]
        start -> z_0 [color=\""+theme.fg.to-hex()+"\"]
        z_0 -> z_1 [label=\"a\"]
        z_1 -> z_1 [label=\"a\"]
        z_1 -> z_0 [label=\"b, 𝜀\"]
        z_0 -> z_0 [label=\"b\"]
      "
    )))
  )
  If we look closely, we can see that $N$ would accept something that's not in 
  $L(N_1)^*$ such as `bbb`.

+ We modify the construction from the previous problem a little bit,
  and get the solution
  $ M = (Z, A, delta, z_0, Z_A), quad M'' = (Z'', A, delta'', z_"start", Z''_A) \
    Z'' = Z union {z_"start"} \
    Z''_A = Z_A union {z_"start"} \
    delta''(z, x) = cases(
      delta(z, x) & z in.not Z_A or x eq.not epsilon,
      delta(z, x) union {z_"start"} quad & z in Z_A and x = epsilon.
    ) \
    delta''(z_"start", epsilon) = {z_0}.
  $
  