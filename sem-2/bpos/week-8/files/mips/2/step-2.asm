addi	$t0 $gp !\color{red}0!
addi	$t1 $gp !\color{red}24!
deref($t1)
lui 	$s7 0000000000000000
ori 	$s7 0000000000000100
mul($t1, $t1, $s7)
add 	$t0 $t0 $t1
deref($t0)
addi	$t1 $gp !\color{red}24!
deref($t1)
add 	$t0 $t0 $t1