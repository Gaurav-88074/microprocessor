;#taking array as a input
.MODEL SMALL
.DATA 
    ARRAY DB 10 DUP(?)
    LEN   DW ?

    MESSGAGE1 DB 'ENTER THE SIZE OF ARRAY : $'
    MESSGAGE2 DB 'ENTER ELEMENT : $'
    MESSGAGE3 DB 'DISPLAYING YOUR ARRAY : $'

.CODE

.STARTUP
    ;Printing input message
    MOV     DX,  OFFSET MESSGAGE1
    MOV     AH,   09H
    INT     21H

    ;Taking input from user
    mov     AH,01H
    INT     21H

    ;---------------------
    MOV     AH,   00H
    ; SUB     AL,   30H ;OR
    SUB     AL,   48
    MOV     LEN,  AX
    ;---------------------

    ;printing "\n"
    MOV     DL,10
    MOV     AH,02H
    INT     21H

    ;SI = ADDRESS OF ARRAY
    MOV     SI,OFFSET ARRAY
    MOV     CX, LEN
INPUT:
    ;Printing input message
    MOV     DX , OFFSET MESSGAGE2
    MOV     AH,   09H
    INT     21H

    MOV     AH,01H
    INT     21H

    ;BL = AL (safe side purpose)
    MOV     BL,AL

    ;printing "\n"
    MOV     DL,10
    MOV     AH,02H
    INT     21H
    
    MOV     [SI],BL
    INC     SI

    LOOP    INPUT

    ;---------------------
    ;Printing input message
    MOV     DX,  OFFSET MESSGAGE3
    MOV     AH,   09H
    INT     21H

    ;printing " "
    MOV     DL,32
    MOV     AH,02H
    INT     21H
    
    ;--------------------------
    ;SI = ADDRESS OF ARRAY
    MOV     SI,OFFSET ARRAY
    MOV     CX, LEN
    
ELEMENT:
    MOV     DL,[SI]
    mov     AH,02H
    INT     21H
    INC     SI
    
    ;printing " "
    MOV     DL,32
    MOV     AH,02H
    INT     21H

    LOOP ELEMENT


.EXIT
END
