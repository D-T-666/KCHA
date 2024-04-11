import math

n = 80
b = [math.pi for i in range(80)]
a = [[0 for j in range(n)] for i in range(n)]

print(n)

for i in range(n):
    # s = []
    for j in range(n):
        if i == j:
            a[i][j] = 2 * (i + 1)
        elif (j == i + 2 and i < 78) or (j == i - 2 and i >= 2):
            a[i][j] = 0.5 * (i + 1)
        elif (j == i + 4 and i < 76) or (j == i - 4 and i >= 4):
            a[i][j] = 0.25 * (i + 1)
        else:
            a[i][j] = 0

        # if a[i][j] == 0:
        #     s.append("0")
        # else:
        #     s.append(f"{a[i][j]}")
        print(a[i][j])

    # print(" & ".join(s), "\\\\")

for i in range(n):
    print(b[i])

for i in range(n):
    print(1)

print(1.5)
print("0.00001")
print(1000)