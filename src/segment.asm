section .data
g       dd 256

section .text
global _p, _q, _f

_p:
    ;prologue
    push            ebp                         ;push old frame pointer
    mov             ebp, esp                    ;set new frame pointer
    sub             esp, 4                      ;allocate space for k

    ;body
    mov             ebx, [ebp+8]                ;move i to ebx
    add             ebx, [ebp+12]               ;add i and j
    mov             [ebp-4], ebx                ;store the result on the stack
    shl             ebx, 2                      ;logical shift left
    sub             ebx, 1                      ;subtraction
    mov             eax, ebx                    ;move return value to eax

    ;epilogue
    add             esp, 4                      ;deallocate space for k
    mov             esp, ebp                    ;reset top of stack
    pop             ebp                         ;reset old frame pointer
    ret                                         ;return


_q:
    ;prologue
    push            ebp                         ;push old frame pointer
    mov             ebp, esp                    ;set new frame pointer

    ;body
    mov             ebx, [ebp+8]                ;load i
    neg             ebx                         ;negate i
    push            ebx                         ;push the first parameter
    mov             ebx, [g]                    ;load g
    push            ebx                         ;push the second parameter
    call            _p                          ;function call
    add             esp, 8                      ;remove parameters from stack

    ;epilogue
    mov             esp, ebp                    ;reset top of stack
    pop             ebp                         ;reset old frame pointer
    ret                                         ;return


_f
    ;prologue
    push            ebp                         ;push old frame pointer
    mov             ebp, esp                    ;set new frame pointer
    sub             esp, 4                      ;declare local variable

    ;body
    mov             ebx, [ebp+8]                ;load n
    cmp             ebx, 0                      ;compare with 0
    jle             else1                       ;if statement
    ;if
    mov             [ebp-4], ebx                ;store n
    dec             ebx                         ;n-1
    push            ebx                         ;push parameter
    call            _f                          ;f(n-1)
    add             esp, 4                      ;remove parameter from stack
    mov             ebx, [ebp-4]                ;get stored variable
    imul            eax, ebx                    ;n*f(n-1)
    jmp             end1                        ;jump to end
else1:
    ;else
    mov             eax, 1
end1:

    ;epilogue
    add             esp, 4                      ;remove local variable
    mov             esp, ebp                    ;reset top of stack
    pop             ebp                         ;reset old frame pointer
    ret                                         ;return
