********************************************************************
********************************************************************

FUNCTION ABREYCIERRACON
PARAMETERS co,conex
* Abre y Cierra conexiones con base de datos
* Recibe como paramtros el nombre de la base de datos 
* Si lo que se desea es cerrar la conexion, recibe como parametro
* "co" = al numero de la conexión y "conex" = ""
conectar = 0
IF !(ALLTRIM(conex) == "") then
	ccDataBaseSQL = conex
	*STORE SQLSTRINGCONNECT("DSN=Visual FoxPro Database;UID=;PWD=;SourceDB="+ ;
	*                 ALLTRIM(ccDataBaseSQL)+";SourceType=DBC;Exclusive=No;BackgroundFetch=Sí;" + ;
	*                 "Collate=Machine;Null=Sí;Deleted=Sí") TO conectar

	STORE SQLSTRINGCONNECT("DSN=Visual FoxPro Database;UID=;PWD=;SourceDB="+ ;
	                 ALLTRIM(ccDataBaseSQL)) TO conectar
	
	IF conectar < 0 then
		=MESSAGEBOX("Error en apertura de la conexion con la base datos... ( "+ALLTRIM(conex)+" )",16,"Error Fatal")
		CLOSE ALL
		QUIT 
	ENDIF
ELSE
	=SQLDISCONNECT(co)
	conectar = 0
ENDIF
RETURN conectar 


********************************************************************
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
	r=SQLEXEC(co,SQLMATRIZ(1)+SQLMATRIZ(2)+SQLMATRIZ(3)+SQLMATRIZ(4)+SQLMATRIZ(5)+SQLMATRIZ(6)+SQLMATRIZ(7)+SQLMATRIZ(8)+SQLMATRIZ(9)+SQLMATRIZ(10)+SQLMATRIZ(11)+SQLMATRIZ(12)+SQLMATRIZ(13)+SQLMATRIZ(14)+SQLMATRIZ(15)+SQLMATRIZ(16)+SQLMATRIZ(17)+SQLMATRIZ(18)+SQLMATRIZ(19)+SQLMATRIZ(20),pcursor)
	IF r < 0
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
*r = sqlexec(co,'BEGIN TRANSACTION')				
r = sqlsetprop(co,'Transactions', 2)				
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
	*r = sqlexec(co,'COMMIT TRANSACTION')
	*WAIT WINDOW "COMMIT TRANSACTION"
	r = sqlcommit(co)
else
	*r = sqlexec(co,'ROLLBACK TRANSACTION')
	*WAIT WINDOW "ROLLBACK TRANSACTION"
	r = sqlrollback(co)
ENDIF

if r<0 then
	varreturn=.f.
else
	*SQLFlagErrorTrans=0
	varreturn= .t.
endif
return varreturn

