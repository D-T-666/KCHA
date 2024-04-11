perp = (0, 0, 0)

def t(n, i, a, b):
    if n <= 1:
        return '0'
    ai, aa, ab = a
    bi, ba, bb = b
    return f'{n-1} + {t(i-1, ai, aa, ab)} + {t(n-i, bi, ba, bb)}'

def Q(n):
    if n <= 1:
        return [perp]
    
    res = []
    for i in range(1, n+1): 
        for a in Q(i - 1):
            for b in Q(n - i):
                res.append((i, a, b))
    return res

def strQ(x):
    if x == perp:
        return '\perp'
    i, a, b = x
    return f'({i}, {strQ(a)}, {strQ(b)})'

pp = 5
for x in Q(pp):
    i, a, b = x
    tx = t(pp, i, a, b)
    print(f't_4{strQ(x)} &= {tx} = {eval(tx)} \\\\')
