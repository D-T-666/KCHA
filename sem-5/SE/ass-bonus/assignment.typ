#import "@tcum/hw:0.1.1": *

#show: hw

#set document(title: "SE-asssignment-10", author: "Dimitri Tabatadze")

#[
  #set align(center + horizon)

  = Introduction to Software Engineering
  == #text(fill: gradient.linear(..color.map.rainbow))[Bonus Assignment]

  Dimitri Tabatadze, #datetime.today().display()
  #pagebreak()
]

#show raw.where(block: true): set text(size: 7pt)
#show math.equation.where(block: true): set text(size: 10pt)
#set page(height: 28cm)
#show: codly-init.with()

#problem(1)[][]

#solution[
  1. #raw(read("1-1.java"), lang: "java", block: true)
  2. #raw(read("1-2.java"), lang: "java", block: true)
]

#problem(2)[][]

#solution[

]

#problem(3)[][]

#solution[
  1. `git clone git@ipd.edu:swt1/mosaiqueTiles.git`
  2. `cd mosaiqueTiles`
  3. `git branch filterPictures`
  4. `git rm 001.png`
  5. `git commit -m "Reduce number of images"`
  6. `git checkout filterPictures ; git merge main`
  7. `git checkout main ; git push origin main`

  #import "@preview/fletcher:0.5.3" as fletcher: diagram, node, edge
  #import fletcher.shapes: circle, rect
  #let colors = (maroon, olive, eastern)

  #figure(diagram(
  	edge-stroke: 1pt,
  	node-corner-radius: 5pt,
  	edge-corner-radius: 8pt,
  	mark-scale: 80%,
    spacing: 10pt,

  	node((0, 0), [A], shape: circle, stroke: black),
  	edge("-"),
  	node((2, 0), [B], shape: circle, stroke: black),
  	edge("-"),
  	node((4, 0), [C], shape: circle, stroke: black),
  	edge("-"),
  	node((6, 0), [D], shape: circle, stroke: black),
  	edge((2, 0), "rur", "-"),
  	node((4, -1), [E], shape: circle, stroke: black),
  	edge("-"),
  	node((6, -1), [F], shape: circle, stroke: black),
  	edge("-"),
  	node((8, -1), [G], shape: circle, stroke: black),
  	edge("-"),
  	node((10, 0), [H], shape: circle, stroke: black),
  	edge((6, 0), "-"),
  	node((8, -2), [Feature]),
  	edge("->", (8, -1)),
  	node((10, -1), [Main/HEAD]),
  	edge("->", (10, 0)),
  ))
]

#problem(4)[][

]

#solution[
  1. `git pull`
  2. `git fetch`
  3. `git status`
  4. `git clone`
  5. `git init`
  6. `git add`
  7. `git commit`
  8. `git merge`
  9. `git --help`
  10. `git push`
]
