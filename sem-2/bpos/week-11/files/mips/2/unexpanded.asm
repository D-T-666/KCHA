addi	$t0 bpt displ(x, $gm)
addi	$t1 bpt displ(z, $gm)
deref($t1)
gpr(23) = enc(size(int),uint)
mul($t1, $t1, 23)
add 	$t0 $t0 $t1
deref($t0)
addi	$t1 bpt displ(z, $gm)
deref($t1)
add 	$t0 $t0 $t1