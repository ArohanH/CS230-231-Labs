.data
    array: .space 40000
    #myCharacter: .byte 'm'
    #myCharacter1: .byte 'x'
    space: .asciiz "\n"
.text

heapify:
    addi $sp, $sp, -12
    sw $ra, 0($sp)
    sw $a2, 4($sp) #This stores value of index to be heapified
    sw $a0, 8($sp) #Base address of array
    move $s0, $a2   #for storing the index to be heapified
    move $t1, $a2   
    move $t2, $a2
    mul $t1, $t1, 2   #2i+1=leftchild
    mul $t2, $t2, 2   #2i+2=rightchild
    addi $t1, 1 
    addi $t2, 2
    slt  $t3, $t1, $a1     #comparison between $t1 and $a1 
    bne  $t3, $zero, leftchild #leftchild for again doing a comparison
    option2_ret: 
    slt  $t3, $t2, $a1      
    bne  $t3, $zero, rightchild
    option4_ret:
    bne  $s0, $a2, swapheapify1 
    #li $v0, 4
    #la $a0, myCharacter1
    #syscall
    option5_ret:
    lw $ra, 0($sp)
    lw $a2, 4($sp)
    lw $a0, 8($sp)
    addi $sp, $sp, 12
    jr $ra

swapheapify1:
    #addi $sp, $sp, -8
    #sw $ra, 0($sp)
    #sw $a2, 4($sp)
    move $t5, $s0            # put the index in $t5
    add $t5, $t5, $t5    # double the index
    add $t5, $t5, $t5    # double the index again (now 4x)
    add $t6, $a0, $t5    # get address of ith location
    lw $t7, 0($t6)
    move $t4, $a2            # put the index in $t4
    add $t4, $t4, $t4    # double the index
    add $t4, $t4, $t4    # double the index again (now 4x)
    add $t9, $a0, $t4    # get address of ith location
    lw $t8, 0($t9)
    sw $t7, 0($t9)       #swapping 
    sw $t8, 0($t6)       #swapping
    jal heapify
    j option5_ret
    #lw $ra, 0($sp)
    #lw $a2, 4($sp)
    #addi $sp, $sp, 8
    #jr $ra


leftchild:
    #addi $sp, $sp, -4
    #sw $ra, 0($sp) 
    move $t5, $t1            # put the index in $t5
    add $t5, $t5, $t5    # double the index
    add $t5, $t5, $t5    # double the index again (now 4x)
    add $t6, $a0, $t5    # get address of ith location
    lw $t7, 0($t6)
    move $t4, $a2        # put the index in $t4
    add $t4, $t4, $t4    # double the index
    add $t4, $t4, $t4    # double the index again (now 4x)
    add $t9, $a0, $t4    # get address of ith location
    lw $t8, 0($t9)
    slt  $t9, $t8, $t7      
    bne  $t9, $zero, move1
    option1_ret:
    j option2_ret
    #lw $ra, 0($sp)
    #addi $sp, $sp, 4 
    #jr $ra

move1:
    move $a2, $t1
    j option1_ret
    #jr $ra   

rightchild:
    #addi $sp, $sp, -4
    #sw $ra, 0($sp) 
    move $t5, $t2            # put the index in $t5
    add $t5, $t5, $t5    # double the index
    add $t5, $t5, $t5    # double the index again (now 4x)
    add $t6, $a0, $t5    # get address of ith location
    lw $t7, 0($t6)
    move $t4, $a2            # put the index in $t4
    add $t4, $t4, $t4    # double the index
    add $t4, $t4, $t4    # double the index again (now 4x)
    add $t9, $a0, $t4    # get address of ith location
    lw $t8, 0($t9)
    slt  $t9, $t8, $t7      
    bne  $t9, $zero, move2
    option3_ret:
    j option4_ret
    #lw $ra, 0($sp)
    #addi $sp, $sp, 4 
    #jr $ra

move2:
    move $a2, $t2
    j option3_ret
    #jr $ra

heapSort:
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    move $a3, $a1
    addi $a3, -1 #a3 store the value of n-1
    jal loop2
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra


binarysearch1:
    start:
    bgt $t8, $t9, skip
    sub $t4, $t9, $t8 #high-low
    div $t4, $t4, 2 #divided by 2
    add $t5, $t8, $t4# t5 stores (low+high)/2 +low=mid
    mul $t6, $t5, 4 # For array indexing
    add $t7, $t2, $t6 #array[mid]
    lw $t7, 0($t7) # loading array[mid]
    beq $t7, $a2, midequal #if $t7 value is equal to $a2 => return mid
    bgt $t7, $a2, midgreater #if $t7 value is greater to $a2 => iterate again with high=mid-1
    add $t8, $t5, 1 #uf $t7 value is less to $a2 => iterate again with low mid+1
    j start
    
   
    skip:
    add $v1, $zero, -1
    j option7_ret

    midequal:
    move $v1, $t5
    j option7_ret

    midgreater:
    sub $t9, $t5, 1
    j start

    option7_ret:
    jr $ra

loop1:
    beq $a2, -1, loopdone #checking whether the iterator i has reached the value -1
    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $a0, 4($sp)
    jal heapify
    #li $v0, 4
    #la $a0, myCharacter
    #syscall
    addi $a2, -1 #i=i-1
    lw $ra, 0($sp)
    lw $a0, 4($sp)
    addi $sp, $sp, 8

    # j exit1
    j loop1

loop2:
    beq $a3, -1, loopdone #i from n-1 to 0
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    jal swapheapify2
    #option6_ret:
    sub $a3, $a3, 1 #i=i-1
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    j loop2

swapheapify2:
    addi $sp, $sp, -12
    sw $ra, 0($sp)
    sw $a2, 4($sp)
    sw $a1, 8($sp)
    add $a2, $zero, 0
   # move $t5, $s0            # put the index in $t5
    #add $t5, $t5, $t5    # double the index
    #add $t5, $t5, $t5    # double the index again (now 4x)
    #add $t6, $a0, $t5    # get address of ith location
    lw $t7, 0($a0)
    move $t4, $a3            # put the index in $t4
    add $t4, $t4, $t4    # double the index
    add $t4, $t4, $t4    # double the index again (now 4x)
    add $t9, $a0, $t4    # get address of ith location
    lw $t8, 0($t9)
    sw $t7, 0($t9)       #swapping 
    sw $t8, 0($a0)       #swapping
    move $a1, $a3
    jal heapify
    lw $ra, 0($sp)
    lw $a2, 4($sp)
    lw $a1, 8($sp)
    addi $sp, $sp, 12
    jr $ra

loopdone:
    jr $ra

TakeInput:
    beq $t0, -1, loopdone #checking whether the iterator i has reached the value -1
    li $v0, 5
    syscall
    move $t1, $v0   #moving integer into $t1
    sw $t1, 0($t2)   #storing integer at array address
    add $t2, $t2, 4
    addi $t0, -1 #i=i-1
    j TakeInput

#printout:

    #li $t0,0
    #move $t1,$a1
    #addi $t1,$t1,-1
    #j condition
    #loop:
    #lw $a0,array
    #move $t2,$t0
    #sll $t2,$t2,2
    #add $t2,$t2,$a0
    #li $v0, 5
    #lw $a0,0($t2)
    #syscall
    #addi $t0,$t0,1
    
    #condition:
    #bgt $t0,$t1,endloop
    #j loop


    #endloop:
    #jr $ra

InputQuery:
    beq $t0, -1, loopdone #checking whether the iterator i has reached the value -1
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    li $v0, 5
    syscall
    move $s5, $v0
    #li $v0, 1
    #move $a0, $s5
    #syscall
    move $a2, $s5   #moving integer into $a2
    move $t9, $s2   #Passing the value of n to $t9
    addi $t9, -1 #storing the high element
    add $t8, $zero, 0 #storing the low element
    la $t2, array
    jal binarysearch1
    li $v0, 1
    move $a0, $v1
    syscall
    li $v0, 4
    la $a0, space
    syscall
    addi $t0, $t0, -1 #i=i-1
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    j InputQuery

main:
    li $v0, 5  #input value of n
    syscall
    la $a0, array #a0 stores the address of array
    move $a1, $v0 #a1 stores n
    move $s2, $a1
    move $t0, $a1
    addi $t0, -1 #Pass n-1 to input loop
    move $t2, $a0
    jal TakeInput
    move $a2, $a1 
    div $a2, $a2, 2
    addi $a2, -1  #a2 stores the value of n/2-1
    jal loop1
    jal heapSort
    #jal printout
    li $v0, 5  #input value of q
    syscall
    move $a1, $v0 #a1 stores q
    move $t0, $a1
    addi $t0, -1 #Pass q-1 to input loop of taking queries
    move $t2, $a0
    jal InputQuery


    #move $t2, $a0
    #addi $t0, $zero, 0
    #jal while

    exit1:
    li $v0, 10
    syscall

    
while:
    beq $t0, $a1, exit
    lw $t6, 0($t2)
    add $t2, $t2, 4
    addi $t0, 1
    li $v0, 1
    move $a0, $t6
    syscall
    li $v0, 4
    la $a0, space
    syscall
    j while
exit: 
    jr $ra
    
   
    
    
    







