addi	$t0 bpt displ(x, $gm)
addi	$t1 bpt displ(z, $gm)
deref($t1)
!\color{red}lui 	23 0000000000000000!
!\color{red}ori 	23 0000000000000100!
mul($t1, $t1, 23)
add 	$t0 $t0 $t1
deref($t0)
addi	$t1 bpt displ(z, $gm)
deref($t1)
add 	$t0 $t0 $t1