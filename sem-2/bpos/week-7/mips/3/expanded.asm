addi	$t0 $gp 24
lw  	$t0 $t0 0
lui 	$t1 0000000000000000
lui 	$t1 0000000000000000
slt 	$t0 $t1 $t0
beqz	$t0 9
addi	$t0 $gp 24
addi	$t1 $gp 24
lw  	$t1 $t1 0
lui 	$t2 0000000000000000
ori 	$t2 0000000000000010
sub 	$t1 $t1 $t2
sw  	$t0 $t1 0
blez	$zero -12