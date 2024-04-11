int b;
int y;

int main() {
    b = 5;
    y = 11;
    if b > 1 {
        b = f1(b, b - 1)
    };
    return 0
};

int f1(int y, int z) {
    while b > 0 { 
        if y > 12 {
            b = (y - 1) * f1(y - 1, y)
        } else {
            if y > 9 {
                y = y - 1;
                b = 5
            } else {
                b = 5;
                y = y - 1
            }
        }
    };
    y = y - 1;
    return b
}

// 1: 
b=5;while b>0 {if y>12 {b=(y-1)*f1(y-1,y)}else{if y>9 {y=y-1;b=5} else {b=5;y=y-1}}};y=y-1;return b;return 0

// 2:
while b>0 {if y>12 {b=(y-1)*f1(y-1,y)}else{if y>9 {y=y-1;b=5} else {b=5;y=y-1}}};y=y-1;return b;return 0

// 3:
return b; return 0

