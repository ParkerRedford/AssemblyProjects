        global  main
        section .text
main:
        sub     rsp, 8                        ; Reserve the shadow space
        mov     rcx, message                    ; First argument is address of message
        add     rsp, 8                        ; Remove shadow space
        ret
message:
        db      'Hello, World', 0  