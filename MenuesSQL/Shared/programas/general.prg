******************************************************************
******************************************************************
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
cadena = STR(numero,9)
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

**************************************************************************
**************************************************************************


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
**************************************************************************
**************************************************************************


**************************************************************************
**************************************************************************
** GENERA UNA SALIDA DE ARCHIVO LLAMADO AUDITORIA.AUD CUYA FUNCION ES 
** ALMACENAR Y MANTENER UN REGISTRO DE TODAS LAS OPERACIONES DE ACTUALIZACION
** QUE SE LLEVAN A CABO DENTRO DEL SISTEMA
**************************************************************************

FUNCTION AUDITORIA()
PARAMETER MOV, BASEDATO, TABLA, CONDICION
DIMENSION matauditor(20)
FOR i=1 TO 20 
	matauditor(i) = ""
ENDFOR 
IDMAT = 1
ALIASANT = ALIAS()


varcone = abreycierracon(0,miservidor+"\Maestros\Maestros.dbc")
sqlejec = "select * from auditoria where ALLTRIM(codigo)=='"+ALLTRIM(mov)+"'"
=SQLEXEC(varcone,sqlejec,"curauditor")
= abreycierracon(varcone,"")
SELECT curauditor
MATAUDITOR(IDMAT) = MATAUDITOR(IDMAT)+DTOC(DATE())+";"+TIME()+";"+ALLTRIM(GUSUARIO)+";"+ ;
ALLTRIM(CURAUDITOR.CODIGO)+";"+ALLTRIM(CURAUDITOR.DESCRIPCIO)+";"+ALLTRIM(BASEDATO)+";"+ALLTRIM(TABLA)+";"

SELECT curauditor
USE

IF !EMPTY(basedato) THEN 

	varcone = abreycierracon(0,miservidor+BASEDATO)
	sqlejec = "select * from "+TABLA+" where "+CONDICION
	=SQLEXEC(varcone,sqlejec,"curtabla")
	= abreycierracon(varcone,"")


	SELECT curtabla
	CCAMPO = ""
	FOR I = 1 TO FCOUNT()
		CAMPO = FIELD(I)
		DO CASE
			CASE TYPE(FIELD(I))= "C"
				CCAMPO = CAMPO+"="+ALLTRIM(&CAMPO)
			CASE TYPE(FIELD(I))= "N"
				CCAMPO = CAMPO+"="+ALLTRIM(STR(&CAMPO,10,4))
			CASE TYPE(FIELD(I))= "Y"
				CCAMPO = CAMPO+"="+ALLTRIM(STR(&CAMPO,10,4))
			CASE TYPE(FIELD(I))= "D"
				CCAMPO = CAMPO+"="+ALLTRIM(DTOC(&CAMPO))
			CASE TYPE(FIELD(I))= "T"
				CCAMPO = CAMPO+"="+ALLTRIM(TTOC(&CAMPO))
			CASE TYPE(FIELD(I))= "L"
				IF &CAMPO THEN
					CCAMPO = CAMPO+"=.T."
				ELSE
					CCAMPO = CAMPO+"=.F."
				ENDIF
			CASE TYPE(FIELD(I))= "M"
				IF !(LEN(ALLTRIM(&CAMPO)) >= 255) THEN 
					CCAMPO = CAMPO+"="+ALLTRIM(&CAMPO)
				ELSE
					CCAMPO = CAMPO+"="+SUBSTR(ALLTRIM(&CAMPO),1,254)
				ENDIF
				
			OTHERWISE 
				 CCAMPO = ''
		ENDCASE
		IF LEN(ALLTRIM(matauditor(idmat)))+LEN(ALLTRIM(ccampo)) >= 255 then
			idmat = idmat + 1
		ENDIF
		IF idmat <= 20 THEN 
			matauditor(idmat) = ALLTRIM(matauditor(idmat))+"#"+ALLTRIM(ccampo)
		ENDIF 
	ENDFOR
ELSE

ENDIF 

IF !EMPTY(aliasant) THEN 
	SELECT &ALIASANT
ENDIF 
ARVO = MISERVIDOR+"\AUDITORIA.AUD"
IF FILE(ARVO)  && �Existe el archivo?
	PUNTERO = FOPEN(ARVO,12)  && Si existe, abrir para lectura-escritura
ELSE
	PUNTERO = FCREATE(ARVO)  && Si no, crearlo
ENDIF
IF PUNTERO < 0  && Comprobar si hay error al abrir el archivo
	RETURN .F.
ELSE  && Si no hay error, escribir en archivo
	=FSEEK(PUNTERO,0,2)
	=FPUTS(PUNTERO, ;
MATAUDITOR(1)+MATAUDITOR(2)+MATAUDITOR(3)+MATAUDITOR(4)+MATAUDITOR(5)+MATAUDITOR(6)+ ;	       
MATAUDITOR(7)+MATAUDITOR(8)+MATAUDITOR(9)+MATAUDITOR(10)+MATAUDITOR(11)+MATAUDITOR(12)+MATAUDITOR(13)+ ;
MATAUDITOR(14)+MATAUDITOR(15)+MATAUDITOR(16)+MATAUDITOR(17)+MATAUDITOR(18)+MATAUDITOR(19)+MATAUDITOR(20)+CHR(13))
ENDIF
=FCLOSE(PUNTERO)  && Cerrar archivo
RETURN .T.
**************************************************************************
**************************************************************************


FUNCTION CIERRAAPP
CLOSE ALL 
CLOSE TABLES ALL 
SET SAFETY OFF 
SET DEFAULT TO C:\
*DELETE FILE &MIESTACION\TEMP\*.* &MIPAPELERA 
*RMDIR &MIESTACION\TEMP
*DELETE FILE &MIESTACION\*.* &MIPAPELERA
*RMDIR &MIESTACION
CLEAR EVENTS 
CLEAR DLLS
RELEASE ALL EXTENDED
QUIT
RETURN

**************************************************************************
**************************************************************************
FUNCTION CAMBIAUSUARIO
	DO FORM LOGIN TO LOGEO		
	IF LEN(ALLTRIM(LOGEO)) = 0 THEN
		CLOSE ALL
		CLEAR READ
		QUIT
	ENDIF
RETURN

******************************************************
******************************************************
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

*************************
*** DATA CONTROL ***
	CASE setmpcod= 13
		v_char=CHR(13) 			&& CR - RETORNO DE CARRO

	CASE setmpcod= 24
		v_char=CHR(24) 			&& CAN - Cancel Line

	CASE setmpcod= 127
		v_char=CHR(127) 		&& DEL - Delete Character
		
********************

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

**************************************

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
************************

*** OVERALL PRINTING STYLE ***
	CASE setmpcod= 120
		v_char=CHR(27)+"x0"		&& ESC x - Select Near Letter Quality(x1) or Draft(x0)

	CASE setmpcod= 107
		v_char=CHR(27)+"k"		&& ESC k - Select NLQ Font

	CASE setmpcod= 33
		v_char=CHR(27)+"!"		&& ESC ! - Master Select
*****************************

	OTHERWISE 
ENDCASE 

RETURN v_char

ENDFUNC

*!*	******************************************************************************
*!*	******************************************************************************
*!*	FUNCTION LEELOCALCFG()
*!*		PUNTERO = FOPEN("C:\GESLOCAL.CFG",0)
*!*		IF PUNTERO > 0 THEN
*!*			DO WHILE !FEOF(PUNTERO) 
*!*				EJE = ALLTRIM(FGETS(PUNTERO))
*!*				IF !(ALLTRIM(EJE)=="" OR SUBSTR(ALLTRIM(EJE),1,1)=="[") THEN 
*!*					&EJE
*!*				ENDIF
*!*			ENDDO
*!*			=FCLOSE(PUNTERO)
*!*			SET SAFETY OFF
*!*		ELSE 
*!*			arch = "C:\GESLOCAL.CFG"
*!*			IF FILE(arch) then
*!*				DELETE FILE &arch
*!*			ENDIF 
*!*			PUNTERO = FCREATE(arch)  && Si no, crearlo
*!*				renglon = "PUBLIC MIEMPRESECCION "
*!*				&renglon
*!*				=FPUTS(PUNTERO,renglon )
*!*				renglon = "MIEMPRESECCION = 'INGENIERIA'"
*!*				&renglon
*!*				=FPUTS(PUNTERO,renglon )
*!*			=FCLOSE(PUNTERO)		
*!*		ENDIF
*!*	RETURN







**************************************************************************************
** RETORNA LA CADENA DE CARACTERES A IMPRIMIR SEGUN EL PARAMETRO DE SELECCION RECIBIDO
***************************************************************************************
FUNCTION BARCODIGO
PARAMETERS P_ELIGE
RETCODIGO = ""
DO CASE
	
	CASE P_ELIGE = 1 && IMPRESION CODBAR P/BANCO CREDICOOP VENCIMIENTOS
		
		RETCODIGO1 = ALLTRIM(CODENTE)+;
					SUBSTR(ALLTRIM(STR(BOLETAS.IDBOLETA+1000000000,10)),2,9)+ ;
					DIAJULIANO(CTOD(SUBSTR(BOLETAS.FECHAVENC,7,2)+"/"+SUBSTR(BOLETAS.FECHAVENC,5,2)+"/"+SUBSTR(BOLETAS.FECHAVENC,1,4)))+ ;
					STRTRAN(STRTRAN(STR(BOLETAS.IMPTOTAL,7,2)," ","0"),".","")+ ; 
					DIAJULIANO(CTOD(SUBSTR(BOLETAS.SEGUVENC,7,2)+"/"+SUBSTR(BOLETAS.SEGUVENC,5,2)+"/"+SUBSTR(BOLETAS.SEGUVENC,1,4)))+ ;
					STRTRAN(STRTRAN(STR((BOLETAS.IMPSEGUV),7,2)," ","0"),".","")+ ;  
					DIAJULIANO(CTOD(SUBSTR(BOLETAS.TERCVENC,7,2)+"/"+SUBSTR(BOLETAS.TERCVENC,5,2)+"/"+SUBSTR(BOLETAS.TERCVENC,1,4)))+ ;
					STRTRAN(STRTRAN(STR((BOLETAS.IMPTERCV),7,2)," ","0"),".","")
		RETCODIGO2 =  RETCODIGO1 + VERIFICADOR(RETCODIGO1)
		RETCODIGO  = BAR25(RETCODIGO2)
	
	CASE P_ELIGE = 2 && IMPRESION CODBAR P/COMUNA  VENCIMIENTOS
			
		RETCODIGO1 = SUBSTR(ALLTRIM(STR(BOLETAS.IDBOLETA+1000000000,10)),2,9)
		RETCODIGO2 =  RETCODIGO1 + VERIFICADOR(RETCODIGO1)
		RETCODIGO  = BAR25(RETCODIGO2)

	CASE P_ELIGE = 3 && IMPRESION CODIGO LECTURA  HUMANA P/BANCO CREDICOOP VENCIMIENTOS
		
		RETCODIGO1 = ALLTRIM(CODENTE)+;
					SUBSTR(ALLTRIM(STR(BOLETAS.IDBOLETA+1000000000,10)),2,9)+ ;
					DIAJULIANO(CTOD(SUBSTR(BOLETAS.FECHAVENC,7,2)+"/"+SUBSTR(BOLETAS.FECHAVENC,5,2)+"/"+SUBSTR(BOLETAS.FECHAVENC,1,4)))+ ;
					STRTRAN(STRTRAN(STR(BOLETAS.IMPTOTAL,7,2)," ","0"),".","")+ ; 
					DIAJULIANO(CTOD(SUBSTR(BOLETAS.SEGUVENC,7,2)+"/"+SUBSTR(BOLETAS.SEGUVENC,5,2)+"/"+SUBSTR(BOLETAS.SEGUVENC,1,4)))+ ;
					STRTRAN(STRTRAN(STR((BOLETAS.IMPSEGUV),7,2)," ","0"),".","")+ ;  
					DIAJULIANO(CTOD(SUBSTR(BOLETAS.TERCVENC,7,2)+"/"+SUBSTR(BOLETAS.TERCVENC,5,2)+"/"+SUBSTR(BOLETAS.TERCVENC,1,4)))+ ;
					STRTRAN(STRTRAN(STR((BOLETAS.IMPTERCV),7,2)," ","0"),".","")			
		RETCODIGO =  RETCODIGO1 +'0'+VERIFICADOR(RETCODIGO1) &&0 agregado para completar caracteres pares
	
	CASE P_ELIGE = 4 && IMPRESION CODIGO LECTURA HUMANA P/COMUNA  VENCIMIENTOS
			
		RETCODIGO1 = SUBSTR(ALLTRIM(STR(BOLETAS.IDBOLETA+1000000000,10)),2,9)
		RETCODIGO =  RETCODIGO1 + VERIFICADOR(RETCODIGO1)


	CASE P_ELIGE = 5 && IMPRESION DEL NUEVO BANCO DE SANTA FE  VENCIMIENTOS
	
		 RETCODIGO1 = ALLTRIM(CENTE)+;
					SUBSTR(ALLTRIM(STR(TMFACTURAS.IDBOLETA+1000000000000,13)),2,12)+ ;
					DIAJULIANO(TMFACTURAS.FECH_VENC)+ ;
					STRTRAN(STRTRAN(STR(TMFACTURAS.IMP_TOTAL,7,2)," ","0"),".","")+ ; 
					DIAJULIANO(TMFACTURAS.SEGU_VENC)+ ;
					STRTRAN(STRTRAN(STR((TMFACTURAS.IMP_TOTAL+TMFACTURAS.REC_VEN1),7,2)," ","0"),".","")  
		RETCODIGO2 =  RETCODIGO1 + VERIFICADOR(RETCODIGO1)
		RETCODIGO  = BAR25(RETCODIGO2)
		
	CASE P_ELIGE = 6 && IMPRESION CODIGO LECTURA  HUMANA P/BANCO CREDICOOP CONVENIOS
		
		RETCODIGO1 = ALLTRIM(CODENTE)+;
					SUBSTR(ALLTRIM(STR(BOLETAS.IDBOLETAC+1000000000,10)),2,9)+ ;
					DIAJULIANO(CTOD(SUBSTR(BOLETAS.FECHAVENC,7,2)+"/"+SUBSTR(BOLETAS.FECHAVENC,5,2)+"/"+SUBSTR(BOLETAS.FECHAVENC,1,4)))+ ;
					STRTRAN(STRTRAN(STR(BOLETAS.IMPTOTAL,7,2)," ","0"),".","")+ ; 
					DIAJULIANO(CTOD(SUBSTR(BOLETAS.FECHAVENC,7,2)+"/"+SUBSTR(BOLETAS.FECHAVENC,5,2)+"/"+SUBSTR(BOLETAS.FECHAVENC,1,4)))+ ;
					STRTRAN(STRTRAN(STR((BOLETAS.IMPTOTAL),7,2)," ","0"),".","")+ ;  
					DIAJULIANO(CTOD(SUBSTR(BOLETAS.FECHAVENC,7,2)+"/"+SUBSTR(BOLETAS.FECHAVENC,5,2)+"/"+SUBSTR(BOLETAS.FECHAVENC,1,4)))+ ;
					STRTRAN(STRTRAN(STR((BOLETAS.IMPTOTAL),7,2)," ","0"),".","")			

		RETCODIGO1  = STRTRAN(RETCODIGO1,'0','9',1,1)
		RETCODIGO =  RETCODIGO1 +'0'+VERIFICADOR(RETCODIGO1) &&0 agregado para completar caracteres pares
		
	
	CASE P_ELIGE = 7 && IMPRESION CODIGO LECTURA HUMANA P/COMUNA  CONVENIOS
			
		RETCODIGO1 = SUBSTR(ALLTRIM(STR(BOLETAS.IDBOLETAC+1000000000,10)),2,9)
		RETCODIGO1  = STRTRAN(RETCODIGO1,'0','9',1,1)
		RETCODIGO =  RETCODIGO1 + VERIFICADOR(RETCODIGO1)
		
		
	CASE P_ELIGE = 8 && IMPRESION CODBAR P/BANCO CREDICOOP CONVENIOS
		
		RETCODIGO1 = ALLTRIM(CODENTE)+;
					SUBSTR(ALLTRIM(STR(BOLETAS.IDBOLETAC+1000000000,10)),2,9)+ ;
					DIAJULIANO(CTOD(SUBSTR(BOLETAS.FECHAVENC,7,2)+"/"+SUBSTR(BOLETAS.FECHAVENC,5,2)+"/"+SUBSTR(BOLETAS.FECHAVENC,1,4)))+ ;
					STRTRAN(STRTRAN(STR(BOLETAS.IMPTOTAL,7,2)," ","0"),".","")+ ; 
					DIAJULIANO(CTOD(SUBSTR(BOLETAS.FECHAVENC,7,2)+"/"+SUBSTR(BOLETAS.FECHAVENC,5,2)+"/"+SUBSTR(BOLETAS.FECHAVENC,1,4)))+ ;
					STRTRAN(STRTRAN(STR((BOLETAS.IMPTOTAL),7,2)," ","0"),".","")+ ;  
					DIAJULIANO(CTOD(SUBSTR(BOLETAS.FECHAVENC,7,2)+"/"+SUBSTR(BOLETAS.FECHAVENC,5,2)+"/"+SUBSTR(BOLETAS.FECHAVENC,1,4)))+ ;
					STRTRAN(STRTRAN(STR((BOLETAS.IMPTOTAL),7,2)," ","0"),".","")
		RETCODIGO1  = STRTRAN(RETCODIGO1,'0','9',1,1)
		RETCODIGO2 =  RETCODIGO1 + VERIFICADOR(RETCODIGO1)
		RETCODIGO  = BAR25(RETCODIGO2)
		RETCODIGO  = STRTRAN(RETCODIGO,'0','9',1,1)
		
	CASE P_ELIGE = 9 && IMPRESION CODBAR P/COMUNA  CONVENIOS
			
		RETCODIGO1 = SUBSTR(ALLTRIM(STR(BOLETAS.IDBOLETAC+1000000000,10)),2,9)
		RETCODIGO1  = STRTRAN(RETCODIGO1,'0','9',1,1)
		RETCODIGO2 =  RETCODIGO1 + VERIFICADOR(RETCODIGO1)
		RETCODIGO  = BAR25(RETCODIGO2)		
		RETCODIGO  = STRTRAN(RETCODIGO,'0','9',1,1)
		
	OTHERWISE 
		
ENDCASE
RETURN RETCODIGO
ENDFUNC


************************************************************
** Esta funcion es para la conversion
** en la impresion de las barras en codigo Interleave 2 de 5
************************************************************
FUNCTION bar25(t)
a=CHR(33)

FOR x = 1 TO LEN(T) STEP 2 
	v= VAL(SUBSTR(t,x,2)) 
	DO CASE 
		CASE v >= 0 AND v<=91
			c=CHR(v+35)
		CASE v=92
			c=CHR(196)
		CASE v=93
			c=CHR(197)
		CASE v=94
		    c=CHR(199)
		CASE v=95
		    c=CHR(201)
		CASE v=96
		    c=CHR(209)
		CASE v=97
		    c=CHR(214)
		CASE v=98
			c=CHR(220)
		CASE v=99
			c=CHR(225)
	ENDCASE 
	a=a+c
	NEXT 
	a = a + CHR(34)
RETURN a
			

************************************************************
** Funci�n de Retorno de D�gito Verificador
** Recibe el string y devuelve el digito verificador
************************************************************
FUNCTION verificador(t)
	L = LEN(t)
	DIMENSION arreglo(3,L)
	DIMENSION serie (1,4)
	serie(1,1) = 3
	serie(1,2) = 5
	serie(1,3) = 7
	serie(1,4) = 9
	arreglo(2,1)=1
	suma= 0
	y = 1
	FOR x = 1 TO L
		arreglo(1,x)= VAL(SUBSTR(t,x,1))
		IF x > 1 THEN 
			arreglo(2,x)=serie(1,y)
			IF y = 4 then
				y = 1
			ELSE
				y = y + 1
			ENDIF 
		ENDIF 
		arreglo(3,x) = arreglo(1,x)*arreglo(2,x)
		suma = suma + arreglo(3,x)
	NEXT 
	mitad=INT(suma/2)
	dg = ALLTRIM(STR(MOD(mitad,10)))
RETURN dg			


************************************************************
** Funci�n de Retorno del Dia Juliano de acuerdo a una fecha dada
** en 4 digitos 1 posicion ultimo digito del a�o y 2 a 4 el dia
************************************************************
FUNCTION DIAJULIANO
PARAMETERS eldia
	
	ano=SUBSTR(ALLTRIM(STR(YEAR(eldia))),4,1)
	diaj=SUBSTR(STR(((eldia-DATE(YEAR(eldia),01,01)+1)+1000),4),2)
	ret=ano+diaj

	RETURN ret 
ENDFUNC 


******************************************************
*Convierte un numero en letra
*******************************************************

FUNCTION  numenletra (numero1)

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

		IF numero = 0 THEN
			*nump = nump+"CERO"
			otro = 2
		ELSE
			otro = otro + 1
		ENDIF
	ENDDO
	******DELETREA EL NUMERO*******
	*nump =  nump+" CENTAVOS "
	return nump
ENDFUNC 

FUNCTION f_ejecutar (tcArranque, tcPrg, tcUsu, tcOp, tcRun)
	*******TCRUN NO LO USO ERA PARA EJECUTAR PRG EXTERNOS (CALC.EXE ECT)
	*tcRun= S paso como parametro el id del esquema
	*tcRun= N no paso id. del esquema (para utilizar los ejecutable anteriores sin modificarlos)
	LOCAL lcUsu

	IF tcUsu = 'S' THEN 
		lcUsu = ALLTRIM(GUSUARIO)
	ELSE 
		lcUsu = ''
	ENDIF 
	
	IF SUBSTR(tcArranque,1,1) = '#' THEN 
		*no tener encuenta el path, me permite ejecutar programas externos al sistema (ej. calculdora, excel, etc)
		tcArranque = STRTRAN(tcArranque,'#','')
		IF FILE(ALLTRIM(tcArranque)+tcPrg) THEN 
			CHDIR(ALLTRIM(tcArranque))
			EJE = "RUN /N2 "+ALLTRIM(tcArranque)+ALLTRIM(tcPrg)	
			&EJE	
		ELSE 
			=MESSAGEBOX("No se Encuentra el Archivos que se Intenta Ejecutar",64,"Error de Ejecuci�n")
			MESSAGEBOX(ALLTRIM(tcArranque)+tcPrg)		
		ENDIF 
	ELSE  
		IF FILE(ALLTRIM(MIPATH)+ALLTRIM(tcArranque)+tcPrg) THEN 
			CHDIR(ALLTRIM(MIPATH)+ALLTRIM(tcArranque))
			IF tcRun = 'S' THEN 
				EJE = "RUN /N2 "+ALLTRIM(MIPATH)+ALLTRIM(tcArranque)+ALLTRIM(tcPrg)+" '"+ALLTRIM(STR(esquemas.idesquema))+"' "+ALLTRIM(lcUsu)+" "+ALLTRIM(tcOp)
			ELSE 
				EJE = "RUN /N2 "+ALLTRIM(MIPATH)+ALLTRIM(tcArranque)+ALLTRIM(tcPrg)+" "+ALLTRIM(lcUsu)+" "+ALLTRIM(tcOp)
			ENDIF 
			&EJE
			SET DEFAULT TO &MIESTACION
			*_screen.Visible = .t.
		ELSE
			=MESSAGEBOX("No se Encuentra el Archivos que se Intenta Ejecutar",64,"Error de Ejecuci�n")
			MESSAGEBOX(ALLTRIM(MIPATH)+ALLTRIM(tcArranque)+tcPrg)
		ENDIF
	ENDIF 
ENDFUNC   
