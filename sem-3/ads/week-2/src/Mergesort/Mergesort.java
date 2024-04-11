package Mergesort;

public class Mergesort {
    static void printArr(int[] arr) {
        for (int i = 0; i < arr.length; i++) {
            System.out.print(arr[i]);
            if (i < arr.length - 1) {
                System.out.print(" ");
            } else {
                System.out.println("");
            }
        }
    }

    public static void main(String[] args) {
        LinkedList one = LinkedList.fromList(new int[]{1, 5, 2, 4, 3}, 5);
        LinkedList two = LinkedList.fromList(new int[]{1, 5, 2, 4, 3}, 5);
        int[] three = {1, 5, 2, 4, 3};

        System.out.println("Initial array:");
        printArr(three);
        System.out.println("");

        System.out.println("Task one:");
        One.mergeSort(one, 5).print();
    
        System.out.println("Task two:");
        Two.mergeSort(two, 5).print();
        
        System.out.println("Task three:");
        Three.mergeSort(three);
        printArr(three);
    }
}