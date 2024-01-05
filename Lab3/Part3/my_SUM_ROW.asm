        section .text
        global  alt_sum

alt_sum:
        push rdi                       ; pointer to mat
        push rdx                       ; number of rows/ columns of the matrix (n)
        push r11
        
; ; 0-indexing on all matrices
; ; mat1[j][i] = rdi+(rdx*j+i)*8
; ; GOAL - Perform matrix alternate summation of elements in matrix and return the sum

; ; TODO - Fill your code here performing the matrix alternate summation in the following order
; ; for(int i = 0; i < n; i++){for(int j = 0; j < n; j++){sum += (-1)^(i+j)*mat1[i][j];}}
        mov r11, -1
        mov rax, 0; sum initialized to zero
        outerloop:
        add r11, 1
        cmp r11, rdx ; r11 stores i value
        jge return
        mov r13, 0
        innerloop:
        cmp r13, rdx ; r13 stores j value
        jge outerloop
        mov r10, r11 ; saving the value of i in r10
        imul r13, 8 ; j*8
        imul r11, 8 ; i*8
        imul r11, rdx ; rdx*(i*8)
        add rdi, r13
        add rdi, r11
        mov r14, [rdi] ; r14 stores mat1[i][j]
        sub rdi, r13
        sub rdi, r11
        shr r13, 3
        mov r11, r10
        mov r15, r11 
        add r15, r13 ; (i+j)
        and r15, 1
        cmp r15, 0
        je even1
        mov r15, -1
        jmp odd1
        even1:
        mov r15, 1
        odd1:
        imul r15, r14
        add rax, r15
        add r13, 1 ; j++
        jmp innerloop

; ; End of code to be filled
        return:
        pop r11
        pop rdx
        pop rdi
        ret
