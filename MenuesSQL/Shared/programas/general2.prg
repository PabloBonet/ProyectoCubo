************************************
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

*****************************************************************
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
IF FILE(ARVO)  && ¿Existe el archivo?
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




FUNCTION CAMBIAUSUARIO
	DO FORM LOGIN TO LOGEO		
	IF LEN(ALLTRIM(LOGEO)) = 0 THEN
		CLOSE ALL
		CLEAR READ
		QUIT
	ENDIF
RETURN


**********************************************************************
****** SELECCIONA LAS LINEAS DE ACUERDO AL MODULO ELEGIDO
****** DEVUELVE LAS LINEAS EN UN CURSOR LLAMADO LINEMODUL
FUNCTION LINEAMODULO
PARAMETERS demodulo
var_conex = abreycierracon(0,miservidor+"\Maestros\Maestros.dbc")
=SQLEXEC(var_conex,"select * from modulolinea where modulo == "+STR(demodulo),"lineas0")
=SQLEXEC(var_conex,"select descripcio, cod_linea, longcodigo from lineacodigo","lineas1")
=abreycierracon (var_conex,"")
select descripcio, cod_linea, longcodigo from lineas1 INTO CURSOR linemodul ;
WHERE ALLTRIM(cod_linea) in (select ALLTRIM(cod_linea) FROM lineas0)
USE IN lineas0
USE IN lineas1
RETURN "linemodul"








