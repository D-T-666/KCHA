import numpy as np


def sor_step(a, x, b, omega):
    for i in range(len(x)):
        x[i] = omega / a[i][i] * (b[i] - sum(a[i][j] * x[j] for j in range(len(x)) if j != i)) \
             + (1 - omega) * x[i]
    
    return x


n = int(input("n           \t> "))
a = [[float(input(f"a[{i}][{j}] \t> ")) for j in range(n)] for i in range(n)]
b = [float(input(f"b[{i}]      \t> ")) for i in range(n)]
x = [float(input(f"x0[{i}]     \t> ")) for i in range(n)]
omega = float(input("omega        \t> "))
tol = float(input("TOL          \t> "))
max_iters = float(input("max_iters \t> "))

iters = 0

while iters < max_iters:
    px = [x_i for x_i in x]
    x = sor_step(a, x, b, omega)
    e = max([abs(x[i] - px[i]) for i in range(len(x))]) / max(map(abs,px))
    if e < tol:
        print(x)
        break
    iters += 1
else:
    print("iteration limit exceeded")