;
; Title:		       05-sprite - Assembler Example
;
; Description:         A program that loads a sprite on the
;                      NEO6502
;                      
; Author:		       Andy McCall, mailme@andymccall.co.uk
;
; Created:		       2025-06-17 @ 17:46
; Last Updated:	       2025-06-17 @ 17:46
;
; Modinfo:
;

.include "includes/neo6502.asm"

.org $800
.segment "STARTUP"

start:

    ldx #0                 ; initialize string iteration index
    lda API_FN_WRITE_CHAR  ; console write function        (API::console->write)
    sta API_FUNCTION       ; set API 'Function'            (API::console->write)
print_next_char:
    lda API_COMMAND        ; previous API routine status
    bne print_next_char    ; wait for previous API routine to complete

    lda hello_msg , x      ; next character of 'hello_msg' (API::console->write->char)
    beq @done       ; test for string end null byte
    sta API_PARAMETERS + 0 ; set API 'Parameter0'          (API::console->write->char)
    lda #API_GROUP_CONSOLE ; 'Console' API function group  (API::console)
    sta API_COMMAND        ; trigger 'Console' API routine (API::console)

    inx                    ; increment iteration index
    jmp print_next_char    ; continue 'hello_msg' print loop
@done:
    lda #$0D               ; load the Line Feed character
    sta API_PARAMETERS      ; set it as the character to print
    lda #API_GROUP_CONSOLE  ; select the 'Console' API group
    sta API_COMMAND         ; execute the write command
    jsr load_sprites

load_sprites:

    lda API_FN_LOAD_FILENAME
    sta API_FUNCTION
@wait_api:
    lda API_COMMAND
    bne @wait_api

    ; Set up parameters for Function 2: Load File
    lda #<sprite_file          ; Load low byte of filename address
    sta API_PARAMETERS + 0
    lda #>sprite_file          ; Load high byte of filename address
    sta API_PARAMETERS + 1

    ; Set destination to graphics working memory
    lda #$FF
    sta API_PARAMETERS + 2
    sta API_PARAMETERS + 3

    ; Specify Function 2 (Load File) of Group 3 (File I/O)
    lda #API_FN_LOAD_FILENAME
    sta API_FUNCTION

    ; Execute the command
    lda #API_GROUP_FILEIO
    sta API_COMMAND

@wait_api2:
    lda API_COMMAND
    bne @wait_api2

    lda API_ERROR               ; Load the status code from the last operation
    cmp #0                  ; Compare with the success code (0)
    beq load_success        ; If it's zero, branch to the success handler

load_failed:
    ldx #0                 ; initialize string iteration index
    lda API_FN_WRITE_CHAR  ; console write function        (API::console->write)
    sta API_FUNCTION       ; set API 'Function'            (API::console->write)
@print_next_char:
    lda API_COMMAND        ; previous API routine status
    bne @print_next_char    ; wait for previous API routine to complete

    lda failed_msg , x      ; next character of 'hello_msg' (API::console->write->char)
    beq end                ; test for string end null byte
    sta API_PARAMETERS + 0 ; set API 'Parameter0'          (API::console->write->char)
    lda #API_GROUP_CONSOLE  ; 'Console' API function group  (API::console)
    sta API_COMMAND        ; trigger 'Console' API routine (API::console)

    inx                    ; increment iteration index
    jmp @print_next_char    ; continue 'hello_msg' print loop
    rts

load_success:
    ldx #0                 ; initialize string iteration index
    lda API_FN_WRITE_CHAR  ; console write function        (API::console->write)
    sta API_FUNCTION       ; set API 'Function'            (API::console->write)
@print_next_char:
    lda API_COMMAND        ; previous API routine status
    bne @print_next_char    ; wait for previous API routine to complete

    lda success_msg , x      ; next character of 'hello_msg' (API::console->write->char)
    beq end                ; test for string end null byte
    sta API_PARAMETERS + 0 ; set API 'Parameter0'          (API::console->write->char)
    lda #API_GROUP_CONSOLE  ; 'Console' API function group  (API::console)
    sta API_COMMAND        ; trigger 'Console' API routine (API::console)

    inx                    ; increment iteration index
    jmp @print_next_char    ; continue 'hello_msg' print loop

    ; ---------------------------------------------------------------
    ; 2. Set up all parameters for Function 2 (Sprite Set)
    ; ---------------------------------------------------------------
    ; Parameter 0: Sprite Number (we'll use sprite #1)
    lda #1
    sta API_PARAMETERS          ; Sprite Number = 1

    ; Parameter 1,2: X Coordinate (e.g., 150)
    lda #150                ; Low byte of X=150
    sta API_PARAMETERS + 1
    lda #0                  ; High byte of X=150
    sta API_PARAMETERS + 2

    ; Parameter 3,4: Y Coordinate (e.g., 100)
    lda #100                ; Low byte of Y=100
    sta API_PARAMETERS + 3
    lda #0                  ; High byte of Y=100
    sta API_PARAMETERS + 4

    ; Parameter 5: Image Index (use the 3rd image from graphics.gfx)
    lda #1                  ; Image Index = 2
    sta API_PARAMETERS + 5

    ; Parameter 6: Flip and Anchor (default: no flip, default anchor)
    lda #0
    sta API_PARAMETERS + 6

    ; Parameter 7: Flags (default: 16x16 sprite)
    lda #0                  ; Bit 0 = 0 for 16x16
    sta API_PARAMETERS + 7

    ; ---------------------------------------------------------------
    ; 3. Execute the command: Function 2, Group 5 (Sprite/Bitmap)
    ; ---------------------------------------------------------------
    lda #API_FN_SPRITE_SET                      ; Function 2: Sprite Set
    sta API_FUNCTION
    lda #API_GROUP_SPRITES     ; Group 5: Sprite/Bitmap
    sta API_COMMAND             ; GO!

end:
    jmp end                ; infinite loop

; Define filename and its location in memory
sprite_file:    .byte 12, "graphics.gfx" ; Length byte (12) followed by the filename
hello_msg:      .asciiz "Sprite demo"

failed_msg:     .asciiz "Failed loading graphics.gfx"
success_msg:    .asciiz "Loading graphics.gfx"