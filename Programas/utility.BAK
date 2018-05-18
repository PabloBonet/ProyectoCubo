 
FUNCTION CTRLF12
	SET SYSMENU TO DEFA
	CANCEL
	RETURN
ENDFUNC 


FUNCTION LEECONFIG()
	PUNTERO = FOPEN("CONFIG.CFG",0)
	IF PUNTERO > 0 THEN
		DO WHILE !FEOF(PUNTERO) 
			EJE = ALLTRIM(FGETS(PUNTERO))
			IF !(ALLTRIM(EJE)=="" OR SUBSTR(ALLTRIM(EJE),1,1)=="[") THEN 
				&EJE
			ENDIF
		ENDDO
		=FCLOSE(PUNTERO)
		SET SAFETY OFF
	ELSE 
		MESSAGEBOX("Error: No se puede continuar con la ejecucion; Error en carga de archivo de configuración !! ")
		RETURN	
	ENDIF
	RETURN
ENDFUNC 


************************************************************************************************************
************************************************************************************************************
********************************************************************************************************
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
*=SQLDISCONNECT(0)
QUIT
RETURN


********************************************************************************************************
********************************************************************************************************
********************************************************************************************************
FUNCTION Valicuit (NRO_CUIT)

IF NRO_CUIT='  -        - ' OR NRO_CUIT='             ' THEN 
	RETURN .T.
ENDIF	
IF LEN(ALLTRIM(NRO_CUIT)) < 13 THEN 
	RETURN .F.
ENDIF	
A = VAL(SUBSTR(NRO_CUIT,1,1)) * 5
B = VAL(SUBSTR(NRO_CUIT,2,1)) * 4
C = VAL(SUBSTR(NRO_CUIT,4,1)) * 3
D = VAL(SUBSTR(NRO_CUIT,5,1)) * 2
E = VAL(SUBSTR(NRO_CUIT,6,1)) * 7
F = VAL(SUBSTR(NRO_CUIT,7,1)) * 6
G = VAL(SUBSTR(NRO_CUIT,8,1)) * 5
H = VAL(SUBSTR(NRO_CUIT,9,1)) * 4
I = VAL(SUBSTR(NRO_CUIT,10,1)) * 3
J = VAL(SUBSTR(NRO_CUIT,11,1)) * 2

DV_NRO = VAL(SUBSTR(NRO_CUIT,13,1)) 
SUMA = A + B + C + D + E + F + G + H + I + J

RESTO = MOD(SUMA,11)

DV = 11 - RESTO
IF RESTO = 0 OR RESTO = 1 THEN
	IF DV_NRO = 0 THEN
		RETURN .T.
	ELSE
		RETURN .F.
	ENDIF
ELSE
	IF DV_NRO = DV THEN
		RETURN .T.
	ELSE
		RETURN .F.
	ENDIF
ENDIF
ENDFUNC


********************************************************************************************************
********************************************************************************************************
********************************************************************************************************

PROCEDURE enletras
parameters enl_nume1
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
cadena1 = STR(enl_nume1,12,2)
cadena = SUBSTR(cadena1,1,9)
enl_numer = VAL(cadena)
cadena = STR(ENL_NUMER,9)
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
		IF enl_numer > 999999 .and. contador = 1
			nump = nump+' MILLONES '
		ENDIF
		
		IF nump = " UN MILLONES "
			nump = " UN MILLON "
		ENDIF
		
		IF (enl_numer > 999 .and. contador = 2 .and. VAL(subcadena) > 0 ) THEN
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
enl_numer = VAL(cadena)
if otro = 0
	nump = nump+" PESOS CON "
endif
IF enl_numer = 0 THEN
	nump = nump+"CERO"
	otro = 2
ELSE
otro = otro + 1
ENDIF
ENDDO
******DELETREA EL NUMERO*******
nump =  nump+" CENTAVOS "				
return nump


********************************************************************************************************
********************************************************************************************************
********************************************************************************************************
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
	OTHERWISE 
	    RETURN "."
ENDCASE



FUNCTION SETMASTERSCHEMA
	_SYSMYSQL_SERVER 	= _SYSMASTER_SERVER 
	_SYSMYSQL_USER	 	= _SYSMASTER_USER   
	_SYSMYSQL_PASS   	= _SYSMASTER_PASS   
	_SYSMYSQL_PORT   	= _SYSMASTER_PORT   
	_SYSSCHEMA     		= _SYSMASTER_SCHEMA   
	_SYSDESCRIP			= _SYSMASTER_DESC
ENDFUNC 


FUNCTION SETVARPUBLICAS  
	PARAMETERS P_PREFIJO, P_TABLA
	** OBTIENE LOS DATOS DE UNA TABLA Y GENERA VARIABLES PUBLICAS CON LOS CAMPOS Y SUS VALORES **
	** RECIBE COMO PARAMETROS UNA CADENA PARA ANEXAR A LOS NOMBRES DE LOS CAMPOS PARA SU IDENTIFICACION **
	** COMO VARIABLE PUBLICA GLOBAL **
	vconeccion=abreycierracon(0,_SYSSCHEMA)
	sqlmatriz(1)=" select * from "+P_tabla 
	verror=sqlrun(vconeccion,p_tabla)
	IF !verror THEN 
		MESSAGEBOX('Ha ocurrido un error al obtener los datos de la Empresa',0+64,'Error')
	ENDIF 

	=abreycierracon(vconeccion,'')
	SELECT &p_tabla 
	FOR i = 1 TO FCOUNT(p_tabla)
		EJE='PUBLIC '+p_prefijo+FIELD(I)
		&EJE
		EJE=p_prefijo+FIELD(I)+'='+p_tabla+'.'+FIELD(i)
		&EJE 
	ENDFOR 
	USE 
ENDFUNC 


FUNCTION DEFVARPUBLICAS  
	PARAMETERS p_tabla
	** DEFINICION DE VARIABLES PUBLICAS DEL SISTEMA DESDE UNA TABLA DE MYSQL LLAMADA VARPUBLICAS EN EL SCHEMMA ADMINDB **
	vconeccion=abreycierracon(0,_SYSSCHEMA)
	sqlmatriz(1)=" select * from "+P_tabla 
	verror=sqlrun(vconeccion,p_tabla)
	IF !verror THEN 
		MESSAGEBOX('Ha ocurrido un error al obtener los datos de la Empresa',0+64,'Error')
	ENDIF 
	=abreycierracon(vconeccion,'')
	SELECT &p_tabla
	GO TOP  
	DO WHILE !EOF()
		EJE='PUBLIC '+&p_tabla..variable
		&EJE
		IF &p_tabla..tipo = 'I' OR &p_tabla..tipo = 'F' OR &p_tabla..tipo = 'N'  THEN  
			EJE=&p_tabla..variable+" = "+STR(VAL(ALLTRIM(&p_tabla..valor)))
		ELSE
			EJE=&p_tabla..variable+" = '"+ALLTRIM(&p_tabla..valor)+"'"
		ENDIF 
		&EJE 
		SKIP 
	ENDDO 
	USE 
ENDFUNC 


PROCEDURE cerrar_todo 
	ON ERROR error = .f.
	ON SHUTDOWN
	CLEAR EVENTS
	QUIT
ENDPROC 


PROCEDURE SETEO_ESC 
	IF !(type('_SCREEN.ActiveForm')='U') THEN 
		_SCREEN.ActiveForm.cerrar 
	ELSE
	ENDIF 	
ENDPROC 



PROCEDURE salirmenu 
	IF MESSAGEBOX("¿Está seguro que desea Salir?",36,'Salir del Sistema') = 6
		CIERRAAPP()
    ENDIF
ENDPROC


FUNCTION winexec (tcExe)
	MESSAGEBOX(tcexe)
	&tcExe
ENDFUNC 



***********
********** BUSCO SETEO DE BOTONES DE TOOLBARSYS  E ICONOS ***
FUNCTION settoolbarsys 

	vconeccion=abreycierracon(0,'admindb')

	sqlmatriz(1)="select * from settoolbarsys"

	verror=sqlrun(vconeccion,'setbar')

	IF !verror THEN 
		MESSAGEBOX('Ha ocurrido un error al obtener datos de toolbarsys',0+64,'Error')
	ENDIF 

	sqlmatriz(1)="select * from iconos"

	verror=sqlrun(vconeccion,'setico')

	IF !verror THEN 
		MESSAGEBOX('Ha ocurrido un error al obtener datos de iconos',0+64,'Error')
	ENDIF 

	=abreycierracon(vconeccion,'')


	SELECT * FROM setbar INTO TABLE .\settoolbarsys
	SELECT setbar
	USE IN setbar
	SELECT settoolbarsys
	USE IN settoolbarsys

	SELECT * FROM setico INTO TABLE .\seticonos
	SELECT setico 
	USE IN setico 
	SELECT seticonos
	USE IN seticonos

ENDFUNC 


* FUNCION DE SETEO DE LA BARRA DE HERRAMIENTAS
FUNCTION actutoolbarsys 
PARAMETERS p_form
	
	= disabletoolbar()
	
	USE .\settoolbarsys IN 0
	SELECT * FROM settoolbarsys INTO CURSOR settool WHERE UPPER(ALLTRIM(form)) == UPPER(ALLTRIM(p_form))
	DO WHILE !EOF()
	
		IF settool.habilita = '1' THEN 
			vhabi = '.t.'
		ELSE
			vhabi = '.f.'
		ENDIF 
		eje = "toolbarsys.cmdbar_"+ALLTRIM(settool.idobjeto)+".enabled ="+vhabi
		&eje
		
		IF settool.visible = '1' THEN 
			vhabi = '.t.'
		ELSE
			vhabi = '.f.'
		ENDIF 
		eje = "toolbarsys.cmdbar_"+ALLTRIM(settool.idobjeto)+".visible ="+vhabi
		&eje

		eje = "toolbarsys.cmdbar_"+ALLTRIM(settool.idobjeto)+".tag = '"+ALLTRIM(settool.active)+ALLTRIM(settool.funcion)+"'"
		&eje

		IF !EMPTY(ALLTRIM(settool.tooltip)) THEN 
			eje = "toolbarsys.cmdbar_"+ALLTRIM(settool.idobjeto)+".tooltiptext = '"+ALLTRIM(settool.tooltip)+"'"
			&eje
		ENDIF 
		
		IF !EMPTY(ALLTRIM(settool.icono)) THEN 
			eje = "toolbarsys.cmdbar_"+ALLTRIM(settool.idobjeto)+".picture = '"+_sysservidor+"\iconos\"+ALLTRIM(settool.icono)+"'"
			&eje
		ENDIF 

		SELECT settool
		SKIP 
	ENDDO  
	SELECT settoolbarsys
	USE 

ENDFUNC 

FUNCTION disabletoolbar
	FOR i = 1 TO toolbarsys.controlcount
		eje = "toolbarsys.cmdbar_"+SUBSTR((STR(100+i,3)),2,2)+".visible = .f."
		&eje
		eje = "toolbarsys.cmdbar_"+SUBSTR((STR(100+i,3)),2,2)+".enabled = .f."
		&eje
	ENDFOR 
ENDFUNC 


FUNCTION validcmdtoolbar
	PARAMETERS p_cmdbar 
	eje="varejecutar = toolbarsys."+p_cmdbar+".tag"
	&eje 
	IF !TYPE('_SCREEN.ActiveForm ')= 'U' THEN 
		on error _screen.activeform.error(error())
		_screen.activeform.activecontrol.lostfocus()
		on error
	ENDIF 

	IF len(ALLTRIM(varejecutar))>1 THEN 
		varejecu    = SUBSTR(ALLTRIM(varejecutar),2)
		IF SUBSTR(ALLTRIM(varejecutar),1,1)='1'
			IF !TYPE('_SCREEN.ActiveForm ')= 'U' THEN 
				_screen.ActiveForm.&varejecu
			ENDIF 
		ELSE
			=&varejecu
		ENDIF 
	ENDIF 
	Return	
ENDFUNC 

*FUNCION DE SETEO DE ICONOS
FUNCTION seticonos
	PARAMETERS p_nombre, par_objeto, par_arreglo
	
	USE .\seticonos IN 0
	SELECT * FROM seticonos INTO CURSOR setico WHERE ALLTRIM(nombre) == ALLTRIM(p_nombre)
	SELECT setico
	GO TOP 
	IF !EOF() THEN 
		IF TYPE("par_objeto") = 'C' AND TYPE("par_arreglo") = 'C' THEN 
			ret = _sysservidor+"\iconos\"+ALLTRIM(setico.archivo)+"#"+ALLTRIM(setico.tooltip)+IIF(!EMPTY(ALLTRIM(setico.teclafn))," ( "+setico.teclafn+" )","")
		ELSE
			ret = _sysservidor+"\iconos\"+ALLTRIM(setico.archivo)+"#"+ALLTRIM(setico.tooltip)+IIF(!EMPTY(ALLTRIM(setico.teclafn))," ","")
		ENDIF 
	ELSE
		ret = ""
	ENDIF 
	SELECT seticonos
	USE
	SELECT setico
	tfn = ALLTRIM(setico.teclafn)
	USE
	

	IF TYPE("par_objeto") = 'C' AND TYPE("par_arreglo") = 'C' THEN 
		IF !EMPTY(tfn) THEN 
			=seteoteclafn (par_arreglo,1,par_objeto,tfn)
		ENDIF 
	ENDIF 

	
RETURN ret 
ENDFUNC 




*** COPIAR IMAGENES ***
FUNCTION copyarchivo
	PARAMETERS p_archivo, p_pathn
	
	j = LEN(ALLTRIM(p_archivo))
	LON = J
	DO WHILE ! (SUBSTR(p_archivo,j,1) == "\") AND ! (ALLTRIM(p_archivo) == "") AND j > 0
		j = j - 1
	ENDDO 

	IF !(ALLTRIM(p_archivo) == "") AND J > 0 THEN 
		viejo_directorio = LOWER(SUBSTR(p_archivo,1,J))	
	ENDIF 

	IF !(ALLTRIM(p_archivo) == "") THEN 
		a_archivo = LOWER(SUBSTR(p_archivo,J+1,LON - J + 1))
	ENDIF 
	
	
	nuevo_completo   = ALLTRIM(p_pathn)+ALLTRIM(a_archivo)
	viejo_completo   = LOWER(ALLTRIM(p_archivo))
	
	IF ALLTRIM(UPPER(viejo_completo))==ALLTRIM(UPPER(nuevo_completo)) THEN 
		* El Archivo ya esta en el directorio de la red
	ELSE 
			v_var = 0	
			new_nuevo_completo = ALLTRIM(nuevo_completo)
			DO WHILE FILE(new_nuevo_completo) = .t.
				v_var = v_var + 1
				new_nuevo_completo = ALLTRIM(SUBSTR(nuevo_completo,1,(LEN(ALLTRIM(nuevo_completo))-4))+ALLTRIM(STR(v_var))+SUBSTR(nuevo_completo,(LEN(ALLTRIM(nuevo_completo))-3)))
			ENDDO 
			nuevo_completo = ALLTRIM(new_nuevo_completo)	
			v_ejecutar = "COPY FILE '"+ALLTRIM(viejo_completo)+"' TO '"+ALLTRIM(nuevo_completo)+"'"
			MESSAGEBOX(v_ejecutar)
			&v_ejecutar				
	ENDIF

	j = LEN(ALLTRIM(nuevo_completo))
	LON = J
	DO WHILE ! (SUBSTR(nuevo_completo,j,1) == "\") AND ! (ALLTRIM(nuevo_completo) == "") AND j > 0
		j = j - 1
	ENDDO 

	a_archivo = ""
	IF !(ALLTRIM(nuevo_completo) == "") THEN 
		a_archivo = ALLTRIM(LOWER(SUBSTR(nuevo_completo,J+1,LON - J + 1)))
	ENDIF 
	
RETURN a_archivo
ENDFUNC 


**** COPIAR IMAGENES ****
FUNCTION copyimg
	PARAMETERS p_img, p_pathn, p_codigo
	
	j = LEN(ALLTRIM(p_img))
	LON = J
	DO WHILE ! (SUBSTR(p_img,j,1) == "\") AND ! (ALLTRIM(p_img) == "") AND j > 0
		j = j - 1
	ENDDO 

	IF !(ALLTRIM(p_img) == "") AND J > 0 THEN 
		viejo_directorio = LOWER(SUBSTR(p_img,1,J))	
	ENDIF 

	IF !(ALLTRIM(p_img) == "") THEN 
		a_archivo = LOWER("img" + ALLTRIM(p_codigo))
	ENDIF 
	
	
	nuevo_completo   = ALLTRIM(p_pathn)+ALLTRIM(a_archivo)
	viejo_completo   = LOWER(ALLTRIM(p_img))
	
	IF ALLTRIM(UPPER(viejo_completo))==ALLTRIM(UPPER(nuevo_completo)) THEN 
		* El Archivo ya esta en el directorio de la red
	ELSE 
			v_var = 0	
			new_nuevo_completo = ALLTRIM(nuevo_completo)
			DO WHILE FILE(new_nuevo_completo) = .t.
				v_var = v_var + 1
				new_nuevo_completo = ALLTRIM(SUBSTR(nuevo_completo,1,(LEN(ALLTRIM(nuevo_completo))-4))+ALLTRIM(STR(v_var))+SUBSTR(nuevo_completo,(LEN(ALLTRIM(nuevo_completo))-3)))
			ENDDO 
			nuevo_completo = ALLTRIM(new_nuevo_completo)
			v_ejecutar = "COPY FILE '"+ALLTRIM(viejo_completo)+"' TO '"+ALLTRIM(nuevo_completo)+"'"
			MESSAGEBOX(v_ejecutar)
			&v_ejecutar				
	ENDIF

	j = LEN(ALLTRIM(nuevo_completo))
	LON = J
	DO WHILE ! (SUBSTR(nuevo_completo,j,1) == "\") AND ! (ALLTRIM(nuevo_completo) == "") AND j > 0
		j = j - 1
	ENDDO 

	a_archivo = ""
	IF !(ALLTRIM(nuevo_completo) == "") THEN 
		a_archivo = ALLTRIM(LOWER(SUBSTR(nuevo_completo,J+1,LON - J + 1)))
	ENDIF 
	
RETURN a_archivo
ENDFUNC 

*** COPIAR DOCUMENTOS ***
FUNCTION copydocu
	PARAMETERS p_docu, p_pathn, p_codigo, p_viejo
	
	j = LEN(ALLTRIM(p_docu))
	LON = J
	DO WHILE ! (SUBSTR(p_docu,j,1) == "\") AND ! (ALLTRIM(p_docu) == "") AND j > 0
		j = j - 1
	ENDDO 

	IF !(ALLTRIM(p_docu) == "") AND J > 0 THEN 
		viejo_directorio = LOWER(SUBSTR(p_docu,1,J))	
	ENDIF 

	IF !(ALLTRIM(p_docu) == "") THEN 
		a_archivo = LOWER(ALLTRIM(p_codigo)+"_"+ALLTRIM(p_viejo))
	ENDIF 
	
	
	nuevo_completo   = ALLTRIM(p_pathn)+"\"+ALLTRIM(a_archivo)
	viejo_completo   = LOWER(ALLTRIM(p_docu))
	
	IF ALLTRIM(UPPER(viejo_completo))==ALLTRIM(UPPER(nuevo_completo)) THEN 
		* El Archivo ya esta en el directorio de la red
	ELSE 
			v_var = 0	
			new_nuevo_completo = ALLTRIM(nuevo_completo)
			DO WHILE FILE(new_nuevo_completo) = .t.
				v_var = v_var + 1
				new_nuevo_completo = ALLTRIM(SUBSTR(nuevo_completo,1,(LEN(ALLTRIM(nuevo_completo))-4))+ALLTRIM(STR(v_var))+SUBSTR(nuevo_completo,(LEN(ALLTRIM(nuevo_completo))-3)))
			ENDDO 
			nuevo_completo = ALLTRIM(new_nuevo_completo)
			v_ejecutar = "COPY FILE '"+ALLTRIM(viejo_completo)+"' TO '"+ALLTRIM(nuevo_completo)+"'"
			MESSAGEBOX(v_ejecutar)
			&v_ejecutar				
	ENDIF

	j = LEN(ALLTRIM(nuevo_completo))
	LON = J
	DO WHILE ! (SUBSTR(nuevo_completo,j,1) == "\") AND ! (ALLTRIM(nuevo_completo) == "") AND j > 0
		j = j - 1
	ENDDO 

	a_archivo = ""
	IF !(ALLTRIM(nuevo_completo) == "") THEN 
		a_archivo = ALLTRIM(LOWER(SUBSTR(nuevo_completo,J+1,LON - J + 1)))
	ENDIF 
	
RETURN a_archivo
ENDFUNC 
*Convierte FECHA tipo CHAR a DATE
*COnvierte FECHA tipo DATE a CHAR
FUNCTION CFTOFC 
PARAMETERS P_TRANS
IF TYPE("P_TRANS")="C" THEN
	IF !EMPTY(P_TRANS) THEN 
		
		IF VAL(ALLTRIM(SUBSTR(P_TRANS,1,4)))>1900 AND VAL(ALLTRIM(SUBSTR(P_TRANS,5,2)))>0 AND VAL(ALLTRIM(SUBSTR(P_TRANS,5,2)))<13 AND ;
		    VAL(ALLTRIM(SUBSTR(P_TRANS,7,2)))>0 AND VAL(ALLTRIM(SUBSTR(P_TRANS,7,2)))< 32 THEN 
		    
			RETORNO = DATE(VAL(ALLTRIM(SUBSTR(P_TRANS,1,4))),VAL(ALLTRIM(SUBSTR(P_TRANS,5,2))),VAL(ALLTRIM(SUBSTR(P_TRANS,7,2))))
		ELSE
			RETORNO = {//}
		ENDIF 
	ELSE
		RETORNO = {//}
	ENDIF 
ELSE
	IF TYPE("P_TRANS")='D' THEN 
		IF EMPTY(P_TRANS) THEN 
			RETORNO = ""
		ELSE
			RETORNO = SUBSTR(ALLTRIM(DTOC(P_TRANS)),7,4)+SUBSTR(ALLTRIM(DTOC(P_TRANS)),4,2)+SUBSTR(ALLTRIM(DTOC(P_TRANS)),1,2)
		ENDIF 
	ELSE
		RETORNO = -1
	ENDIF 
ENDIF
RETURN RETORNO
ENDFUNC 



** FUNCION PARA BUSQUEDA DE VALORES EN TABLAS DE LA BASE DE DATOS **
** RECIBE COMO PARAMETROS LA TABLA EN LA QUE BUSCAR Y EL CAMPO Y VALOR BUSCADO
** DATO ACERCA DEL VALOR A RETORNAR
** EN CASO DE NO HALLAR EL VALOR RETORNA ".NULL."
FUNCTION BUSCAVALORDB
PARAMETERS b_tabla, b_campoidx, b_valoridx, b_camporet, b_database
LOCAL varb_retorno 

	IF TYPE('b_valoridx') = 'C' THEN 
		b_valoridx_C = "'"+b_valoridx+"'"
	ELSE
		b_valoridx_C = STR(b_valoridx,10,2)
	ENDIF 

	IF b_database = 0 THEN && busca en database mysql
		vconefind=abreycierracon(0,_SYSSCHEMA)
		sqlmatriz(1)="SELECT "+ALLTRIM(b_camporet)+" as campo from "+b_tabla+" where "+ALLTRIM(b_campoidx)+"="+alltrim(b_valoridx_C)
		verror=sqlrun(vconefind,"buscatmp")
		IF verror=.f.  
		    MESSAGEBOX("Ha Ocurrido un Error en la BÚSQUEDA de Funcion BUSCAVALORDB ",0+48+0,"Error")
		ENDIF 
		=abreycierracon(vconefind,"")
		
	ELSE
		eje = "SELECT "+ALLTRIM(b_camporet)+" as campo from "+b_tabla+" into cursor buscatmp where "+ALLTRIM(b_campoidx)+"="+alltrim(b_valoridx_C)
		&eje 
	ENDIF 
	
	SELECT buscatmp 
	GO top
	IF !EOF() THEN 
		varb_retorno = buscatmp.campo
	ELSE 
		varb_retorno = Null
	ENDIF 
	SELECT buscatmp
	USE 
RETURN varb_retorno
ENDFUNC 



*----------------------------------------------------- 
* FUNCTION Edad(tdNac, tdHoy) 
*----------------------------------------------------- 
* Calcula la edad pasando como parámetros: 
* tdNac = Fecha de nacimiento 
* tdHoy = Fecha a la cual se calcula la edad. 
* Por defecto toma la fecha actual. 
*----------------------------------------------------- 
FUNCTION Edad(tdNac, tdHoy) 
LOCAL lnAnio 
IF EMPTY(tdHoy) 
tdHoy = DATE() 
ENDIF 
IF TYPE("tdNac")='C' THEN 
	tdNacD = cftofc(tdNac)
ELSE
	tdNacD = tdNac
ENDIF 
lnAnio = YEAR(tdHoy) - YEAR(tdNacD) 
IF GOMONTH(tdNacD, 12 * lnAnio) > tdHoy 
lnAnio = lnAnio - 1 
ENDIF 
RETURN lnAnio 
ENDFUNC 


** SETEO DE MATRIZ PARA EJECUCION DE FUNCIONES DE LOS BOTONES **
FUNCTION seteoteclafn
PARAMETERS p_matriz_p , p_opcion, p_objeto, p_teclafn
	p_matriz = p_matriz_p+"FN"
	retorno =""
	DO CASE 
		CASE p_opcion = 0 &&CREACION DEL ARREGLO
			eje = "public array "+p_matriz+"(20,2)"
			&eje
			FOR i = 1 TO 20
					eje 	= p_matriz+"("+ALLTRIM(STR(i))+",1) = ''"
					&eje					
					eje 	= p_matriz+"("+ALLTRIM(STR(i))+",2) = ''"
					&eje					
			ENDFOR 

		CASE p_opcion = 1 &&ASIGNACION DE VALORES DE BOTONES
			i 	= 1
			var1 =""
			eje 	= "var1 = "+p_matriz+"("+ALLTRIM(STR(i))+",1)"
			&eje
			DO WHILE i <=20 AND !EMPTY(var1)
				
				i = i + 1
				eje 	= "var1 = "+p_matriz+"("+ALLTRIM(STR(i))+",1)"
				&eje		
			ENDDO 
			IF i <= 20 THEN 
				eje 	= p_matriz+"("+ALLTRIM(STR(i))+",1) = '"+ALLTRIM(p_objeto)+"'"
				&eje					
				eje 	= p_matriz+"("+ALLTRIM(STR(i))+",2) = '"+ALLTRIM(p_teclafn)+"'"
				&eje					
			ENDIF 
		
		CASE p_opcion = 2 && SETEA TECLAS DE FUNCION EN EL FORMULARIO
			
			FOR i = 1 TO 12 
				eje = "on key label F"+ALLTRIM(STR(I))
				&eje
				eje = "on key label CTRL+F"+ALLTRIM(STR(I))
				&eje
				eje = "on key label ALT+F"+ALLTRIM(STR(I))
				&eje
			ENDFOR 
			
			FOR I = 1 TO  20
				vtecla1 =" v1 = "+ p_matriz+"("+ALLTRIM(STR(i))+",2)"
				vtecla2 =" v2 = "+ p_matriz+"("+ALLTRIM(STR(i))+",1)"
				&vtecla1
				&vtecla2
				IF !EMPTY(ALLTRIM(v1)) THEN
					eje 	= "on key label "+v1+" "+p_matriz_p+"."+v2+".click ()"
					&eje
				ENDIF 
				
			ENDFOR 

		CASE p_opcion = 3 && LIBERA LAS TECLAS SETEADAS
			FOR i = 1 TO 12 
				eje = "on key label F"+ALLTRIM(STR(I))
				&eje
				eje = "on key label CTRL+F"+ALLTRIM(STR(I))
				&eje
				eje = "on key label ALT+F"+ALLTRIM(STR(I))
				&eje
			ENDFOR 
			eje = "release "+ p_matriz 
			&eje		
		OTHERWISE 
	ENDCASE 
	
	RETURN retorno 
ENDFUNC 

* FUNCION PARA TRAER EL MAXIMO NUMERO DE UN COMPROBANTE
* RECIBE COMO PARAMETROS EL ID DEL COMPROBANTE, EL PUNTO DE VENTA Y EL VALOR A INCREMENTAR EL NUMERO
* DEVUELVE EL VALOR INCREMENTADO SEGUN EL PARAMETRO DE INCREMENTO RECIBIDO
FUNCTION maxnumerocom
PARAMETERS p_idcomproba, p_pventa, v_incre 

	compruebaCajaReca()


vconeccionF = abreycierracon(0,_SYSSCHEMA)

*sqlmatriz(1)="UPDATE compactiv set maxnumero = ( maxnumero + "+ALLTRIM(STR(v_incre))+" ) "
*sqlmatriz(2)=" WHERE puntov = "+ALLTRIM(p_puntov)+" and idnumera in ( select idnumera from comprobantes where idcomproba = "+STR(p_idcomproba)+" ) "
*verror=sqlrun(vconeccionF,"upmaximo")
*IF verror=.f.  
*    MESSAGEBOX("Ha Ocurrido un Error en la Actualizacion del maximo Numero de Comprobantes ",0+48+0,"Error")
*ENDIF 

sqlmatriz(1)="UPDATE compactiv set maxnumero = ( maxnumero + "+ALLTRIM(STR(v_incre))+" ) "
sqlmatriz(2)=" WHERE pventa = "+ALLTRIM(STR(p_pventa))+" and idcomproba = "+ALLTRIM(STR(p_idcomproba))
verror=sqlrun(vconeccionF,"upmaximo")
IF verror=.f.  
    MESSAGEBOX("Ha Ocurrido un Error en la Actualizacion del maximo Numero de Comprobantes ",0+48+0,"Error")
ENDIF 



*sqlmatriz(1)="select a.maxnumero as maxnro FROM comprobantes c "
*sqlmatriz(2)="LEFT JOIN compactiv a ON a.idnumera = c.idnumera " 
*sqlmatriz(3)="WHERE c.idcomproba = "+ STR(p_idcomproba) + " AND a.puntov = " + p_puntov


sqlmatriz(1)="select maxnumero as maxnro FROM compactiv "
sqlmatriz(2)="WHERE idcomproba = "+ ALLTRIM(STR(p_idcomproba)) + " AND pventa = " + ALLTRIM(STR(p_pventa))


verror=sqlrun(vconeccionF,"maximo")
IF verror=.f.  
    MESSAGEBOX("Ha Ocurrido un Error en la BÚSQUEDA del maximo Numero de Comprobantes ",0+48+0,"Error")
ENDIF 

* me desconecto	
=abreycierracon(vconeccionF,"")

v_maximo = IIF(ISNULL(maximo.maxnro),0,maximo.maxnro)

SELECT maximo
USE IN maximo

RETURN v_maximo


ENDFUNC

* FUNCION PARA TRAER EL MAXIMO ID O INDICE DE UNA TABLA
* RECIBE COMO PARAMETROS EL CAMPO QUE CONTIENE EL ID O INDICE, EL TIPO DE CAMPO, LA TABLA Y EL VALOR A INCREMENTAR EL ID
* DEVUELVE EL VALOR INCREMENTADO SEGUN EL PARAMETRO DE INCREMENTO RECIBIDO (SOLO SI ES NUMERO)
FUNCTION maxnumeroidx
PARAMETERS p_campoidx, p_tipo, p_tabla, v_incre 
v_tipoCampo = ""


vconeccionF = abreycierracon(0,_SYSSCHEMA)

IF p_tipo = 'I'
	*INTEGER
	v_tipocampo = "I"
	sqlmatriz(1)="UPDATE tablasidx set maxvalori = ( maxvalori + "+ALLTRIM(STR(v_incre))+" ) "
	sqlmatriz(2)=" WHERE campo = '"+ALLTRIM(p_campoidx)+"' and tabla = '"+ALLTRIM(p_tabla)+"' and tipocampo = '"+ALLTRIM(v_tipocampo)+"'"

	verror=sqlrun(vconeccionF,"idxmaximo")
	IF verror=.f.  
	    MESSAGEBOX("Ha Ocurrido un Error en la Actualizacion del maximo Numero de indice ",0+48+0,"Error")
	    RETURN 
	ENDIF 
	
	*** Vuelvo a buscar para corroborar
	
	
	sqlmatriz(1)="select maxvalori as maxnro FROM tablasidx "
	sqlmatriz(2)="WHERE campo = '"+ALLTRIM(p_campoidx)+"' and tabla = '"+ALLTRIM(p_tabla)+"' and tipocampo = '"+ALLTRIM(v_tipocampo)+"'" 
		
	verror=sqlrun(vconeccionF,"maximo")
	IF verror=.f.  
	    MESSAGEBOX("Ha Ocurrido un Error en la BÚSQUEDA ddel maximo Numero de indice",0+48+0,"Error")
	ENDIF 

	* me desconecto	
	=abreycierracon(vconeccionF,"")
	v_maximo = IIF(ISNULL(maximo.maxnro),0,maximo.maxnro)

	SELECT maximo
	USE IN maximo

	RETURN v_maximo

	

ELSE
	IF p_tipo = 'C'
		*CHAR
		v_tipocampo = "C"
		
	
				
		sqlmatriz(1)="select maxvalorc as maxnro FROM tablasidx "
		sqlmatriz(3)="WHERE campo = '"+ALLTRIM(p_campoidx)+"' and tabla = '"+ALLTRIM(p_tabla)+"' and tipocampo = '"+ALLTRIM(v_tipocampo)+"'" 

		verror=sqlrun(vconeccionF,"maximo")
		IF verror=.f.  
		    MESSAGEBOX("Ha Ocurrido un Error en la BÚSQUEDA ddel maximo Numero de indice",0+48+0,"Error")
		ENDIF 

		* me desconecto	
		=abreycierracon(vconeccionF,"")

		v_maximo = IIF(ISNULL(maximo.maxnro),"",maximo.maxnro)

		SELECT maximo
		USE IN maximo

		RETURN v_maximo
		
		
	ELSE
		
	ENDIF 

ENDIF 

RETURN -1
ENDFUNC
 

* FUNCIÓN PARA CARGAR EL SERVICIO
* PARAMETROS: P_PUNTOVTA, PUNTO DE VENTA DONDE SE VA A AUTORIZAR LOS COMPROBANTES

FUNCTION cargarServicioFE
	PARAMETERS p_puntoVta
	v_puntoVta = p_puntoVta
	Public loBasicHttpBinding_IServicio AS "XML Web Service"
	* LOCAL loBasicHttpBinding_IServicio AS "MSSOAP.SoapClient30"
	* Do not remove or alter following line. It is used to support IntelliSense for your XML Web service.
	*__VFPWSDef__: loBasicHttpBinding_IServicio = http://localhost:8000/?wsdl , Servicio , BasicHttpBinding_IServicio
	public loException, lcErrorMsg, loWSHandler
	v_cargado = .F.
	TRY

		
		loWSHandler = NEWOBJECT("WSHandler",IIF(VERSION(2)=0,"",HOME()+"FFC\")+"_ws3client.vcx")

		loBasicHttpBinding_IServicio = loWSHandler.SetupClient("http://localhost:8000/?wsdl", "Servicio", "BasicHttpBinding_IServicio")
		* Call your XML Web service here.  ex: leResult = loBasicHttpBinding_IServicio.SomeMethod()
		
	

		*thisform.serviciocargado = .f.
		****** Inicio el servicio  ***

		respuesta = loBasicHttpBinding_IServicio.iniciarServicio(v_puntoVta)

		IF respuesta = .t.

			*Se cargo el servicio correctamente
			
			*thisform.lblComprobanteElec.Caption = "Comp. Electrónico - Servicio: INICIADO"
			v_cargado = .T.
		ELSE
			*El servicio no se cargó correctamente

			*thisform.lblComprobanteElec.Caption = "Comp. Electrónico - Servicio: NO INICIADO"
			v_cargado = .F.		

		ENDIF 
	
	CATCH TO loException
			lcErrorMsg="Error: "+TRANSFORM(loException.Errorno)+" - "+loException.Message
			DO CASE
			CASE VARTYPE(loBasicHttpBinding_IServicio)#"O"
				* Handle SOAP error connecting to web service
			CASE !EMPTY(loBasicHttpBinding_IServicio.FaultCode)
				* Handle SOAP error calling method
				lcErrorMsg=lcErrorMsg+CHR(13)+loBasicHttpBinding_IServicio.Detail
			OTHERWISE
				* Handle other error
			ENDCASE
			* Use for debugging purposes
			MESSAGEBOX(lcErrorMsg)
			v_cargado = .F.
		FINALLY
	ENDTRY

	RETURN v_cargado
ENDFUNC 
 
 
 
* FUNCION QUE PERMITE LA CARGA DEL COMPROBANTE AL SERVICIO LOCAL, PARA LUEGO SER AUTORIZADA
* PARAMETROS: p_idFactura, ID DEL COMPROBANTE A AUTORIZAR
FUNCTION cargarCompFE
PARAMETERS p_idFactura


	v_servicioCargado = .F.
	v_compCargado = .F.
	TRY 
	
		v_servicioCargado = loBasicHttpBinding_IServicio.servicioIniciado()
		
		IF v_servicioCargado  = .t.

			v_idfactura = p_idFactura
			
			**** CARGA COMPROBANTE ***

			vconeccionF=abreycierracon(0,_SYSSCHEMA)	
			
*			sqlmatriz(1)="Select f.*, a.codigo as codAfip, p.puntov from facturas f left join comprobantes c on f.idcomproba = c.idcomproba "
*			sqlmatriz(2)=" left join afipcompro a on  c.idafipcom = a.idafipcom left join puntosventa p on f.pventa = p.pventa "
*			sqlmatriz(3)=" where f.idfactura = "+ ALLTRIM(STR(v_idfactura))

			sqlmatriz(1)="Select f.*, a.codigo as codAfip, p.puntov from facturas f left join comprobantes c on f.idcomproba = c.idcomproba "
			sqlmatriz(2)=" left join tipocompro tc on  c.idtipocompro = tc.idtipocompro left join afipcompro a on  tc.idafipcom = a.idafipcom "
			sqlmatriz(3)=" left join puntosventa p on f.pventa = p.pventa "
			sqlmatriz(4)=" where f.idfactura = "+ ALLTRIM(STR(v_idfactura))

			verror=sqlrun(vconeccionF,"factu_sql")
			IF verror=.f.  
			    MESSAGEBOX("Ha Ocurrido un Error en la BÚSQUEDA de la factura a cargar ",0+48+0,"Error")
			    *thisform.comprobantecargado = .f.
			    v_compCargado = .F.
			ENDIF 

			*** Cargo IMpuestos del comprobante agrupados por tipo de impuesto
			sqlmatriz(1)="Select fi.*,a.codigo as codigoAfip, a.tipo as tipoAfip, a.detalle as detAfip from  facturasimp fi left join impuestos i on fi.impuesto = i.impuesto "
			sqlmatriz(2)=" left join afipimpuestos a on i.idafipimp = a.idafipimp " 
			sqlmatriz(3)=" where fi.idfactura = "+ ALLTRIM(STR(v_idfactura))

			verror=sqlrun(vconeccionF,"factImp_sql")
			IF verror=.f.  
			    MESSAGEBOX("Ha Ocurrido un Error en la BÚSQUEDA de los impuestos de las facturas ",0+48+0,"Error")
			    *thisform.comprobantecargado = .f.
			    v_compCargado = .F.
			ENDIF 

			SELECT factu_sql

			v_idComprobante = factu_sql.idfactura
			*id o tipo?
			v_tipoComprobante = VAL(factu_sql.codAfip)
			
			*Tipo doc = 80, CUIT?
			*¿Que pasa si es consumidor final?

			IF factu_sql.tipodoc = '80'
				v_tipoDocCliente = '80'
				v_nroDocCliente = factu_sql.cuit
			ELSE 
				IF factu_sql.tipodoc = '99'
					v_tipoDocCliente = '99'
					v_nroDocCliente = factu_sql.cuit
				ELSE
					MESSAGEBOX("El tipo de cocumento no es CUIT ",0+48+0,"Error")
				    
				    v_compCargado =.F.
				ENDIF 
				
				
			ENDIF 
			
			v_fechaComprobante = factu_sql.fecha
			v_importeNeto = factu_sql.neto
			
			*** OPERACION EXCENTA???
			v_importeOpEx = 0
			*Tratamiento de impuestos
			IF factu_sql.operexenta = "S"
				v_importeOpEx = 0
			ELSE
			
			ENDIF 
			

			SELECT * FROM factImp_sql INTO TABLE .\factImp
			
			 
			 
			
			v_importeTotalComp = factu_sql.total
			v_idMoneda = "PES"
			v_cotizacionMoneda = 1
		*Concepto se refiere a:
		*1- Productos
		*2- Servicios
		*3- Productos y servicios
			v_concepto = _SYSCONCEPTOAFIP
			v_ptoVta = factu_sql.puntov 

			v_1 =	loBasicHttpBinding_IServicio.setIDComprobante(v_idComprobante)

			v_2=	loBasicHttpBinding_IServicio.setTipoComprobante(v_tipoComprobante)

			v_3=	loBasicHttpBinding_IServicio.setDocTipoClienteComprobante(v_tipoDocCliente)

			v_4=		loBasicHttpBinding_IServicio.setNroDocClienteComprobante(ALLTRIM(v_nroDocCliente))

			v_5=		loBasicHttpBinding_IServicio.setFechaComprobante(ALLTRIM(v_fechaComprobante))
				
			 
			
			v_totalIVA = 0
			v_totalTributo = 0
			SELECT factImp
			GO TOP
			DO WHILE  NOT EOF()
				
				v_impuesto = factImp.impuesto
				v_detalle  = factImp.detalle
				v_importe  = factImp.importe
				v_neto	   = factImp.neto
				v_codAfip  = VAL(ALLTRIM(factImp.codigoafip))
				v_tipoAfip = factImp.tipoAfip
				v_detAfip  = factImp.detAfip

				DO case
				
					CASE v_tipoAfip = "IVA"

						resp = loBasicHttpBinding_IServicio.agregarAlicIva(v_codAfip,v_neto,v_importe)
					
						IF resp = .F.
							MESSAGEBOX("Error al cargar alicuota IVA",0+48+0,"Error")
						
						ELSE
							v_totalIVA = v_totalIVA + v_importe
					
						ENDIF 
						
						
					CASE v_tipoAfip = "TRIBUTO"
					**REVISAR ALICUOTA (0) EN TRIBUTO 

						resp = loBasicHttpBinding_IServicio.agregarTributo(v_codAfip, 0, v_neto, v_detAfip, v_importe)
					
						IF resp = .F.
							MESSAGEBOX("Error al cargar el TRIBUTO",0+48+0,"Error")
						
						ELSE
							v_totalTributo = v_totalTributo + v_importe
					
						ENDIF 
					
				
				ENDCASE 
				
				
			
				SELECT factImp
				SKIP 1
			ENDDO  

				v_importeTributo = v_totalTributo
				v_importeIva = v_totalIVA

					v_6=		loBasicHttpBinding_IServicio.setImporteNetoComprobante(v_importeNeto)

			v_7=		loBasicHttpBinding_IServicio.setImporteOpExComprobante(v_importeOpEx)

			v_8=		loBasicHttpBinding_IServicio.setImporteTributoComprobante(v_importeTributo)

			v_9=		loBasicHttpBinding_IServicio.setImporteIvaComprobante(v_importeIva)

			v_10 = 		loBasicHttpBinding_IServicio.setImporteTotalComprobante(v_importeTotalComp)
			

			v_11=		loBasicHttpBinding_IServicio.setIDMonedaComprobante(ALLTRIM(v_idMoneda))

			v_12=		loBasicHttpBinding_IServicio.setCotizacionMonedaComprobante(v_cotizacionMoneda)

			v_13=		loBasicHttpBinding_IServicio.setConceptoComprobante(v_concepto)

			v_14 =			loBasicHttpBinding_IServicio.setPtoVtaComprobante(v_ptoVta)

			v_estadoComp =	loBasicHttpBinding_IServicio.comprobanteCargado()
			
					
			
			IF v_estadoComp = .T.
			
				v_compCargado =.T.
			ELSE
			
			    v_compCargado =	.F.

			ENDIF 

		ELSE
			  MESSAGEBOX("El servicio de autorización no está Iniciado",0+48+0,"Error")

			    v_compCargado = .F.
		ENDIF 
	CATCH TO loException
		lcErrorMsg="Error: "+TRANSFORM(loException.Errorno)+" - "+loException.Message
		DO CASE
			CASE VARTYPE(loBasicHttpBinding_IServicio)#"O"
				* Handle SOAP error connecting to web service
			CASE !EMPTY(loBasicHttpBinding_IServicio.FaultCode)
				* Handle SOAP error calling method
				lcErrorMsg=lcErrorMsg+CHR(13)+loBasicHttpBinding_IServicio.Detail
			OTHERWISE
				* Handle other error
			ENDCASE
			* Use for debugging purposes
			MESSAGEBOX(lcErrorMsg,0+48+0,"Se produjo un Error")
			v_compCargado = .F.
		FINALLY
	ENDTRY
	RETURN v_compCargado
ENDFUNC 





* FUNCIÓN QUE AUTORIZA EL COMPROBANTE CARGADO EN EL SERVICIO Y QUE SEA EL QUE SE LE INDICA COMO PARÁMETRO
* PARAMETRO: P_IDFACTURA, ID DEL COMPROBANTE A AUTORIZAR
FUNCTION autorizarCompFE
PARAMETERS p_idFactura
	v_idAutorizar = p_idfactura
	v_autorizado = .F.
	v_servicioCargado = .F.
	v_estadoComp = .F.
		v_nro = "0"
	TRY 

		v_servicioCargado = loBasicHttpBinding_IServicio.servicioIniciado()

		v_estadoComp =	loBasicHttpBinding_IServicio.comprobanteCargado()

		v_fechaComp = loBasicHttpBinding_IServicio.getFechaComprobante()
		
		CATCH TO loException
		lcErrorMsg="Error: "+TRANSFORM(loException.Errorno)+" - "+loException.Message
		DO CASE
		CASE VARTYPE(loBasicHttpBinding_IServicio)#"O"
			* Handle SOAP error connecting to web service
		CASE !EMPTY(loBasicHttpBinding_IServicio.FaultCode)
			* Handle SOAP error calling method
			lcErrorMsg=lcErrorMsg+CHR(13)+loBasicHttpBinding_IServicio.Detail
		OTHERWISE
			* Handle other error
		ENDCASE
		* Use for debugging purposes
		MESSAGEBOX(lcErrorMsg,0+48+0,"Se produjo un Error")
		v_autorizado = .F.
	FINALLY
	ENDTRY

		IF  v_estadoComp  = .T.		

			v_respuesta=loBasicHttpBinding_IServicio.autorizarComprobante(v_idAutorizar)
	
			v_observacion = ""  
		
			v_estado = SUBSTR(v_respuesta,1,1)
			v_obsercacion = ""
			v_error = ""
			v_codError = ""
			IF v_estado = "A"
				*Arpobado
				*RAAAANNNNNNNNCCCCCCCCCCCCCCFFFFFFFF
				v_ptoVta =  SUBSTR(v_respuesta,2,4)
				v_nro =  SUBSTR(v_respuesta,6,8)
				v_cae =  SUBSTR(v_respuesta,14,14)
				v_fechavenc =  SUBSTR(v_respuesta,28,8)
				*FECHA QUE RETORNA ES FECHAVENC?
				v_obsercacion = ""
				v_error = ""
				v_fecha = cftofc(DATE())

				MESSAGEBOX("Comprobante Autorizado: "+ v_ptovta + " - "+v_nro + " CAE: "+v_cae+"Fecha: "+v_fecha,0+64,"Comprobante Autorizado")
			
				*** ACTUALIZO EL NUMERO DEL COMPROBANTE EN FACTURAS
*				DIMENSION lamatriz7(1,2)
				
*				lamatriz7(1,1) = 'numero'
*				lamatriz7(1,2) = ALLTRIM(v_nro)
				
*				p_tipoope     = 'U'
*				p_condicion   = " idfactura = " + ALLTRIM(STR(v_idAutorizar))
*				v_titulo      = " LA MODIFICACIÓN "		
*				p_tabla     = 'facturas'
*				p_matriz    = 'lamatriz7'
*				p_conexion  = vconeccionF
*				IF SentenciaSQL(p_tabla,p_matriz,p_tipoope,p_condicion,p_conexion) = .F.  
*				    MESSAGEBOX("Ha Ocurrido un Error en "+v_titulo+" "+ALLTRIM(STR(v_numero)),0+48+0,"Error")
*				ENDIF  
				
				
				
				*** ACTUALIZO EL MAXIMO NUMERO EN COMPACTIV ***
				
				*Busco el pventa e idcomproba de la factura
*				vconeccionF=abreycierracon(0,_SYSSCHEMA)	
*			
*				sqlmatriz(1)="Select idcomproba, pventa from facturas "
*				sqlmatriz(2)=" where idfactura = "+ ALLTRIM(STR(v_idfactura))
*
*				verror=sqlrun(vconeccionF,"comPvta_sql")
*				IF verror=.f.  
*				    MESSAGEBOX("Ha Ocurrido un Error en la BÚSQUEDA de comprobante y pventa de la factura ",0+48+0,"Error")
*
*				ENDIF 
*				
*				SELECT comPvta_sql
*				GO TOP 
*
*				v_idcomproba 	= comPvta_sql.idcomproba
*				v_pventa		= comPvta_sql.pventa
*				
*				*Actualizo compactiv
*				
*				DIMENSION lamatriz7(1,2)
*				
*				lamatriz7(1,1) = 'maxnumero'
*				lamatriz7(1,2) = ALLTRIM(v_nro)
*				
*				p_tipoope     = 'U'
*				p_condicion   = " idcomproba = " + ALLTRIM(STR(v_idcomproba )) + " and pventa = "+ALLTRIM(STR(v_pventa))
*				v_titulo      = " LA MODIFICACIÓN "		
*				p_tabla     = 'compactiv'
*				p_matriz    = 'lamatriz7'
*				p_conexion  = vconeccionF
*				IF SentenciaSQL(p_tabla,p_matriz,p_tipoope,p_condicion,p_conexion) = .F.  
*				    MESSAGEBOX("Ha Ocurrido un Error en "+v_titulo+" "+ALLTRIM(STR(v_numero)),0+48+0,"Error")
*				ENDIF  
							
			ELSE

				IF v_estado = "R"
					*Rechazado
					v_respuesta =  SUBSTR(v_respuesta,2)
					MESSAGEBOX("Comprobante Rechazado: "+ v_respuesta,0+48+0,"Comprobante Rechazado")
					v_ptoVta = ""
					v_nro = ""
					v_cae = ""
					v_fechavenc =""
					
					*¿La respuesta va en error u observacion¡?
					v_error = ""
					v_observacion  = V_respuesta 
					*¿Falta codigo de error?
					v_codErro = ""
				ELSE
					*Indefinido
					MESSAGEBOX("Respuesta desconocida",0+48+0,"Error al Autorizar")

				ENDIF 
			ENDIF 
			
				
			
			*** Guardar datos en facturasFe
			DIMENSION lamatriz8(13,2)
			
			v_idfe = maxnumeroidx("idfe","I","facturasfe",1)
			
			lamatriz8(1,1)='idfe'
			lamatriz8(1,2)= ALLTRIM(STR(v_idfe))
			lamatriz8(2,1)='idfactura'
			lamatriz8(2,2)= ALLTRIM(STR(v_idAutorizar))
			lamatriz8(3,1)='fecha'
			*lamatriz8(3,2)= "'"+ALLTRIM(cftofc(thisform.tb_fecha.Value))+"'"
			*Fecha de la factura
			lamatriz8(3,2)= "'"+ALLTRIM(v_fechaComp)+"'"
			lamatriz8(4,1)='resultado'
			lamatriz8(4,2)= "'"+ALLTRIM(v_estado)+"'"
			lamatriz8(5,1)='caecesp'
			lamatriz8(5,2)= "'"+ALLTRIM(v_cae)+"'"
			lamatriz8(6,1)='caecespven'
			lamatriz8(6,2)= "'"+ALLTRIM(v_fechavenc)+"'"
			*Fecha desde CESP
			lamatriz8(7,1)='caecespfec'
			lamatriz8(7,2)= "''"
			lamatriz8(8,1)='pathpdffe'
			lamatriz8(8,2)= "''"
			* idtipo comprobante afip
			lamatriz8(9,1)='idtipofe'
			lamatriz8(9,2)= "0"
			lamatriz8(10,1)='idtranafip'
			lamatriz8(10,2)= "0"
			*Descripción del error
			lamatriz8(11,1)='observa'
			lamatriz8(11,2)= "'"+ALLTRIM(v_observacion)+"'"
			*Codigo del error
			lamatriz8(12,1)='coderror'
			lamatriz8(12,2)= "'"+v_codError+"'"
				*¿ Que va aca?
			lamatriz8(13,1)='numerofe'
			lamatriz8(13,2)=  v_nro


		*** Creo siempre un nuevo registro para idfe?
			p_tipoope     = 'I'
			p_condicion   = ''
			v_titulo      = " EL ALTA "

			p_tabla     = 'facturasfe'
			p_matriz    = 'lamatriz8'
			p_conexion  = vconeccionF
			IF SentenciaSQL(p_tabla,p_matriz,p_tipoope,p_condicion,p_conexion) = .F.  
			    MESSAGEBOX("Ha Ocurrido un Error en "+v_titulo+" "+ALLTRIM(STR(v_numero)),0+48+0,"Error")
			    
			    v_autorizado =.F.
			ENDIF  
		
				v_autorizado =.T.
		
		ELSE
		
			MESSAGEBOX("El servicio no está iniciado o el comprobante no está cargado",0+48+0,"Error")
			    
			v_autorizado =.F.
		
		
		ENDIF 
		
	RETURN v_autorizado  

ENDFUNC 

* FUNCIÓN PARA AUTORIZAR COMPROBANTES
* PARAMETROS: P_PUNTOVTA, PUNTO DE VTA DEL COMPROBANTE; P_IDFACTURA, ID DEL COMPROBANTE A AUTORIZAR
FUNCTION autorizarFE
PARAMETERS p_puntoVta, p_idFactura

v_puntoVta = p_puntoVta
v_idfactura= p_idFactura
v_autorizar = .F.

	TRY 


	v_servicioCargado = loBasicHttpBinding_IServicio.servicioIniciado()
	
	*v_estadoComp =	loBasicHttpBinding_IServicio.comprobanteCargado()

		IF v_servicioCargado  = .F.
		
			*El servicio no está cargado
			*Intenta cargar
			v_servicioCargado = cargarServicioFE(v_puntoVta)
			
			IF v_servicioCargado  = .F.
				*Comprueba y no está cargado
				MESSAGEBOX("El servicio para autorizar comprobantes electrónicos no está disponible",0+48+0,"Error al autorizar")
				v_autorizar = .F.
			ENDIF  
			

		ENDIF 
	CATCH TO loException
			lcErrorMsg="Error: "+TRANSFORM(loException.Errorno)+" - "+loException.Message
			DO CASE
			CASE VARTYPE(loBasicHttpBinding_IServicio)#"O"
				* Handle SOAP error connecting to web service
			CASE !EMPTY(loBasicHttpBinding_IServicio.FaultCode)
				* Handle SOAP error calling method
				lcErrorMsg=lcErrorMsg+CHR(13)+loBasicHttpBinding_IServicio.Detail
			OTHERWISE
				* Handle other error
			ENDCASE
			* Use for debugging purposes
			MESSAGEBOX(lcErrorMsg,0+48+0,"Se produjo un Error")
			v_autorizar = .F.
		FINALLY
	ENDTRY	
		
		IF v_servicioCargado = .T.
			***COMPRUEBO QUE EL COMPROBANTE NO ESTÉ AUTORIZADO
	
			vconeccion=abreycierracon(0,_SYSSCHEMA)	
				
				sqlmatriz(1)="Select * from facturasfe "
				sqlmatriz(2)=" where idfactura = "+ ALLTRIM(STR(v_idfactura))

				verror=sqlrun(vconeccion,"factufe_sql")
				IF verror=.f.  
				    MESSAGEBOX("Ha Ocurrido un Error en la BÚSQUEDA de la facturasFE",0+48+0,"Error")
				    v_autorizar = .F.
				ELSE
				
					SELECT factufe_sql
					GO TOP 
					
					DO WHILE NOT EOF()
						
						v_resultado = factufe_fe.resultado
						v_caecesp 	= factufe_fe.caecesp
						
						IF v_resultado = "A" OR v_caecesp <> ""
						
							MESSAGEBOX("El comprobante ID: "+ALLTRIM(STR(v_idfactura))+" ya se encuentra autorizado",0+48+0,"Error al autorizar")
							v_autorizar = .F.
							RETURN v_autorizar
						ENDIF 
						
						SELECT factu_fe
						SKIP 1
					
					ENDDO 
				ENDIF 


			*Carga el comprobante en el servicio para autorizar
			*thisform.cargarcomprobantefe


				
			v_comprobanteCargado = cargarcompFE(v_idfactura)
			IF v_comprobanteCargado = .t.
					*Intenta autorizar el comprobante cargado en el servicio
				*thisform.autorizarcomprobantefe


				v_comprobanteAutorizado = autorizarCompFE(v_idfactura)
				
				IF v_comprobanteAutorizado  = .T.
				
					v_autorizar = .T.
					
					
					
					
					
				ELSE
					MESSAGEBOX("Ha Ocurrido un Error al autorizar el comprobante en el servicio ",0+48+0,"Error")
				    
				    v_autorizar = .F.
				
				ENDIF 
				
				
			ELSE

			    MESSAGEBOX("Ha Ocurrido un Error al cargar el comprobante en el servicio ",0+48+0,"Error")
			    
			    v_autorizar = .F.
			
			ENDIF 
		ENDIF 

			

		

	RETURN v_autorizar

	

ENDFUNC 

* FUNCIÓN PARA IMPRIMIR UNA FACTURA (COMPROBANTES DE LA TABLA FACTURA: FACTURA, NC, ND)
* PARAMETROS: P_IDFACTURA, P_ESELECTRONICA
FUNCTION imprimirFactura
PARAMETERS p_idFactura, p_esElectronica


	v_idfactura = p_idFactura
	v_esElectronica = p_esElectronica 

	IF v_idfactura > 0
		
		*** Busco los datos de la factura y el detalle
		IF v_esElectronica  = .T.

			vconeccionF=abreycierracon(0,_SYSSCHEMA)	
		

			sqlmatriz(1)="Select *,c.detalle as detIVA, v.nombre as nomVend from facturas f left join detafactu d on f.idfactura = d.idfactura " 
			sqlmatriz(2)=" left join facturasfe fe on f.idfactura = fe.idfactura left join condfiscal c on f.iva = c.iva"
			sqlmatriz(3)=" left join vendedores v on f.vendedor = v.vendedor"
			sqlmatriz(4)=" where f.idfactura = "+ ALLTRIM(STR(v_idfactura))+ " and fe.resultado = 'A'"
			
			verror=sqlrun(vconeccionF,"fac_det_sql")
			IF verror=.f.  
			    MESSAGEBOX("Ha Ocurrido un Error en la BÚSQUEDA  de la factura",0+48+0,"Error")
			ENDIF
		
		ELSE
			
			vconeccionF=abreycierracon(0,_SYSSCHEMA)	
		
			sqlmatriz(1)="Select *,c.detalle as detIVA from facturas f left join detafactu d on f.idfactura = d.idfactura " 
			sqlmatriz(2)=" left join condfiscal c on f.iva = c.iva"
			sqlmatriz(3)=" left join vendedores v on f.vendedor = v.vendedor"
			sqlmatriz(4)=" where f.idfactura = "+ ALLTRIM(STR(v_idfactura))

			verror=sqlrun(vconeccionF,"fac_det_sql")
			IF verror=.f.  
			    MESSAGEBOX("Ha Ocurrido un Error en la BÚSQUEDA  de la factura",0+48+0,"Error")
			ENDIF
		
		ENDIF 
		
		
		*** Busco los datos de los impuestos
			vconeccionF=abreycierracon(0,_SYSSCHEMA)	
		
			sqlmatriz(1)="Select fi.detalle as detaIMP, fi.neto as netoIMP, fi.razon as razonIMP, fi.importe as importeIMP, ai.tipo as tipoIMP "
			sqlmatriz(2)=" from facturasimp fi" 
			sqlmatriz(3)=" left join impuestos i on fi.impuesto = i.impuesto "
			sqlmatriz(4)=" left join afipimpuestos ai on i.idafipimp = ai.idafipimp "
			sqlmatriz(5)=" where fi.idfactura = "+ ALLTRIM(STR(v_idfactura))

			verror=sqlrun(vconeccionF,"impuestos_sql")
			IF verror=.f.  
			    MESSAGEBOX("Ha Ocurrido un Error en la BÚSQUEDA  de la factura",0+48+0,"Error")
			ENDIF
		

		SELECT * FROM fac_det_sql INTO TABLE .\factu
		
		SELECT * FROM impuestos_sql INTO TABLE .\ImpIVA WHERE ALLTRIM(tipoIMP) = "IVA"
		
		SELECT * FROM impuestos_sql INTO TABLE .\ImpTRIB WHERE ALLTRIM(tipoIMP) = "TRIBUTO"
		
		SELECT factu
		
		IF NOT EOF()
		
			v_idcomproba = factu.idcomproba
			DO FORM reporteform WITH "factu;impIva;impTRIB","facturasrc;impIVArc;impTRIBrc",v_idcomproba
			
		ELSE
			MESSAGEBOX("Error al cargar la factura para imprimir",0+48+0,"Error al cargar la factura")
			RETURN 	
		ENDIF 
		
		

	ELSE
		MESSAGEBOX("NO se pudo recuperar la factura ID <= 0",0+16,"Error al imprimir")
		RETURN 

	ENDIF 

ENDFUNC 


* FUNCIÓN PARA IMPRIMIR RECIBO
* PARAMETROS: P_IDRECIBO
FUNCTION imprimirRecibo
PARAMETERS p_idRecibo


	v_idrecibo = p_idrecibo
	
	IF v_idrecibo > 0
		
		*** Busco los datos del recibo
					
			vconeccionF=abreycierracon(0,_SYSSCHEMA)	
		
			sqlmatriz(1)="Select * from recibos" 
			sqlmatriz(4)=" where idrecibo = "+ ALLTRIM(STR(v_idrecibo))

			verror=sqlrun(vconeccionF,"recibo_sql")
			IF verror=.f.  
			    MESSAGEBOX("Ha Ocurrido un Error en la BÚSQUEDA  del recibo",0+48+0,"Error")
			ENDIF
		
		 		

		SELECT * FROM recibo_sql INTO TABLE .\recibo
				
		SELECT recibo
		
		IF NOT EOF()
		
			v_idcomproba = recibo.idcomproba
			DO FORM reporteform WITH "recibo","reciborc",v_idcomproba
			
		ELSE
			MESSAGEBOX("Error al cargar el recibo para imprimir",0+48+0,"Error al cargar el recibo")
			RETURN 	
		ENDIF 
		
		

	ELSE
		MESSAGEBOX("NO se pudo recuperar el recibo el ID <= 0",0+16,"Error al imprimir")
		RETURN 

	ENDIF 

ENDFUNC 




* FUNCIÓN PARA IMPRIMIR UN MOVIMIENTO DE STOCK DE MATERIALES
* PARAMETROS: P_IDMOVISTOCK
FUNCTION imprimirOtMoviStock
PARAMETERS p_idMoviStockP


	v_idmovip = p_idMoviStockP


	IF v_idmovip > 0
	
	
		** Compruebo que no esté anulado
		vconeccionF=abreycierracon(0,_SYSSCHEMA)	
		
		sqlmatriz(1)="Select * from otmovianul "
		sqlmatriz(2)=" where idmovip= "+ ALLTRIM(STR(v_idmovip ))

		verror=sqlrun(vconeccionF,"otAnul_sql")
		IF verror=.f.  
		    MESSAGEBOX("Ha Ocurrido un Error en la comprobación de comprobante anulado",0+48+0,"Error")
		    RETURN 
		ENDIF
	
		SELECT  otAnul_sql
		
		IF NOT EOF()
			 MESSAGEBOX("El comprobante se encuentra ANULADO, no se puede imprimir",0+48+0,"No se puede imprimir")
		    RETURN 
		ENDIF 
	
		
		
		*** Busco los datos del movimiento y el detalle
		
		
			sqlmatriz(1)="Select p.*,h.*, e.apellido as apellEnt, e.nombre as nomEnt, e.compania, e.cuit, e.direccion, t.ie,t.reporte, d.detalle as detDepo "
			sqlmatriz(2)=" from otmovistockp p left join otmovistockh h on p.idmovip = h.idmovip " 
			sqlmatriz(3)=" left join entidades e on p.entidad = e.entidad "
			*sqlmatriz(4)=" left join otmateriales m on h.idmate = m.idmate "
			sqlmatriz(5)=" left join tipomstock t on h.idtipomov = t.idtipomov "
			sqlmatriz(6)=" left join otdepositos d on h.iddepo = d.iddepo "
			sqlmatriz(7)=" where p.idmovip = "+ ALLTRIM(STR(v_idmovip))

			verror=sqlrun(vconeccionF,"otmovi_sql")
			IF verror=.f.  
			    MESSAGEBOX("Ha Ocurrido un Error en la BÚSQUEDA  del Movimiento de Stock",0+48+0,"Error")
			    RETURN 
			ENDIF
		
	
	
		

		SELECT * FROM otmovi_sql INTO TABLE .\otmoviImpr

		
		SELECT otmoviImpr
		
		IF NOT EOF()
		
			
			DO FORM reporteform WITH "otmoviImpr","movistockcr","otmovistock"
			
			
		ELSE
			MESSAGEBOX("Error al cargar el movimiento para imprimir",0+48+0,"Error al cargar el movimiento")
			RETURN 	
		ENDIF 
		
		

	ELSE
		MESSAGEBOX("NO se pudo recuperar el movimiento de stock ID <= 0",0+16,"Error al imprimir")
		RETURN 

	ENDIF 

ENDFUNC 




FUNCTION compruebaCajaReca

*** Controlo que se haya seleccionado una caja de recaudación 

IF _SYSCAJARECA = 0 && No hay caja seleccionada, pide caja

	v_idcajareca = 0
	
	DO FORM selectcajareca  TO v_idcajareca
	
	IF v_idcajareca > 0
	
		_SYSCAJARECA = v_idcajareca
	ENDIF 

ENDIF 


ENDFUNC 

* ACTUALIZO CAJARECAUDAH CON EL COMPROBANTE GUARDADO
* PARAMETROS: P_idComp: id comprobante; P_idReg: ID del registro
FUNCTION guardaCajaRecaH 
PARAMETERS p_idComp, p_idReg
				
		v_idcajarecaudah = maxnumeroidx("idcajareh","I","cajarecaudah",1)

		v_idcajareca 	= _SYSCAJARECA
		v_usuario		= _SYSUSUARIO
		v_idcomproba	= p_idComp
		v_idregicomp	=  p_idReg

		DIMENSION lamatriz3(5,2)
		
			
		lamatriz3(1,1)='idcajareh'
		lamatriz3(1,2)= ALLTRIM(STR(v_idcajarecaudah ))
		lamatriz3(2,1)='idcajareca'
		lamatriz3(2,2)= ALLTRIM(STR(v_idcajareca ))
		lamatriz3(3,1)='usuario'
		lamatriz3(3,2)= "'"+ALLTRIM(v_usuario)+"'"
		lamatriz3(4,1)='idcomproba'
		lamatriz3(4,2)= ALLTRIM(STR(v_idcomproba))
		lamatriz3(5,1)='idregicomp'
		lamatriz3(5,2)= ALLTRIM(STR(v_idregicomp))
		
			
		p_tipoope     = 'I'
		p_condicion   = ''
		v_titulo      = " EL ALTA "
		p_tabla     = 'cajarecaudah'
		p_matriz    = 'lamatriz3'
		p_conexion  = vconeccionF
		IF SentenciaSQL(p_tabla,p_matriz,p_tipoope,p_condicion,p_conexion) = .F.  
		    MESSAGEBOX("Ha Ocurrido un Error en "+v_titulo+" "+ALLTRIM(STR(v_numero)),0+48+0,"Error")
		    RETURN .F.
		ENDIF	
	
		RETURN .T.

ENDFUNC 


 *** COPIAR ARCHIVOS ***
FUNCTION copydocu
	PARAMETERS p_docu, p_pathn, p_codigo, p_viejo
	
	j = LEN(ALLTRIM(p_docu))
	LON = J
	DO WHILE ! (SUBSTR(p_docu,j,1) == "\") AND ! (ALLTRIM(p_docu) == "") AND j > 0
		j = j - 1
	ENDDO 

	IF !(ALLTRIM(p_docu) == "") AND J > 0 THEN 
		viejo_directorio = LOWER(SUBSTR(p_docu,1,J))	
	ENDIF 

	IF !(ALLTRIM(p_docu) == "") THEN 
		a_archivo = LOWER(ALLTRIM(p_codigo)+"_"+ALLTRIM(p_viejo))
	ENDIF 
	
	
	nuevo_completo   = ALLTRIM(p_pathn)+"\"+ALLTRIM(a_archivo)
	viejo_completo   = LOWER(ALLTRIM(p_docu))
	
	IF ALLTRIM(UPPER(viejo_completo))==ALLTRIM(UPPER(nuevo_completo)) THEN 
		* El Archivo ya esta en el directorio de la red
	ELSE 
			v_var = 0	
			new_nuevo_completo = ALLTRIM(nuevo_completo)
			DO WHILE FILE(new_nuevo_completo) = .t.
				v_var = v_var + 1
				new_nuevo_completo = ALLTRIM(SUBSTR(nuevo_completo,1,(LEN(ALLTRIM(nuevo_completo))-4))+ALLTRIM(STR(v_var))+SUBSTR(nuevo_completo,(LEN(ALLTRIM(nuevo_completo))-3)))
			ENDDO 
			nuevo_completo = ALLTRIM(new_nuevo_completo)
			v_ejecutar = "COPY FILE '"+ALLTRIM(viejo_completo)+"' TO '"+ALLTRIM(nuevo_completo)+"'"
			MESSAGEBOX(v_ejecutar)
			&v_ejecutar				
	ENDIF

	j = LEN(ALLTRIM(nuevo_completo))
	LON = J
	DO WHILE ! (SUBSTR(nuevo_completo,j,1) == "\") AND ! (ALLTRIM(nuevo_completo) == "") AND j > 0
		j = j - 1
	ENDDO 

	a_archivo = ""
	IF !(ALLTRIM(nuevo_completo) == "") THEN 
		a_archivo = ALLTRIM(LOWER(SUBSTR(nuevo_completo,J+1,LON - J + 1)))
	ENDIF 
	
RETURN a_archivo
ENDFUNC 

*** Función que recibe un numero decimal y retorna el RGB equivalente, en una cadena de texto
FUNCTION decimalARGB
PARAMETERS p_numDecimal

v_num = p_numDecimal

v_cad1 = ""
v_cad2 = ""
v_cad3 = ""

v_cad1 = ALLTRIM(STRTRAN(STR(INT(VAL('0x'+RIGHT(TRANSFORM(v_num , '@0'),2))),3,0)," ","0"))

v_cad2= ALLTRIM(STRTRAN(STR(INT(VAL('0x'+SUBSTR(TRANSFORM(v_num, '@0'),7,2))),3,0)," ","0"))

v_cad3 = ALLTRIM(STRTRAN(STR(INT(VAL('0x'+SUBSTR(TRANSFORM(v_num , '@0'),5,2))),3,0)," ","0"))

v_retorno = v_cad1 + v_cad2 + v_cad3


*v_retorno = ALLTRIM(STR(INT(VAL('0x'+RIGHT(TRANSFORM(v_num , '@0'),2)))))+ALLTRIM(STR(INT(VAL('0x'+SUBSTR(TRANSFORM(v_num, '@0'),7,2)))))+ALLTRIM(STR(INT(VAL('0x'+SUBSTR(TRANSFORM(v_num , '@0'),5,2))))


RETURN v_retorno

ENDFUNC 
