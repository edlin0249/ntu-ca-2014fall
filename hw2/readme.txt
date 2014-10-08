
This code is tested on Ubuntu 14.04

-------
STEP4

operater in ascii is loaded in $s3.
xor $t0, $t0, $t0 to zero out $t0
addi $t0, $t0, 43 to put the desired operator to compare into $t0 (43 --> '+')
beq to check if operator == ?? and jump to the right location

-------
STEP5

Just put $a0 into array output_ascii byte by byte(little endien)

itoa
Turn the number in $a0 byte by byte.

------



