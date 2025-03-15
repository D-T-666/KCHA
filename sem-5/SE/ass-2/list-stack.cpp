#include <cstdlib>
template <typename T>
struct Element {
    T value;
    Element<T>* next;
};

template <typename T>
class ListStack {
    Element<T>* list = nullptr;

public:
    ListStack() {}

    void push(T val) {
        Element<T>* node = (Element<T>*)malloc(sizeof(Element<T>));
        node->value = val;
        node->next = list;
        list = node;
    }

    T pop() {
        if (list == nullptr) {
            throw "already empty";
        }

        T res = list->value;
        list = list->next;
        return res;
    }

    T top() {
        if (list == nullptr) {
            throw "stack is empty";
        }

        return list->value;
    }

    bool isEmpty() {
        return list == nullptr;
    }
};

#include <iostream>

using namespace std;

int main() {
    ListStack<int> as;
    as.push(1);
    as.push(2);
    as.push(69);

    cout << as.pop() << endl;
    as.push(420);
    cout << as.pop() << endl;
    cout << as.pop() << endl;
    cout << as.pop() << endl;
    cout << as.pop() << endl;
}
