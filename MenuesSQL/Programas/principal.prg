_screen.Visible = .t.
SET SYSMENU OFF
CLEAR
_screen.windowstate= 0 
_screen.closable = .f.
_screen.MaxButton = .T.
_screen.AutoCenter = .T.

set exclusive OFF
set date to dmy
set century on
set delete on
set safety off
SET DATE TO BRITISH

=LEECONFIG()

_screen.BackColor = MICOLORFONDO
_screen.Caption = MITITULO
_screen.Icon    = MIICONO
**********
**** CREACION DEL DIRECTORIO DE ARCHIVOS TEMPORARIOS
**********
I=1
VMIESTACION = MIESTACION+"\"+ALLTRIM(STR(I))
AUX = VMIESTACION+"\TEMP"
DO WHILE DIRECTORY(AUX)
	I = I+1
	VMIESTACION = MIESTACION+"\"+ALLTRIM(STR(I))
	AUX = VMIESTACION+"\TEMP"
ENDDO
IF !DIRECTORY(AUX) then
	MKDIR(AUX)
	MIESTACION = VMIESTACION
ENDIF



****************
****************
****************

PUBLIC SQLMATRIZ(20)
FOR I = 1 TO 20
	SQLMATRIZ(I)=""
ENDFOR 

DEACTIVATE WINDOW "Project Manager"
IF SET('TALK') = 'ON'
  SET TALK OFF
  PUBLIC gcOldTalk
  gcOldTalk = 'ON'
ELSE
  PUBLIC gcOldTalk
  gcOldTalk = 'OFF'
ENDIF

PUBLIC gcOldDir, gcOldPath, gcOldClassLib, gcOldEscape, gTTrade, ;
		gUsuario, gJerarquia, logeo 
gcOldEscape   = SET('ESCAPE')
gcOldDir       = FULLPATH(CURDIR())
gcOldPath     = SET('PATH')
gcOldClassLib = SET('CLASSLIB')
gTTrade = .T.

IF SetPath() THEN
    RELEASE gcOldDir, gcOldPath, gcOldClassLib, gcOldTalk, gcOldEscape
	_screen.Caption = MITITULO

*!*		=LEELOCALCFG()
	DO FORM LOGIN TO LOGEO

	IF LOGEO > 0 THEN 
*!*			*SET SYSMENU OFF
*!*			*SET SYSMENU TO
*!*			SET DATE TO BRITISH
*!*			_screen.Visible = .T.
*!*			
*!*			DO generamenup WITH logeo 
*!*			READ EVENTS
 
	ELSE 
		IF logeo = -1 THEN 
			SET SYSMENU OFF
			SET SYSMENU TO
			SET DATE TO BRITISH	
			_screen.Visible = .F.			
			DO FORM frmadmin
			READ EVENTS 
		ENDIF 	
	ENDIF 
	
ENDIF

CLEAR DLLS
RELEASE ALL EXTENDED
CLEAR ALL




FUNCTION SetPath()
  ON KEY LABEL CTRL+F12 SET SYSMENU TO DEFA
*  SET DEFAULT TO &MISERVIDOR  
  SET PATH TO PROGRAMAS,FORMULARIOS, ;
			   CLASES, BITMAPS
  SET PROCEDURE TO UTILITY.PRG, SALIDA.PRG, SONIDO.PRG, GENERAL.PRG, SQL.PRG, passtran.prg, backupmysql.prg

  SET DEFAULT TO &MIESTACION	

RETURN .t.


************************************************
************************************************
** LECTURA DE ARCHIVOS DE CONFIGURACION PARA
** CADA UNO DE LOS SISTEMAS
************************************************
************************************************
FUNCTION LEECONFIG()

	PUNTERO = FOPEN("CONFIG.CFG",0)
	IF PUNTERO > 0 THEN
		DO WHILE !FEOF(PUNTERO)
			EJE = ALLTRIM(FGETS(PUNTERO))
			IF !((ALLTRIM(EJE) == "") OR (SUBSTR(ALLTRIM(EJE),1,1)=="[")) THEN
				&EJE
			ENDIF
		ENDDO
		=FCLOSE(PUNTERO)
		SET SAFETY OFF
	ELSE 
		PUNTERO = FOPEN(MISERVIDOR+"\CONFIG.CFG",0)
		IF PUNTERO > 0 THEN 
			DO WHILE !FEOF(PUNTERO)
				EJE = ALLTRIM(FGETS(PUNTERO))
				IF !((ALLTRIM(EJE) == "") OR (SUBSTR(ALLTRIM(EJE),1,1)=="[")) THEN
					&EJE
				ENDIF
			ENDDO
			=FCLOSE(PUNTERO)
			SET SAFETY OFF		
		ELSE 
			MESSAGEBOX(SYS(2003))
			MESSAGEBOX('ERROR AL LEER ARCHIVO DE CONFIGURACI�N')
		ENDIF 
	ENDIF
RETURN

PROCEDURE salirmenu 
	IF MESSAGEBOX("�Est� seguro que desea Salir?",36,'Salir del Sistema') = 6
		CIERRAAPP()
    ENDIF
ENDPROC

FUNCTION winexec (tcExe)
	MESSAGEBOX(tcexe)
	&tcExe
ENDFUNC 