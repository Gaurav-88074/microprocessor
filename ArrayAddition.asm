;#taking array as a input
.MODEL SMALL
.DATA 
    ARRAY1 DB 10 DUP(?)
    ARRAY2 DB 10 DUP(?)
    LEN    DW ?

    MESSGAGE1 DB 'ENTER THE SIZE OF ARRAY 1 : $'
    MESSGAGE2 DB 'ENTER ELEMENT : $'
    MESSGAGE3 DB 'DISPLAYING YOUR ARRAY : $'
    MESSGAGE4 DB 'ENTER THE SIZE OF ARRAY 2 : $'
    MESSGAGE5 DB 'DISPLAYING ARRAY AFTER PERFORMING ADDITION : $'

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
    MOV     SI,OFFSET ARRAY1
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
    MOV     SI,OFFSET ARRAY1
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

    ;printing "\n"
    MOV     DL,10
    MOV     AH,02H
    INT     21H

    JMP     PHASE2

PHASE2:
    ;printing "\n"
    MOV     DL,10
    MOV     AH,02H
    INT     21H

    ;Printing input message
    MOV     DX,  OFFSET MESSGAGE4
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
    MOV     SI,OFFSET ARRAY2
    MOV     CX, LEN
INPUT1:
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

    LOOP    INPUT1

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
    MOV     SI,OFFSET ARRAY2
    MOV     CX, LEN
    
ELEMENT1:
    MOV     DL,[SI]
    mov     AH,02H
    INT     21H
    INC     SI
    
    ;printing " "
    MOV     DL,32
    MOV     AH,02H
    INT     21H

    LOOP ELEMENT1

    ;printing "\n"
    MOV     DL,10
    MOV     AH,02H
    INT     21H

    JMP ADDITON
ADDITON:
    ;ASSIGNING INITIAL ADRESSES
    MOV     SI,OFFSET ARRAY1
    MOV     DI,OFFSET ARRAY2
    MOV     CX, LEN

    JMP ADDTASK

ADDTASK:
    MOV AL,[SI]
    ; SUB [DI],AL
    ADD [DI],AL
    ; MUL [DI],AL
    INC SI
    INC DI
    LOOP ADDTASK


    ;---------------------
    ;printing "\n"
    MOV     DL,10
    MOV     AH,02H
    INT     21H

    ;Printing  message5
    MOV     DX,  OFFSET MESSGAGE5
    MOV     AH,   09H
    INT     21H
    
    ;--------------------------


    ;SI = ADDRESS OF ARRAY
    MOV     SI,OFFSET ARRAY2
    MOV     CX, LEN

    JMP FINAL
FINAL:
    
    MOV     DL,[SI]

    SUB     DL,48

    mov     AH,02H
    INT     21H
    INC     SI
    
    ;printing " "
    MOV     DL,32
    MOV     AH,02H
    INT     21H

    LOOP FINAL
.EXIT
END
