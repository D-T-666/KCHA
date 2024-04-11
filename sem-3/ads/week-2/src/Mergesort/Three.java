package Mergesort;

public class Three {
    static int min(int a, int b) {
        return a < b ? a : b;
    }

    static void mergeSort(int[] arr) {
        int[] brr;
        
        for (int p = 2; p / 2 <= arr.length; p *= 2) {
            brr = arr.clone();
            for (int l = 0; l < arr.length; l += p) {
                if (arr.length - l < p / 2) break;
                
                int r = min(l + p - 1, arr.length - 1);
                int m = l + p / 2 - 1;
                
                int L = l, R = m + 1;
                for (int i = l; i <= r; i++) {
                    if (L > m || R > r) {
                        if (L > m) {
                            arr[i] = brr[R];
                            R++;
                        } else {
                            arr[i] = brr[L];
                            L++;
                        }
                    } else {
                        if (brr[L] > brr[R]) {
                            arr[i] = brr[R];
                            R++;
                        } else {
                            arr[i] = brr[L];
                            L++;
                        }               
                    }
                }
            }
        }
    }
}