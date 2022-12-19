100 REM ____________________________________ MSX-Project
105 COLOR 15,1,1:SCREEN 2,0,0 'Définition écran
110 GOSUB 2000 'Appel définition Sprite

190 VITESSE = 2 : X=10+VITESSE : Y=10+VITESSE : S=0 'Initialisation variables de départ

200 REM ____________________________________Affichage cadre et décor.
205 FOR AA=0 TO VITESSE-1
210 LINE (8+AA,8+AA)-(239-AA, 176-AA),15,B 'cadre
215 NEXT AA
220 LINE (8,32)-(199, 39),15,BF 'plateforme
230 LINE -(192,65),15,BF 'mur
240 LINE (127,78)-STEP(-41,9),15,BF 'plateforme 2
250 LINE -STEP(9,-35),15,BF
260 LINE (127,127)-(120,120),5,BF
270 LINE (24,86)-(47,111),8,BF

295 REM ____________________________________Début de la boucle principale
300 A=X : B=Y :C=STICK(0) 'Variables, on sauve X,Y et on sauve STICK(0)
305 IF C <> 0 THEN S=1-S
310 X=X+ VITESSE*(C>5 AND C<9) - VITESSE*(C>1 AND C<5): Y=Y+ VITESSE*(C=8 OR C=1 OR C=2) - VITESSE*(C>3 AND C<7)'Calcul Déplacement Joueur
320 P=(POINT (X+3,Y))+(POINT(X+7,Y+3)) + ( POINT (X+3,Y+7)) + (POINT (X,Y+3))'Test pixel

330 REM ____________________ici il faudra mettre le test pour les autres couleurs

400 IF P=18 THEN X=A :Y=B 'Si collision avec décor on restaure X et Y

410 IF P=8 THEN GOTO 900 ' Si cube bleu
420 IF p=11 THEN GOTO 950 ' Si cube rouge


700 PUT SPRITE 0,(X,Y-1),13,S

800 GOTO 300 ' Fin de la boucle

900 screen 0,0,0 : color 2,0 : print "Cube Bleu";P : END

950 screen 0,0,0 : color 2,0 : print "Cube Rouge";P : END

1000 Rem ____________________________________ Data Sprites
1005 DATA 18,99,7E,BD,7E,3C,DB,18
1020 DATA 00,18,7E,BD,7E,BD,5A,81
1030 DATA *

2000 Rem ____________________________________ Définition Sprites
2005 S=BASE(9)
2010 READ R$
2020 IF R$="*" THEN RETURN ELSE VPOKE S,VAL("&H"+R$):S=S+1
2030 GOTO 2010