addi	$t0 $gp 0
addi	$t1 $gp 24
lw  	$t1 $t1 0
lui 	$s7 0000000000000000
ori 	$s7 0000000000000100
addi	!\color{red}\$t8! !\color{red}\$zero! 1
addi	!\color{red}\$k0! $t1 0
addi	!\color{red}\$k1! !\color{red}\$zero! 0
and 	!\color{red}\$t9! $s7 !\color{red}\$t8!
beq 	!\color{red}\$t9! !\color{red}\$zero! 2
add 	!\color{red}\$k1! !\color{red}\$k1! !\color{red}\$k0!
add 	!\color{red}\$t8! !\color{red}\$t8! !\color{red}\$t8!
add 	!\color{red}\$k0! !\color{red}\$k0! !\color{red}\$k0!
bne 	!\color{red}\$t8! !\color{red}\$zero! -5
addi	$t1 !\color{red}\$k1! 0
add 	$t0 $t0 $t1
lw  	$t0 $t0 0
addi	$t1 $gp 24
lw  	$t1 $t1 0
add 	$t0 $t0 $t1