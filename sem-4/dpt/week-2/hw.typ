#import "@local/hw:0.1.0": *

#let theme = color_theme(dark)

#show: homework(
  theme,
  title: "Homwework 1",
  subject: "Discrete Probability Theory"
)

#align(center, smallcaps(text(20pt)[Variant 1]))

+ 
  + Assuming that there are $26$ letters and $10$ digits, the number
    of possible license plates is 
    $ 26^5 dot 10^2 = 1188137600.  #text(theme.faded)[(not my id number)] $ 

  + We need to count the number of permutations insde the groups and then multiply
    that by the total permutations of all groups
    $ underbrace(2! dot 3! dot 4! dot 1!, "inside the groups") dot 4! = 6912. $
+
  + We should multiply the number of possible choices of $3$ women out of $5$ and 
    $5$ men out of $8$
    $ binom(5, 3) dot binom(8, 5) = 10 dot 56 = 560. $

  + We can consider placing the functional antenas and then looking at the inbetweens
    as availbale spots for defective ones. That would give us $6+1$ spots for $4$ 
    antenas which is
    $ binom(6+1, 4) = 35. $
+
  + There are $7! = #calc.fact(7)$ permutations of $7$ gifts but since the order
    for each child doesn't matter, we must divide that by number of permutations
    inside each group
    $ (7!)/(3! dot 2! dot 2!) = 210. $

  + We can consider all possible partitions of $7$ answered questions
    $ sum_(i=3)^5 binom(5, i) binom(5, 7-i)  = 
    110. $ 

+
  + Since there is no restriction on prefixed $0$s, I will consider 
    $000...000$ to be a $n$-digit number. The first digit doesn't matter
    so it has $10$ possible values. However, all consecutive digits have only $9$ 
    possible since they can not be equal to the previous digit
    $ 10 dot underbrace(9 dot 9 dot dots dot 9, n-1) = 10 dot 9^(n-1). $
    If we were to be restricted to numbers starting with a non-zero digit, we would
    have only $9$ possibilities for the first digit as well as the consecutive ones
    and we would get
    $ underbrace(9 dot 9 dot dots dot 9, n) = 9^n. $

  + If we have to pick one student from each group, the answer would be $n^3$ but if
    we can pick any $3$ students, the answer would very straightforwardly be 
    $binom(3n, 3).$
