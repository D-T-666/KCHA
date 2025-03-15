#import "@tcum/hw:0.1.0": *

#show: hw

#set document(title: "SE-asssignment-3", author: "Dimitri Tabatadze")

#[
  #set align(center + horizon)

  = Introduction to Software Engineering
  == Assignment 4

  Dimitri Tabatadze, #datetime.today().display()
  #pagebreak()
]

#set page(height: auto)

#problem()

#solution[
  #set enum(numbering: "a)1.")
  1. Cnotravariance
  2. 
    + #figure(
        image("1.jpg")
      )
    + Both, `x` and `y`, Clearly.
    + ```java o = new U;```
    + Still both, `x` and `y`, since ```java U::m``` just overloads 
      ```java O::m``` since the signatures are diferent.
    + Yes. Nothing breaks.
]

#problem()

#solution[
  This was the worst task I've encountered in the period of time I can 
  remember.

  This is how the start would look like. It's only missing the static 
  variable declarations at the top, which is super trivial and I couldn't be bothered to add it to still incomplete solution. 
  #figure(
    image("2.png")
  )
  After this, I don't know how to and am not presented a way to know 
  how to continue. I'm quite sure that I am not missing anything from 
  the lecture material.
]

#problem()

#solution[
  #figure(
    image("3.jpg")
  )
]