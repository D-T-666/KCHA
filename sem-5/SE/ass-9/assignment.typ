#import "@tcum/hw:0.1.1": *

#show: hw

#set document(title: "SE-asssignment-9", author: "Dimitri Tabatadze")

#[
  #set align(center + horizon)

  = Introduction to Software Engineering
  == Assignment 9

  Dimitri Tabatadze, #datetime.today().display()
  #pagebreak()
]

#show raw.where(block: true): set text(size: 7pt)
#show math.equation.where(block: true): set text(size: 10pt)
#set page(height: 28cm)
#set enum(numbering: "a)")
#show: codly-init.with()

#problem(1)[Functional Test][
  Consider the following interface
  ```java
  public interface Account {
    private BigDecimal balance;
    //...

    /**
     * Withdraws the amount specified, provided balance+creditLine >= amount
     *
     * @param amount
     * The amount to be withdrawn (>= 0)
     * @param creditLine
     * The credit line of the account (how much one can borrow) (>= 0)
     * @return true if withdrawal is possible, false otherwise
     */
    public boolean withdraw(BigDecimal amount, BigDecimal creditLine);
    //...
  }
  ```

  1. Determine the equivalence classes of method ```java withdraw()``` and 
    provide representatives. Describe each equivalence class in a short 
    sentence.
  2. Determine the boundaries of your equivalence classes. Which additional 
    values should be tested when taking the boundaries into account?
]

#solution[
  + We must use the assertions
    - `amount >= 0`,
    - `creditLine >= 0`.
    This gives the equivalence classes:

    #table(columns: (auto, 1fr, auto))[
      Equiv Class ][ Description ][ Possible values
    ][
      $"EC"_(mono("amount"), I)$ ][ Invalid `amount` ][ $mono("amount") < 0$
    ][
      $"EC"_(mono("amount"), V)$ ][ Valid `amount` ][ $mono("amount") >= 0$
    ][
      $"EC"_(mono("creditLine"), I)$ ][ Invalid `creditLine` ][ $mono("creditLine") < 0$
    ][
      $"EC"_(mono("creditLine"), V)$ ][ Valid `creditLine` ][ $mono("creditLine") >= 0$
    ]

  + The boundaries are clear:
    - $"EC"_(mono("amount"), I)$ --- only relevant boundary is exclusive 
      $0$, should test for $-1 in "EC"_(mono("amount"), I)$ and 
      $0 in.not "EC"_(mono("amount"), I)$.
    - $"EC"_(mono("amount"), V)$ --- only relevant boundary is inclusive 
      $0$, should test for $-1 in.not "EC"_(mono("amount"), V)$ and 
      $0 in "EC"_(mono("amount"), V)$.
    - $"EC"_(mono("creditLine"), I)$ --- only relevant boundary is exclusive 
      $0$, should test for $-1 in "EC"_(mono("creditLine"), I)$ and 
      $0 in.not "EC"_(mono("creditLine"), I)$.
    - $"EC"_(mono("creditLine"), V)$ --- only relevant boundary is inclusive 
      $0$, should test for $-1 in.not "EC"_(mono("creditLine"), V)$ and 
      $0 in "EC"_(mono("creditLine"), V)$.
    #note[
      Bless the guy who invented copy-pasting.
    ]
]


#problem(2)[Control flow-oriented test][
  Consider the method `isIdentity()`.
  #raw(read("2.java"), lang: "java", block: true)

  1. Translate the code of `isIdentity(double[][] mtx)` into the intermediate
    language presented in class.
  2. Draw the control flow graph for `isIdentity(double[][] mtx)`. Enter the 
    source code statements into the boxes and number the boxes. (Only 
    entering the line numbers is not sufficient.)
  3. Provide a minimal test case set and the paths traversed by them, such 
    that statement coverage is achieved. Do the same for branch coverage. If it is 
    not possible to achieve full coverage, explain why.
    #hint[
      "Minimal" means the test case set must contain enough test cases to 
      achieve coverage, and not more.
    ]
  4. Which test cases do you need for boundary-interior test? Explain how you
    would handle the nested loops in this case.
  5. Explain why path coverage for `isIdentity(double[][] mtx)` is not
    practicable.
]


#solution[
  1. The translated code:
    #raw(read("2-intermediate.java"), lang: "java", block: true)
  2.
    #import "@preview/fletcher:0.5.3" as fletcher: diagram, node, edge

    #import fletcher.shapes: diamond
    #set raw(lang: "java")
    #codly-disable()
    // #show raw.where(block: false): set text(size: 7pt)
    #set text(size: 7pt)

    #figure(diagram(
      node-stroke: 1pt,
      edge-stroke: 1pt,
      cell-size: 1em,
      node((0,0), [Start], stroke: 3pt, corner-radius:4pt),
      edge("-|>"),
      node((0,1), [`if (mtx == null)` ~ $n_1$], corner-radius: 4pt),
      edge("-|>", [no]),
      edge("r,d", "-|>", [yes]),
      node((0,2), [`if (mtx.length != mtx[0].length)` ~ $n_2$], corner-radius: 4pt),
      edge("-|>", [no]),
      edge("r", "-|>", [yes]),
      node((0,3), stack(
        dir: ltr,
        box[```java
        int n = mtx.length;
        int r = 0;
        ```],
        [~ $n_3$]
      ), corner-radius: 4pt),
      edge("-|>"),
      node((0,4), [`if (r < n)` ~ $n_4$], corner-radius: 4pt),
      edge("-|>", [yes]),
      edge("r", "-|>", [no]),
      node((0,5), [`int c = 0;` ~ $n_5$], corner-radius: 4pt),
      edge("-|>"),
      node((0,6), [`if  (c < n)` ~ $n_6$], corner-radius: 4pt),
      edge("-|>", [yes]),
      edge("l", "-|>", [no]),
      node((0,7), [`if (r == c)` ~ $n_7$], corner-radius: 4pt),
      edge("-|>", [yes]),
      node((0,8), [`if (Math.abs(mtx[r][c] - 1) >= 1E-8)` ~ $n_8$], corner-radius: 4pt),
      edge("-|>", [no]),
      edge("r", "-|>", [yes]),
      edge((0,7), "l,d,d,r", "-|>", [no]),
      node((0,9), [`if not (r == c) and(Math.abs(mtx[r][c]) >= 1E-8)` ~ $n_9$], corner-radius: 4pt),
      edge("-|>", [no]),
      edge("r", "-|>", [yes]),
      node((0,10), [`c++;` ~ $n_10$], corner-radius: 4pt),
      edge("r,r,u,u,u,u,l,l", "-|>"),

      node((1,2), [`return false` ~ $n_11$], extrude: (-3, 0), corner-radius: 4pt),
      node((1,4), [`return true` ~ $n_12$], extrude: (-3, 0), corner-radius: 4pt),
      node((1,8), [`return false` ~ $n_13$], extrude: (-3, 0), corner-radius: 4pt),
      node((1,9), [`return false` ~ $n_14$], extrude: (-3, 0), corner-radius: 4pt),

      node((-1,6), [`r++;` ~ $n_15$], corner-radius: 4pt),
      edge((-1,6), "u,u,r", "-|>"),
    ))
    #codly-enable()
  3. 
    #figure(
      table(columns: 2, align: (center, left)
      )[                    test ][ covered satatements
      ][          $mono("null")$ ][ $n_1, n_11$
      ][       $mat(0, 0; 0, 0)$ ][ $n_1, n_2, n_3, n_4, n_5, n_6, n_7, n_8, n_13$
      ][       $mat(1, 1; 1, 1)$ ][ $n_1, n_2, n_3, n_4, n_5, n_6, n_7, n_8, n_9, n_10, n_14$
      ][       $mat(1, 0; 0, 1)$ ][ $n_1, n_2, n_3, n_4, n_5, n_6, n_7, n_8, n_9, n_10, n_15, n_12$
      ],
      caption: [Statement coverage]
    )
    #figure(
      table(columns: 2, align: (center, left)
      )[                    test ][ covered satatements
      ][          $mono("null")$ ][ $n_1, n_11$
      ][ $mat(1, 0, 0; 0, 1, 0)$ ][ $n_1, n_2, n_11$
      ][       $mat(0, 0; 0, 0)$ ][ $n_1, n_2, n_3, n_4, n_5, n_6, n_7, n_8, n_13$
      ][       $mat(1, 1; 1, 1)$ ][ $n_1, n_2, n_3, n_4, n_5, n_6, n_7, n_8, n_9, n_10, n_6, n_7, n_9, n_14$
      ][       $mat(1, 0; 0, 1)$ ][ $n_1, n_2, n_3, n_4, n_5, n_6, n_7, n_8, n_9, n_10, n_6, n_7, n_9, n_10, n_6, n_15,$\ 
        $n_4, n_5, n_6, n_7, n_8, n_9, n_10, n_6, n_7, n_9, n_10, n_6, n_15, n_4, n_12$
      ],
      caption: [Branch coverage]
    )
  4. What is boundary-interior test? 
  5. For every element of a matrix there's a three way condition 
    (if, else-if, else). 

    For an $n times n$ matrix, there are $n^2$ elements in the matrix and
    to cover all paths, we would need the total of $3^(n^2)$ tests. Since
    the amount of tests is dependent on $n$ and we don't have $n$ fixed,
    that means that we would have to write tests for every possible $n$.

    Assuming that $n in NN, n < N$, we can calculate the total number of
    tests by:
    $ \#"Tests" = sum_(i = 1)^N 3^(i^2) $
    This number grows way too fast compared to $N$. Already for $N = 5$ 
    we would have $\#"Tests" > 8 dot 10^11$.
]


#set enum(numbering: "11.", full: true) 
#problem(3)[Code Inspections][
  Inspect the class `Matrix` below for issues. An issue is a violation 
  of one of the rules in the checklist following the code. Record each 
  issue in a table of the following form
  #[
    #set text(size: 9pt)
    #table(columns: (auto, auto, 1fr))[
      Rule
    ][
      Lines
    ][
      Short description
    ][][][#v(1em)]
  ]
  If you discover an issue, enter the violated rule, the line number 
  in the source text, and a short description of the issue.

  #raw(read("3.java"), lang: "java", block: true)

  === Rules
  #set text(size: 7pt)
  1. Variable and Constant Declarations
    0. Are all identifiers intelligible and in accordance with the Java naming conventions?
    1. Are the types of all variables and constants correct?
    2. Are all variables and constants correctly initialized?
    3. Are there literals that should be declared as constants?
    4. Are there local variables, instance or class variables that should be constant?
    5. Are there class or instance variables that should be local?
    6. Have class and instance variables the appropriate visibility?
      (default, private, protected, public)?
    7. Are there instance variables that should be static or vice versa?
    8. Are there libraries that are not used anywhere?
  2. Method and Constructor Declarations
    0. Are all identifiers intelligible and in accordance with the Java naming conventions?
    1. Is every input parameter checked for correct value?
    2. Does every return-statement deliver the correct value?
    3. Have all methods and constructors the appropriate visibility?
      (default, private, protected, public)?
    4. Are there instance methods or constructors that should be static or vice versa?
  3. Comments
    0. Have all classes and all non-private constructors, methods, constants, class
      and instance variables a complete JavaDoc comment?
    1. Do comments describe the associated code sections correctly?
  4. Layout
    0. Is indentation correct and consistent?
    1. Do all blocks have curly braces?
  5. Performance
    0. Is it possible to cache values rather than computing them repeatedly?
    1. Is every computed value used?
    2. Can computations be moved out of loops?
]

#solution[
  Team members: Giorgi Bakradze, Giorgi Otinashivli

  #set text(size: 9pt)
  #table(columns: (auto, auto, 1fr), align: (center, left, left)
  )[ Rule ][ Lines ][ Short description
  ][ 10 ][ 21-23,\ 29-36,\ 76-77 ][ Variables `m`, `r`, `v`, and `c` could be made more intelligible
  ][ 10 ][ 89 ][ Variable name `closeParen` is not appropriate for a #link("https://www.thepunctuationguide.com/parentheses.html")[brace]
  ][ 16 ][ 15 ][ The variable `data` should be private
  ][ 18 ][ 89 ][ The variable `closeParen` is not used anywhere
  ][ 20 ][ 67,72,76 ][ Getters and setter should use `getRows()`, `getCols()` and `setElement(rows, cols, val)`
  ][ 21 ][ 76,82 ][ The parameters `r` and `c` may be out of bounds
  ][ 30 ][ 10 ][ The javadoc doesn't document the class `Matrix`
  ][ 30 ][ 46 ][ The javadoc doesn't document the parameter `cols`
  ][ 30 ][ 56 ][ There is no javadoc that documents the method `copy()`
  ][ 31 ][ 25-39 ][ The comment doesn't describe the method _completely_ but it is _correct_
  ][ 40 ][ 68,73,\ 92-104 ][ Indentation is not consistent
  ][ 41 ][ 35 ][ The for loop doesn't have curly braces
  ][ 50 ][ 87 ][ The `toString()` method can be cached
  ]
]
