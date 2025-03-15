#import "lib.typ": *

#set page(width: 18cm, height: 20cm, margin: 2cm)

#[
  #set align(center + horizon)

  = Introduction to Software Engineering
  == Assignment 2

  Dimitri Tabatadze, #datetime.today().display()
  #pagebreak()
]

#set page(height: auto)

// ^^^^^^^^^^

= Problem 1

#figure(
  block(width: 340pt, height: 320pt, inset: 20pt)[
    #place(
      class(
        name: [ArrayStack],
        attributes: ([-capacity: Integer], [-data: T\[\]], [-size: Integer]),
        methods: ([push(element: T)], [pop(): T], [top(): T], [isEmpty(): boolean]),
      ),
    )

    #place(
      class(
        name: [<\<interface>>\ Stack], 
        methods: ([push(element: T)], [pop(): T], [top(): T], [isEmpty(): boolean])
      ),
      dy: 120pt
    )

    #place(
      class(
        name: [ListStack],
        attributes: ([-head: Node],),
        methods: ([push(element: T)], [pop(): T], [top(): T], [isEmpty(): boolean]),
      ),
      // dx: 260pt,
      dy: 225pt
    )

    #place(
      signal(
        name: [StackEmptyException],
      ),
      dx: 200pt,
      dy: 160pt
    )


    #place(
      class(
        name: [T],
      ),
      dx: 180pt,
    )

    #place(
      class(
        name: [Node],
        attributes: ([value: T], [next: Node])
      ),
      dx: 220pt,
      dy: 40pt
    )

    #label(position: (110pt, 160pt))[<\<send>>]
    #arrow(
      from: (50pt, 167pt),
      to: (200pt, 167pt), dashed: true, head: "open"
    )
    #label(position: (110pt, 180pt))[<\<send>>]
    #arrow(
      from: (50pt, 177pt),
      to: (200pt, 177pt), dashed: true, head: "open"
    )

    #label(position: (110pt, 276pt))[<\<send>>]
    #arrow(
      from: (50pt, 267pt),
      to: (245pt, 182pt), dashed: true, head: "open", through: (196pt, 246pt)
    )
    #label(position: (110pt, 253pt))[<\<send>>]
    #arrow(
      from: (50pt, 277pt),
      to: (255pt, 182pt), dashed: true, head: "open", through: (204pt, 253pt)
    )

    #label(position: (110pt, 84pt))[<\<send>>]
    #arrow(
      from: (50pt, 72pt),
      to: (245pt, 160pt), dashed: true, head: "open", through: (196pt, 94pt)
    )
    #label(position: (110pt, 56pt))[<\<send>>]
    #arrow(
      from: (50pt, 62pt),
      to: (255pt, 160pt), dashed: true, head: "open", through: (203pt, 86pt)
    )
    #place(arrow(from: (50pt, 90pt), to: (50pt, 120pt), dashed: true))
    #place(arrow(from: (50pt, 225pt), to: (50pt, 195pt), dashed: true))
  ]
)

#pagebreak()

= Problem 2 \

#figure(
  image("drawing.svg")
)
