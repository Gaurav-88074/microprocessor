.MODEL SMALL
.DATA
    inputMessage  DB    'Enter The Number : $'
    outputMessage DB    'Your Number is : $'
.CODE
.STARTUP
    ;Printing input message
    MOV     DX,  OFFSET inputMessage
    MOV     AH,   09H
    INT     21H

    ;Taking input from user
    mov     AH,01H
    INT     21H

    ;BL = AL (safe side purpose)
    Mov     BL,AL
    
    ;printing "\n"
    mov     AH,02H
    INT     21H

    ;Printing output message
    MOV     DX,   OFFSET outputMessage
    MOV     AH,   09H
    INT     21H

    MOV     DL,BL
    ;Printing value present in DL
    mov     AH,02H
    INT     21H


.EXIT
END
