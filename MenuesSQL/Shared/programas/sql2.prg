

FUNCTION ABREYCIERRACON
PARAMETERS co,conex
conectar = 0
IF !(ALLTRIM(conex) == "") then
	ccDataBaseSQL = conex
	STORE SQLSTRINGCONNECT("DSN=Visual FoxPro Database;UID=;PWD=;SourceDB="+ ;
	                 ccDataBaseSQL+";SourceType=DBC;Exclusive=No;BackgroundFetch=Sí;" + ;
	                 "Collate=Machine;Null=Sí;Deleted=Sí") TO conectar
	IF conectar < 0 then
		=MESSAGEBOX("Error en apertura de la conexion con la base da datos...",16,"Error Fatal")
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
