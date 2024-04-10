#import "@local/hw:0.1.0": *

#set par(first-line-indent: 1em)
#import "@preview/ctheorems:1.1.2": *
#show: thmrules.with(qed-symbol: $square$)

#show: homework(
  theme,
  subject: "Discrete Probability Theory",
  title: "Homwework",
  week: 6,
  variant: 2
)

#let (problem, solution, ..) = themed-items(theme)

#problem[
  You ask your neighbor to water a sickly plant while you are on vacation. Without water, it will die with probability 0.7; with water, it will die with probability 0.1. You are 95 percent certain that your neighbor will remember to water the plant. What is the probability that the plant will be alive when you return?
]
#solution[
  Let $W$ be the event that the plant gets watered and $D$ be the event that it
  dies, so $p(E) = 0.95, (P(D sect E))/(P(E)) = 0.1, (P(D sect E^c))/(P(E^c)) 
  = 0.7$. We can calculate 
  $ P(D sect E) &= 0.1 dot 0.95 = 0.095 \
    P(D sect E^c) &= 0.7 dot (1 - 0.95) = 0.035 $
  and we know that $D sect E$ and $D sect E^c$ are independent, since $E$ and 
  $E^c$ are independent. Thus, we can write
  $ P(D) 
    &= P(D sect E union D sect E^c) \
    &= P(D sect E) + P(D sect E^c) \
    &= 0.095 + 0.035 \
    &= 0.13 $
  and the probability that the plant will be alive is $p(D^c) = 1 - p(D) = 0.87$
][done]

#problem[
  At all times, a pipe-smoking mathematician carries 2 matchboxes --- 1 in his 
  left-hand pocket and 1 in his right-hand pocket. Each time he needs a match,
  he is equally likely to take it from either pocket. Consider the moment when
  the mathematician first discoveres that one of his matchboxes is empty. If it
  is assumed that both of the matchboxes initially contained $N$ matches, what
  is the probability that there are exactly $k$ matches, $k = 0, 1, ..., N$, in
  the other box?
]
#solution[
  We can think about this problem as a sequence of $N$ `0`s and $N$ `1`s 
  shuffled where `0` represents the one pocket and `1` the other and the order
  in which they appear is the order the mathematician took the matches out of
  corresponding pockets. Without loss of generality, we can assume that the
  first matchbox that runs out of matches is the one represented by `0`s. Since
  you'd need to try picking $N+1$ matches to find out that they've run out, we
  can put $N+1$ `0`s instead of $N$ into the sequence (the $(N+1)$-th `0` being 
  the act of discovering that the matchbox is empty). 
  
  Now we can ask the question in such a way: what's the probability that the 
  number of `1`s that follow the $(N+1)$-th `0` is $k$? Or if you reverse the 
  sequence: What's the probability that a sequence consisting of $N$ `1`s and 
  $(N+1)$ `0`s starts with $k$ ones? The solution is very clear and can be written
  in the following way
  $ p_k &= product_(i=0)^k (N + 1 - i)/(2 N + 1 - i) \
    &= binom(2 N - k, N) / binom(2 N + 1, N)
    = ((2 N - k)!(N + 1)!) / ((2 N + 1)!(N - k)!) $
][done]

#problem[
  Independent trials consisting of rolling a pair of fair dice are performed. 
  What is the probability that an outcome of 4 appears before an outcome of 7 
  when the outcome of a roll is the sum of the dice?
]
#solution[
  The probability that `7` doesn't get rlooed in $k$ rolls is equal to 
  $(1 - 6/36)^k = (5/6)^k$ and the probability that the first `7` gets rolled 
  on the $(k+1)$-th roll is $ (5/6)^k dot 6/36 = (5^k)/(6^(k+1)). $ Now the
  probability that a `4` gets rolled in the first $k$ rolls with no `7` being 
  rolled and teh $(k+1)$-th being a `7` is 
  $ (1 - (1 - 3/(36-6))^k)dot (5^k)/(6^(k+1)) 
    &= (5^k)/(6^(k+1)) - (5^k)/(6^(k+1)) * (9^k)/(10^k) \
    &= 1/6 dot ((5^k)/(6^k) - (3^k)/(4^k)) $
  Now since these events are independent, the probability of their union would be
  equal to the sum of their probabilities
  $ sum_(i=0)^oo 1/6 dot ((5^k)/(6^k) - (3^k)/(4^k))
    &= 1/6 dot lim_(h->oo) sum_(i=0)^h ((5^k)/(6^k) - (3^k)/(4^k)) \
    &= 1/6 dot lim_(h->oo) (((5/6)^(h + 1) - 1)/(5/6 - 1) - 
      ((3/4)^(h + 1) - 1)/(3/4 - 1)) \
    &= 1/6 dot lim_(h->oo) (6 - (5^(h + 1))/(6^h) - 4 + (3^(h+1))/(4^h)) \
    &= 1 - 2/3 \
    &= 1/3 $
][done]

#pagebreak()

#problem[
  A coin that, when flipped, comes up with heads with probability $p$ is flipped
  until either heads or tails has occured twice. Find the expected number of 
  flips.
]
#solution[
  By pigeon hole principle, for $n > 2$ throws, one side of the coin will come up 
  at least twice. This means that the maximum number of throws needed is the
  smallest $n > 2$ which is $3$. It's also clear that only one throw is not gonna
  be enough, so we can look at the 4 cases that can happen:
  
  - `heads`, `heads` --- with probability $p^2$.
  - `heads`, `tails` --- with probability $p(1-p)$.
  - `tails`, `heads` --- with probability $p(1-p)$.
  - `tails`, `tails` --- with probability $(1-p)^2$.

  Out of these, only two are desired with probabilities $p^2$ and $(1-p)^2$ 
  and they are independent so their combined probability would be $p^2+(1-p)^2$.
  Now we can calculate the expected value:
  $ 2 dot underbrace((p^2+(1-p)^2), "only two needed") + 3 dot 
    underbrace((1 - p^2-(1-p)^2), "three needed")
    &= -2 p^2 + 2 p + 2 $
][done]
