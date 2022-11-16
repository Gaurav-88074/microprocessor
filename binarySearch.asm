.MODEL SMALL
.DATA
    MESSAGE1 DB  'ENTER THE SIZE OF ARRAY : $'
    MESSAGE2 DB  'ENTER ELEMENT :$'

    MESSAGE3 DB  'ELEMENT FOUND!!$'
    MESSAGE4 DB  'ELEMENT NOT FOUND!!$'
    MESSAGE9 DB  'WE ARE IN ENDGAME NOW!!$'

    GOINTLEFT  DB 'GOING LEFT $'
    GOINTRIGHT DB 'GOING RIGHT $'

    LEN      DW  ?
    ARRAY    DB 10 DUP(?)
    KEY      DB ?

    LEFT     DB ?
    RIGHT    DB ?

    MID      DB ?
    MID_V    DB ?
.CODE
.STARTUP
    ;-----------
    MOV KEY,5
    ;-----------

    ;PRINTING MESSAGE 1
    MOV DX, OFFSET MESSAGE1
    MOV AH, 09H
    INT 21H

    ;TAKING INPUT FROM USER
    MOV AH,01H
    INT 21H

    ;INSERTING THAT VALUE INTO LEN
    MOV AH , 00H
    SUB AL , 30H

    MOV LEN ,AX

    ;PRINTING "\n"
    MOV DL,10
    MOV AH,02H
    INT 21H

    ;SI = ADDRESS OF ARRAY
    MOV SI,OFFSET ARRAY
    MOV CX,LEN

    ;MOV TO ELEMENT INPUT
    JMP ELEMENT_INPUT


ELEMENT_INPUT:
    ;PRINTING MESSAGE 2
    MOV DX, OFFSET MESSAGE2
    MOV AH, 09H
    INT 21H

    ;TAKING ELEMNET_INPUT FROM USER
    MOV AH,01H
    INT 21H

    ;A[I] = VALUE
    SUB AL,48
    MOV [SI],AL
    INC SI

    ;PRINTING "\n"
    MOV DL,10
    MOV AH,02H
    INT 21H

    LOOP ELEMENT_INPUT

    ;SETTING SI AGAIN
    MOV SI,OFFSET ARRAY
    MOV CX,LEN

    ;MOVE TO DISPLAY ARRAY
    JMP DISPLAY_ARRAY

DISPLAY_ARRAY:
    ;VALUE = A[I]
    MOV     DL,[SI]
    ADD     DL,48

    ;DISPLAY VALUE OF A[I]
    MOV     AH,02H
    INT     21H

    INC     SI
    
    ;printing " "
    MOV     DL,32
    MOV     AH,02H
    INT     21H

    LOOP DISPLAY_ARRAY

    ;printing "\n"
    MOV     DL,10
    MOV     AH,02H
    INT     21H

    ;LEFT =1
    MOV BH ,1
    MOV LEFT ,BH

    ;RIGHT=LEN
    MOV AX,LEN
    MOV RIGHT,AL

    JMP CALC_MID
CALC_MID:
    ;CL = LEFT
    ;CH = RIGHT
    MOV CL ,LEFT
    MOV CH ,RIGHT

    ;CHECING WHETHER LEFT>RIGHT 
    CMP CL,CH
    JA NOT_FOUND
    

    ;CH-CL
    SUB CH,CL

    ; AL = BH
    MOV AL,CH

    ;CH = 2
    MOV BH,2

    ; XOR DX,DX
    ; AL/=BH
    DIV BH
    
    ; AL+=LEFT
    ADD AL,LEFT

    ; MID = AL
    MOV MID,AL

    JMP CALC_MID_VALUE
CALC_MID_VALUE:
    MOV AL,MID
    MOV AH,00H
    MOV SI,OFFSET ARRAY
    DEC SI

    ADD SI,AX

    MOV BH,[SI]
    MOV MID_V , BH

    JMP CHECK
    
CHECK:
    MOV AL,KEY

    ; ;DISPLAYING DL VALUE
    ; MOV DL,AL
    ; ADD DL,48
    ; MOV     AH,02H
    ; INT     21H

    MOV CL,MID_V

    ; ; DISPLAYING DL VALUE
    ; MOV DL,CL
    ; ADD DL,48
    ; MOV AH,02H
    ; INT 21H
    ; ;printing "\N"
    ; MOV     DL,10
    ; MOV     AH,02H
    ; INT     21H
    

    CMP CL,AL

    ;IF BL>BH GOTO LEFT
    ;IF BL<BH GOTO RIGHT

    JE FOUND
    JA GOTO_LEFT
    JB GOTO_RIGHT

    JMP FINAL
GOTO_LEFT:
    ; MOV DX, OFFSET GOINTLEFT
    ; MOV AH, 09H
    ; INT 21H

    ; ;printing "\N"
    ; MOV     DL,10
    ; MOV     AH,02H
    ; INT     21H

    MOV AL,MID
    DEC AL
    MOV RIGHT,AL
    JMP CALC_MID
GOTO_RIGHT:
    ; MOV DX, OFFSET GOINTRIGHT
    ; MOV AH, 09H
    ; INT 21H

    ; ;printing "\N"
    ; MOV     DL,10
    ; MOV     AH,02H
    ; INT     21H

    MOV AL,MID
    INC AL
    MOV LEFT,AL
    JMP CALC_MID
    ; JMP FINAL
FOUND:
    MOV DX, OFFSET MESSAGE3
    MOV AH, 09H
    INT 21H

    ;printing "\N"
    MOV     DL,10
    MOV     AH,02H
    INT     21H

    JMP FINAL
NOT_FOUND:
    MOV DX, OFFSET MESSAGE4
    MOV AH, 09H
    INT 21H

    ;printing "\N"
    MOV     DL,10
    MOV     AH,02H
    INT     21H

    JMP FINAL
FINAL:
    MOV DX, OFFSET MESSAGE9
    MOV AH, 09H
    INT 21H

    ;printing "\N"
    MOV     DL,10
    MOV     AH,02H
    INT     21H

.EXIT
END



; ROUGH:
;     MOV LEFT,1
;     MOV AX,LEN
;     MOV RIGHT,AL
;     ; DEC RIGHT
;     ;ADD RIGHT = LEFT + RIGHT
;     MOV CH,LEFT
;     MOV CL,RIGHT
;     ADD CL,CH

;     MOV AL,CL
    
;     MOV CH,2

;     DIV CH;(AL/=CH)
;     MOV MID,AL

;     ;FETCHING FROM ARRAY
;     MOV SI,OFFSET ARRAY
;     MOV CH,00H
;     MOV CL,MID
;     ; SI+=CL
;     ADD SI,CX

;     ;ASSIGNING TO MID
;     DEC SI
;     MOV CH,[SI] ;MID = S[I]
;     MOV MID,CH

;     ;MAKING INTO CHAR
;     ADD MID,48
;     MOV DL,MID

;     ;DISPLAYING DL VALUE
;     MOV     AH,02H
;     INT     21H