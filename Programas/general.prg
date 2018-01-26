******************************************************************************************************
******************************************************************************************************
FUNCTION SeparaMiles (p_numeroAT)
		* Armo el total en caracteres
		sm_total   = ALLTRIM(STRTRAN(ALLTRIM(STR(p_numeroAT,18,2)),".",","))
		sm_tamanio = LEN(sm_total)-3
		sm_totalc  = ""
		sm_totalc = sm_totalc + RIGHT(sm_total,3) 
		pos = 4
		punto = 0
		DO WHILE sm_tamanio > 0
			sm_totalc = SUBSTR(RIGHT(sm_total,pos),1,1) + sm_totalc
			punto = punto + 1
			pos   = pos + 1
			IF punto = 3 THEN 
				punto = 0
				sm_totalc = "." + sm_totalc
			ENDIF 
			
			sm_tamanio = sm_tamanio  - 1 
		ENDDO 
		IF SUBSTR(sm_totalc,1,1)=='.'
			sm_totalc = SUBSTR(sm_totalc,2)
		ENDIF 
	
		p_numeroTRANS = sm_totalc

	RETURN p_numeroTRANS
ENDFUNC

******************************************************************************************************
******************************************************************************************************
FUNCTION IsTag (tcTagName, tcAlias)
  *-- Recibe un nombre de etiqueta y un alias (que es opcional) como
  *-- parámetros y devuelve .T. si el nombre de etiqueta existe en
  *-- el alias. Si no se pasa ningún alias, se asume el alias actual.
  LOCAL llIsTag, ;
        lcTagFound

  IF PARAMETERS() < 2
    tcAlias = ALIAS()
  ENDIF
  
  IF EMPTY(tcAlias)
    RETURN .F.
  ENDIF

  llIsTag = .F.
  tcTagName = UPPER(ALLTRIM(tcTagName))

  lnTagNum = 1
  lcTagFound = TAG(lnTagNum, tcAlias)
  DO WHILE !EMPTY(lcTagFound)
    IF UPPER(ALLTRIM(lcTagFound)) == tcTagName
      llIsTag = .T.
      EXIT
    ENDIF
    lnTagNum = lnTagNum + 1
    lcTagFound = TAG(lnTagNum, tcAlias)
  ENDDO

  RETURN llIsTag
ENDFUNC



******************************************************************************************************
******************************************************************************************************
PROCEDURE enletras
parameters numero1

N=""
N1="UN"
N2="DOS"
N3="TRES"
N4="CUATRO"
N5="CINCO"
N6="SEIS"
N7="SIETE"
N8="OCHO"
N9="NUEVE"
N10="DIEZ"
N11="ONCE"
N12="DOCE"
N13="TRECE"
N14="CATORCE"
N15="QUINCE"
N16="DIECISEIS"
N17="DIECISIETE"
N18="DIECIOCHO"
N19="DIECINUEVE"
N20="VEINTE"
N30="TREINTA"
N40="CUARENTA"
N50="CINCUENTA"
N60="SESENTA"
N70="SETENTA"
N80="OCHENTA"
N90="NOVENTA"
NCCC="CIEN"
N100="CIENTO"
N200="DOSCIENTOS"
N300="TRESCIENTOS"
N400="CUATROCIENTOS"
N500="QUINIENTOS"
N600="SEISCIENTOS"
N700="SETECIENTOS"
N800="OCHOCIENTOS"
N900="NOVECIENTOS"
* /////// *
cadena1 = STR(numero1,12,2)
cadena = SUBSTR(cadena1,1,9)
numero = VAL(cadena)
cadena = STR(NUMERO,9)
nump = " "
otro = 0
do while otro <= 1
	contador = 1
	inicio = 1
	do while contador < 4
		subcadena = SUBSTR(cadena,inicio,3)
		centena = SUBSTR(subcadena,1,1)+'00'
		decena = SUBSTR(subcadena,2,2)
		unidad = SUBSTR(subcadena,3,1)
		IF VAL(subcadena) > 99
			IF VAL(subcadena) = 100 THEN
			nump = nump+NCCC+' '
			ELSE
			nump = nump + N&centena+' '
			ENDIF
		ENDIF
		T = VAL(decena)
		IF T > 0
		do case
		
			*****caso 1 : Decenas sin unidades o de 10 a 20.*********
			
			case (int(T/10.0)=T/10.0) .or. (T>9	.and. T<20)
				nump = nump + N&decena
				
			*****caso 2 : Decenas mayores de 10 pero con unidades*********	
			
			case (T > 9) .and. (INT(T/10.0) <> T/10.0)
				decena = SUBSTR(decena,1,1)+'0'
				IF decena <> '20'
					nump = nump+N&decena+' Y '+N&unidad	
				ELSE
					nump = nump+'VEINTI'+N&unidad
				ENDIF
			
			*****caso 3 : Si no hay decenas**********
			
			case T < 10
				nump = nump+N&unidad
			endcase
		ENDIF
		IF numero > 999999 .and. contador = 1
			nump = nump+' MILLONES '
		ENDIF
		
		IF nump = " UN MILLONES "
			nump = " UN MILLON "
		ENDIF
		
		IF (numero > 999 .and. contador = 2 .and. VAL(subcadena) > 0 ) THEN
			nump = nump +' MIL '
		ENDIF
		IF nump = " UN MIL "
			nump = " MIL "
		ENDIF
		
		inicio = contador * 3 + 1
		contador = contador + 1
	ENDDO
contador = 1
inicio = 1
cadena = '       '+SUBSTR(cadena1,11,2)
numero = VAL(cadena)
if otro = 0
	nump = nump+" PESOS CON "
endif
IF numero = 0 THEN
	nump = nump+"CERO"
	otro = 2
ELSE
otro = otro + 1
ENDIF
ENDDO
******DELETREA EL NUMERO*******
nump =  nump+" CENTAVOS "				
return nump



******************************************************************************************************
******************************************************************************************************
FUNCTION NOMBREMES
PARAMETER NMES
DO CASE
	CASE NMES = 1
		RETURN "Enero"
	CASE NMES = 2
		RETURN "Febrero"
	CASE NMES = 3
		RETURN "Marzo"
	CASE NMES = 4
		RETURN "Abril"
	CASE NMES = 5
		RETURN "Mayo"
	CASE NMES = 6
		RETURN "Junio"
	CASE NMES = 7
		RETURN "Julio"
	CASE NMES = 8
		RETURN "Agosto"
	CASE NMES = 9
		RETURN "Setiembre"
	CASE NMES = 10
		RETURN "Octubre"
	CASE NMES = 11
		RETURN "Noviembre"
	CASE NMES = 12
		RETURN "Diciembre"
	OTHERWISE RETURN ""
ENDCASE



******************************************************************************************************
******************************************************************************************************
FUNCTION CIERRAAPP
CLOSE ALL 
CLOSE TABLES ALL 
SET SAFETY OFF 
SET DEFAULT TO C:\
CLEAR EVENTS 
CLEAR DLLS
RELEASE ALL EXTENDED
QUIT
RETURN



******************************************************************************************************
******************************************************************************************************
FUNCTION CAMBIAUSUARIO
	DO FORM LOGIN TO LOGEO		
	IF LEN(ALLTRIM(LOGEO)) = 0 THEN
		CLOSE ALL
		CLEAR READ
		QUIT
	ENDIF
RETURN



******************************************************************************************************
******************************************************************************************************
FUNCTION codigocuenta
PARAMETERS ELCODIGO
RETORNO = ALLTRIM(STRTRAN(ELCODIGO,".",""))
CANTCAR = LEN(ALLTRIM(RETORNO))
IF !(MOD(CANTCAR,2) = 0) THEN 
	RETORNO = ALLTRIM(RETORNO)+"0"
	CANTCAR = CANTCAR+1
ENDIF
RETORNA = ""
FOR I = 1 TO CANTCAR
	IF MOD(I,2)=0 AND I > 1 THEN
		RETORNA = RETORNA + SUBSTR(RETORNO,I-1,2)+"."
	ENDIF
ENDFOR
RETORNA = SUBSTR(RETORNA,1,LEN(ALLTRIM(RETORNA))-1)
RETURN RETORNA



******************************************************************************************************
******************************************************************************************************
FUNCTION SETMP
PARAMETERS setmpcod
DO CASE 

*** PRINTER OPERATION ***
	CASE setmpcod= 64
		v_char=CHR(27)+"@" 			&& ESC @ - Initialize Printer

	CASE setmpcod= 17
		v_char=CHR(17)  			&& DC1   - Select Printer

	CASE setmpcod= 19
		v_char=CHR(19)  			&& DC2   - Deselect Printer

	CASE setmpcod= 115
		v_char=CHR(27)+"s" 			&& ESC s - Turn Half-speed Mode On/Off 

	CASE setmpcod= 60
		v_char=CHR(27)+"<" 			&& ESC < - Select Uniderectional Mode (On Line)

	CASE setmpcod= 85
		v_char=CHR(27)+"U" 			&& ESC U - Turn Unidirectional Mode On/Off
		
	CASE setmpcod= 56
		v_char=CHR(27)+"8" 			&& ESC 8 - Disable Paper Out Detection

	CASE setmpcod= 57
		v_char=CHR(27)+"9" 			&& ESC 9 - Enable Paper Out Detection

	CASE setmpcod= 25
		v_char=CHR(25) 			    && ESC EM - Turn Cut Sheet Feeder Mode On/Off
		
	CASE setmpcod= 7
		v_char=CHR(7)   			&& BEL    - Beeper

*** DATA CONTROL ***
	CASE setmpcod= 13
		v_char=CHR(13) 			&& CR - RETORNO DE CARRO

	CASE setmpcod= 24
		v_char=CHR(24) 			&& CAN - Cancel Line

	CASE setmpcod= 127
		v_char=CHR(127) 		&& DEL - Delete Character
		
*** VERTICAL MOTION ***		
	CASE setmpcod= 12
		v_char=CHR(12)			&& FF    - Form Feed 
	
	CASE setmpcod= 67
		v_char=CHR(27)+"C"		&& ESC C n - Set Page Length in Lines -- ESC C 0 n - Set Page Length in Inches

	CASE setmpcod= 10
		v_char=CHR(10)			&& LF    - Line Feed

	CASE setmpcod= 48
		v_char=CHR(27)+"0"		&& ESC 0 - Select 1/8-inch Line Spacing

	CASE setmpcod= 49
		v_char=CHR(27)+"1"		&& ESC 1 - Select 7/72-inch Line Spacing

	CASE setmpcod= 50
		v_char=CHR(27)+"2"		&& ESC 2 - Select 1/6 -inch Line Spacing
	
	CASE setmpcod= 51
		v_char=CHR(27)+"3"		&& ESC 3 - Select n/216-inch Line Spacing

	CASE setmpcod= 65
		v_char=CHR(27)+"A"		&& ESC A - Select n/216-inch Line Spacing

	CASE setmpcod= 74
		v_char=CHR(27)+"J"		&& ESC J - Select n/216-inch Line Feed

*** PRINT SIZE AND CHARACTER WIDTH ***
	CASE setmpcod= 15
		v_char=CHR(15)			&& ESC SI - Select Condensed Mode

	CASE setmpcod= 18
		v_char=CHR(18)			&& DC2    - Cancel Condensed Mode 

	CASE setmpcod= 14
		v_char=CHR(14)			&& ESC SO - Select Double-wide Mode (on line)

	CASE setmpcod= 20
		v_char=CHR(20)			&& DC4    - Cancel Double-wide Mode (on line)

	CASE setmpcod= 80
		v_char=CHR(27)+"P"		&& ESC P  - Select 10 cpi

	CASE setmpcod= 77
		v_char=CHR(27)+"M"		&& ESC M  - Select 12 cpi

*** PRINT ENHACEMENT ****
	CASE setmpcod= 69
		v_char=CHR(27)+"E"		&& ESC E - Select Emphasized Mode (Negrita)

	CASE setmpcod= 70
		v_char=CHR(27)+"F"		&& ESC F - Cancel Emphasize Mode (Negrita)

	CASE setmpcod= 52
		v_char=CHR(27)+"4"		&& ESC 4 - Select Italic Mode

	CASE setmpcod= 53
		v_char=CHR(27)+"5"		&& ESC 5 - Cancel Italic Mode

*** CHARACTER TABLES ***
	CASE setmpcod= 116
		v_char=CHR(27)+"t1"	    && ESC t - Select Character tables

	CASE setmpcod= 82
		v_char=CHR(27)+"R7"	    && ESC R - Select Internacional Character tables

*** OVERALL PRINTING STYLE ***
	CASE setmpcod= 120
		v_char=CHR(27)+"x0"		&& ESC x - Select Near Letter Quality(x1) or Draft(x0)

	CASE setmpcod= 107
		v_char=CHR(27)+"k"		&& ESC k - Select NLQ Font

	CASE setmpcod= 33
		v_char=CHR(27)+"!"		&& ESC ! - Master Select

	OTHERWISE 
ENDCASE 

RETURN v_char

ENDFUNC




