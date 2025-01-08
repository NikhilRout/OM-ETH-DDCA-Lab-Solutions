# Calculate sum from A to B
.text
main:
	addi $t0 $zero 1  # A
	addi $t1 $zero 100 # B
	add  $t2 $zero $zero

loop:
	add  $t2 $t0   $t2
	beq  $t0 $t1   end
	addi $t0 $t0   1
	j loop

end:	
	j	end	# Infinite loop at the end of the program. 
