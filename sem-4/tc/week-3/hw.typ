#import "@local/hw:0.1.0": *
#import "@preview/tablex:0.0.8": *

#show: homework(
  theme,
  subject: smallcaps[Theory of Computation],
  title: smallcaps[Week two],
  week: 3
)

#let (problem, hr, ..) = themed-items(theme)
#let cx = cellx(fill: theme.tcum, "")


#problem[
  #set enum(numbering: colored-numbering("I."), full: false)
  + Since ${E, F, G, H}$ are not reachable, we can remove them

  +
    #set text(size: 6pt)
    #stack(
      dir: ltr, spacing: 3em,
      [
      #tablex(
          columns: 4,
          align: center,
          auto-vlines: false,
          auto-hlines: false,
          hlinex(end: 2), vlinex(end: 3),
          [B], [ ],                          vlinex(), [], [], hlinex(end: 3),
          [C], [ ], [ ],                     vlinex(start: 1), [], hlinex(end: 4),
          [D],  cx,  cx,  cx,                vlinex(start: 2), hlinex(end: 5), [], vlinex(),
               [A], [B], [C], hlinex(start: 1),
        )
    ], box(height: 8em, stack(1fr, text(fill: theme.tcum, size: 3em, $->$), 1fr)), [
      #tablex(
          columns: 4,
          align: center,
          auto-vlines: false,
          auto-hlines: false,
          hlinex(end: 2), vlinex(end: 3),
          [B], [ ],                          vlinex(), [], [], hlinex(end: 3),
          [C],  cx,  cx,                     vlinex(start: 1), [], hlinex(end: 4),
          [D],  cx,  cx,  cx,                vlinex(start: 2), hlinex(end: 5), [], vlinex(),
               [A], [B], [C], hlinex(start: 1),
        )
    ], box(height: 8em, stack(1fr, text(fill: theme.tcum, size: 3em, $->$), 1fr)), [
      #tablex(
          columns: 4,
          align: center,
          auto-vlines: false,
          auto-hlines: false,
          hlinex(end: 2), vlinex(end: 3),
          [B],  cx,                          vlinex(), [], [], hlinex(end: 3),
          [C],  cx,  cx,                     vlinex(start: 1), [], hlinex(end: 4),
          [D],  cx,  cx,  cx,                vlinex(start: 2), hlinex(end: 5), [], vlinex(),
               [A], [B], [C], hlinex(start: 1),
        )
    ])

  + 
    #rect(
      align(center + horizon, dfa(theme: theme, "
        D [shape=doublecircle, color=\""+theme.tcum.to-hex()+"\"]
        start -> A [color=\""+theme.fg.to-hex()+"\"]
        edge [label = \"0\"]
        A -> B -> A
        C -> D -> D
        edge [label = \"1\"]
        B -> C -> D -> A -> A
      "
    )))
]

#problem[
  #proof[
    - $B ->^*_G w$ #text(fill: theme.tcum, $==>$) there exists a derivation tree with root $B$ and border word $w$. #box(width: 1fr) #hr

      To go from a derivation to a derivation tree, we to find a construction:

      Let $B => w_1 => w_2 => ... => w_n => w$ be intermediate yieldings of productions to $B$
      that result in $w$.
      1. Start with the initial symbol $B$ as the root.
      2. For every intermediate yielding, attach new nodes (right hand side of the production)
        as children to the respective node.
      3. Repeat step 2 until you reach the desired border word.

      // B->\*w-დან ხის არსებობის გამომდინარეობის ჩვენება კონსტრუქციით შეიძლება წესით და პირიქით
      // ალბათ იმ კონსტრუქციის უკან გაყოლით. ასე დავწერე და შეიძლება სწორი იყოს
      #v(1em)

    - $B =>^*_G w$ #text(fill: theme.tcum, $<==$) there exists a derivation tree with root $B$ and border word $w$. #hr

      In a derivation tree, the immediate children of every inner node is specified by a
      production, therefore given a root node $B$, there exist a sequence of direct 
      derivations that result in the given borderword, i.e. $B =>^*_G w$.

  ]
]

#problem[#text(size: 30pt)[#emoji.face.wink #emoji.thumb]]

#problem[
  #proof[
    We use pumping lemma and show that there is no combination $u v x y z$ such that you can pump on $v$ and $y$ at the same time ($u v^i x y^i z in L(G) forall i>=0$). For that we can consider all combinations:

    - Consider that the number of $v$ consists only of `a`s or `b`s and similarly $y$ 
      consists only of `b`s or `c`s (but $v$ and $y$ dont consist of `b`s at the same 
      time). In this case, pumpint on $v$ and $y$ increases the amount of corresponding 
      symbols while the amoun of the excluded one stays the same --- the decomposition 
      is not valid.

    - $v$ consists of $k$ `a`s and $k$ `b`s and $y$ consists of $k$ `c`s. Pumping will 
      not result in imbalanced amounts, but it will cause the order of `a`s and `b`s
      to change (eg. `aaabbbccc` $->$ `aaababbbcccc`) --- the decomposition is not valid.

    - The case where either $v$ or $y$ contains all three symbols at the same tims 
      violates the pumping length restriction. No matter what we pick $p$ (pumping length)
      to be, a string that looks like $#`a`^p #`b`^p #`c`^p$ will 
      violate the length restriction.

    These are all sensible decompositions, for others it's very clear that they fail.
  ]
]
