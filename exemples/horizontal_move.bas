100 REM ____________________________________ MSX-Project
105 COLOR 15,1,1:SCREEN 2,0,0 'Définition écran
110 GOSUB 2000 'Appel définition Sprite

190 VITESSE = 2 : X=10+VITESSE : Y=10+VITESSE : S=0 : J=0 'Initialisation variables de départ

200 REM ____________________________________Affichage cadre et décor.
205 FOR AA=0 TO VITESSE-1
210 LINE (8+AA,8+AA)-(239-AA, 176-AA),15,B 'cadre
215 NEXT AA
220 LINE (8,160)-(239, 176),15,BF 'plateforme

295 REM ____________________________________Début de la boucle principale
300 A=X : B=Y :C=STICK(0) 'Variables, on sauve X,Y et on sauve STICK(0)
305 IF C <> 0 THEN J=1-J
310 X=X+ VITESSE*(C>5 AND C<9) - VITESSE*(C>1 AND C<5): Y=Y+ VITESSE*(C=8 OR C=1 OR C=2) - VITESSE*(C>3 AND C<7)'Calcul Déplacement Joueur
320 P=(POINT (X+3,Y))+(POINT(X+7,Y+3)) + ( POINT (X+3,Y+7)) + (POINT (X,Y+3))'Test pixel

330 REM ____________________ici il faudra mettre le test pour les autres couleurs

400 IF P=18 THEN X=A :Y=B 'Si collision avec décor on restaure X et Y

410 IF P=8 THEN GOTO 900 ' Si cube bleu
420 IF p=11 THEN GOTO 950 ' Si cube rouge


700 PUT SPRITE 0,(X,Y),8,S
710 PUT SPRITE 1,(X + 8,Y ),8,S + 1
720 PUT SPRITE 2,(X,Y + 8),15,S + 2
730 PUT SPRITE 3,(X + 8,Y + 8),15,S + 3
740 PUT SPRITE 4,(X,Y + 16),15,S + 4
750 PUT SPRITE 5,(X + 8,Y + 16),15,S + 5
760 PUT SPRITE 6,(X,Y + 24),15,(J * 2) + 6
770 PUT SPRITE 7,(X + 8,Y + 24),15,(J * 2)  + 7 

800 GOTO 300 ' Fin de la boucle

900 screen 0,0,0 : color 2,0 : print "Cube Bleu";P : END

950 screen 0,0,0 : color 2,0 : print "Cube Rouge";P : END

1000 Rem ____________________________________ Data Sprites
1005 DATA 00,00,11,A7,7F,3F,7F,FF
1006 DATA 00,8A,9B,FF,FF,FF,FF,FF

1007 DATA FF,FE,FD,7B,07,3F,3F,3F
1008 DATA FF,00,FE,FE,CC,FE,FE,FE

1010 DATA 3F,3F,1F,0F,1C,1D,1D,1D
1011 DATA E2,FE,FC,F8,04,F4,F4,F4

1012 DATA 1D,1D,1D,0D,01,07,07,07
1013 DATA F4,F4,F4,F0,F8,38,38,BC

1014 Rem ____________________________________ Anim jambes qui bougent
1015 DATA 1D,1D,1D,0D,03,07,0E,0F
1016 DATA F4,F4,F4,F4,F0,3A,1E,0C


1100 DATA *
2000 Rem ____________________________________ Définition Sprites
2005 S=BASE(9)
2010 READ R$
2020 IF R$="*" THEN RETURN ELSE VPOKE S,VAL("&H"+R$):S=S+1
2030 GOTO 2010