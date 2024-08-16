;
; Title:		       01-helloworld - Assembler Example
;
; Description:         A program that outputs Hello, World! on the NEO6502
;                      intended to check your environment works with no
;                      issues
; Author:		       Andy McCall, mailme@andymccall.co.uk
;
; Created:		       2024-08-16 @ 14:07
; Last Updated:	       2024-08-16 @ 14:07
;
; Modinfo:
;

.include "../includes/neo6502.asm"

.org $800
.segment "STARTUP"
.segment "INIT"
.segment "ONCE"
.segment "CODE"

   jmp start

start:

    ldx #0                 ; initialize string iteration index
    lda API_FN_WRITE_CHAR  ; console write function        (API::console->write)
    sta API_FUNCTION       ; set API 'Function'            (API::console->write)
print_next_char:
    lda API_COMMAND        ; previous API routine status
    bne print_next_char    ; wait for previous API routine to complete

    lda hello_msg , x      ; next character of 'hello_msg' (API::console->write->char)
    beq end                ; test for string end null byte
    sta API_PARAMETERS + 0 ; set API 'Parameter0'          (API::console->write->char)
    lda API_GROUP_CONSOLE  ; 'Console' API function group  (API::console)
    sta API_COMMAND        ; trigger 'Console' API routine (API::console)

    inx                    ; increment iteration index
    jmp print_next_char    ; continue 'hello_msg' print loop
end:
    jmp end                ; infinite loop


hello_msg:     .byte "Hello, World!",0