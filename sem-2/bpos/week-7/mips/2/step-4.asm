addi	$t0 $gp 0
addi	$t1 $gp 24
lw  	$t1 $t1 0
lui 	$s7 0000000000000000
ori 	$s7 0000000000000100
!\color{red}addi	24 0 1!
!\color{red}addi	26 \$t1 0!
!\color{red}addi	27 0 0!
!\color{red}and 	25 \$s7 24!
!\color{red}beq 	25 0 2!
!\color{red}add 	27 27 26!
!\color{red}add 	24 24 24!
!\color{red}add 	26 26 26!
!\color{red}bne 	24 0 -5!
!\color{red}addi	\$t1 27 0!
add 	$t0 $t0 $t1
lw  	$t0 $t0 0
addi	$t1 $gp 24
lw  	$t1 $t1 0
add 	$t0 $t0 $t1