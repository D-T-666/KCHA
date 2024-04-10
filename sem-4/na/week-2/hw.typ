#import "@local/hw:0.1.0": *
// #import "@preview/tablex:0.0.8": *

// #let theme = color_theme(dark)

#show: homework(
  theme,
  subject: "Introduction to Optimization",
  title: "Homework",
  week: 2
)

#text(size: 9pt, table(
  columns: (auto, 1fr),
  inset: 10pt,
  align: horizon + center,
  stroke: theme.faded + 0.2pt,

  [order],
  text(size: 8pt)[
    $ f(x_0 + k h) &= f(x_0) + k h 1/1! der(f, 1)(x_0) + (k h)^2/2! der(f, 2)(x_0) + (k h)^3/3! der(f, 3)(x_0) + (k h)^4/4! der(f, 4)(x_0) + ... + (k h)^n/n! der(f, n)(x_0) + O(h^(n+1)) $
  ],

  Roman(1), 
  $ der(f, 1)(x_0) &= (f(x_0 + k h) - f(x_0)) / (k h) - (k h)/2! der(f, 2)(x_0) - (k h)^2/3! der(f, 3)(x_0) - (k h)^3/4! der(f, 4)(x_0) - O(h^4) $,

  Roman(2), 
  $ der(f, 2)(x_0) &= 2!(f(x_0 + k h) - f(x_0)) / (k h)^2 - 2! 1/(k h) der(f, 1)(x_0) - 2!(k h)/3! der(f, 3)(x_0) - 2!(k h)^2/4! der(f, 4)(x_0) - O(h^3) $,

  Roman(3), 
  $ der(f, 3)(x_0) &= 3!(f(x_0 + k h) - f(x_0)) / (k h)^3 - 3! 1/(k h)^2 der(f, 1)(x_0) - 3! 1/(2!dot k h) der(f, 2)(x_0) - 3!(k h)/4! der(f, 4)(x_0) - O(h^2) $,

  Roman(4), 
  $ der(f, 4)(x_0) &= 4! (f(x_0 + k h) - f(x_0)) / (k h)^4 - 4! 1/(k h)^3 der(f, 1)(x_0) - 4! 1/(2! (k h)^2) der(f, 2)(x_0) - 4! 1/(3! dot k h) der(f, 3)(x_0) - O(h) $,
))

+ The error term and the order of
  $ f'(x_0) approx (4 f(x_0 + h) - 3 f(x_0) - f(x_0 - 2 h)) / (6 h) $
  would be calculate by Taylor's theorem
  $  f(x_0 + h) &= f(x_0) + h f'(x_0) + h^2/2 f''(x_0) + ... + h^n/n! f^((n))(x_0) + O(h^(n+1)) \
    f(x_0 - 2h) &= f(x_0) - 2h f'(x_0) + 4h^2 1/2 f''(x_0) - ... + (-2h)^n 1/n! f^((n))(x_0) + O(h^(n+1)). $
  $ f'(x_0) &= (f(x_0 + h) - f(x_0) - h^2/2 f''(x_0) - O(h^3)) / h \
          &= (f(x_0 + h) - f(x_0)) / h - h/2 f''(x_0) - O(h^2) \
    f'(x_0) &= (f(x_0) - f(x_0 - 2h) + 4h^2 1/2 f''(x_0) + O(h^3)) / (2h) \
          &= (f(x_0) - f(x_0 - 2h)) / (2h) + h f''(x_0) + O(h^2) $
  If we combine both of these, we get
  $ 3f'(x_0) &= (4f(x_0 + h) - 3f(x_0) - f(x_0 - 2h))/(2h) + O(h^2) \
     f'(x_0) &= (4f(x_0 + h) - 3f(x_0) - f(x_0 - 2h))/(6h) + O(h^2). $
  Now we can see that the error term for the given approx_0imation is $O(h^2)$ and
  the order therefore is $2$.

+ As in the previous problem, we use taylors formula
  $ f(x_0 - h) &= f(x_0) - h 1/1! f'(x_0) + h^2 1/2! f''(x_0) - ... + (-h)^n 1/n! f^((n))(x_0) + O(h^(n+1)) \
    f'(x_0) &= (f(x_0) - f(x_0 - h) + h^2 1/2 f''(x_0) + O(h^3)) / h \
          &= (f(x_0) - f(x_0 - h)) / h + h 1/2 f''(x_0) + O(h^2) \
    f(x_0 +3h) &= f(x_0) +3h 1/1! f'(x_0) + (3h)^2 1/2! f''(x_0) + ... + (3h)^n 1/n! f^((n))(x_0) + O(h^(n+1)) \
    f'(x_0) &= (f(x_0 + 3h) - f(x_0) - h^2 9/2 f''(x_0) - O(h^3)) / (3h) \
          &= (f(x_0 + 3h) - f(x_0)) / (3h) - h 9/2 f''(x_0) - O(h^2) $
  then we combine these to get
  $ 20 f'(x_0) &= 18 (f(x_0) - f(x_0 - h)) / h + 9 h f''(x_0) + 2(f(x_0 + 3h) - f(x_0)) / (3h) - 9 h f''(x_0) + O(h^2) \ 
           &= 18 (f(x_0) - f(x_0 - h)) / h + 2(f(x_0 + 3h) - f(x_0)) / (3h) + O(h^2) \
           &= (53 f(x_0) - 54 f(x_0 - h) + 2 f(x_0 + 3h)) / (3h) + O(h^2) \
    f'(x) &= (53 f(x_0) - 54 f(x_0 - h) + 2 f(x_0 + 3h)) / (60h) + O(h^2) $
  a second order approximation for $f'(x_0)$

+ Similarly
  combining these gives
  $ 4f''(x_0) &= 2(3f(x_0+3h) + 9f(x_0-h) - 10f(x_0)) / (9h^2) - O(h) \
    f''(x_0) &= (3f(x_0+3h) + 9f(x_0-h) - 10f(x_0)) / (18h^2) - O(h) $

+ If you sum up $s = -f(x_0 - 2h) + 2f(x_0 - h) - 2f(x_0 + h) + f(x_0 + 2h)$ you will get
  $
    s =&(-1+2-2+1)f(x_0) + \
      &(2-2-2+2) h der(f, 1)(x_0) + \
      &(-2+2-2+2) h^2 der(f, 2)(x_0) + \
      &(8-2-2+8) h^3/6 der(f, 3)(x_0) + \
      &(-16+2-2+16) h^4/24 der(f, 4)(x_0) + \
      &O(h^5) \
      =& 2h^3 der(f, 3)(x_0)
  $
  $ der(f, 3)(x_0) = (-f(x_0-2h) + 2f(x_0-h) - 2f(x_0+h) + f(x_0+2h))/(2h^3)+O(h^2) $

+ #text(theme.faded)[გთხოვ ნუ დამაწერინებ ამ უაზრობებს, ორი დღე ვეჯექი ამ დავალებას 
  და ამდენის დაწერა ძლივს დავაძალე თავს, მოვკვდები კიდე რო დავწერო.]


