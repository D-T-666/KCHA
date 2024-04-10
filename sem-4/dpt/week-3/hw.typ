#import "@local/hw:0.1.0": *

#show: homework(
  theme,
  subject: "Discrete Probability Theory",
  title: "Homwework",
  week: 3
)

#let (problem, ..) = themed-items(theme)

#problem[
  We can think of this problem as picking one ball from
  urn $B$ and then measuring the probability of a random
  ball picked form urn $A$ matching the one from $B$. That
  for any ball picked from $B$ there is a $1/2$ probability
  that a ball from $A$ matches.
]

#problem[
  We can count all the possible combinations of a committee 
  consisting of one student from each class
  and then divide that by the total number of combinations
  $ (overbrace(3, "freshmen") dot 
    overbrace(4, "sophomores") dot
    overbrace(4, "juniors") dot
    overbrace(3, "seniors"))/binom(14, 4) = 144/1001 $
]

#problem[
  It's been proven in class that
  
  1. $P(M) = 1 - P(M^c)$.

  3. $(sect.big_(i=1)^oo A_i)^c = union.big_(i=1)^oo A_i^c$.

  4. $P(union.big_(i=1)^oo A_i) = sum_(i=1)^oo P(A_i)$ for mutually independent sequence ${A_i}$.

  Now we just write

  $ P(sect.big_(i=1)^oo A_i) 
    &= P((union.big_(i=1)^oo A_i^c)^c) & quad (3) \
    &= 1 - P(union.big_(i=1)^oo A_i^c) & quad (1) \
    &= 1 - sum_(i=1)^oo P(A_i^c) & quad (4) \
    &= 1 - sum_(i=1)^oo (1 - P(A_i)) & quad (1) \
    &= 1 - sum_(i=1)^oo (1 - 1) 
    = 1  $
]

#problem[
  Since the probability of picking a blue ball out of 
  $#text(theme.r)[$4$]+#text(theme.b)[$8$]+#text(theme.g)[$5$]$ balls is
  $#text(theme.b)[$8$]/(#text(theme.r)[$4$]+#text(theme.b)[$8$]+#text(theme.g)[$5$])$.
  Then picking another blue ball would have the probability 
  $(#text(theme.b)[$8$] - 1)/(#text(theme.r)[$4$]+#text(theme.b)[$8$]+#text(theme.g)[$5$] - 1)$ and so on. Thereby the probability of the first 5 balls picked would be blue is
  $ product_(i=0)^(4) (#text(theme.b)[$8$] - i)/(#text(theme.r)[$4$]+#text(theme.b)[$8$]+#text(theme.g)[$5$] - i) = 8/17 * 7/16 * 6/15 * 5/14 * 4/13 = 2/221 $ 

]