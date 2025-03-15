#import "@tcum/hw:0.1.1": *

#show: hw

#set document(title: "SE-asssignment-8", author: "Dimitri Tabatadze")

#[
  #set align(center + horizon)

  = Introduction to Software Engineering
  == Assignment 8

  Dimitri Tabatadze, #datetime.today().display()
  #pagebreak()
]

#set page(height: 28cm)
#set enum(numbering: "a)")
#show: codly-init.with()

#problem[
  Explain why Template Method is an instance of “switchless
  programming”. Use UML and proper English (complete, correct sentences) in
  your explanation.
]

#solution[
  The _Tmplate Method_ is a way to have multiple implementations of the same
  method deffered to different subclasses. In switchless programming we want
  to remove the case splitting from the code that doesn't necessarily need to
  know about it for cleannes sake. The Template Mehtod allows us exacly that.

  #note[
    I don't konw what I would use UML here for. I think my explaination is
    enough. Here's some screenshots though:

    #figure(image("1-1.png"))
    #figure(image("1-2.png"))
  ]
]

#problem[
  This problem is about implementing the design pattern _Observer_ in
  correct Java. (This problem was an exam question, so try to do it from memory, without
  looking at the pattern.) Use the conventions for the implementation of UML class
  diagrams presented in class. Include constructors.

  + Complete the following classes:
    ```java
    public abstract class Subject { ... }

    public class ConcreteSubject extends Subject {
      State subjectState;

      public State getState() {
        return subjectState;
      }

      ...
    }

    public class ConcreteObserver extends Observer {
      State observerState;

      ...
    }
    ```

  + The above assumes the _pull_ model. Discuss what needs to be changed for a _push_ model.

  + Discuss the advantages and disadvantages of the _push_ model vs. the _pull_ model.
]

#solution[
  + ```java
    public abstract class Subject {
      private List<Observer> observers;

      Subject() {
        this.observers = new ArrayList<Observer>();
      }

      public void attach(Observer o) {
        this.observers.add(o)
      }

      public void detach(Observer o) {
        for (int i = 0; i < this.observers.length; i++) {
          this.observers.remove(i);
          break;
        }
      }

      public void notify() {
        for (Observer o : this.observers) {
          o.update();
        }
      }

      public abstract State getState();
      public abstract void setState(State newState);
    }

    public class ConcreteSubject extends Subject {
      State subjectState;

      ConcreteSubject() {
        super();
        this.subjectState = new State();
      }

      public State getState() {
        return subjectState;
      }

      public void setState(State newState) {
        this.subjectState = newState;
      }
    }

    public abstract class Observer {
      private Subject subject;

      Observer(Subject subject) {
        this.subject = subject;
      }

      public abstract void update();
    }

    public class ConcreteObserver extends Observer {
      State observerState;

      ConcreteObserver(Subject subject) {
        super(subject);
      }

      public void update() {
        observerState = this.subject.getState();
      }
    }
    ```
  + In the _pull_ model, the observer fetches all data from the subject
    whereas in the _push_ model, the subject passes the data in the update method.

    To change to the push model, we need to change two functions: `notify` and
    `update`.

    ```java
    public abstract class Subject {
      ...

      public void notify() {
        for (Observer o : this.observers) {
          o.update(this.getState());
        }
      }

      ...
    }
    ```

    and

    ```java
    public class ConcreteObserver extends Observer {
      ...

      public void update(State newState) {
        observerState = newState;
      }
    }
    ```

  + #block(table(stroke: black, columns: (1fr, 1fr),
      align(center)[*_Push_*], align(center)[*_Pull_*],
      [asynchronous friendly], [may skip an update asynchronously],
      [overnotification], [can skip updates],
    ), breakable: false)
]

#problem[
  The coffee machine of your team is not working right. The main
  problem seems to be that one must press the coffee button twice, otherwise the
  brewing process stops. Your boss who needs coffee to work has drawn an activity
  diagram and now asks you to fix the machine. To get a better view of what happens
  when, you decide to figure out what the states of the machine are. The activity diagram
  is below. (SS19 ü4)

  #figure(image("3.png", width: 70%))

  Convert the UML activity diagram above into a UML state chart. Model the states of the
  machine as accurately as possible. Your UML state chart should have as few states as
  possible. Provide the state transitions with events and operations and use entry, exit
  and continuous actions as well as conditions if necessary.
]

#solution[
  #figure(image("3.svg", width: 100%))

  #note[
    The power cable can probably be pulled while being in any state, so
    I considered it correct to do that even though the given activity diagram
    only assumed that the cable could get pulled while idle.
  ]
]

#problem[
  Convert the state chart you produced in the previous problem into a
  UML class diagram according to the state machine design pattern presented in class.
]

#solution[
  #figure(image("4.svg", width: 100%))
]
