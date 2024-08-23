;
; Title:		       00-firstprg - Assembler Example
;
; Description:     A program that does nothing for the NEO6502
;                  intended to check your environment works with no
;                  issues
; Author:		    Andy McCall, mailme@andymccall.co.uk
;
; Created:		    2024-08-16 @ 14:07
; Last Updated:	 2024-08-16 @ 14:07
;
; Modinfo:
;

.include "includes/neo6502.asm"

.org $800
.segment "STARTUP"

   jmp start

start:
    jmp start