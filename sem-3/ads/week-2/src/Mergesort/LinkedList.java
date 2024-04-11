package Mergesort;

public class LinkedList {
    int value = 0;
    LinkedList next = null;

    public LinkedList(int value) {
        this.value = value;
    }

    public static LinkedList fromList(int[] arr, int n) {
        LinkedList res = new LinkedList(arr[0]);
        LinkedList res_head = res;
        for (int i = 1; i < n; i++) {
            res.next = new LinkedList(arr[i]);
            res = res.next;
        }
        return res_head;
    }

    public LinkedList nth(int n) {
        LinkedList res = this;
        while (res != null && n-- > 0) {
            res = res.next;
        }
        return res;
    }

    public int length() {
        int l = 1;
        LinkedList s = this.next;
        while (s != null) {
            l++;
            s = s.next;
        }
        return l;
    }

    public void print() {
        print(length());
    }

    public void print(int d) {
        LinkedList s = this;
        while (s != null && d-- >= 0) {
            System.out.print("" + s.value);
            if (s.next != null) {
                System.out.print(" ");
            }
            s = s.next;
        }
        System.out.println("");
    }
}
