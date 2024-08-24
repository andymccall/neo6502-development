;
; Title:		       03-clrscr - Assembler Example
;
; Description:         A program that clears the console on
;                      the NEO6502
;                      
; Author:		       Andy McCall, mailme@andymccall.co.uk
;
; Created:		       2024-08-23 @ 18:51
; Last Updated:	       2024-08-23 @ 18:51
;
; Modinfo:
;

.include "includes/neo6502.asm"

.org $800
.segment "STARTUP"

start:

;   Clear the screen
    lda #$c
    sta $FF01
    lda #$2
    sta $FF00