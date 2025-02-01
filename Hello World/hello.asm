section .data
    hello db "Hello, World!", 10, 0  ; Null-terminated string with newline

section .text
    global main
    extern printf  ; Import printf from C library

main:
    sub rsp, 40        ; Allocate shadow space (Windows x64 ABI requirement)
    lea rcx, [rel hello]  ; Ensure RIP-relative addressing (64-bit safe)
    call printf        ; Call printf function
    add rsp, 40        ; Restore stack

    xor eax, eax       ; Return 0
    ret