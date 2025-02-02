section .data
    message db 'Hello, WriteConsole!', 0
    messageLen equ $ - message
    bytesWritten dd 0

section .bss
    hConsoleOutput resd 1  ; Reserve a 32-bit value (handle)

section .text
    global _start
    extern _GetStdHandle@4, _WriteConsoleA@20, _ExitProcess@4

_start:
    ; Get handle to console output (STD_OUTPUT_HANDLE = -11)
    push -11                    ; STD_OUTPUT_HANDLE
    call _GetStdHandle@4
    mov [hConsoleOutput], eax    ; Store the handle in hConsoleOutput

    ; Write to console
    push 0                       ; Reserved (NULL)
    push bytesWritten            ; Pointer to number of characters written
    push messageLen              ; Number of characters to write
    push message                 ; Pointer to the message
    push dword [hConsoleOutput]        ; Handle to console output (dereference the pointer)
    call _WriteConsoleA@20

    ; Exit the process
    push 0
    call _ExitProcess@4