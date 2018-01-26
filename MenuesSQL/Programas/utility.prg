FUNCTION creamenuusr
PARAMETERS usr
	a = abreycierracon(0,"dbcomuna")
	b= SQLEXEC(a, "select * from menu where usuario = '"+alltrim(usr)+"'", "menuusr")
	SELECT menuusr
	IF RECCOUNT() = 0 THEN 
		SENTENCIA = "select * from menu where usuario == '"+MENUSUDEFA+"'"
		i= SQLEXEC(a, SENTENCIA, "menuusr")
		IF i > 0 THEN 
			SELECT menuusr
			GO TOP 
			DO WHILE !EOF()
				c= SQLEXEC(a, "INSERT INTO menu (clave, padre, descrip, nivel, mostrarlo ,ejecutar ,arranque ,image, opcion,registro,fhregistro,usuario,expandir) VALUES ('"+menuusr.clave+"', '"+menuusr.padre+"',  '"+menuusr.descrip+"', "+ALLTRIM(STR(menuusr.nivel))+","+ALLTRIM(STR(menuusr.mostrarlo))+",'"+menuusr.ejecutar+"', '"+menuusr.arranque+"', '"+menuusr.image+"', '"+menuusr.opcion+"','','','"+ALLTRIM(usr)+"','"+menuusr.expandir+"')", '')
				SELECT menuusr
				SKIP 
			ENDDO 
		ELSE
			
		ENDIF 
	ENDIF 
	*-=SQLDISCONNECT(a)
	=abreycierracon(a,"")

	RETURN .t.
ENDFUNC 


************************************************************************
*  LoadImageResource
****************************************
***  Function: Pre-load an image file so transparency is respected
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION LoadImageResource(lcFile)
LOCAL loImg as Image
	loImg = CREATEOBJECT("Image")
	loImg.Picture = lcFile
ENDFUNC
