class Joe {
    final int[] x;
    Joe() {
        x = new int[]{0, 1};
        System.out.println(x[0]);
    }
    public void f() {
        x[0] = 2;
        System.out.println(x[0]);
    }
}

public class Main {
    public static void main(String args[]) {
        Joe j = new Joe();

        j.f();
    }
}

