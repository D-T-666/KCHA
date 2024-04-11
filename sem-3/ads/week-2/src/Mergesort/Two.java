package Mergesort;

public class Two {
    static LinkedList mergeSort(LinkedList arr, int n) {
        LinkedList head = new LinkedList(666);
        head.next = arr;

        LinkedList res = new LinkedList(69420);
        for (int w = 2; w / 2 < n; w *= 2) {
            for (int h = 0; h + w / 2 < n; h += w) { 
                LinkedList tail = head.nth(h + w + 1);
                LinkedList a = head.nth(h + 1);
                LinkedList b = head.nth(h + w / 2 + 1);

                int al = w / 2;
                int bl = Math.min(w / 2, n - h - w/2);

                LinkedList r = res;
                for (int i = 0; i < w; i++) {
                    boolean pick_a = bl == 0;
                    if (!pick_a) {
                        pick_a = al > 0 && a.value <= b.value;
                    }
                    
                    if (pick_a) {
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
                head.nth(h).next = res.next;
            }
        }
        return head.next;
    }
}