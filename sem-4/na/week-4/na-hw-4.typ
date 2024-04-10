#import "@local/hw:0.1.0": *

#show: homework(
  theme,
  subject: "Numerical Analysis",
  title: "Homework",
  week: 3
)

#let (problem, ..) = themed-items(theme)
#set rect(width: 100%)

#problem[
  #let text = read("1.rs")
  #rect(raw(text, lang: "rs"))
  #set enum(numbering: colored-numbering("(a)"))

  1. 1.1697261594235897 
  2. 6.776092294603586
]


#problem[
  #let text = read("2.rs")
  #rect(raw(text, lang: "rs"))
  #set enum(numbering: colored-numbering("(a)"))

  1. 1.1697262198431786 
  2. 6.776092319299465
]


#problem[
  #let text = read("3.rs")
  #rect(raw(text, lang: "rs"))
  #set enum(numbering: colored-numbering("(a)"))

  1. -6.000000014901161 
  2. 0
]

#pagebreak()
#problem[
  #let text = read("4.rs")
  #rect(raw(text, lang: "rs"))
  #set enum(numbering: colored-numbering("(a)"))

  1. x = 0.7548776625
  2. x = -0.9708989217
  3. x = 1.5921429345
]

#pagebreak()
#problem[
  #let text = read("5.rs")
  #rect(raw(text, lang: "rs"))
  #set enum(numbering: colored-numbering("(a)"))

  1. x = 0.7548776662
  2. x = -0.9708989235
  3. x = 1.5921429371
]

#problem[
  #proof[
    We can use algebra to find the real and the only root of $f(x) = a x + b$ which 
    is $-b / a$. Now, if we start with an initial guess $x_0$ and apply 
    one iteration of newtons method, we will get 
    $ x_1 
      = x_0 - f(x_0) / (f'(x_0))
      = x_0 - (a x_0 + b) / a
      = x_0 - x_0 - b/a 
      = -b/a $
    which we know is the root of $f(x)$.
  ]
]

#problem[
  $ x_1 = x_0 - f(x_0) / (f'(x_0)) = 1 - 1/(-1\/1^2) = 2 \
    x_2 = x_1 - f(x_1) / (f'(x_1)) = 2 - (1\/2)/(-1\/2^2) = 4 \
    x_3 = x_2 - f(x_2) / (f'(x_2)) = 4 - (1\/4)/(-1\/4^2) = 8 \
    dots.v \
    x_50 = x_49 - f(x_49) / (f'(x_49)) = 2^49 - (2^(-49))/(-2^(-98)) = 2^50 $
]