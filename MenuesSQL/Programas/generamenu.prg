****************************************
* MODO DE USO :
* COPIAR EL TEXTO EN UN PRG EN
* CUALQUIER CARPETA EJ: MENU.PRG
* DO MENU.PRG
****************************************
* INDICACIONES :
* EL CODIGO SE ENCARGA DE CREAR UN FORM DE NIVEL SUPERIOR, GENERA EL
* MENU Y HACE LA LLAMADA AL MISMO.
**********************************************************************
*OBSERVACIONES: hay un menu unico por lo cual las opciones habilitdas tienen la siguente jerarquia (menu/perfil)
*es decir que si en el menu se deshabilita  una opcion no se tiene en cuenta el valor del perfil
*el resto de la validaciones ya se hicieron en el momento del login

PARAMETERS tnId  &&idperfil de menu

vconeccion=abreycierracon(0,MISCHEMA)

sqlmatriz(1)="select m.* from perfilmh h left join  menusql m on h.idmenu = m.idmenu "
sqlmatriz(2)="left join perfilusu u on h.idperfil = u.idperfil "
sqlmatriz(3)="where h.idperfil = "+ALLTRIM(STR(tnId))+" and h.habilitado = 'S' and m.habilitado = 'S' and u.activo = 1 group by h.idmenu order by m.orden, m.codigo"

verror=sqlrun(vconeccion,'TABMENU')

=abreycierracon(vconeccion,'')

IF !verror THEN 
	MESSAGEBOX('Ha ocurrido un error al obtener el menu',0+64,'Error')
	RETURN 	
ENDIF 
*UPDATE tabmenu set descrip = '\<Salir', comando = "do salirmenu"
*UPDATE tabmenu set descrip = '\<Maestros', comando = "RUN N/2 \\server\proyectos\Krumbein\Gestion\Programas\Maestros\maestros.exe ALEJANDRO 1"


*AGREGO AL FINAL DEL MENU LA OPCION DE SALIDA
SELECT MAX(SUBSTR(codigo,1,2)) as codigo FROM tabmenu INTO CURSOR tmenu
LOCAL lnM
SELECT tmenu 
GO TOP 
lnM = VAL(tmenu.codigo) + 1
USE IN 'tmenu' 

*!*	SELECT tabmenu
*!*	APPEND BLANK 
*!*	REPLACE idmenu WITH 99
*!*	REPLACE nivel WITH "01"
*!*	IF lnM < 10 THEN 
*!*		REPLACE codigo WITH "0"+ALLTRIM(STR(lnM))+"010000000000"
*!*	ELSE
*!*		REPLACE codigo WITH ALLTRIM(STR(lnM))+"010000000000"
*!*	ENDIF 
*!*	REPLACE descrip WITH "\<Salir"
*!*	REPLACE comando WITH 'do salirmenu'
RELEASE lnM 
*************************************************************

oForm = CREATEOBJECT('MyFormSample')
oForm.SHOW
READ EVENTS

DEFINE CLASS MyFormSample AS FORM
  NAME = 'FrmPrincipal'
  CAPTION = MITITULO+" "+MIDESCRIP
  SHOWWINDOW = 2
  WINDOWSTATE = 2
  WINDOWTYPE = 1
  BACKCOLOR = MICOLORFONDO
  PICTURE   = MIFONDO
  ICON      = MIICONO
*SYSMETRIC(1) && Ancho de la pantalla
*SYSMETRIC(2) && Alto de la pantalla
  cNameMenuMP = ""
  PROCEDURE LOAD
    *ejecutando load
    THISFORM.Previo()
      \LPARAMETER oFormRef,getMenuName
      \
      \LOCAL cMenuName
      \IF TYPE("m.oFormRef") # "O" OR LOWER(m.oFormRef.BaseClass) # 'form' OR m.oFormRef.ShowWindow # 2
      \   RETURN
      \ENDIF
      \m.cMenuName = IIF(TYPE("m.getMenuName")="C",m.getMenuName,SYS(2015))
      \IF TYPE("m.getMenuName")="L" AND m.getMenuName
      \   m.oFormRef.Name = m.cMenuName
      \ENDIF
      \DEFINE MENU (m.cMenuName) IN (m.oFormRef.Name) BAR
      \*
    SELECT TABMENU
    nNumberMenuPrin = 0
    SELECT TABMENU

    SCAN FOR INT(VAL(SUBSTR(CODIGO,3)))=0
      nNumberMenuPrin = nNumberMenuPrin + 1
      cDescripcion = ALLTRIM(TABMENU.descrip)
      *Creando Menú

      cNamePad = "PAD" + PADL(ALLTRIM(STR(nNumberMenuPrin)),4,'0')
      \DEFINE PAD <<cNamePad>> OF (m.cMenuName) PROMPT "<<cDescripcion>>" COLOR SCHEME 4 KEY ALT+T, ""
    ENDSCAN

    SELECT LEFT(CODIGO,2) AS GRUPO FROM TABMENU GROUP BY 1 ORDER BY 1 INTO CURSOR _CrsOpciones
    nMenuTotal = RECCOUNT("_CrsOpciones")
    IF USED('_CrsOpciones')
      USE IN _CrsOpciones
    ENDIF
    nNumberMenuPrin = 0
    SELECT TABMENU

    SCAN FOR INT(VAL(SUBSTR(CODIGO,3)))=0
      nNumberMenuPrin = nNumberMenuPrin + 1
      cDescripcion = ALLTRIM(TABMENU.descrip)
      cNamePad   = "PAD" + PADL(ALLTRIM(STR(nNumberMenuPrin)),4,'0')
      cNamePopup = "P" + LEFT(TABMENU.CODIGO,2) &&& + PADL(ALLTRIM(STR(nNumberMenuPrin)),2,'0')
      \ON PAD <<cNamePad>> OF (m.cMenuName) ACTIVATE POPUP <<cNamePopup>>
    ENDSCAN

    * DEFINIENDO POPUS POR NIVELES
    nBarNivel = 0
    SELECT TABMENU
    GO TOP
    ****2
    FOR nNiveles = 2 TO 6
      nSubStrCero = ((nNiveles+1)+nNiveles)
      nLeft = nSubStrCero-1
      nLeftNivelFactor = IIF(nNiveles=2,2,nNiveles*2)

      FOR nMenuPrin = 1 TO nMenuTotal
      
        SELECT * FROM TABMENU WHERE LEFT(TABMENU.CODIGO,2) = PADL(ALLTRIM(STR(nMenuPrin)),2,'0') AND ;
          INT(VAL(SUBSTR(TABMENU.CODIGO,nSubstrCero))) = 0 AND ;
          RIGHT(LEFT(TABMENU.CODIGO,nLeft),2) <> '00';
          INTO CURSOR _CrsConsultaSQL
        IF RECCOUNT('_CrsConsultaSQL')>0
          IF USED('_CrsConsultaSQL')
            USE IN _CrsConsultaSQL
          ENDIF
          nBarNivel = 0
          lEsPrimero = .T.
          SELECT TABMENU
          SCAN FOR LEFT(TABMENU.CODIGO,2)=PADL(ALLTRIM(STR(nMenuPrin)),2,'0') AND ;
          	INT(VAL(SUBSTR(TABMENU.CODIGO,nSubstrCero))) = 0 AND ;
            RIGHT(LEFT(TABMENU.CODIGO,nLeft),2) <> '00'
            
            cTagNivelNamePad = LEFT(TABMENU.codigo,nLeftNivelFactor) &&& SUBSTR(TABMENU.codigo,3,2)
            IF lEsPrimero
              cPadNameNivel = "P" + cTagNivelNamePad
              \
              \DEFINE POPUP <<cPadNameNivel>> MARGIN RELATIVE SHADOW COLOR SCHEME 4
              lEsPrimero = .F.
			ENDIF 
			
            cTagBar = ALLTRIM(TABMENU.descrip)
            nBarNivel = nBarNivel + 1
            \DEFINE BAR <<nBarNivel>> OF <<cPadNameNivel>> PROMPT "<<cTagBar>>"
          ENDSCAN

        ELSE
          IF USED('_CrsConsultaSQL')
            USE IN _CrsConsultaSQL
          ENDIF
        ENDIF
        
        nBarNivel = 0
        SELECT TABMENU
        SCAN FOR LEFT(TABMENU.CODIGO,2)=PADL(ALLTRIM(STR(nMenuPrin)),2,'0') AND ;
            INT(VAL(SUBSTR(TABMENU.CODIGO,nSubstrCero)))=0 AND ;
            RIGHT(LEFT(TABMENU.CODIGO,nLeft),2)<>'00'

	        cTagBar = ALLTRIM(TABMENU.descrip)	 
	        IF tabmenu.nivel = 'H' THEN    
		      	cTagCom = "f_ejecutar('"+ALLTRIM(tabmenu.arranque)+"','"+ALLTRIM(tabmenu.comando)+"', '"+tabmenu.pusu+"', '"+tabmenu.opcion+"', '"+ALLTRIM(tabmenu.prun)+"')"
		    ELSE 
		    	&&I
		    	cTagCom = ALLTRIM(tabmenu.comando)
		    ENDIF 	 
		 
	         nBarNivel = nBarNivel + 1
	      
	         IF "ACTIVATE POPUP"$cTagCom
	           \ON BAR <<nBarNivel>> OF <<cPadNameNivel>> <<cTagCom>>
	      
	         ELSE
	           \ON SELECTION BAR <<nBarNivel>> OF <<cPadNameNivel>> <<cTagCom>>
	         ENDIF
        ENDSCAN
      NEXT
    NEXT
  **********************************************************
  *FUNCTION SALIR MENU LA TENGO DEFINIDA EN PRINCIPAL.PRG  *
  **********************************************************
  
      nNumberMenuPrin = nNumberMenuPrin + 1
     cDescripcion = "SALIR"
     cNamePad = "PAD" + PADL(ALLTRIM(STR(nNumberMenuPrin)),3,'0')
     \DEFINE PAD <<cNamePad>> OF (m.cMenuName) PROMPT "<<cDescripcion>>" COLOR SCHEME 4 KEY ALT+F4, "ALT+F4"
      \ON SELECTION PAD <<cNamePad>> OF (m.cMenuName) SALIRMENU()
 *
 	\ACTIVATE MENU (m.cMenuName) NOWAIT
    SET TEXTMERGE TO
    SET TEXTMERGE OFF
    COMPILE (THISFORM.cNameMenuMP+".MPR")
  ENDPROC
  
  PROCEDURE Previo
    SET TEXTMERGE ON
    THISFORM.cNameMenuMP = GETENV("TEMP")+"\"+"_" + RIGHT(SUBSTR(SYS(2015), 3),3) + RIGHT(SUBSTR(SYS(2015), 3),3) + RIGHT(SUBSTR(SYS(2015), 3),1)
    SET TEXTMERGE TO (THISFORM.cNameMenuMP+".MPR") NOSHOW
  ENDPROC
  PROCEDURE INIT
    DO (THISFORM.cNameMenuMP+".MPX") WITH THISFORM,.F.
    THISFORM.RESIZE()
  ENDPROC
  
  PROCEDURE unload 
  	cierraapp() 
  ENDPROC 

ENDDEFINE




