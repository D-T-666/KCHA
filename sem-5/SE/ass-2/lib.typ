#let tt(t) = text(font: "Monaspace Neon Var", weight: "medium", size: 7pt, t)

#let label(s, position: (0pt, 0pt)) = place(
  tt(s),
  dx: position.at(0),
  dy: position.at(1),
)

#let signal(name: []) = {
  show line: set block(above: 0pt, below: 0pt)
  set text(font: "Monaspace Neon Var", weight: "medium", size: 7pt)
  box(
    stroke: black,
    width: 100pt,
    align(center, block(inset: 4pt, text(weight: "bold", [<\<signal>> \ #name]))),
  )
}

#let class(name: [], attributes: (), methods: ()) = {
  show line: set block(above: 0pt, below: 0pt)
  set text(font: "Monaspace Neon Var", weight: "medium", size: 7pt)
  box(
    stroke: black,
    width: 100pt,
    {
      align(center, block(inset: 4pt, text(weight: "bold", name)))
      line(length: 100%)
      block(
        inset: 4pt,
        for attribute in attributes [
          #attribute \
        ],
      )
      line(length: 100%)
      block(
        inset: 4pt,
        for method in methods [
          #method \
        ],
      )
    },
  )
}

#let arrow(from: (0pt, 0pt), to: (10pt, 0pt), dashed: false, through: none, head: "normal") = (
  context {

    let x = to.at(0).to-absolute().pt() - from.at(0).to-absolute().pt()
    let y = to.at(1).to-absolute().pt() - from.at(1).to-absolute().pt()
    let d = calc.sqrt(x * x + y * y)
    x = x / d * 1pt
    y = y / d * 1pt

    if through == none {
      place(
        line(
          start: from,
          end: to,
          stroke: (
            dash: if dashed {
              "dashed"
            },
          ),
        ),
      )
    } else {
      place(
        path(
          stroke: (
            dash: if dashed {
              "dashed"
            },
          ),
          from,
          (
            (through.at(0), through.at(1)),
            (-x * d / 4, -y * d / 4),
          ),
          to,
        ),
      )
      x = (through.at(0) + x * d / 4 - to.at(0)).to-absolute().pt()
      y = (through.at(1) + y * d / 4 - to.at(1)).to-absolute().pt()
      d = calc.sqrt(x * x + y * y)
      x = -x / d * 1pt
      y = -y / d * 1pt
      
      // let t = x
      // x = -y
      // y = t
    }
    if head == "normal" {
      place(
        path(
          stroke: black,
          fill: white,
          closed: true,
          to,
          (to.at(0) - x * 6 - y * 3, to.at(1) - y * 6 + x * 3),
          (to.at(0) - x * 6 + y * 3, to.at(1) - y * 6 - x * 3),
        ),
      )
    } else if head == "open" {
      place(
        path(
          stroke: black,
          closed: false,
          (to.at(0) - x * 6 - y * 3, to.at(1) - y * 6 + x * 3),
          to,
          (to.at(0) - x * 6 + y * 3, to.at(1) - y * 6 - x * 3),
        ),
      )
    }
  }
)

// #let class(name: [], position: (0, 0), attributes: (), methods: ()) = {
//   let title = content(position, name)
//   let size = measure(block(inset: 1em)[#title])

//   content(position, name)
//   rect(
//     (-size.width.to-absolute().cm() / 2 + position.at(0), -size.height.to-absolute().cm() / 2 + position.at(1)),
//     (rel: (size.width.to-absolute().cm(), size.height.to-absolute().cm()))
//   )
// }