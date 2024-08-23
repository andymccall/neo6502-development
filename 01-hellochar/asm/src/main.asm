;
; Title:		   01-hellochar - Assembler Example
;
; Description:     A program that prints a character to the console of
;                  the NEO6502.
;
; Author:		   Andy McCall, mailme@andymccall.co.uk
;
; Created:		   2024-08-23 @ 11:00
; Last Updated:	   2024-08-23 @ 11:00
;
; Modinfo:
;

.include "includes/neo6502.asm"

.org $800
.segment "STARTUP"

   jmp start

start:

    lda API_FN_WRITE_CHAR  ; console write function        (API::console->write)
    sta API_FUNCTION       ; set API 'Function'            (API::console->write)
    lda API_COMMAND        ; previous API routine status
   
    lda #$4E               ; Place 'N' character in the acumulator (API::console->write->char)

    sta API_PARAMETERS + 0 ; set API 'Parameter0'          (API::console->write->char)
    lda #API_GROUP_CONSOLE ; 'Console' API function group  (API::console)
    sta API_COMMAND        ; trigger 'Console' API routine (API::console)

end:
    jmp end                ; infinite loop