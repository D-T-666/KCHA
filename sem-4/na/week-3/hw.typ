#import "@local/hw:0.1.0": *

#show: homework(
  theme,
  subject: "Introduction to Optimization",
  title: "Homework",
  week: 2
)

#let (problem, ..) = themed-items(theme)

#problem[
  $ f(x_0 + h) &= f(x_0) + h f'(x_0) + h^2/2 f''(x_0) +  O(h^3) \
    f'(x_0) &= (f(x_0) - f(x_0 + h)) / h + h^2/2 f''(x_0) + O(h^2) $
  Then we apply extraplotaion to get a higher order approximation.
  $ f'(x_0) &= (4 (2(f(x_0) - f(x_0 + h/2)) / h + h^2/8 f''(x_0) + O(h^2)) - ((f(x_0) - f(x_0 + h)) / h + h^2/2 f''(x_0) + O(h^2))) / (4-1) \
    &= (8 (f(x_0) - f(x_0 + h/2)) / h + h^2/2 f''(x_0) - (f(x_0) - f(x_0 + h)) / h - h^2/2 f''(x_0) + O(h^2))/3 \
    &= (7 f(x_0) - 8 f(x_0 + h/2) + f(x_0 + h))/3 + O(h^2) $
]

#problem[
  #set enum(numbering: colored-numbering("(a)"))
  + $ 3 f(x_0 - h) + f(x_0 + 3h) = 4f(x_0) + 6 h^2 f''(x_0) + 4 h^3 f'''(x_0) + O(h^3) \
      f''(x_0) = (3 f(x_0 - h) + f(x_0 + 3h) - 4f(x_0)) / (6 h^2) + 2/3 h f'''(x_0) + O(h) $
  + $ f''(x_0) &= (2^1 ((3 f(x_0 - h/2) + f(x_0 + 3/2h) - 4f(x_0)) / (3/2 h^2) + O(h^2)) - ((3 f(x_0 - h) + f(x_0 + 3h) - 4f(x_0)) / (6 h^2) + 2/3 h f'''(x_0) + O(h))) / 1 \
      &= (24 f(x_0 - h/2) + 8 f(x_0 + 3/2 h) - 3 f(x_0 - h) - f(x_0 + 3h) - 28 f(x_0)) / (6h^2) + O(h^2) $
  + with $h = 0.1$ the absolute error is $2.90187 dot 10^(-3)$ and with $h = 0.01$ it's $2.917 dot 10^(-5)$ which is about two times smaller

  + #grid(
      columns: (auto, 1fr),
      gutter: 1em,
      rect(stroke: theme.tcum, text(size: 6pt, ```
      h=0.500 0.13565659 -0.06405054
      h=0.475 0.12329346 -0.05855471
      h=0.450 0.11139753 -0.05319656
      h=0.425 0.09999343 -0.04799719
      h=0.400 0.08910493 -0.04297703
      h=0.375 0.07875482 -0.03815570
      h=0.350 0.06896488 -0.03355200
      h=0.325 0.05975579 -0.02918381
      h=0.300 0.05114710 -0.02506805
      h=0.275 0.04315715 -0.02122063
      h=0.250 0.03580302 -0.01765639
      h=0.225 0.02910049 -0.01438903
      h=0.200 0.02306395 -0.01143112
      h=0.175 0.01770644 -0.00879399
      h=0.150 0.01303953 -0.00648774
      h=0.125 0.00907332 -0.00452119
      ```)),
      box(width: 1fr, [The first column is the absolute error of the first method (the one without extrapolation) and the second is the second column (the one with extrapolation).])
    )
]

#problem[
  #set enum(numbering: colored-numbering("(a)"))
  + $ (diff f) / (diff x) 
      &approx (f(x + h, y) - f(x - h, y)) / (2h) \
      &= (cancel(f(x, y)) + h (diff f) / (diff x) + cancel(h^2 / 2 (diff^2 f) / (diff x^2)) + O(h^3) - cancel(f(x, y)) + h (diff f) / (diff x) - cancel(h^2 / 2 (diff^2 f) / (diff x^2)) + O(h^3)) / (2h) \
      &= (diff f) / (diff x) + O(h^2)$
  + $ (diff^2 f) / (diff y^2) 
      &approx (f(x, y+h) - 2 f(x, y) + f(x, y-h)) / (h^2) \
      &= (cancel(f(x, y)) + cancel(h (diff f) / (diff y)) + h^2 / 2 (diff^2 f) / (diff y^2) + cancel(h^3 / 6 (diff^3 f) / (diff y^3)) + O(h^4) - cancel(2f(x, y)) + cancel(f(x, y)) - cancel(h (diff f) / (diff y)) + h^2 / 2 (diff^2 f) / (diff y^2) - cancel(h^3 / 6 (diff^3 f) / (diff y^3)) + O(h^4)) / (h^2) \
      &= (diff^2 f) / (diff y^2) + O(h^2)$
]
