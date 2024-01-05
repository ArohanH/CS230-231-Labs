extern init_v
extern pop_v
extern push_v
extern size_v
extern get_element_v
extern resize_v
extern delete_v
extern free

section .text
global init_h
global delete_h
global size_h
global insert_h
global get_max
global pop_max
global heapify
global heapsort

init_h:
        push rbp
        mov rbp, rsp
        push rax
        push rbx
        push rcx
        push rdx
        push r8
        push r9
        push r10
        push r11
        push r12
        push r13
        push r14
        push r15
        ; ENTER YOUR CODE HERE, DO NOT MODIFY EXTERNAL CODE
        mov rax, 0  ; Loading 0 to rax 
        mov [rdi], rax ; initializing buffer size to 0
        mov [rdi+8], rax; initializing size 0
        mov [rdi+16], rax; initializing ptr to NULL
        pop r15
        pop r14
        pop r13
        pop r12
        pop r11
        pop r10
        pop r9
        pop r8
        pop rdx
        pop rcx
        pop rbx
        mov rsp, rbp
        pop rbp
        ret

delete_h:
        push rbp
        mov rbp, rsp
        push rax
        push rbx
        push rcx
        push rdx
        push r8
        push r9
        push r10
        push r11
        push r12
        push r13
        push r14
        push r15
        ; ENTER YOUR CODE HERE, DO NOT MODIFY EXTERNAL CODE
        mov r12, [rdi + 16] ; 
        cmp r12, 0        
        je not_free 
        mov rdi, r12          
        call free
        not_free:   
        pop r15
        pop r14
        pop r13
        pop r12
        pop r11
        pop r10
        pop r9
        pop r8
        pop rdx
        pop rcx
        pop rbx
        mov rsp, rbp
        pop rbp
        ret


size_h:
        push rbp
        mov rbp, rsp
        push rax
        push rbx
        push rcx
        push rdx
        push r8
        push r9
        push r10
        push r11
        push r12
        push r13
        push r14
        push r15
        ; ENTER YOUR CODE HERE, DO NOT MODIFY EXTERNAL CODE
        mov rax, [rdi+8]
        pop r15
        pop r14
        pop r13
        pop r12
        pop r11
        pop r10
        pop r9
        pop r8
        pop rdx
        pop rcx
        pop rbx
        mov rsp, rbp
        pop rbp
        ret


insert_h:
        push rbp
        mov rbp, rsp
        push rax
        push rbx
        push rcx
        push rdx
        push r8
        push r9
        push r10
        push r11
        push r12
        push r13
        push r14
        push r15
        ; ENTER YOUR CODE HERE, DO NOT MODIFY EXTERNAL CODE
        ;mov r12, [rdi+16] ;
        mov r13, [rdi+8] ;size of the heap before pushing(or i)
        add rdi, 8
        mov rbx, rdi
        sub rdi, 8
        call push_v ;pushed the new element of the heap
        mov r12, [rbx+8] ; r12 stores the address of ptr inside the vector structure after pushing
        ;add r13, 1
        whilecondition1: ; i>0
        cmp r13, 0
        jg whilecondition2
        jmp return
        whilecondition2:
        mov r14, r13
        sub r14, 1
        shr r14, 1 ; divide by 2 
        imul r14, 8
        mov r10, r12
        add r10, r14
        shr r14, 3  ; again divided r14 by 8 to restore the value of parent(i)
        mov r9, [r10] ; r9 stores T[parent(i)]
        imul r13, 8
        mov r11, r12
        add r11, r13
        shr r13, 3  ; again divided r13 by 8 to restore the value of i
        mov r15, [r11] ; r15 stores T[i]        
        cmp r9, r15 ; comparing r9 & r15
        jl whileexecute
        jmp return
        whileexecute:
        mov [r11], r9
        mov [r10], r15
        mov r13, r14
        jmp whilecondition1
        return:
        mov rcx, [rbx]
        add rcx, 1 ;to load new size into arr constructor size 
        mov [rbx], rcx
        pop r15
        pop r14
        pop r13
        pop r12
        pop r11
        pop r10
        pop r9
        pop r8
        pop rdx
        pop rcx
        pop rbx
        mov rsp, rbp
        pop rbp
        ret

get_max:
        push rbp
        mov rbp, rsp
        push rax
        push rbx
        push rcx
        push rdx
        push r8
        push r9
        push r10
        push r11
        push r12
        push r13
        push r14
        push r15
        ; ENTER YOUR CODE HERE, DO NOT MODIFY EXTERNAL CODE
        mov r12, [rdi+16] 
        mov rax, [r12] ; returning the max element
        pop r15
        pop r14
        pop r13
        pop r12
        pop r11
        pop r10
        pop r9
        pop r8
        pop rdx
        pop rcx
        pop rbx
        mov rsp, rbp
        pop rbp
        ret

pop_max:
        push rbp
        mov rbp, rsp
        push rax
        push rbx
        push rcx
        push rdx
        push r8
        push r9
        push r10
        push r11
        push r12
        push r13
        push r14
        push r15
        ; ENTER YOUR CODE HERE, DO NOT MODIFY EXTERNAL CODE  
        mov r12, [rdi+8] ; storing the size of the heap
        mov r13, [rdi+16]
        mov r14, [r13] ; T[0]
        sub r12, 1; size-1
        imul r12, 8
        add r13, r12
        mov r15, [r13] ; T[size-1]
        mov [r13], r14 ; swapping the values of T[0], T[size-1]
        mov rdx, [rdi+16]
        mov [rdx], r15; swapping
        mov rcx, [rdi+8]
        sub rcx, 1
        mov [rdi+8], rcx ; reducing the size of the heap array
        call heapify
        mov rax, r14
        pop r15
        pop r14
        pop r13
        pop r12
        pop r11
        pop r10
        pop r9
        pop r8
        pop rdx
        pop rcx
        pop rbx
        mov rsp, rbp
        pop rbp
        ret

heapify:
        push rbp
        mov rbp, rsp
        push rax
        push rbx
        push rcx
        push rdx
        push r8
        push r9
        push r10
        push r11
        push r12
        push r13
        push r14
        push r15
        ; ENTER YOUR CODE HERE, DO NOT MODIFY EXTERNAL CODE
        mov rcx, 0 ; rcx stores index of the root 
        ;mov r12, [rdi+16]
        ;mov rcx, 0 ; root value
        whileheapify:
        mov rdx, rcx; largest=root
        ;cmp rdx, 0
        ;je whileheapifyexecute
        ;jmp return1 
        ;whileheapifyexecute:
        mov r9, rcx ;r9 is used for storing the left child
        imul r9, 2
        add r9, 1 ; left=2*i+1
        mov r10, rcx ;r10 is used for storing the right child
        imul r10, 2
        add r10, 2 ; right=2*i+2
        ifcondition1: ; to check left < size of heap
        cmp r9, [rdi+8]
        jl ifcondition2
        jmp ifcondition3
        ifcondition2: ; to check T[left]>T[largest]
        mov r12, [rdi+16]
        imul r9, 8
        add r12, r9 ; to access the memory address of left child element 
        shr r9, 3 ; restore the value of left child indexx
        mov r14, [r12] ; r14 contains T[left]
        mov r13, [rdi+16]
        imul rdx, 8
        add r13, rdx ;to access the memory address of left child element 
        shr rdx, 3; restore the value of largest
        mov r15, [r13] ; r15 contains the value of T[largest]
        cmp r14, r15
        jle ifcondition3
        mov rdx, r9 ; execution of ifcondition2 if ifcondition2 is true
        ifcondition3:  ; to check right < size of heap
        cmp r10, [rdi+8]
        jl ifcondition4
        jmp ifcondition5
        ifcondition4: ; to check T[right]>T[largest]
        mov r12, [rdi+16]
        imul r10, 8
        add r12, r10
        shr r10, 3 ; restore the value of right child index
        mov r14, [r12] ; r14 contains T[right]
        mov r13, [rdi+16]
        imul rdx, 8
        add r13, rdx
        shr rdx, 3; restore the value of largest
        mov r15, [r13] ; r15 contains the value of T[largest]
        cmp r14, r15
        jle ifcondition5
        mov rdx, r10 ; ; execution of ifcondition4 if ifcondition4 is true
        ifcondition5: ; to check whether largest!=root
        cmp rcx, rdx
        je return1
        mov r12, [rdi+16]
        imul rcx, 8
        add r12, rcx
        shr rcx, 3 ; restore the value of root
        mov r14, [r12] ; T[root]
        mov r13, [rdi+16]
        imul rdx, 8
        add r13, rdx 
        shr rdx, 3 ; restore the value of largest
        mov r15, [r13] ; T[largest]
        mov [r13], r14 ; swapping the values of T[root] and T[largest] 
        mov [r12], r15 ; previous comment
        mov rcx, rdx ; root=largest
        jmp whileheapify
        return1:
        pop r15
        pop r14
        pop r13
        pop r12
        pop r11
        pop r10
        pop r9
        pop r8
        pop rdx
        pop rcx
        pop rbx
        mov rsp, rbp
        pop rbp
        ret

heapsort:
        push rbp
        mov rbp, rsp
        push rax
        push rbx
        push rcx
        push rdx
        push r8
        push r9
        push r10
        push r11
        push r12
        push r13
        push r14
        push r15
        ; ENTER YOUR CODE HERE, DO NOT MODIFY EXTERNAL CODE
        pop r15
        pop r14
        pop r13
        pop r12
        pop r11
        pop r10
        pop r9
        pop r8
        pop rdx
        pop rcx
        pop rbx
        mov rsp, rbp
        pop rbp
        ret
