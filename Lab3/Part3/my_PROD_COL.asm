        section .text
        global hadarmard_prod

hadarmard_prod:
        push rdi                       ; pointer to mat1
        push rdx                       ; pointer to mat2
        push r8                        ; pointer to mat3
        push r9                        ; number of rows/ columns of the matrix (n)
        push r11
        

; ; 0-indexing on all matrices
; ; mat1[j][i] = rdi+(r9*j+i)*8
; ; GOAL - Compute hadarmard product of of mat1, mat2 and save the result in mat3
; ; Note : mat1, mat2 and mat3 here are not the same as one given in problem statement.
; ; They are just placeholders for any three matrices using this functionality.

; ; TODO - Fill your code here performing the hadarmard product in the following order
; ; for(int i = 0; i < n; i++){for(int j = 0; j < n; j++){mat3[j][i] = mat1[j][i] * mat2[j][i];}}
        mov r11, -1
        outerloop:
        add r11, 1
        cmp r11, r9 ; r11 stores i value
        jge return
        mov r13, 0
        innerloop:
        cmp r13, r9 ; r13 stores j value
        jge outerloop
        mov r10, r13
        imul r13, 8 ; j*8
        imul r11, 8 ; i*8
        imul r13, r9 ; r9*(j*8)
        add r8, r13 
        add r8, r11
        add rdx, r13
        add rdx, r11
        add rdi, r13
        add rdi, r11
        mov r14, [rdi] ; r14 stores mat1[j][i]
        mov r15, [rdx] ; r15 stores mat2[j][i]
        sub rdx, r13
        sub rdx, r11
        sub rdi, r13
        sub rdi, r11
        imul r14, r15 ; store the LC in r14
        mov [r8], r14
        sub r8, r13
        sub r8, r11
        shr r11, 3
        mov r13, r10
        add r13, 1 ; j++
        jmp innerloop

; ; End of code to be filled
        return:

        pop r11
        pop r9
        pop r8
        pop rdx
        pop rdi
        ret
