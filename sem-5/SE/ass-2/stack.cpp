#include <cstdlib>
template <typename T>
class ArrayStack {
    T* data;
    int capacity = 1;
    int len = 0;

public:
    ArrayStack() {
        data = (T*)malloc(sizeof(T) * capacity);
    }

    void push(T x) {
        if (len == capacity) {
            capacity *= 2;
            T* new_data = (T*)malloc(sizeof(T) * capacity);
            for (int i = 0; i < len; i++) {
                new_data[i] = data[i];
            }
            delete data;
            data = new_data;
        }
        data[len] = x;
        len += 1;
    }

    T pop() {
        if (len == 0) {
            throw "already empty";
        }
        T res = data[len - 1];
        len -= 1;

        if (len < capacity / 2) {
            capacity /= 2;
            T* new_data = (T*)malloc(sizeof(T) * capacity);
            for (int i = 0; i < len; i++) {
                new_data[i] = data[i];
            }
            delete data;
            data = new_data;
        }

        return res;
    }

    T top() {
        if (len == 0) {
            throw "stack is empty";
        }
        return data[len - 1];
    }

    bool isEmpty() {
        return len == 0;
    }
};



#include <iostream>

using namespace std;

int main() {
    ArrayStack<int> as;
    as.push(1);
    as.push(2);
    as.push(69);

    cout << as.pop() << " Capacity: " << as.capacity << endl;
    as.push(420);
    cout << as.pop() << " Capacity: " << as.capacity << endl;
    cout << as.pop() << " Capacity: " << as.capacity << endl;
    cout << as.pop() << " Capacity: " << as.capacity << endl;
    cout << as.pop() << " Capacity: " << as.capacity << endl;
}
