addi	$t0 !\color{red}\$gp! displ(x, $gm)
addi	$t1 !\color{red}\$gp! displ(z, $gm)
deref($t1)
lui 	!\color{red}\$s7! 0000000000000000
ori 	!\color{red}\$s7! 0000000000000100
mul($t1, $t1, !\color{red}\$s7!)
add 	$t0 $t0 $t1
deref($t0)
addi	$t1 !\color{red}\$gp! displ(z, $gm)
deref($t1)
add 	$t0 $t0 $t1