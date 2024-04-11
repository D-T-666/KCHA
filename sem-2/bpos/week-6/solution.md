```c
typedef int[11] vec;
typedef int* intp;
vec c;
int a;
intp b;
```

Expression to evaluate:
```c
    a + b* - c[2]
```

$$displ(c, \$gm) = sbase +_{32} 0_{32}$$
$$displ(a, \$gm) = sbase +_{32} 44_{32}$$
$$displ(b, \$gm) = sbase +_{32} 48_{32}$$

```
addi    1 28 44             # Load a into 1
lw      1 1 0               #

addi    2 28 48             # Load b into 2
lw      2 2 0               # 
lw      2 2 0               # Dereference 2 (b)

add     1 1 2               # Performe addition

addi    2 28 0              # Load c (e) into 2
addi    3 0 2               # gpr(3) = enc(2, uint)
addi    23 0 4              # gpr(23) = enc(4, uint)
mul(3, 3, 23)
add     2 2 3
lw      2 2 0               # Deref c[2]

sub     1 1 2
```

```
lw      $t0, 44($gp)            # Load a into $t0
lw      $t0, 0($t0)             #

lw      $t1, 48($gp)            # Load b into #t1
lw      $t1, 0($t1)             # 
lw      $t1, 0($t1)             # Dereference $t1 (b)

add     $t0, $t0, $t1           # Performe addition

lw      $t1, 0($gp)             # Load c (e) into 2
lw      $t1, 0($t1)             # 
addi    $t2, $zero, 2           # gpr(10) = enc(2, uint)
addi    $s7, $zero, 4           # gpr(23) = enc(4, uint)
mul($t2, $t2, $s7)
add     $t1, $t1, $t2
lw      $t1, 0($t1)             # Deref c[2]

sub     $t0, $t0, 2
```

```mips
lw      $t0,    $gp,    44
lw      $t1,    $gp,    48
lw      $t1,    $t1,    0
add     $t0,    t0,     $t1
lw      $t1,    $gp,    8
sub     $t0,    $t0,    $t1
```


