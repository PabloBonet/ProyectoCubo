*SELECIONO TODAS LAS TABLAS DEL SCHEMA EN MYSQL, LUEGO 
*HAGO UNA SELECT (CON LA ESTRUCTURA DE LAS TABLAS DE MYSQL) EN LAS TABLAS DBFS 
*TENIENDO EN CUENTA EL PATH QUE RECIBO COMO PARAMETRO Y CREO EL UN TXT EN FORMA DE BACKUP MYSQL
FUNCTION transfedatos(xControl, xCamino, xOrigen, xPath)
	*xControl= handle de conexion a la base de datos
	*xCamino= path donde se va a guardar la copia de seguridad
	*xOrigen= handle tablas dbfs
	*xPath = path origen tablas dbfs
	LOCAL lcMacro, lnBandera, xApunta
	
	*RECORRO TODA la BD Y COPIO TODAS LAS TABLAS A UN ARCHIVO DE TEXTO
	IF SQLEXEC(xControl,"show tables","tablas")>=0 THEN 
		*xCamino = "C:\TMP\" &&PATH DONDE SE GUARDA LA COPIA DE RESPALDO
		xList   = FCREATE(xCamino+"listablas.sql")		
		SELECT tablas
		GO TOP 
		L=0		
		DO WHILE !EOF()
			L=L + 1
			xCampo  = FIELD(1) &&NOMBRE DEL PRIMER CAMPO DE LA TABLA SELECCIONADA
			xDato   = &xCampo
			******************************************
			?'Verificando '+ALLTRIM(xDato)+" - "+STR(l)+" de "+STR(RECCOUNT("tablas"))
			IF !FILE(xPath+ALLTRIM(xDato)+".dbf")
				SELECT tablas 
				SKIP 
				LOOP 
			ENDIF 			
			******************************************
			xSql    = "SELECT COLUMN_NAME as campo FROM information_schema.COLUMNS WHERE TABLE_SCHEMA  LIKE '"+ALLTRIM(MISCHEMA)+"' AND TABLE_NAME = '"+ALLTRIM(xDato)+"'"
			xDato   = ALLTRIM(xDato)
			IF !SQLEXEC(xControl,xSql,'xTabla')>=0 THEN 
				MESSAGEBOX('ERROR AL OBTENER ESTRUCTURA DE '+ALLTRIM(xDato))
				SELECT tablas 
				SKIP 
				LOOP 
			ENDIF 
			SELECT xTabla
			GO TOP
			xSql = "Select " 
			lnBandera = 0
			SCAN FOR !EOF()
				IF lnBandera > 0 THEN 
					xSql = xSql+","
				ENDIF 
				lcMacro = ALLTRIM('xTabla'+".campo")
				xSql = xSql+ALLTRIM(&lcMacro)
				lnBandera = lnBandera + 1
			ENDSCAN 
			
			xSql = xSql+" from "+xDato

			?'Copiando '+xDato+" - "+STR(l)+" de "+STR(RECCOUNT("tablas"))
			******************************************
			IF SQLEXEC(xOrigen,xSql,xDato)>=0 THEN 
				SELECT  (xDato)
				GO TOP
				IF !EOF() THEN 
					xApunta = FCREATE(xCamino+ALLTRIM(xDato)+".sql") &&archivo con la copia de seguridad
				ELSE 
					SELECT tablas 
					SKIP 
					LOOP 
				ENDIF 
				DO WHILE !EOF()				
					FOR c=1 TO FCOUNT()
						xContenido = field(c)
					    xContenido = &xContenido
					    DO CASE 
					      	CASE  TYPE('xContenido')='C' or TYPE('xContenido')='M'
						       xContenido = '>'+xFormato(xContenido)+'>'
						       IF ISNULL(xContenido) THEN 
						        	xContenido = '>'+SPACE(10)+'>'
						       ENDIF 
							       
					    	CASE  TYPE('xContenido')='N' or TYPE('xContenido')='Y'
					    		xContenido = '>'+STR(xContenido,14,4)+'>'
					    		IF  ISNULL(xContenido) THEN 
							        xContenido = '>'+'0.0000'+'>'
							    ENDIF 
							       
						    CASE  TYPE('xContenido')='D'
*!*							       xContenido = '>'+DTOC(xContenido)+'>'
*!*							       IF ISNULL(xContenido) THEN 
*!*								        xContenido = '>'+'01/0/1900'+'>'
*!*							       ENDIF 
						       xContenido = '>'+DTOS(xContenido)+'>'
						       IF ISNULL(xContenido) THEN 
							        xContenido = '>'+''+'>'
						       ENDIF 						       
							       
						   CASE  TYPE('xContenido')='L'
*!*							       IF xContenido THEN 
*!*					     		   		xContenido = '>'+'.T.'+'>'
*!*							       ELSE 
*!*							        	xContenido = '>'+'.F.'+'>'
*!*							       ENDIF 
						       IF xContenido THEN 
				     		   		xContenido = '>'+'S'+'>'
						       ELSE 
						        	xContenido = '>'+'N'+'>'
						       ENDIF 
						       
						   CASE  TYPE('xContenido')='T'
						      xContenido = '>'+TTOC(xContenido)+'>'
						      IF ISNULL(xContenido) THEN 
						        xContenido = '>'+space(10)+'>'
						      ENDIF
							       
						  CASE  TYPE('xContenido')='U'
						      xContenido = '>'+'TIPO DE DATO INDEFINIDO'+'>'
						ENDCASE
						=FWRITE(xApunta,xContenido+'|')
					ENDFOR 
				 	=FPUTS(xApunta," ")
				    SELECT (xDato)
			    	SKIP 
				ENDDO 
				*Escribo el nombre dela tabla en list para luego zipear los txt
				=FWRITE(xList,xDato+'.sql')
				=FPUTS(xList," ")				
			ENDIF 
			SELECT tablas
			SKIP 
			=FCLOSE(xApunta) &&CIERRO EL BACKUP
		ENDDO 
		=FCLOSE(xList) &&cierro txt con el listado de los txt. a zipear
	ENDIF
	
	*Generar archivo zip con todos los txt de backup, luego borrar todos los txt.
	LOCAL lcDir, lcMacro, lcData
	
	*Nombre del archivo zip nombreesquema.FAAAMMDDHHHMMSS
	lcData = ALLTRIM(esquemas.schemma)+'F'+DTOS(DATE())+'H'+STRTRAN(TIME(),':','')
	lcDir = SYS(2003)
		
	?'Procesando datos aguarde unos instantes...'
	
	IF MESSAGEBOX('¿Desea ejecutar la transferencia los datos ahora mismo?',4+32,'Información') = 6 THEN 
		IF !restorebackupmysql(vconeccion, xCamino) THEN 
			*ERROR
		ENDIF 
	ENDIF 
	
	?'Generando *.bat aguarde unos instantes...'
	*creo un archivo bat con los comandos para comprimir y eliminar los txt.
	xApunta = FCREATE(xCamino+"backup.bat")
	xContenido = "cd "+ALLTRIM(xCamino)	
	=FWRITE(xApunta,xContenido)
	=FPUTS(xApunta," ")
	
	xContenido = "copy "+ALLTRIM(MIPATHBACKUP)+"pkzip25.exe "+ALLTRIM(xCamino)
	=FWRITE(xApunta,xContenido)
	=FPUTS(xApunta," ")
	
	?'Compactando copia aguarde unos instantes...'
	
	xContenido = xCamino+"pkzip25 -add "+ALLTRIM(lcData)+".zip @listablas.sql"
	=FWRITE(xApunta,xContenido)
	=FPUTS(xApunta," ")
		
*!*		xContenido =  "del "+xCamino+"*.sql" 
*!*		=FWRITE(xApunta,xContenido)
*!*		=FPUTS(xApunta," ")
	
	xContenido =  "del "+xCamino+"pkzip25.exe" 
	=FWRITE(xApunta,xContenido)	
	=FPUTS(xApunta," ")
	=FCLOSE(xApunta)
	?'Comprimiendo datos aguarde unos instantes...'
	lcMacro = "RUN /N2 "+xCamino+"backup.bat"
	&lcMacro	
    *me queda eliminar el bat 
	RETURN 
ENDFUNC 

