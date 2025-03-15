#import "@tcum/hw:0.1.0": *

#show: hw

#set document(title: "SE-asssignment-3", author: "Dimitri Tabatadze")

#[
  #set align(center + horizon)

  = Introduction to Software Engineering
  == Assignment 5

  Dimitri Tabatadze, #datetime.today().display()
  #pagebreak()
]

// #set page(height: auto)
#set enum(numbering: "a)")

#problem[
  Given the following state chart

  #figure(
    image("0.png", width: 90%)
  )

  1. List the states visited for inputs `x, y, x, y, y, z, b, x, y, c, y, x`.
  2. List the states visited for inputs `x, x, x, x, x, z, x, y, x, x`.
  3. transform the automaton into an equivalent, parallel one without history attribute.
]

#solution[
  #show raw: (d) => box(fill: white.darken(10%), outset: (y: 3pt, x: 2pt), radius: 2pt, d)
  1. `A` $->$ `B` $->$ `(D G)` $->$ `(E H)` $->$ `(D H)` $->$ `(F H)` $->$ `C` $->$ `A` $->$ `C` $->$ `C` $->$ `I` $->$ `I` $->$ `C`.
  2. `A` $->$ `B` $->$ `C` $->$ `(D G)` $->$ `(E H)` $->$ `(F G)` $->$ `C` $->$ `(D G)` $->$ `(F G)` $->$ `(E H)` $->$ `(F G)`
  3. #figure(
    image("1.svg")
  )
]


#problem[
  For the following classes and interfaces, indicate briefly which 
  secret is being hidden (or will be hidden in case of an 
  interface), and how.
  + ```java java.io.Closeable```
  + ```java java.lang.Comparable<T>```
  + ```java java.util.List```
  + ```java java.util.Locale```
]
#solution[
  1. Behind the interface ```java java.io.Closeable``` is hidden the type of 
    object that the user of ```java java.io.Closeable``` may be 
    working with. For example, both ```java java.util.Scanner``` 
    and ```java java.io.BufferedReader``` implement ```java java.io.Closeable```.
  2. Behind the interface ```java java.lang.Comparable<T>``` we can
    hide the implementation of comparison. For example, we can 
    implement comparison of two strings in two ways:
    - comparing the lexicographical order,
    - comparing the length.
  3. The ```java java.util.List``` interface hides the datastructure
    behind the list. One can implement ```java java.util.List``` with
    a linked list and one can implement it with a dynamic array.
  4. ```java java.util.Locale```, as far as any user is concerned, can
    be using a single integer to store the whole data or can use a 
    string to achieve the same thing.
]

#problem[
  Your colleagues at Pear Corp have run into a strange
  situation. Since you are coming from KIU and are reputed of solving the toughest
  problems, they have come to you during coffee break. They have already printed out the
  relevant code fragments

  #show: codly-init.with()
  #show raw.where(block: true): set text(6pt)

  - class `AppPrototype`:
  #codly-range(start: 1, end: 4)
  #raw(read("d.java"), block: true, lang: "java")

  - class `IEmployeeManagement`:
  #codly-range(start: 5, end: 13)
  #raw(read("d.java"), block: true, lang: "java")

  - class `EmployeeMa nagementPrototyle`:
  #codly-range(start: 14, end: 19)
  #raw(read("d.java"), block: true, lang: "java")

  The above code violates Liskov's substitution 
  principle. Describe where and why the violation 
  occurs. Note: it is not enough to look at parameter 
  types.
]
#solution[
  Appending to an immutable (created by `List.of`) list is not 
  allowed.
]