addi	$t0 $gp 0
addi	$t1 $gp 24
!\color{red}lw \$t1 \$t1 0!
lui 	$s7 0000000000000000
ori 	$s7 0000000000000100
mul($t1, $t1, $s7)
add 	$t0 $t0 $t1
!\color{red}lw \$t0 \$t0 0!
addi	$t1 $gp 24
!\color{red}lw \$t1 \$t1 0!
add 	$t0 $t0 $t1