.section .text
.global _start
_start:
    la sp, _stack_top
    call main


li x1, 10
li x2, 20
add x3, x1, x2