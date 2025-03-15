public class StateMachine {
    private enum State {
        A,
        B,
        C,
        D,
    }

    private State currentState;

    public StateMachine() {
        currentState = State.A;
    }

    public void X() {
        switch (currentState) {
            case A:
                currentState = State.C;
                entryC();
                break;
            case B:
                exitB();
                currentState = State.C;
                entryC();
                break;
            case C:
                currentState = State.D;
                break;
            case D:
                System.out.println("Reached final state.");
                break;
        }
    }

    public void Y() {
        switch (currentState) {
            case A:
                currentState = State.B;
                entryB();
                break;
            case B:
                exitB();
                currentState = State.D;
                break;
            case D:
                currentState = State.C;
                entryC();
                break;
        }
    }

    private void entryB() {
        System.out.println("Entering State B");
    }

    private void exitB() {
        System.out.println("Exiting State B");
    }

    private void entryC() {
        System.out.println("Entering State C");
    }
}
