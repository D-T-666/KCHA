def p_norm(v, p):
    return sum(abs(x)**p for x in v)**(1/p)

def inf_norm(v):
    return max(abs(x) for x in v)

def main():
    n = int(input())
    v = [float(x) for x in input().split()]

    print(" ".join(f"{v:.7}" for v in [
        p_norm(v, 1),
        p_norm(v, 2),
        p_norm(v, 3),
        inf_norm(v)
    ]))

if __name__ == "__main__":
    main()