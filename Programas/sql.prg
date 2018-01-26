********************************************************************
********************************************************************

FUNCTION ABREYCIERRACON
PARAMETERS co,conex
* Abre y Cierra conexiones con base de datos
* Recibe como parametros el nombre de la base de datos 
* Si lo que se desea es cerrar la conexion, recibe como parametro
* "co" = al numero de la conexión y "conex" = ""
conectar = 0
IF !(ALLTRIM(conex) == "") then
	ccDataBaseSQL = conex

	**********************************************************************
	*SI MIDRVMYSQL NO ESTA DEFINIDO ME CONECTO A LA BASE DE VISUAL FOXPRO
	*ALE 09/07/2012
	**********************************************************************
*!*		LOCAL lcPlataforma &&=1 Visualfoxpro =2 Mysql

*!*		IF TYPE("_SYSDRVMYSQL") = "U" THEN 
*!*			*VARIABLE NO DEFINIDA
*!*			lcPlataforma = 1	  
*!*		ELSE
*!*			IF EMPTY(MIDRVMYSQL) THEN 
*!*				*FOXPRO
*!*				lcPlataforma = 1
*!*			ELSE
*!*				*MYSQL
*!*				lcPlataforma = 2
*!*			ENDIF 
*!*		ENDIF 

		*Bases de datos en Mysql
		**AQUI AGREGUE LA LOGICA PARA QUE EN EL CASO DE QUE SEA UNA CONEXION A MYSQL SOLO ABRA UNA VEZ LA CONEXION *********** DESDE AQUI ****
		** EXTRAIGO EL NOMBRE DE LA BASE DEL STRING PASADO COMO CONEXION CON FECHA 25/08/2007
		*ale- anule esto porque no me podia conectar a distintas bases de datos
		vc_mysl= ""
		
		vc_mysl = LOWER(ALLTRIM(ccDataBaseSQL))
		VARCONMYSQL = ALLTRIM(vc_mysl)+'_cmysql'
		******************************************************************
		IF TYPE(VARCONMYSQL) = "U" THEN 
			PUBLIC &VARCONMYSQL
			conectar = conMySQL(ccDataBaseSQL) && realiza la conexion con la base de datos por unica vez
			EJE = VARCONMYSQL+" = conectar "
			&EJE
		ELSE
			conectar = conMySQL(ccDataBaseSQL) &&me vuelvo a conectar porque puede ser otra base de datos (ale)
			EJE = "conectar = "+VARCONMYSQL
			&EJE				
		ENDIF
	************************************************************************************************************************** HASTA AQUI ***
	*conectar = conMySQL(ccDataBaseSQL)
	******************************************************************************************************************************************
	
	IF conectar < 0 then
		=MESSAGEBOX("Error en apertura de la conexion con la base datos... ( "+ALLTRIM(conex)+" )",16,"Error Fatal")
*		=cierraapp()
*		CLOSE ALL
		ON ERROR errores= .f.
		QUIT 
	ENDIF
ELSE
	*verfico si es una conexion a visual foxpro cierro la conexion desde aqui (en mysql se encarga de abrir y cerrar ConMysql)
	**********************************
	conectar = 0
ENDIF
RETURN conectar 

********************************************************************
FUNCTION LimpiaMatriz
* Blanquea la matriz SQLMATRIZ que se usa para armar centencias SQL
	FOR I = 1 TO 20
		SQLMATRIZ(I)=""
	ENDFOR 
RETURN


********************************************************************
********************************************************************
FUNCTION Sqlrun
* Ejecuta la sentencia SQL ingresada en la matriz SQLMATRIZ 
* recibe como parametro en "co" la conexion sobre la cual ejecutar la SQL
* y en "pcursor" el nombre del cursor en el cual se devuelve la consulta
* retorna falso si no se pudo ejecutar la consulta y limpia la matriz SQL siempre
    PARAMETERS co,pcursor
    LOCAL vrreturn
    local r
	* Esta rutina pone en minuscula los caracteres de sqlmatriz(i), 
	* salvo que el caractere se encuentre en una cadena encerrada en ''
	V_FLAG     = 1 && SI VALE 0 LA CADENA ESTÁ ABIERTA - SI VALE 1 LA CADENA CERRADA
	FOR I = 1 TO 20 STEP 1
		V_ORIGINAL = SQLMATRIZ(I)
		V_NUEVOSTR = ''
		V_TAMAÑO   = LEN(SQLMATRIZ(I)) 
*		V_FLAG     = 1 && SI VALE 0 LA CADENA ESTÁ ABIERTA - SI VALE 1 LA CADENA CERRADA
		
		* Proceso el string de sqlmatriz(i)
		FOR J=1 TO V_TAMAÑO STEP 1
			v_char = SUBSTR(v_original,j,1)
			IF v_char = "'" THEN 
				IF v_flag = 0 THEN 
					v_flag = 1
				ELSE 
					v_flag = 0
				ENDIF 
			ELSE
				IF v_flag = 0 THEN
					* lo dejo como esta
				ELSE 
					v_char = LOWER(v_char)
				ENDIF 
			ENDIF 
			V_NUEVOSTR = V_NUEVOSTR + v_char
		ENDFOR 
		
		SQLMATRIZ(I) = V_NUEVOSTR
	ENDFOR     
	LOCAL laError, lcMsg, ln
	DIMENSION laError[1]   
    
	r=SQLEXEC(co,SQLMATRIZ(1)+SQLMATRIZ(2)+SQLMATRIZ(3)+SQLMATRIZ(4)+SQLMATRIZ(5)+SQLMATRIZ(6)+SQLMATRIZ(7)+SQLMATRIZ(8)+SQLMATRIZ(9)+SQLMATRIZ(10)+SQLMATRIZ(11)+SQLMATRIZ(12)+SQLMATRIZ(13)+SQLMATRIZ(14)+SQLMATRIZ(15)+SQLMATRIZ(16)+SQLMATRIZ(17)+SQLMATRIZ(18)+SQLMATRIZ(19)+SQLMATRIZ(20),pcursor)
	IF r < 0
	  *MANEJO DE ERRORES * ALEJANDRO
	  MESSAGEBOX("HA OCURRIDO UN ERROR AL EJECUTAR LA SIGUIENTE SENTENCIA:"+CHR(13)+SQLMATRIZ(1)+SQLMATRIZ(2)+SQLMATRIZ(3)+SQLMATRIZ(4)+SQLMATRIZ(5)+SQLMATRIZ(6)+SQLMATRIZ(7)+SQLMATRIZ(8)+SQLMATRIZ(9)+SQLMATRIZ(10)+SQLMATRIZ(11)+SQLMATRIZ(12)+SQLMATRIZ(13)+SQLMATRIZ(14)+SQLMATRIZ(15)+SQLMATRIZ(16)+SQLMATRIZ(17)+SQLMATRIZ(18)+SQLMATRIZ(19)+SQLMATRIZ(20),0+64,'SQLRUN')
	  IF AERROR(laError) > 0
	    *-- Ocurrio un error
	    * DISPLAY MEMORY LIKE laError
	    lcMsg = ""
	    FOR ln = 1 TO ALEN(laError,2)
	      lcMsg = lcMsg + TRANSFORM(laError(1,ln)) + CHR(13)
	    ENDFOR
	    MESSAGEBOX(lcMsg, 64, "SQLRUN (ERROR)")
	  ENDIF
	  *FIN INFORME DE ERROR OCURRIDO	
		vrreturn=.f.
    ELSE
    	vrreturn=.t.
    ENDIF 
	LimpiaMatriz()	
RETURN vrreturn


********************************************************************
********************************************************************
FUNCTION SqlIniciarTrans
PARAMETERS co
* Inicia las transacciones en la conexion especificada en "co"
local varreturn	
local r
on error
r = sqlexec(co,'START TRANSACTION')					
if r<0 then
	varreturn=.f.
	SQLFlagErrorTrans=-1
else
	varreturn= .t.
	SQLFlagErrorTrans=0
endif	
return varreturn


********************************************************************
********************************************************************
FUNCTION SqlCerrarTrans
parameters co,paramCommitRollback &&0:commit, 1:rollback
*cierra las transacciones iniciadas en la conexion "co"
local varreturn	
local r
r=0 &&para que si no ejecuta nungun cierre devuelva un estado ok
if paramCommitRollback=0
	r = sqlexec(co,'COMMIT')
else
	r = sqlexec(co,'ROLLBACK')
ENDIF

if r<0 then
	varreturn=.f.
else
	varreturn= .t.
endif
return varreturn


*******************************************************************************
*******************************************************************************
FUNCTION ConMySQL
PARAMETERS pbase
&&	pbase2 = LOWER(ALLTRIM(pbase)+ALLTRIM(MYSQL_PRU))
	pbase2 = LOWER(ALLTRIM(pbase))
******************************************************************

	lnHandle = 0
	IF !EMPTY(pbase2) THEN 
		SQLDISCONNECT(lnHandle)
		lcServer=ALLTRIM(_sysmysql_server)
		lcDatabase=ALLTRIM(pbase2)
		lcUser=ALLTRIM(_sysmysql_user)
		lcPassword=ALLTRIM(_sysmysql_pass)
		lcDriver=ALLTRIM(_SYSDRVMYSQL)
		lcPort=ALLTRIM(_sysmysql_port)
		lcStringConn="Driver="+lcDriver+";Port="+lcPort+;
		";Server="+lcServer+;
		";Database="+lcDatabase+;
		";Uid="+lcUser+;
		";Pwd="+lcPassWord		
		lnHandle=SQLSTRINGCONNECT(lcStringConn)
				
	ENDIF 
	
	IF lnHandle > 0
	ELSE
*		=AERROR(laError)
*		MESSAGEBOX("Error de conexión"+CHR(13)+;
*		"Descripcion:"+laError[2])
	ENDIF
	RETURN lnHandle
ENDFUNC 


FUNCTION configschema (tcId)
	*LEER VARIABLES DE CONFIG. DE ACCESO A ADMINDB
*!*		PUNTERO = FOPEN("CONMYSQL.CFG",0)
*!*		IF PUNTERO > 0 THEN
*!*			DO WHILE !FEOF(PUNTERO)
*!*				EJE = ALLTRIM(FGETS(PUNTERO))
*!*				IF !((ALLTRIM(EJE) == "") OR (SUBSTR(ALLTRIM(EJE),1,1)=="[")) THEN
*!*					&EJE
*!*				ENDIF
*!*			ENDDO
*!*			=FCLOSE(PUNTERO)
*!*			SET SAFETY OFF
*!*		ENDIF
	vco=abreycierracon(0,'admindb')
	
	sqlmatriz(1)="select * from esquemas where idesquema = "+ALLTRIM(tcId)
	
	verror=sqlrun(vco,'configesq')
	
	IF !verror THEN 
		MESSAGEBOX('Error al configurar el acceso al esquema. Function sql.prg(configschema)',0+64,'Error')
	ENDIF 
	SELECT configesq
	GO TOP 
	IF EOF() OR ISNULL(configesq.host) THEN  
		MESSAGEBOX('Error al configurar el acceso al esquema. Esquema no encontrado',0+64,'Error')
		RETURN .F.
	ENDIF 
	_sysmysql_server = configesq.host
	_sysmysql_user	 = configesq.usuario
	_sysmysql_pass	 = configesq.password
	_sysmysql_port	 = configesq.port
	_sysmischema	 = configesq.schemma
	USE IN configesq
	RETURN .T.
ENDFUNC 


**********************************************************************************
FUNCTION SentenciaSQL
PARAMETERS p_tabla, p_matriz, p_tipoope, p_condicion, p_conexion
	ErrorSQL = .F.
	DO CASE 
		CASE p_tipoope = 'I' && INSERT
			limpiamatriz()
			pos = 1
			elementos = ALEN(&p_matriz,1)
			sqlmatriz(pos) = "INSERT INTO "+ALLTRIM(p_tabla)+" ("
			FOR fila = 1 TO elementos STEP 1
				IF LEN(ALLTRIM(sqlmatriz(pos))) + LEN(ALLTRIM(&p_matriz(fila,1))) < 240 THEN 
					* no hago nada
				ELSE 
					pos  = pos + 1
				ENDIF
				IF fila < elementos THEN 
					sqlmatriz(pos) = sqlmatriz(pos)+ALLTRIM(&p_matriz(fila,1))+","
				ELSE 
					sqlmatriz(pos) = sqlmatriz(pos)+ALLTRIM(&p_matriz(fila,1))
				ENDIF 
		 	ENDFOR 
		 	sqlmatriz(pos) = sqlmatriz(pos)+ ") values ("
			FOR fila = 1 TO ALEN(&p_matriz,1) STEP 1
			
				IF LEN(ALLTRIM(sqlmatriz(pos))) + LEN(ALLTRIM(&p_matriz(fila,2))) < 240 THEN 
					* no hago nada
				ELSE 
					pos  = pos + 1
				ENDIF
				IF fila < elementos THEN 
					sqlmatriz(pos) = sqlmatriz(pos)+ALLTRIM(&p_matriz(fila,2))+","
				ELSE 
					sqlmatriz(pos) = sqlmatriz(pos)+ALLTRIM(&p_matriz(fila,2))
				ENDIF 
		 	ENDFOR 
		 	sqlmatriz(pos) = sqlmatriz(pos)+")"
		 	
*!*			 	MESSAGEBOX(sqlmatriz(1)+ ;
*!*			 				sqlmatriz(2)+ ;
*!*			 				sqlmatriz(3)+ ;
*!*			 				sqlmatriz(4)+ ;
*!*			 				sqlmatriz(5)+ ;
*!*			 				sqlmatriz(6)+ ;
*!*			 				sqlmatriz(7)+ ;
*!*			 				sqlmatriz(8)+ ;
*!*			 				sqlmatriz(9)+ ;
*!*			 				sqlmatriz(10)+ ;
*!*			 				sqlmatriz(11)+ ;
*!*			 				sqlmatriz(12)+ ;
*!*			 				sqlmatriz(13)+ ;
*!*			 				sqlmatriz(14)+ ;
*!*			 				sqlmatriz(15)+ ;
*!*			 				sqlmatriz(16))
		 	
		 	ErrorSQL=sqlrun(p_conexion,"nosuo")
		 	
		 	
		CASE p_tipoope = 'U' && UPDATE
			limpiamatriz()
			pos = 1
			elementos = ALEN(&p_matriz,1)
			sqlmatriz(pos) = "UPDATE "+ALLTRIM(p_tabla)+" SET "
			FOR fila = 1 TO elementos STEP 1
				IF LEN(ALLTRIM(sqlmatriz(pos))) + LEN(ALLTRIM(&p_matriz(fila,1))) + 3 + LEN(ALLTRIM(&p_matriz(fila,2))) < 240 THEN 
					* no hago nada
				ELSE 
					pos  = pos + 1
				ENDIF
				IF fila < elementos THEN 
					sqlmatriz(pos) = sqlmatriz(pos)+ALLTRIM(&p_matriz(fila,1))+" = "+ALLTRIM(&p_matriz(fila,2))+","
				ELSE 
					sqlmatriz(pos) = sqlmatriz(pos)+ALLTRIM(&p_matriz(fila,1))+" = "+ALLTRIM(&p_matriz(fila,2))
				ENDIF 
		 	ENDFOR 
		 	IF LEN(ALLTRIM(sqlmatriz(pos))) + LEN(" WHERE "+ALLTRIM(p_condicion)) < 240 THEN
		 		* no hago nada
		 	ELSE  
		 		pos = pos + 1
		 	ENDIF 
		 	sqlmatriz(pos) = sqlmatriz(pos)+" WHERE "+ALLTRIM(p_condicion)
		 	ErrorSQL=sqlrun(p_conexion,"nosuo")			
			
			
		CASE p_tipoope = 'D' && DELETE
			sqlmatriz(1) = "DELETE FROM "+ALLTRIM(p_tabla)+" WHERE "+ALLTRIM(p_condicion)
			ErrorSQL=sqlrun(p_conexion,"nosuo")
			
		
		OTHERWISE 
			MESSAGEBOX("Operación NO Válida",0+48+0,"Sentencia SQL")			
			ErrorSQL = .F.
	ENDCASE 

	RETURN ErrorSQL
ENDFUNC 

