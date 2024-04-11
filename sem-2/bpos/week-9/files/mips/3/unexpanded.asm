addi	$t0 bpt displ(z, $gm)
deref($t0)
gpr($t1) = 0
slt 	$t0 $t1 $t0
beqz 	$t0 7+2
addi 	$t0 bpt displ(z, $gm)
addi 	$t1 bpt displ(z, $gm)
deref($t1)
gpr($t2) = 2
sub 	$t1 $t1 $t2
sw  	$t0 $t1 0
blez 	0 -(4+7+1)