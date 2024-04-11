#import "@local/hw:0.1.0": *

#show: homework(
  theme,
  subject: "Numerical Analysis",
  title: "Homework",
  week: 5
)

#let (problem, ..) = themed-items(theme)
#set rect(width: 100%)
#set enum(numbering: colored-numbering("(a)"))

#problem[
  1. By theorem 10.6#footnote[Burden, page 633.] <2dfp>, if 
    $abs((diff g_i(x)) / (diff x_j)) <= K/n$ for all $i, j = 1, 2$ where 
    $K$ is some constant in $(0, 1)$, then $D$ contains a unique fixed point.
    $ nabla G(x_1, x_2) = mat(x_1/5, x_2/5; (x_2^2 + 1)/10, (x_1 x_2)/5) $
    We can calculate the upper bounds of each component for points in $D$
    $ max_(x in D) x_1/5 &= 3/10 \
      max_(x in D) x_2/5 &= 3/10 \
      max_(x in D) (x_2^2 + 1)/10 &= 13/40 \
      max_(x in D) (x_1 x_2)/5 &= 9/20 $
    So we get that $K = 2 dot max{3/10, 3/10, 13/40, 9/20} = 9/10 in (0, 1)$.
  2. With the following code
    #let text = read("one/src/main.rs")
    #rect(raw(text, lang: "rs"))
    The solution is $x = vec(0, 0)$
  3. Yes, it takes 40 iterations and only 32 with Gauss-Seidel. 
]

#problem[
  First let's wrewrite the equations:
  $ 3x_1^2 - x_2^2 = 0 ==> x_1 = x_2/sqrt(3) \
    3x_1 x_2^2 - x_1^3 - 1 = 0 ==> x_2 = sqrt((x_1^2 - 1/x_1)/3) $
    
  #let text = read("two/src/main.rs")
  #rect(raw(text, lang: "rs"))
  The solution is $x = vec(0.49999999994365524, 0.8660254038294863)$
]

#problem[
  #let text = read("three/src/main.rs")
  #rect(raw(text, lang: "rs"))
  1. $
    4x_1^2  - 20x_1 + 1/4 x_2^2 + 8 = 0 &==> x_1 = 1/5 x_1^2 + 1/80 x_2^2 + 2/5 \
    1/2 x_1x_2^2 + 2x_1 - 5x_2 + 8 = 0 &==> x_2 = 1/10 x_1x_2^2 + 2/5 x_1 + 8/5
    $
    The solution is $x = vec(0.5, 2)$
  2. $
    3x_1 - cos(x_2x_3) - 1/2 = 0 &==> x_1 = 1/3 cos(x_2x_3) + 1/6 \
    4x_1^2 - 625x_2^2 + 2x_2 - 1 = 0 &==> x_2 = 1/2 + 625/2 x_2^2 - 2x_1^2 \
    e^(-x_1x_2) + 20x_3 + (10pi-3)/3 = 0 &==> x_3 = (3-10pi)/60 - 1/20 e^(-x_1x_2)
    $
    The solution is $x = vec(0.5, 0, -0.5235987755982988)$
]