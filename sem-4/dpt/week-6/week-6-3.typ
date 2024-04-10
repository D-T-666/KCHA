#import "@local/hw:0.1.0": *

#set par(first-line-indent: 1em)
#import "@preview/ctheorems:1.1.2": *
#show: thmrules.with(qed-symbol: $square$)

#show: homework(
  theme,
  subject: "Discrete Probability Theory",
  title: "Homwework",
  week: 6,
  variant: 3
)

#let (problem, solution, ..) = themed-items(theme)

#problem[
  Find the variance of a geometric random variable
]

#problem[
  Compute the expected value and the variance of a negative binomial random variable with parameters $r$ and $p$.
]

#problem[
  If independet trials, each resulting in a success with probability $p$ are
  performed, what is the probability of $r$ successes occuring before $m$ 
  failures?
]
#solution[
  $ p^r dot (1-p)^m dot binom(r + m - 1, r) $
]

#problem[
  A laboratory blood test is $96$ percent effective in detecting a certain 
  disease when it is, in fact, present. However, the test also yields a "false 
  positive" result for $3$ percent of the healthy persons tested. (That is, if a 
  healthy person is tested, then, with probability $0.03$, the test result will 
  imply that he or she has the disease.) If $2$ percent of the population 
  actually has the disease, what is the probability that a person has the 
  disease given that the test result is positive?
]
