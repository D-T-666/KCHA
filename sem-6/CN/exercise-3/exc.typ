#import "@tcum/hw:0.2.0": *
#import "@tcum/i2cn:0.1.0": *

#show: hw.with(
  author: [Dimitri Tabatadze],
  date: datetime.today().display(),
  title: [I2CN exercise sheet 3]
)

#problem[Leader election in rings][
  Assume anonymous processes, indirect addressing,
  randomization and konwn ring size $N$. Give pseudo
  code of a probabilistic algorithm for leader election.
  #hint[
    you have to deal with duplicates in the random
    choices, possibly repeatedly.
  ]
]

#solution[
  ```py
  leader_elected = False
  am_leader = False
  participating = True
  am_unique = True

  while not leader_elected:
    if participating:
      ov = 0 if not participating else 1 + rand()
      v = ov
      for _ in range(N):
        send(v)

        r = recv()
        if r == "LEADER_ELECTED":
          v = "LEADER_ELECTED"
          leader_elected = True
        elif r > v:
          v = r
          participating = False
        elif r == v:
          am_unique = False
      am_leader = v == ov and am_unique
      if am_leader:
        send("LEADER_ELECTED")
        leader_elected = True
  ```
]

#problem[Reconsider exercise 1][
  When the algorithm in exercise 1 termiates it always
  has solved leader election. Show that this cannot work
  with unknown ring size for any algorithm.
  #hint[
    I explained the solution in the classroom.
  ]
]

#solution[
  Assume the ring has size $N$ and the processes, without knowing
  the size, elected a leader $p_l$. If we were to have made the
  ring twice as large with the new processes being identical copies
  of the original processes as follows:
  $ p_i = p_(i + N) forall i in [0:N-1] $
  the processes would not know the difference between $p_l$ and
  $p_(l+N)$ and they would elect two leaders.
]

#let bd(x) = $bracket.l.double #x bracket.r.double$

#problem[One's complement numbers][
  Let $a, b in BB^n$ and $s in BB^(n+1)$ and
  $bd(a) + bd(b) = bd(s)$. Prove or disprove
  1. sign extension: $bd(a_(n-1)a) = bd(a)$
  2. detecting overflow: $bd(s) in.not O C_n <-> s_n != s_(n-1)$
  #hint[
    look at the proof of similar statements for two's
    complement numbers.
  ]
]

#solution[
  1.
    - $bold(not a_(n-1))$: $bd(a) >= 0 -> bd(a) = bd(0 a)$
    - $bold(a_(n-1))$: $bd(a) <= 0 -> bd(a) = -bd(macron(a)) = -bd(0 macron(a)) = bd(1 a)$
  2. First, by definition.
    $ bd(s) in.not O C_n 
      &-> bd(s) in [-2^n + 1 : 2^n - 1] without [-2^(n-1) + 1 : 2^(n-1) - 1] \
      &-> bd(s) in [-2^n + 1 : -2^(n-1)] or bd(s) in [2^(n-1) : 2^n - 1] $
    Now consider the cases:
    - $bold(bd(s) in [2^(n-1) : 2^n - 1])$:
      $ -> s_(n-1) and not s_n $
    - $bold(bd(s) in [-2^n + 1 : -2^(n-1)])$:
      $ -> s_n and not s_(n-1) $
    so $bd(s) in.not O C_n -> s_n != s_(n-1)$. Now consider $s_n != s_(n-1)$.
    - $bold(not s_n and s_(n-1))$:
      $ not s_n -> bd(s) >= 0, wide s_(n-1) -> bd(s) >= 2^(n-1) -> bd(s) in.not O C_n $
    - $bold(s_n and not s_(n-1))$:
      $ s_n -> bd(s) <= 0, wide not s_(n-1) -> bd(s) <= -2^(n-1) -> bd(s) in.not O C_n $
]

#problem[Correctness of Polynomial Division][
  show the following properties of the division
  algorithm for polynomials
  $
    f_(i+1) &= f - q_i g forall i \
    a_(i, n-1) &!= 0 -> "deg"(f_(i+1)) < "deg"(f_i)
  $
  What are the outputs (quotient and reminder) of the
  division algorithm?
]

#solution[
  - $ f_(i+1) = f_i - t_i g = (f_(i-1) - t_(i-1) g) - t_i g = dots.c = f - (t_0 + dots.c + t_i) g = f - q_i g $.
  - #text(size: 8pt)[$ &a_(i,n-i) != 0 and b_m != 0 -> c_i != 0 \ -> f_(i+1)
      &= f_i - g t_i \
      &= sum_(j=0)^(n-i) a_(i,j) x^j - sum_(j=0)^m b_j x^j x^(n-m-i) (a_(i,n-i) / b_m) \
      &= cancel(a_(i,n-i) x^(n-i)) + sum_(j=0)^(n-i-1) a_(i,j) x^j - cancel(b_m x^(n-i) (a_(i,n-i) / b_m)) - sum_(j=0)^(m-1) b_j x^j x^(n-m-i) (a_(i,n-i) / b_m) \
      &= sum_(j=0)^(n-i-1) a_(i,j) x^j - sum_(j=0)^(m-1) b_j x^j x^(n-m-i) (a_(i,n-i) / b_m) $]
    and therefore the degree of $f_i$ is greater than $f_(i+1)$ given that $a_(i,n-i) != 0$.
]

#problem[CRC Computation][
  Consider message $u = 1010001101$ and generator
  polynomial $x^5 + x^4 + x^2 + 1$ as the divisor.
  1. What polynomial division is performed?
  2. Compute the result.
  3. What message is sent in binary?
]

#solution[
  1. $x^5 dot (x^9 + x^7 + x^3 + x^2 + 1)$ should be divided by the generator $x^5 + x^4 + x^2 + 1$
  2. #figure(image("5.jpg", width: 100%), caption: [the division])
  3. What should be sent is $101000110101110$.
]
