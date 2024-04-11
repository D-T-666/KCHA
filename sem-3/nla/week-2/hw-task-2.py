import numpy as np

def one_norm(m):
    return max(max(abs(x) for x in row) for row in m)

def tow_norm(m):
    lambdas, vectors = np.linalg.eig(np.matrix(m))
    return max(abs(v) for v in lambdas)**0.5

def inf_norm(m):
    return max(sum(abs(x) for x in row) for row in m)

def frob_norm(m):
    return sum(sum(x**2 for x in row) for row in m)**0.5

def main():
    n = int(input())
    v = [[float(x) for x in input().split()] for i in range(n)]

    print(" ".join(f"{v:.7}" for v in [
        one_norm(v),
        tow_norm(v),
        inf_norm(v),
        frob_norm(v)
    ]))

if __name__ == "__main__":
    main()