5 ' Programme de dessin avec un sprite hard
10 COLOR 15,1,4: SCREEN 2
20 LINE (40,40)-(215,151),7,B
30 FOR I=0 TO 255
40 A=INT(RND(1)*173)+41
50 B=INT(RND(1)*109)+41
55 C=INT(RND(1)*14)+1
60 PRESET(A,B),C
80 NEXT I
85 CIRCLE (127,95),50,,,,1.4
87 CIRCLE (127,95),50,2,,,1
88 CIRCLE (127,95),50,5,,,0.7
90 ' Génération du sprite
95 C=0
100 FOR I=1 TO 8
110 READ L: A$=A$+CHR$(L): READ L: B$=B$+CHR$(L)
120 NEXT
130 SPRITE$(0)=A$: SPRITE$(1)=B$
140 PUTSPRITE 0,(X,Y): PUTSPRITE 1,STEP(0,0): PSET STEP(0,1)
150 IF STRIG(0) THEN C=C+1: COLOR C: VDP(1)=VDP(1) AND 254 ' Sprite size normal
160 IF NOT PEEK(&HFBED) AND 32 THEN Y=Y+(Y>-1)
170 IF NOT PEEK(&HFBED) AND 128 THEN X=X-(X<255)
180 IF NOT PEEK(&HFBED) AND 64 THEN Y=Y-(Y<210)
190 IF NOT PEEK(&HFBED) AND 16 THEN X=X+(X>0)
200 IF NOT PEEK(&HFBED) AND 2 THEN CLS: COLOR 11: VDP(1)=VDP(1)OR 1 ' Sprite size doubled
210 GOTO 140
220 ' Sprite patterns
230 DATA &B01111100,&B00000000
240 DATA &B11111100,&B01111000
250 DATA &B10111000,&B01110000
260 DATA &B10011100,&B01111000
270 DATA &B10101110,&B01011100 
280 DATA &B11010111,&B00001110
290 DATA &B00001010,&B00000100
300 DATA &B00000100,&B00000000