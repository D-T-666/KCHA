package Mergesort;

public class One {
    /// sort the first n elements
    static LinkedList mergeSort(LinkedList arr, int n) {
        if (n == 1) {
            return arr;
        }

        LinkedList tail = arr.nth(n);
        LinkedList a = mergeSort(arr, n/2);
        LinkedList b = mergeSort(arr.nth(n / 2), n - n/2);

        int al = n / 2;
        int bl = n - n / 2;

        LinkedList r = new LinkedList(69420);
        LinkedList res = r;
        for (int i = 0; i < n; i++) {
            if (bl == 0 || (al > 0 && a.value <= b.value)) {
                r.next = a;
                a = a.next;
                al--;
            } else {
                r.next = b;
                b = b.next;
                bl--;
            }
            r = r.next;
        }
        r.next = tail;
        return res.next;
    }
}