*---------------------------------------------------
*FUNCTION f_vereda(tnIdCon_ver, tnIdCon_bas, tnIdreg)
*-----------------------------------------------------
*Recibo como parametro dos Idconcepto; el primero me da el id  con el que obtengo la formula para caluclar la vereda
*el segundo me da la formula para calcular el monto basico sobre el cual calculo la vereda
*ambas Busquedas las hago sobre la tabla contlotserh dado que en esta se almacenan los datos personales de cada contribuyente
*tnIdCon_bas con el id que obtengo el basico de contlotserh al cual le alpico el % correspondiente
*tnIdCon_ver % que aplico al basico
*gnIdreg =  registro contlotserh para obtener los datos. Variable publica
FUNCTION f_vereda
	PARAMETERS tnIdCon_ver, tnIdCon_bas, tnIdreg

	SELECT * FROM curConc INTO CURSOR 'curVereda'
	SELECT curVereda
	LOCATE FOR curVereda.idconcepto = tnIdCon_bas 
	IF FOUND() THEN 
		*Obtengo  el imprte Basico, es decir Cantidad(Metros de Frente) * Importe(por metro)
		LOCAL lnBasico
			lnBasico = curVereda.cantidad * curVereda.importe
	ELSE 
		LOCAL lcmess
			lcmess  = f_error()			
		MESSAGEBOX('Error, El sistema no pudo calcular el Basico de Vereda.'+CHR(13)+;				
					'El Concepto Asignado depende de otro y el mismo no se encuentra asignado'+CHR(13)+;
					lcmess,0+64,"Error en fbiblioteca Funcion f_vereda")
		
		&&Retorno un valor negativo significa que hubo un error			
		RETURN -1
	ENDIF 	
	LOCATE FOR curVereda.idconcepto = tnIdCon_ver
	IF FOUND() THEN 
		LOCAL lnPorcentaje
			lnPorcentaje = curVereda.importe	
	ELSE 
		MESSAGEBOX('Error, El sistema no pudo calcular el % de Vereda.',0+64,"Error en fbiblioteca Funcion f_vereda")
		&&Retorno un valor negativo significa que hubo un error
		RETURN -1 
	ENDIF 
		lnBasico = lnBasico * lnPorcentaje / 100				
	RETURN  lnBasico &&Devuelve el importe de Vereda del contribuyente
ENDFUNC 
*---------------------------------------------------
*FUNCION f_Baldio(tnIdCon_bal, tnIdCon_bas, tnIdreg)
*---------------------------------------------------
*Calculo el Baldio
*en los parametros recibo dos idconcepto de la tabla contlotserh uno es id con los datos de la tasa basica
*y el otro con los datos del baldio, el tercer parametro me da idregistro sobre el cual hago el calculo
FUNCTION f_baldio
	PARAMETERS tnIdCon_bal, tnIdCon_bas, tnIdreg
	SELECT * FROM  curConc INTO CURSOR curBaldio
	SELECT curBaldio
	LOCATE FOR curbaldio.idconcepto = tnIdCon_bas
	IF FOUND() THEN 
		LOCAL lnBasico
			lnBasico = curBaldio.cantidad * curBaldio.importe
	ELSE 			
		LOCAL lcmess
			lcmess  = f_error()	
		MESSAGEBOX('Error, El sistema no pudo calcular el Basico de Baldio.'+CHR(13)+;
					'El Concepto Asignado depende de otro y el mismo no se encuentra asignado'+CHR(13)+;
					lcmess,0+64,"Error en fbiblioteca Funcion f_baldio")
		&&Retorno un valor negativo significa que hubo un error
		RETURN -1
	ENDIF 	
	LOCATE FOR curBaldio.idconcepto = tnIdCon_bal 
	IF FOUND() THEN 
		LOCAL lnPorcentaje
			lnPorcentaje = curBaldio.importe	
	ELSE 
		MESSAGEBOX('Error, El sistema no pudo calcular el % de Baldio.',0+64,"Error en fbiblioteca Funcion f_baldio")
		&&Retorno un valor negativo significa que hubo un error
		RETURN -1
	ENDIF 	
	lnBasico = lnBasico * lnPorcentaje / 100
	RETURN  lnBasico &&Devuelve el importe de Baldio
ENDFUNC 
*---------------------------------------------------------------------------
*f_descuento(tnIdreg)
*----------------------------------------------------------------------------
*Descuento a jubliados no se tiene en cuenta el aporte a la policia
*y el aporte al S.A.M.Co. Calculo el importe que debe abonar y obtengo al 50%
*Lo asigno como negativo para que reste al importe total
*-----------------------------------------------------------------------------
FUNCTION f_descuento
	PARAMETERS tnIdreg
	LOCAL lnImp_conc, lnImptotal
	SELECT * FROM curConc INTO CURSOR curDesc	
	SELECT curDesc
		GO TOP 	
	lnImptotal = 0
	SCAN FOR !EOF()
	*Caluclo el Importe	
	&&El descuento no incluye 16= Descuento 15= Policia  12= Samco	
		IF curDesc.idconcepto = 16 OR curDesc.idconcepto = 15 OR curDesc.idconcepto = 12 THEN 
			LOOP
		ENDIF 
		IF EMPTY(curDesc.funcion) THEN 
			lnImp_conc = curDesc.cantidad * curDesc.importe 
		ELSE
			lcFuncion = ALLTRIM(curDesc.funcion)
			lnImp_conc = &lcFuncion	
			IF lnImp_conc = - 1 THEN 
				&&Ya mostre el Error en fbiblioteca
				RETURN - 1 
				EXIT 
			ENDIF 
		ENDIF 
		lnImptotal = lnImptotal + lnImp_conc		
	ENDSCAN 
	lnImptotal = (lnImptotal*50)/100
	lnImptotal = (lnImptotal) - (lnImptotal*2)
	RETURN lnImptotal 
ENDFUNC 

*------------------------
*FUNCTION f_error
*------------------------
*DEVUELVEL EL CONTLOTSERP y el concepto que dependia de otro y este no estaba asignado
FUNCTION f_error
	LOCAL lcRetu
		lcRetu = "CONTLOTSERP: "+ALLTRIM(STR(curbolep.idcontribu))+"-"+ALLTRIM(STR(curbolep.idlote))+"-"+ALLTRIM(STR(curbolep.idservicio))+"-"+ALLTRIM(STR(curbolep.idsubser))+" "+ALLTRIM(STR(curconc.idconcepto))+"-"+ALLTRIM(curConc.abreviado)
	RETURN lcRetu
ENDFUNC 

*-----------------------------------------------
*FUNCTION f_cemrura(25,0.0288)
*------------------------------------------------
*Calcula en valor de Cementerio 
*rurales el cual es 0.0072 por ha por mes
*es decir 0.0072*3 = 0.0288 esta valor por Ha
*tnIdcon_bas = idservicio del que depende 
*(basico tasa rural saco la cantidad de ha)
*tnValor= valor fijo aplicado a la cantidad de Ha
*-------------------------------------------------
FUNCTION f_cemrura(tnidbas, tnValor) 
	SELECT curConc.cantidad FROM curConc WHERE curConc.idconcepto = tnIdbas INTO CURSOR curCem
	SELECT curCem
	GO TOP 
	IF EOF() OR ISNULL(curCem.cantidad) THEN 
		LOCAL lcmess
			lcmess = f_error()
		MESSAGEBOX('Error al Calcular Cementerio. f_cemrura(tnIdbas, tnValor'+CHR(13)+lcmess,0+64,'Error.')
		RETURN -1
	ENDIF 
	LOCAL lnImporte
	lnImporte = ROUND(curCem.cantidad*tnValor,2)
	RETURN lnImporte
ENDFUNC 
*-------------------------------------------
*FUNCTION f_interes(tdFechav, tdFechapago)
*-------------------------------------------
*Devuelve el Porcentaje de interes aplicando el 2% mensual
*recibe como parametro la fecha de vencimiento y la fecha de pago
FUNCTION f_interes(tdFechav, tdFechapago)
	LOCAL ldAux, lnAnio, lnMes, lnDia, lnRet

	lnAnio = YEAR(tdFechapago)-YEAR(tdFechav)
	ldAux = GOMONTH(tdFechav,12*lnAnio)
	IF ldAux > tdFechapago THEN 
		*no cumplio el año
		lnAnio = lnAnio - 1
	ENDIF 

	lnMes=MONTH(tdFechapago)-MONTH(tdFechav)
	IF lnMes < 0 THEN 
		lnMes = lnMes + 12
	ENDIF 
	lnDia = DAY(tdFechapago)-DAY(tdFechav)
	IF lnDia < 0 THEN 
		lnDia = lnDia + DiasDelMes(tdFechav)
	ENDIF 
	IF DAY(tdFechapago)>DAY(tdFechav) THEN 
		*Vencido, si bien esta en el mismo mes paso el dia de vencimiento 
		lnMes = lnMes + 1
	ENDIF 
	lnRet = (lnAnio*24)+(lnMes*2)
	RETURN lnRet
ENDFUNC 

FUNCTION DiasDelMes(tdFecha)
	LOCAL ld
	ld= GOMONTH(tdfecha,1)
	RETURN DAY(ld-DAY(ld))
ENDFUNC 

*----------------------------------
*FUNCTION f_saldoboleta(tnidboleta)
*------------------------------------
*Devuelve el Saldo de la Boleta 
*lo almacena en una tabla tmp llamda
*saldob. Retorna .T. si logro obtener
*el saldo. caso contrario retorna .F.
*recibe como parametro el idboleta
*fechapago llama a la funcion f_interesd
*-------------------------------------
FUNCTION f_saldoboleta(tnidboleta, tdfechapago)
	LOCAL lnSaldo, lnImputado, lnInteres, lcControl
	SET SAFETY OFF 
	CREATE TABLE .\temp\saldob(saldo N(13,2), recargo N(13,2), imputado N(13,2))
	*
	lcControl = ALLTRIM(SUBSTR(STR(tnIdboleta),1,1))
	IF  ALLTRIM(lcControl) = '9' THEN 
		IF f_saldoboletac (tnidboleta, tdfechapago) THEN 
			RETURN .T.
		ELSE 
			MESSAGEBOX('Error saldoboletac',0+64,'Información')
			RETURN .F.
		ENDIF 
	ENDIF 
	sqlmatriz(1)= "Select * from boletap where boletap.idboleta = "+ALLTRIM(STR(tnidboleta))
	verror=sqlrun(vconeccion,"importeb")
	IF !verror THEN 
		MESSAGEBOX("Error, no se puede determinar el valor de la Boleta",0+64,'Error. f_saldoboleta')
		RETURN .F.
	ENDIF 
	IF RECCOUNT('importeb')<1 THEN 
		MESSAGEBOX('Error. No se encontro la boleta idboleta: '+ALLTRIM(STR(tnidboleta)),0+64,'Error. f_saldoboleta')
		RETURN .F.
	ENDIF 
	SELECT importeb 
		GO TOP 
	*Obtengo los pagos de la boleta
	sqlmatriz(1)= "Select sum(pagos.imputado) as imputado from pagos where pagos.idboleta = "+ALLTRIM(STR(tnidboleta))+" group by idboleta"
	verror=sqlrun(vconeccion,"importep")
	IF !verror THEN 
		MESSAGEBOX('Error, no se puede determinar los pagos de la boleta.',0+64,'Error. f_saldoboleta')
		RETURN .F.
	ENDIF 
	SELECT importep
	GO TOP 
	IF EOF() THEN 
		*No tiene pagos controlar si ya pasaron todas
		*las fechas de vencimientos 
		lnImputado = 0
		DO CASE 
			CASE tdFechapago <= CTOD(SUBSTR(importeb.fechavenc,7,2)+"/"+SUBSTR(importeb.fechavenc,5,2)+"/"+SUBSTR(importeb.fechavenc,1,4))
				*Boleta No Vencida 						
				lnInteres = 0
			CASE tdFechapago <= CTOD(SUBSTR(importeb.seguvenc,7,2)+"/"+SUBSTR(importeb.seguvenc,5,2)+"/"+SUBSTR(importeb.seguvenc,1,4))
				*2 VENCIMIENTO
				lnInteres = importeb.impseguv - importeb.imptotal
			CASE tdFechapago <= CTOD(SUBSTR(importeb.tercvenc,7,2)+"/"+SUBSTR(importeb.tercvenc,5,2)+"/"+SUBSTR(importeb.tercvenc,1,4))
				*3 VENCIMIENTO
				lnInteres = importeb.imptercv - importeb.imptotal
			OTHERWISE 				
				lnInteres = f_interesd(importeb.fechavenc, tdFechapago, importeb.imptotal, importeb.idservicio)
				IF lnInteres < 0 THEN 
					RETURN .F. &&Error en f_interesd
				ENDIF 
		ENDCASE
		lnSaldo = importeb.imptotal + lnInteres
		SELECT saldob
		DELETE ALL 
		INSERT INTO saldob(saldo, recargo, imputado) VALUES (lnSaldo, lnInteres, 0)
		RETURN .T.	
	ELSE
		*Total importe Abonado		
		lnImputado = importep.imputado
		lnSaldo = importeb.imptotal
		lnSaldo = lnSaldo - lnImputado		
		IF lnSaldo < 0 THEN 
			*se pago mas de lo que salia la boleta (por eje: se pago 2 veces la mismo boleta) 
			INSERT INTO saldob(saldo, recargo, imputado) VALUES (0, 0, importeb.imptotal)
			RETURN .T.
		ENDIF 
			
		lnInteres = f_interesd(importeb.fechavenc, tdFechapago, lnSaldo, importeb.idservicio)
		IF lnInteres < 0 THEN 
			MESSAGEBOX('Error f_interesesd',0+64,'Información')
			RETURN .F. &&Error en f_interesd
		ENDIF 
		lnSaldo = lnSaldo + lnInteres
		SELECT saldob
			DELETE ALL 
		INSERT INTO saldob(saldo, recargo, imputado) VALUES (lnSaldo, lnInteres, lnImputado)
		RETURN .T.		
	ENDIF 
ENDFUNC  
*--------------------------------------------------------------
*FUNCTION f_interesd(tdFechav, tdFechapago, tnidboleta)
*--------------------------------------------------------------
*Devuelve el importe de interes diario calculado sobre el saldo
*que recibe como parametro Para el caluclo recibo como parametro
*fecha de pago, fecha vencimiento  idservicio.
*Busco en recargos la alicuota vigente correspondiente al servicio
FUNCTION f_interesd(tcFechav, tdfechapago, tnSaldo, tnidservicio)
	sqlmatriz(1)= "Select * FROM recargos WHERE recargos.fechavige <= "+ALLTRIM(tcFechav)+" and recargos.idservicio = "+ALLTRIM(STR(tnidservicio))+" group by recargos.fechavige desc"
	verror=sqlrun(vconeccion,"intd")
	IF !verror THEN 
		MESSAGEBOX('Error, no se puede determinar el importe de interes diario.'+CHR(13)+'Verifique las conexiones de red y vuelva a intentarlo',0+64,'Error. f_interesd')
		RETURN -1
	ENDIF 	
	IF RECCOUNT('intd')< 1 THEN 
		MESSAGEBOX('El Servicio idservico: '+ALLTRIM(STR(tnidservicio))+' no posee relacionados recargos.'+CHR(13)+;
					'Ingrese al Formulario correspondiente y asigne el recargo mensual para dicho servicio',0+64,'Información')
		RETURN -1
	ENDIF 
	LOCAL ldFechav, lnInteresd, lnDias	
		ldFechav = CTOD(SUBSTR(importeb.fechavenc,7,2)+"/"+SUBSTR(importeb.fechavenc,5,2)+"/"+SUBSTR(importeb.fechavenc,1,4))
		lnDias = tdfechapago - ldfechav &&Cantidad de dias
	lnInteresd = lnDias * ROUND(intd.intdia,8) &&Dias por el interes diario
	lnInteresd = (tnSaldo*lnInteresd)/100 &&saldo * interes = importe interes diario

	RETURN lnInteresd
ENDFUNC 
*----------------------------------------------------
*f_importeb(tdfechae, tdfechav, tdfechav2, tnimporte)
*----------------------------------------------------
*Calcula el importe de 2 y tercer vencimiento.
*Recibe como parametro la fecha de emision 
*para determinar el interes que se debe aplicar
*necesita el importe dado que
*la boleta todavia no esta grabada
FUNCTION f_importeb(tcfechae, tdfechav, tdfechav2, tnimporte, tnidservicio)
	sqlmatriz(1)= "Select * FROM recargos WHERE recargos.fechavige <= "+ALLTRIM(tcFechae)+" and recargos.idservicio = "+ALLTRIM(STR(tnidservicio))+" group by recargos.fechavige desc"
	verror=sqlrun(vconeccion,"intd")
	IF !verror THEN 
		MESSAGEBOX('Error, no se puede determinar el importe de interes diario.'+CHR(13)+'Verifique las conexiones de red y vuelva a intentarlo',0+64,'Error. f_importeb')
		RETURN -1
	ENDIF 	
	IF RECCOUNT('intd')< 1 THEN 
		MESSAGEBOX('El Servicio idservico: '+ALLTRIM(STR(tnidservicio))+' no posee relacionados recargos.'+CHR(13)+;
					'Ingrese al Formulario correspondiente y asigne el recargo mensual para dicho servicio',0+64,'Información')
		RETURN -1
	ENDIF 
	LOCAL lnInteresd, lnDias	
		lnDias = tdfechav2 - tdfechav &&Cantidad de dias
	lnInteresd = lnDias * ROUND(intd.intdia,8) &&Dias por el interes diario
	lnInteresd = tnimporte + (tnimporte*lnInteresd)/100&&saldo * interes = importe interes diario
	RETURN lnInteresd
ENDFUNC 
*----------------------------------
*FUNCTION f_reset_key(tckey)
*----------------------------------
&&Restablece las teclas de funcion del formulario de nivel superior
&&si no hay teclas asigandas limpio todas las teclas asignadas 
*con push key clear. Recibe como parametro las telcas de funcion
*separadas por #. Ejemplo: on key label f3= ....#on key label xxxx
FUNCTION f_resetkey(tckey)
	LOCAL  lcmess, lccar, lnLen

	PUSH KEY CLEAR &&Limpio todas las asignaciones

	IF !EMPTY(tcKey) THEN 
		lcmess = ''
		lnLen = LEN(tcKey)
		FOR I=1 TO lnLen 
			lccar =  SUBSTR(tcKey,I,1)
			IF !lccar = "#" THEN 
				lcmess = lcmess+lccar
				LOOP 
			ELSE
				&&Ejecutar la Sentencia
				&lcmess			
				lcmess = ''
				I= I+1
				lccar = SUBSTR(tcKey,I,1)
				IF !lccar = "#" THEN 
					lcmess = lcmess+lccar
					LOOP 
				ENDIF 		
			ENDIF 
		ENDFOR 
		&lcmess
	ENDIF 
	RETURN 
ENDFUNC 

****************************
*FUNCION IDPLANACT 
*me devuelve el idplan del plan de cuenta activo
*es decir de el plan que se encuetre en vigencia
*verifico fechad y fechah con la fecha del sistema
FUNCTION f_idplanact()
	vconeccion=abreycierracon(0,"dbcomuna")

	sqlmatriz(1)="Select idplan, fechad, fechah, idplan as activo from plancuenta "
	sqlmatriz(2)="where fechad <= '"+DTOS(DATE())+"' and fechah >= '"+DTOS(DATE())+"' order by fechad desc "

	verror=sqlrun(vconeccion,'idplanact')
	IF !verror THEN 
		MESSAGEBOX('Error al Obtner los Planes de Cuentas',0+64,'Error')
		RETURN 0
	ENDIF 
	
	SELECT idplanact 
	GO TOP 
	IF EOF() OR ISNULL(idplanact.idplan) THEN 
		*Plan activo con fechah en ''
		sqlmatriz(1)="Select idplan, fechad, fechah, idplan as activo from plancuenta "
		sqlmatriz(2)="where fechad <= '"+DTOS(DATE())+"' and fechah >= '' order by fechad desc "

		verror=sqlrun(vconeccion,'idplanact')
		IF !verror THEN 
			MESSAGEBOX('Error al Obtner los Planes de Cuentas',0+64,'Error')
			RETURN 0
		ENDIF 		
		SELECT idplanact 
		GO TOP 
		IF EOF() OR ISNULL(idplanact.idplan) THEN 
			MESSAGEBOX('No hay Plan de Cuenta Vigente a la Fecha',0+64,'Error')
			RETURN 0
		ENDIF 		
	ENDIF 
	SELECT idplan FROM idplanact WHERE idplanact.fechad <= DTOS(DATE()) AND idplanact.fechah >=  DTOS(DATE()) INTO CURSOR planv
	SELECT planv 
	IF EOF() OR ISNULL(planv.idplan) THEN 
		SELECT idplan FROM idplanact WHERE idplanact.fechah = '' INTO CURSOR planv
	ENDIF 

	UPDATE idplanact set activo = 0
	SELECT planv
	GO TOP 
	IF !EOF() AND !ISNULL(planv.idplan) THEN 
		UPDATE idplanact set activo = 1 WHERE idplan = planv.idplan	
	ENDIF 
	SELECT idplanact
	GO TOP 	
	=abreycierracon(vconeccion,"")
	RETURN idplanact.idplan 
ENDFUNC 	


*****************************************************************
*Funcion balance recibe parametrode fecha desde, fecha hasta en *
*en formato aaaammdd character, 								*
*filtro T= todas, E= egresos I= ingresos, 						*
*Movi T= plan de cta completo partidas con y sin movi			*
*Movi M= plan de cta partidas con movimientos					*
*carga todos los datso en una tabla temporal					*
*****************************************************************
*!*	FUNCTION balance(tcdesde, tchasta, tcfiltro, tcMovi)
*!*		*me conecto
*!*		vconeccionb=abreycierracon(0,'dbcomuna')
*!*		CREATE TABLE .\temp\balancetmp (codpart i, nompart c(200), montopar N(13,2), idplan i, codarbol i, tipo C(1))
*!*		SELECT balancetmp
*!*		INDEX ON ALLTRIM(STR(idplan))+ALLTRIM(STR(codpart)) TAG idprin
*!*		
*!*		IF UPPER(ALLTRIM(tcFiltro)) = 'T' OR UPPER(ALLTRIM(tcFiltro)) = 'I' THEN 
*!*			*Ingresos
*!*			sqlmatriz(1)="Select codpart, nompart, sum(montopar) as montopar, idplan "
*!*			sqlmatriz(2)="from redetall where fecha >= '"+tcDesde+"' and fecha <= '"+tcHasta+"' and especial = 0 group by codpart, idplan"	
*!*			verror=sqlrun(vconeccionb,'ingb')
*!*			
*!*			IF !verror THEN 
*!*				MESSAGEBOX('Erro al obtener los movimientos de Ingresos',0+48,'Error')
*!*				RETURN .F.
*!*			ENDIF 
*!*			
*!*			*Cor. Ingresos
*!*			sqlmatriz(1)="Select codpart, nompart, sum(montopar) as montopar, idplan "
*!*			sqlmatriz(2)="from ordetall where fecha >= '"+tcDesde+"' and fecha <= '"+tcHasta+"' and especial = 1 group by codpart, idplan"		

*!*			verror=sqlrun(vconeccionb,'coringb')
*!*			
*!*			IF !verror THEN 
*!*				MESSAGEBOX('Erro al obtener los movimientos de Ingresos (Correciones)',0+48,'Error')
*!*				RETURN .F.
*!*			ENDIF 	
*!*			
*!*			* Ingresos Transfiero los datos a la tabla temporal
*!*			SELECT ingb &&Ingresos
*!*			SCAN FOR !EOF()
*!*				INSERT INTO balancetmp (codpart, nompart, montopar, idplan, tipo) VALUES (;
*!*								ingb.codpart, ALLTRIM(ingb.nompart), ingb.montopar, ingb.idplan, 'S')
*!*			ENDSCAN 
*!*				
*!*			SELECT coringb &&Cor ingresos
*!*			SCAN FOR !EOF() 
*!*				IF SEEK(ALLTRIM(STR(coringb.idplan))+ALLTRIM(STR(coringb.codpart)),'balancetmp','idprin') THEN 
*!*					UPDATE balancetmp set montopar = montopar-coringb.montopar WHERE codpart = coringb.codpart AND idplan = coringb.idplan
*!*					LOOP 
*!*				ELSE 
*!*					INSERT INTO balancetmp(codpart, nompart, montopar, idplan, tipo) VALUES (coringb.codpart, coringb.nompart, coringb.montopar*-1, coringb.idplan, 'S')
*!*				ENDIF 
*!*				SELECT coringb
*!*			ENDSCAN 		
*!*		ENDIF 
*!*		
*!*		IF UPPER(ALLTRIM(tcFiltro)) = 'T' OR UPPER(ALLTRIM(tcFiltro)) = 'E' THEN 	
*!*			*Egresos
*!*			sqlmatriz(1)="Select codpart, nompart, sum(montopar) as montopar, idplan "
*!*			sqlmatriz(2)="from ordetall where fecha >= '"+tcDesde+"' and fecha <= '"+tcHasta+"' and especial = 0 group by codpart, idplan"	
*!*			verror=sqlrun(vconeccionb,'egrb')
*!*			
*!*			IF !verror THEN 
*!*				MESSAGEBOX('Erro al obtener los movimientos de Egresos',0+48,'Error')
*!*				RETURN .F.
*!*			ENDIF 
*!*			
*!*			*Cor. Egresos
*!*			sqlmatriz(1)="Select codpart, nompart, sum(montopar) as montopar, idplan "
*!*			sqlmatriz(2)="from redetall where fecha >= '"+tcDesde+"' and fecha <= '"+tcHasta+"' and especial = 1 group by codpart, idplan"		

*!*			verror=sqlrun(vconeccionb,'coregrb')
*!*			
*!*			IF !verror THEN 
*!*				MESSAGEBOX('Erro al obtener los movimientos de Egresos (Correciones)',0+48,'Error')
*!*				RETURN .F.
*!*			ENDIF 	
*!*			*Egresos, transfiero los datos a la tabla temporal
*!*			SELECT egrb &&Egresos
*!*			GO TOP 
*!*			SCAN FOR !EOF()
*!*				INSERT INTO balancetmp (codpart, nompart, montopar, idplan, tipo) VALUES (egrb.codpart, egrb.nompart, egrb.montopar, egrb.idplan, 'N')
*!*			ENDSCAN	
*!*			       
*!*			SELECT coregrb
*!*			GO TOP 
*!*			SCAN FOR !EOF()
*!*				IF SEEK(ALLTRIM(STR(coregrb.idplan))+ALLTRIM(STR(coregrb.codpart)),'balancetmp','idprin') THEN 
*!*					UPDATE balancetmp set montopar = montopar-coregrb.montopar WHERE codpart = coregrb.codpart AND idplan = coregrb.idplan
*!*					LOOP 
*!*				ELSE 
*!*					INSERT INTO balancetmp (codpart, nompart, montopar, idplan, tipo) VALUES (coregrb.codpart, coregrb.nompart, coregrb.montopar*-1, coregrb.idplan, 'N')
*!*				ENDIF 
*!*				SELECT coregrb		
*!*			ENDSCAN 		
*!*		ENDIF 
*!*		
*!*		*Mod. de ejecuciones
*!*		sqlmatriz(1)="select modejecu.partdesde, modejecu.parthasta, modejecu.idplan, sum(modejecu.monto) as monto, partidas.tipo "
*!*		sqlmatriz(2)="from modejecu left join partidas on modejecu.partdesde = partidas.codpart "
*!*		sqlmatriz(3)=" WHERE fechaejec >= '"+tcDesde+"' and fechaejec <= '"+tcHasta+"' group by modejecu.partdesde, modejecu.idplan"
*!*		
*!*		verror=sqlrun(vconeccionb,'modejecu')
*!*		
*!*		IF !verror THEN 
*!*			MESSAGEBOX('Erro al obtener los movimientos (Mod. de Ejecuciones)',0+48,'Error')
*!*			RETURN .F.
*!*		ENDIF 		
*!*		
*!*		SELECT modejecu
*!*		GO TOP 
*!*		DO CASE 
*!*			CASE UPPER(ALLTRIM(tcFiltro)) = 'T'	
*!*				SCAN FOR !EOF()
*!*					*Partida desde (resta)
*!*					IF SEEK(ALLTRIM(STR(modejecu.idplan))+ALLTRIM(STR(modejecu.partdesde)),'balancetmp','idprin') THEN 
*!*						UPDATE balancetmp set montopar = montopar-modejecu.montopar WHERE codpart = modejecu.partdesde AND idplan = modejecu.idplan
*!*						LOOP 
*!*					ELSE 
*!*						INSERT INTO balancetmp (codpart, nompart, montopar, idplan, tipo) VALUES (modejecu.partdesde, modejecu.nompart, modejecu.montopar*-1, modejecu.idplan, ALLTRIM(modejecu.tipo))
*!*					ENDIF 		
*!*					*Partidas hasta (suma)
*!*					IF SEEK(ALLTRIM(STR(modejecu.idplan))+ALLTRIM(STR(modejecu.parthasta)),'balancetmp','idprin') THEN 
*!*						UPDATE balancetmp set montopar = montopar+modejecu.montopar WHERE codpart = modejecu.codpart AND idplan = modejecu.idplan
*!*						LOOP 
*!*					ELSE 
*!*						INSERT INTO balancetmp (codpart, nompart, montopar, idplan, tipo) VALUES (modejecu.parthasta, modejecu.nompart, modejecu.montopar, modejecu.idplan, ALLTRIM(modejecu.tipo))
*!*					ENDIF 				
*!*				ENDSCAN 
*!*				
*!*			CASE UPPER(ALLTRIM(tcFiltro)) = 'I'	
*!*				*Ingresos
*!*				SCAN FOR !EOF() AND modejecu.tipo = 'S'
*!*					*Partida desde (resta)
*!*					IF SEEK(ALLTRIM(STR(modejecu.idplan))+ALLTRIM(STR(modejecu.partdesde)),'balancetmp','idprin') THEN 
*!*						UPDATE balancetmp set montopar = montopar-modejecu.montopar WHERE codpart = modejecu.partdesde AND idplan = modejecu.idplan
*!*						LOOP 
*!*					ELSE 
*!*						INSERT INTO balancetmp (codpart, nompart, montopar, idplan, tipo) VALUES (modejecu.partdesde, modejecu.nompart, modejecu.montopar*-1, modejecu.idplan, ALLTRIM(modejecu.tipo))
*!*					ENDIF 		
*!*					*Partidas hasta (suma)
*!*					IF SEEK(ALLTRIM(STR(modejecu.idplan))+ALLTRIM(STR(modejecu.parthasta)),'balancetmp','idprin') THEN 
*!*						UPDATE balancetmp set montopar = montopar+modejecu.montopar WHERE codpart = modejecu.codpart AND idplan = modejecu.idplan
*!*						LOOP 
*!*					ELSE 
*!*						INSERT INTO balancetmp (codpart, nompart, montopar, idplan, tipo) VALUES (modejecu.parthasta, modejecu.nompart, modejecu.montopar, modejecu.idplan, ALLTRIM(modejecu.tipo))
*!*					ENDIF 				
*!*				ENDSCAN 	
*!*				
*!*			CASE UPPER(ALLTRIM(tcFiltro)) = 'E'	
*!*				*Egresos
*!*				SCAN FOR !EOF() AND modejecu.tipo = 'N'
*!*					*Partida desde (resta)
*!*					IF SEEK(ALLTRIM(STR(modejecu.idplan))+ALLTRIM(STR(modejecu.partdesde)),'balancetmp','idprin') THEN 
*!*						UPDATE balancetmp set montopar = montopar-modejecu.montopar WHERE codpart = modejecu.partdesde AND idplan = modejecu.idplan
*!*						LOOP 
*!*					ELSE 
*!*						INSERT INTO balancetmp (codpart, nompart, montopar, idplan, tipo) VALUES (modejecu.partdesde, modejecu.nompart, modejecu.montopar*-1, modejecu.idplan, ALLTRIM(modejecu.tipo))
*!*					ENDIF 		
*!*					*Partidas hasta (suma)
*!*					IF SEEK(ALLTRIM(STR(modejecu.idplan))+ALLTRIM(STR(modejecu.parthasta)),'balancetmp','idprin') THEN 
*!*						UPDATE balancetmp set montopar = montopar+modejecu.montopar WHERE codpart = modejecu.codpart AND idplan = modejecu.idplan
*!*						LOOP 
*!*					ELSE 
*!*						INSERT INTO balancetmp (codpart, nompart, montopar, idplan, tipo) VALUES (modejecu.parthasta, modejecu.nompart, modejecu.montopar, modejecu.idplan, ALLTRIM(modejecu.tipo))
*!*					ENDIF 				
*!*				ENDSCAN 				
*!*			OTHERWISE 
*!*				*Todos
*!*				SCAN FOR !EOF
*!*					*Partida desde (resta)
*!*					IF SEEK(ALLTRIM(STR(modejecu.idplan))+ALLTRIM(STR(modejecu.partdesde)),'balancetmp','idprin') THEN 
*!*						UPDATE balancetmp set montopar = montopar-modejecu.montopar WHERE codpart = modejecu.partdesde AND idplan = modejecu.idplan
*!*						LOOP 
*!*					ELSE 
*!*						INSERT INTO balancetmp (codpart, nompart, montopar, idplan, tipo) VALUES (modejecu.partdesde, modejecu.nompart, modejecu.montopar*-1, modejecu.idplan, ALLTRIM(modejecu.tipo))
*!*					ENDIF 		
*!*					*Partidas hasta (suma)
*!*					IF SEEK(ALLTRIM(STR(modejecu.idplan))+ALLTRIM(STR(modejecu.parthasta)),'balancetmp','idprin') THEN 
*!*						UPDATE balancetmp set montopar = montopar+modejecu.montopar WHERE codpart = modejecu.codpart AND idplan = modejecu.idplan
*!*						LOOP 
*!*					ELSE 
*!*						INSERT INTO balancetmp (codpart, nompart, montopar, idplan, tipo) VALUES (modejecu.parthasta, modejecu.nompart, modejecu.montopar, modejecu.idplan, ALLTRIM(modejecu.tipo))
*!*					ENDIF 				
*!*				ENDSCAN 
*!*			ENDCASE 	
*!*		*Armo la estructra del plan de cuentas
*!*		*Uso balnce01 para traer todas las partidas de los planes de cuentas afectados en los movimientos
*!*		*luego trasnfiero a la tabla balance los datos que se va a mostrar filtrando de acuerdo a los 
*!*		*parametros recibos en la funcion (todos las part o las que tienen movi)
*!*		
*!*		CREATE TABLE .\temp\balance01 (codpart i, nombre C(200), monto N(13,2), codarbol C(18), sumaen i, tipo C(1), simovim C(1), idplan i)

*!*		*Verifico si el perido solicitado afecto a mas de un plan de cuentas
*!*		
*!*		SELECT idplan FROM balancetmp GROUP BY idplan INTO CURSOR planescta	
*!*		SELECT planescta 
*!*		GO TOP 
*!*		SCAN FOR !EOF()
*!*			sqlmatriz(1)="Select codpart, nombre,  presuini as monto, codarbol, sumaen, tipo, simovim "
*!*			sqlmatriz(2)="from partidas where idplan = "+ALLTRIM(STR(planescta.idplan))
*!*			
*!*			verror=sqlrun(vconeccion,'parttmp') 

*!*			IF !verror THEN 
*!*				MESSAGEBOX('Error al obtener las Partidas',0+48,'Error')
*!*				RETURN .F.
*!*			ENDIF 
*!*			SELECT parttmp
*!*			GO TOP 
*!*			SCAN FOR !EOF()
*!*				INSERT INTO balance01 (codpart, nombre, monto, codarbol, sumaen, tipo, simovim, idplan) VALUES (;
*!*								parttmp.codpart, parttmp.nombre, parttmp.monto, parttmp.codarbol, parttmp.sumaen, parttmp.tipo, parttmp.simovim, planescta.idplan)
*!*			
*!*			ENDSCAN 	
*!*		ENDSCAN 
*!*		
*!*		*me desconecto
*!*		=abreycierracon(vconeccionb,'dbcomuna')			
*!*		

*!*		SET SAFETY OFF 	
*!*		LOCAL lnMonto, lnCod, lnImp, lnCodp
*!*		
*!*		UPDATE balance01 set monto = 0
*!*		SELECT balancetmp &&los importes de los movi de las part
*!*		GO TOP 
*!*		SCAN FOR !EOF() 
*!*			UPDATE balance01 set monto = balancetmp.montopar WHERE codpart = balancetmp.codpart AND idplan = balancetmp.idplan		
*!*			SELECT balancetmp 
*!*		ENDSCAN 

*!*	******************	
*!*		SELECT idplan, codpart, sumaen FROM balance01 WHERE monto <> 0 GROUP BY sumaen INTO TABLE .\temp\totales   
*!*		CREATE TABLE .\temp\tmp (codpart i, idplan i, simovim C(1))
*!*	*****ver balance	
*!*	*!*		*Totales acumulados por partidas con movimientos agrupado por suamen
*!*	*!*		SELECT idplan, sumaen, sum(monto) as monto FROM balance01 WHERE simovim = 'S' GROUP BY sumaen, idplan INTO TABLE .\temp\totales 
*!*	*!*		
*!*	*!*		SELECT totales 
*!*	*!*		GO TOP 

*!*	*!*		SCAN FOR !EOF() 
*!*	*!*			UPDATE balance01 set monto = totales.monto WHERE balance01.idplan = totales.idplan AND balance01.codpart = totales.sumaen
*!*	*!*		ENDSCAN 	
*!*	*!*		SELECT balance01
*!*	*!*		GO TOP &&para que me baje los update al disco	
*!*	*!*	************************	
*!*	*!*		*Me faltan totalizar las partidas sin movimientos que depende de partidas totalizadoras
*!*	*!*		SELECT idplan, sumaen, sum(monto) as monto FROM balance01 WHERE balance01.simovim = 'N' AND balance01.monto = 0 GROUP BY sumaen, idplan INTO TABLE .\temp\faltan

*!*	*!*		SELECT faltan&&patidas totalizadoras que me falta calcular el monto
*!*	*!*		GO TOP 	
*!*	*!*		SCAN FOR !EOF() 
*!*	*!*			SELECT balance01
*!*	*!*			MESSAGEBOX(STR(faltan.sumaen))
*!*	*!*			SELECT sum(monto) as monto FROM balance01 WHERE balance01.idplan = faltan.idplan AND balance01.sumaen = faltan.sumaen INTO CURSOR suma 
*!*	*!*			SELECT suma 
*!*	*!*			GO TOP 		
*!*	*!*			IF !EOF() THEN 
*!*	*!*				MESSAGEBOX(STR(suma.monto,13,2))
*!*	*!*				UPDATE balance01 set monto = suma.monto WHERE idplan = .idplan AND codpart = faltan.sumaen
*!*	*!*				SELECT balance01
*!*	*!*				GO TOP &&para que baje las actualizaciones al disco
*!*	*!*			ENDIF 
*!*	*!*			SELECT faltan
*!*	*!*			LOOP 
*!*	*!*		ENDSCAN 
*!*	******************************	
*!*		SELECT totales
*!*		GO TOP 
*!*		SCAN FOR !EOF()		
*!*			*Asignar el valor correspondiente a todas las partidas afectadas				
*!*			lnCod = totales.sumaen
*!*			SELECT tmp
*!*			DELETE ALL 
*!*			DO WHILE !lnCod = 0	
*!*				SELECT codpart, sumaen, simovim, idplan FROM balance01 WHERE codpart = lnCod INTO CURSOR 'sumaen'
*!*				SELECT sumaen
*!*				GO TOP 
*!*				IF !EOF() AND !ISNULL(sumaen.codpart) THEN 		
*!*					INSERT INTO tmp(codpart, idplan, simovim) VALUES (sumaen.codpart, sumaen.idplan, sumaen.simovim)
*!*				ENDIF 
*!*				lnCod = sumaen.sumaen			
*!*			ENDDO 

*!*			SELECT tmp
*!*			GO TOP 
*!*			SCAN FOR !EOF() AND !DELETED()
*!*				lnCod = RECNO()
*!*				SELECT balance01 
*!*				SUM monto FOR balance01.sumaen = tmp.codpart TO lnImp
*!*				UPDATE balance01 set monto = lnImp WHERE balance01.codpart = tmp.codpart
*!*				SELECT tmp 
*!*	*			GO lnCod
*!*			ENDSCAN 
*!*			SELECT totales
*!*		ENDSCAN 

*!*	***********************		
*!*		*Pasar los datos a la tabla definitiva de acuerdo a los parametros recibos en la funcion
*!*		DO CASE 
*!*			CASE ALLTRIM(UPPER(tcMovi)) = 'T'
*!*				*plan de cta completo
*!*				SELECT * from balance01 INTO TABLE .\temp\balance.dbf
*!*				
*!*			CASE ALLTRIM(UPPER(tcMovi)) = 'M'
*!*				*plan de cta con partidas que tuvieron movi
*!*				DELETE FROM balance01 WHERE ALLTRIM(UPPER(simovim)) = 'S' AND monto = 0
*!*				SELECT * from balance01 WHERE !DELETED() INTO TABLE .\temp\balance.dbf
*!*				
*!*			OTHERWISE 
*!*				*plan de cta completo
*!*				SELECT * from balance01 INTO TABLE .\temp\balance.dbf
*!*		ENDCASE 
*!*		
*!*	*Tabulo el Balance
*!*	SELECT balance01 
*!*	GO TOP 
*!*	SCAN FOR !EOF() AND !DELETED()
*!*		IF SUBSTR(balance01.codarbol,1,1) = "1" THEN 
*!*			LOOP 
*!*		ELSE 
*!*			lnSpace = VAL(SUBSTR(balance01.codarbol,1,1))
*!*			lnSpace = lnSpace * 4
*!*			lcNombre = REPLICATE(" ",lnSpace)
*!*			lcNombre = lcNombre +balance01.nombre
*!*			UPDATE balance set nombre = RTRIM(lcNombre) WHERE balance.codpart = balance01.codpart AND balance.idplan = balance01.idplan
*!*			LOOP 
*!*		ENDIF 						
*!*	ENDSCAN 				
*!*		
*!*		SELECT balance 
*!*		INDEX ON SUBSTR(codarbol,2) TAG codarbol 
*!*		RETURN .T.
*!*	ENDFUNC 
*****************************************************************
*Funcion balance recibe parametrode fecha desde, fecha hasta en *
*en formato aaaammdd character, 								*
*filtro T= todas, E= egresos I= ingresos, 						*
*Movi T= plan de cta completo partidas con y sin movi			*
*Movi M= plan de cta partidas con movimientos					*
*carga todos los datso en una tabla temporal					*
*****************************************************************
FUNCTION balance(tcdesde, tchasta, tcfiltro, tcMovi)
	*me conecto
	vconeccionb=abreycierracon(0,'dbcomuna')
	CREATE TABLE .\temp\balancetmp (codpart i, nompart c(200), montopar N(13,2), idplan i, codarbol i, tipo C(1))
	SELECT balancetmp
	INDEX ON ALLTRIM(STR(idplan))+ALLTRIM(STR(codpart)) TAG idprin
	
	IF UPPER(ALLTRIM(tcFiltro)) = 'T' OR UPPER(ALLTRIM(tcFiltro)) = 'I' THEN 
		*Ingresos
		sqlmatriz(1)="Select codpart, nompart, sum(montopar) as montopar, idplan "
		sqlmatriz(2)="from redetall where fecha >= '"+tcDesde+"' and fecha <= '"+tcHasta+"' and especial = 0 group by codpart, idplan"	
		verror=sqlrun(vconeccionb,'ingb')
		
		IF !verror THEN 
			MESSAGEBOX('Erro al obtener los movimientos de Ingresos',0+48,'Error')
			RETURN .F.
		ENDIF 
		
		*Cor. Ingresos
		sqlmatriz(1)="Select codpart, nompart, sum(montopar) as montopar, idplan "
		sqlmatriz(2)="from ordetall where fecha >= '"+tcDesde+"' and fecha <= '"+tcHasta+"' and especial = 1 group by codpart, idplan"		

		verror=sqlrun(vconeccionb,'coringb')
		
		IF !verror THEN 
			MESSAGEBOX('Erro al obtener los movimientos de Ingresos (Correciones)',0+48,'Error')
			RETURN .F.
		ENDIF 	
		
		* Ingresos Transfiero los datos a la tabla temporal
		SELECT ingb &&Ingresos
		SCAN FOR !EOF()
			INSERT INTO balancetmp (codpart, nompart, montopar, idplan, tipo) VALUES (;
							ingb.codpart, ALLTRIM(ingb.nompart), ingb.montopar, ingb.idplan, 'S')
		ENDSCAN 
			
		SELECT coringb &&Cor ingresos
		SCAN FOR !EOF() 
			IF SEEK(ALLTRIM(STR(coringb.idplan))+ALLTRIM(STR(coringb.codpart)),'balancetmp','idprin') THEN 
				UPDATE balancetmp set montopar = montopar-coringb.montopar WHERE codpart = coringb.codpart AND idplan = coringb.idplan
				LOOP 
			ELSE 
				INSERT INTO balancetmp(codpart, nompart, montopar, idplan, tipo) VALUES (coringb.codpart, coringb.nompart, coringb.montopar*-1, coringb.idplan, 'S')
			ENDIF 
			SELECT coringb
		ENDSCAN 		
	ENDIF 
	
	IF UPPER(ALLTRIM(tcFiltro)) = 'T' OR UPPER(ALLTRIM(tcFiltro)) = 'E' THEN 	
		*Egresos
		sqlmatriz(1)="Select codpart, nompart, sum(montopar) as montopar, idplan "
		sqlmatriz(2)="from ordetall where fecha >= '"+tcDesde+"' and fecha <= '"+tcHasta+"' and especial = 0 group by codpart, idplan"	
		verror=sqlrun(vconeccionb,'egrb')
		
		IF !verror THEN 
			MESSAGEBOX('Erro al obtener los movimientos de Egresos',0+48,'Error')
			RETURN .F.
		ENDIF 
		
		*Cor. Egresos
		sqlmatriz(1)="Select codpart, nompart, sum(montopar) as montopar, idplan "
		sqlmatriz(2)="from redetall where fecha >= '"+tcDesde+"' and fecha <= '"+tcHasta+"' and especial = 1 group by codpart, idplan"		

		verror=sqlrun(vconeccionb,'coregrb')
		
		IF !verror THEN 
			MESSAGEBOX('Erro al obtener los movimientos de Egresos (Correciones)',0+48,'Error')
			RETURN .F.
		ENDIF 	
		*Egresos, transfiero los datos a la tabla temporal
		SELECT egrb &&Egresos
		GO TOP 
		SCAN FOR !EOF()
			INSERT INTO balancetmp (codpart, nompart, montopar, idplan, tipo) VALUES (egrb.codpart, egrb.nompart, egrb.montopar, egrb.idplan, 'N')
		ENDSCAN	
		       
		SELECT coregrb
		GO TOP 
		SCAN FOR !EOF()
			IF SEEK(ALLTRIM(STR(coregrb.idplan))+ALLTRIM(STR(coregrb.codpart)),'balancetmp','idprin') THEN 
				UPDATE balancetmp set montopar = montopar-coregrb.montopar WHERE codpart = coregrb.codpart AND idplan = coregrb.idplan
				LOOP 
			ELSE 
				INSERT INTO balancetmp (codpart, nompart, montopar, idplan, tipo) VALUES (coregrb.codpart, coregrb.nompart, coregrb.montopar*-1, coregrb.idplan, 'N')
			ENDIF 
			SELECT coregrb		
		ENDSCAN 		
	ENDIF 
	
	*Mod. de ejecuciones
	sqlmatriz(1)="select modejecu.partdesde, modejecu.parthasta, modejecu.idplan, sum(modejecu.monto) as monto, partidas.tipo "
	sqlmatriz(2)="from modejecu left join partidas on modejecu.partdesde = partidas.codpart "
	sqlmatriz(3)=" WHERE fechaejec >= '"+tcDesde+"' and fechaejec <= '"+tcHasta+"' group by modejecu.partdesde, modejecu.idplan"
	
	verror=sqlrun(vconeccionb,'modejecu')
	
	IF !verror THEN 
		MESSAGEBOX('Erro al obtener los movimientos (Mod. de Ejecuciones)',0+48,'Error')
		RETURN .F.
	ENDIF 		
	
	SELECT modejecu
	GO TOP 
	DO CASE 
		CASE UPPER(ALLTRIM(tcFiltro)) = 'T'	
			SCAN FOR !EOF()
				*Partida desde (resta)
				IF SEEK(ALLTRIM(STR(modejecu.idplan))+ALLTRIM(STR(modejecu.partdesde)),'balancetmp','idprin') THEN 
					UPDATE balancetmp set montopar = montopar-modejecu.montopar WHERE codpart = modejecu.partdesde AND idplan = modejecu.idplan
					LOOP 
				ELSE 
					INSERT INTO balancetmp (codpart, nompart, montopar, idplan, tipo) VALUES (modejecu.partdesde, modejecu.nompart, modejecu.montopar*-1, modejecu.idplan, ALLTRIM(modejecu.tipo))
				ENDIF 		
				*Partidas hasta (suma)
				IF SEEK(ALLTRIM(STR(modejecu.idplan))+ALLTRIM(STR(modejecu.parthasta)),'balancetmp','idprin') THEN 
					UPDATE balancetmp set montopar = montopar+modejecu.montopar WHERE codpart = modejecu.codpart AND idplan = modejecu.idplan
					LOOP 
				ELSE 
					INSERT INTO balancetmp (codpart, nompart, montopar, idplan, tipo) VALUES (modejecu.parthasta, modejecu.nompart, modejecu.montopar, modejecu.idplan, ALLTRIM(modejecu.tipo))
				ENDIF 				
			ENDSCAN 
			
		CASE UPPER(ALLTRIM(tcFiltro)) = 'I'	
			*Ingresos
			SCAN FOR !EOF() AND modejecu.tipo = 'S'
				*Partida desde (resta)
				IF SEEK(ALLTRIM(STR(modejecu.idplan))+ALLTRIM(STR(modejecu.partdesde)),'balancetmp','idprin') THEN 
					UPDATE balancetmp set montopar = montopar-modejecu.montopar WHERE codpart = modejecu.partdesde AND idplan = modejecu.idplan
					LOOP 
				ELSE 
					INSERT INTO balancetmp (codpart, nompart, montopar, idplan, tipo) VALUES (modejecu.partdesde, modejecu.nompart, modejecu.montopar*-1, modejecu.idplan, ALLTRIM(modejecu.tipo))
				ENDIF 		
				*Partidas hasta (suma)
				IF SEEK(ALLTRIM(STR(modejecu.idplan))+ALLTRIM(STR(modejecu.parthasta)),'balancetmp','idprin') THEN 
					UPDATE balancetmp set montopar = montopar+modejecu.montopar WHERE codpart = modejecu.codpart AND idplan = modejecu.idplan
					LOOP 
				ELSE 
					INSERT INTO balancetmp (codpart, nompart, montopar, idplan, tipo) VALUES (modejecu.parthasta, modejecu.nompart, modejecu.montopar, modejecu.idplan, ALLTRIM(modejecu.tipo))
				ENDIF 				
			ENDSCAN 	
			
		CASE UPPER(ALLTRIM(tcFiltro)) = 'E'	
			*Egresos
			SCAN FOR !EOF() AND modejecu.tipo = 'N'
				*Partida desde (resta)
				IF SEEK(ALLTRIM(STR(modejecu.idplan))+ALLTRIM(STR(modejecu.partdesde)),'balancetmp','idprin') THEN 
					UPDATE balancetmp set montopar = montopar-modejecu.montopar WHERE codpart = modejecu.partdesde AND idplan = modejecu.idplan
					LOOP 
				ELSE 
					INSERT INTO balancetmp (codpart, nompart, montopar, idplan, tipo) VALUES (modejecu.partdesde, modejecu.nompart, modejecu.montopar*-1, modejecu.idplan, ALLTRIM(modejecu.tipo))
				ENDIF 		
				*Partidas hasta (suma)
				IF SEEK(ALLTRIM(STR(modejecu.idplan))+ALLTRIM(STR(modejecu.parthasta)),'balancetmp','idprin') THEN 
					UPDATE balancetmp set montopar = montopar+modejecu.montopar WHERE codpart = modejecu.codpart AND idplan = modejecu.idplan
					LOOP 
				ELSE 
					INSERT INTO balancetmp (codpart, nompart, montopar, idplan, tipo) VALUES (modejecu.parthasta, modejecu.nompart, modejecu.montopar, modejecu.idplan, ALLTRIM(modejecu.tipo))
				ENDIF 				
			ENDSCAN 				
		OTHERWISE 
			*Todos
			SCAN FOR !EOF
				*Partida desde (resta)
				IF SEEK(ALLTRIM(STR(modejecu.idplan))+ALLTRIM(STR(modejecu.partdesde)),'balancetmp','idprin') THEN 
					UPDATE balancetmp set montopar = montopar-modejecu.montopar WHERE codpart = modejecu.partdesde AND idplan = modejecu.idplan
					LOOP 
				ELSE 
					INSERT INTO balancetmp (codpart, nompart, montopar, idplan, tipo) VALUES (modejecu.partdesde, modejecu.nompart, modejecu.montopar*-1, modejecu.idplan, ALLTRIM(modejecu.tipo))
				ENDIF 		
				*Partidas hasta (suma)
				IF SEEK(ALLTRIM(STR(modejecu.idplan))+ALLTRIM(STR(modejecu.parthasta)),'balancetmp','idprin') THEN 
					UPDATE balancetmp set montopar = montopar+modejecu.montopar WHERE codpart = modejecu.codpart AND idplan = modejecu.idplan
					LOOP 
				ELSE 
					INSERT INTO balancetmp (codpart, nompart, montopar, idplan, tipo) VALUES (modejecu.parthasta, modejecu.nompart, modejecu.montopar, modejecu.idplan, ALLTRIM(modejecu.tipo))
				ENDIF 				
			ENDSCAN 
		ENDCASE 	
	*Armo la estructra del plan de cuentas
	*Uso balnce01 para traer todas las partidas de los planes de cuentas afectados en los movimientos
	*luego trasnfiero a la tabla balance los datos que se va a mostrar filtrando de acuerdo a los 
	*parametros recibos en la funcion (todos las part o las que tienen movi)
	
	CREATE TABLE .\temp\balance01 (codpart i, nombre C(200), monto N(13,2), codarbol C(18), sumaen i, tipo C(1), simovim C(1), idplan i)

	*Verifico si el perido solicitado afecto a mas de un plan de cuentas
	
	SELECT idplan FROM balancetmp GROUP BY idplan INTO CURSOR planescta	
	SELECT planescta 
	GO TOP 
	SCAN FOR !EOF()
		sqlmatriz(1)="Select codpart, nombre,  presuini as monto, codarbol, sumaen, tipo, simovim "
		sqlmatriz(2)="from partidas where idplan = "+ALLTRIM(STR(planescta.idplan))
		
		verror=sqlrun(vconeccion,'parttmp') 

		IF !verror THEN 
			MESSAGEBOX('Error al obtener las Partidas',0+48,'Error')
			RETURN .F.
		ENDIF 
		SELECT parttmp
		GO TOP 
		SCAN FOR !EOF()
			INSERT INTO balance01 (codpart, nombre, monto, codarbol, sumaen, tipo, simovim, idplan) VALUES (;
							parttmp.codpart, parttmp.nombre, parttmp.monto, parttmp.codarbol, parttmp.sumaen, parttmp.tipo, parttmp.simovim, planescta.idplan)
		
		ENDSCAN 	
	ENDSCAN 
	
	*me desconecto
	=abreycierracon(vconeccionb,'dbcomuna')			
	

	SET SAFETY OFF 	
	LOCAL lnMonto, lnCod, lnImp, lnCodp
	
	UPDATE balance01 set monto = 0
	SELECT balancetmp &&los importes de los movi de las part
	GO TOP 
	SCAN FOR !EOF() 
		UPDATE balance01 set monto = balancetmp.montopar WHERE codpart = balancetmp.codpart AND idplan = balancetmp.idplan		
		SELECT balancetmp 
	ENDSCAN 

******************	
	SELECT idplan, codpart, sumaen FROM balance01 WHERE monto <> 0 GROUP BY sumaen INTO TABLE .\temp\totales   
	CREATE TABLE .\temp\tmp (codpart i, idplan i, simovim C(1))
*****ver balance	
*!*		*Totales acumulados por partidas con movimientos agrupado por suamen
*!*		SELECT idplan, sumaen, sum(monto) as monto FROM balance01 WHERE simovim = 'S' GROUP BY sumaen, idplan INTO TABLE .\temp\totales 
*!*		
*!*		SELECT totales 
*!*		GO TOP 

*!*		SCAN FOR !EOF() 
*!*			UPDATE balance01 set monto = totales.monto WHERE balance01.idplan = totales.idplan AND balance01.codpart = totales.sumaen
*!*		ENDSCAN 	
*!*		SELECT balance01
*!*		GO TOP &&para que me baje los update al disco	
*!*	************************	
*!*		*Me faltan totalizar las partidas sin movimientos que depende de partidas totalizadoras
*!*		SELECT idplan, sumaen, sum(monto) as monto FROM balance01 WHERE balance01.simovim = 'N' AND balance01.monto = 0 GROUP BY sumaen, idplan INTO TABLE .\temp\faltan

*!*		SELECT faltan&&patidas totalizadoras que me falta calcular el monto
*!*		GO TOP 	
*!*		SCAN FOR !EOF() 
*!*			SELECT balance01
*!*			MESSAGEBOX(STR(faltan.sumaen))
*!*			SELECT sum(monto) as monto FROM balance01 WHERE balance01.idplan = faltan.idplan AND balance01.sumaen = faltan.sumaen INTO CURSOR suma 
*!*			SELECT suma 
*!*			GO TOP 		
*!*			IF !EOF() THEN 
*!*				MESSAGEBOX(STR(suma.monto,13,2))
*!*				UPDATE balance01 set monto = suma.monto WHERE idplan = .idplan AND codpart = faltan.sumaen
*!*				SELECT balance01
*!*				GO TOP &&para que baje las actualizaciones al disco
*!*			ENDIF 
*!*			SELECT faltan
*!*			LOOP 
*!*		ENDSCAN 
******************************	
	SELECT totales
	GO TOP 
	SCAN FOR !EOF()		
		*Asignar el valor correspondiente a todas las partidas afectadas				
		lnCod = totales.sumaen
		SELECT tmp
		DELETE ALL 
		DO WHILE !lnCod = 0	
			SELECT codpart, sumaen, simovim, idplan FROM balance01 WHERE codpart = lnCod INTO CURSOR 'sumaen'
			SELECT sumaen
			GO TOP 
			IF !EOF() AND !ISNULL(sumaen.codpart) THEN 		
				INSERT INTO tmp(codpart, idplan, simovim) VALUES (sumaen.codpart, sumaen.idplan, sumaen.simovim)
			ENDIF 
			lnCod = sumaen.sumaen			
		ENDDO 

		SELECT tmp
		GO TOP 
		SCAN FOR !EOF() AND !DELETED()
			lnCod = RECNO()
			SELECT balance01 
			SUM monto FOR balance01.sumaen = tmp.codpart TO lnImp
			UPDATE balance01 set monto = lnImp WHERE balance01.codpart = tmp.codpart
			SELECT tmp 
*			GO lnCod
		ENDSCAN 
		SELECT totales
	ENDSCAN 

***********************		
	*Pasar los datos a la tabla definitiva de acuerdo a los parametros recibos en la funcion
	DO CASE 
		CASE ALLTRIM(UPPER(tcMovi)) = 'T'
			*plan de cta completo
			SELECT * from balance01 INTO TABLE .\temp\balance.dbf
			
		CASE ALLTRIM(UPPER(tcMovi)) = 'M'
			*plan de cta con partidas que tuvieron movi
			DELETE FROM balance01 WHERE ALLTRIM(UPPER(simovim)) = 'S' AND monto = 0
			SELECT * from balance01 WHERE !DELETED() INTO TABLE .\temp\balance.dbf
			
		OTHERWISE 
			*plan de cta completo
			SELECT * from balance01 INTO TABLE .\temp\balance.dbf
	ENDCASE 
	
*Tabulo el Balance
SELECT balance01 
GO TOP 
SCAN FOR !EOF() AND !DELETED()
	IF SUBSTR(balance01.codarbol,1,1) = "1" THEN 
		LOOP 
	ELSE 
		lnSpace = VAL(SUBSTR(balance01.codarbol,1,1))
		lnSpace = lnSpace * 4
		lcNombre = REPLICATE(" ",lnSpace)
		lcNombre = lcNombre +balance01.nombre
		UPDATE balance set nombre = RTRIM(lcNombre) WHERE balance.codpart = balance01.codpart AND balance.idplan = balance01.idplan
		LOOP 
	ENDIF 						
ENDSCAN 				
	
	SELECT balance 
	INDEX ON SUBSTR(codarbol,2) TAG codarbol 
	RETURN .T.
ENDFUNC 

**************************************************************************************
*FUNCION F_SALDOINIBAN(tdfecha)										    		 *
*Devuelve el saldo incial de las cuentas.											 *
*recibo como parametro una tabla con las cunetas bancarias a calcular el			 *
*saldo, tambien recibo la fecha a la cual debo devolver el saldo inicial			 *
*Retorna T si logro calcular el saldo (al cual lo almacena en la					 *
*tabla que recibe como parametro)													 *
*IMPORTANTE: LA tabla se dede llamar bancos y debe estar en el dir tmp del sistema	 *
**************************************************************************************
FUNCTION f_saldoiniban (tdfecha, tdfechah)
	SET SAFETY OFF 
	SET CENTURY ON 
	SET DATE DMY 

*	CREATE TABLE .\temp\saldosban (nrocuenta C(12), fechaape D(8), saldoini N(13,2), ingresos N(13,2), egresos N(13,2), saldofinal N(13,2))
	CREATE TABLE .\temp\bcossalini (nrocuenta C(12), saldo N(13,2), fecha D(8))
	LOCAL lcFecha, lnSaldoF, lnIngresos, lnEgresos, lnSaldoini, lnAux
	
	*Me conecto a la base se datos
	vconeccionB=abreycierracon(0,'dbcomuna')
	
	*obtengo el Saldo Inicial, para ello busco la fecha del ultimo cierre

	SELECT bancos 
	GO TOP 
	SCAN FOR !EOF()
		*Determinar ultimo cierre, a partir de la fecha que se pide el saldo.
		*luego se busca los movimientos posteriores a la fecha de cierre

		*Buscar Ultimo Cierre

		sqlmatriz(1)="Select MAX(fechacie) as fechacie, saldoini, ingresos, egresos, saldofinal from cierreban where nrocuenta = '"+ALLTRIM(bancos.nrocuenta)+"' "
		sqlmatriz(2)=" and fechacie <= '"+DTOS(tdfecha)+"' group by nrocuenta"


		verror=sqlrun(vconeccionb,'ultcierre')
		
		IF !verror THEN 
			MESSAGEBOX('Error al Obtener la Fecha de Apertura',0+48,'Error')
			*me desconecto
			=abreycierracon(vconeccionb,'')			
			RETURN .F.
		ENDIF 

		SELECT ultcierre
		GO TOP 
		IF EOF() OR ISNULL(ultcierre.fechacie) THEN 
			*verificar si hay movimientos por si no me queda colgado un
			*cierre posterior (sin movimientos anteriores)
			*por lo caul son los saldos iniciales
			LOCAL lnVer

			lnVer = f_verificacierre(tdFecha, tdFechah, bancos.nrocuenta) 

			IF lnVer = -1 THEN 
				MESSAGEBOX('Error al Verificar el Cierre Bancario',0+48,'Error')
				=abreycierracon(vconeccionB,'')
				RETURN .F.
			ENDIF 
			IF lnVer = 0 THEN 			
				*No hay cierre 
				lnSaldoini = 0 
				lnIngresos = 0
				lnEgresos = 0
				lnSaldoF = 0				
				lcFecha = DTOS(tdFecha)
				lnAux = 0 &&no hay cierre
			ELSE 
				*hay un cierre posterior a la fecha pedida
				*y no hay movimientos anteriores al cierre
				lnSaldoini = ultcierre.saldoini
				lnIngresos = ultcierre.ingresos
				lnEgresos = ultcierre.egresos
				lnSaldoF = ultcierre.saldofinal	
				
				lcFecha = ultcierre.fechacie 
				lnAux = 1 &&hay cierre bancarios			
			ENDIF 
		ELSE 
			lnSaldoini = ultcierre.saldoini
			lnIngresos = ultcierre.ingresos
			lnEgresos = ultcierre.egresos
			lnSaldoF = ultcierre.saldofinal	
			
			lcFecha = ultcierre.fechacie 
			lnAux = 1 &&hay cierre bancarios
		ENDIF 
		*Tanto en ingresos y egresos calculo todos los importes sin tener en cuenta el campo especial porque de 
		*esa manera tambien calculo sus respectivas correciones

		*INGRESOS
		IF lnAux = 0 THEN 		
			*No cierre ha tener en cuenta
			sqlmatriz(1)="Select sum(monto) as monto from recibo where fecha <= '"+lcFecha+"' " 
			sqlmatriz(2)="and nrocuenta = '"+ALLTRIM(bancos.nrocuenta)+"'"		
		ELSE 
			*hay un cierre por esos los mov deben ser posterior al mismo y anterior o igual a la fecha pedida
			sqlmatriz(1)="Select sum(monto) as monto from recibo where fecha > '"+lcFecha+"'  and fecha <= '"+DTOS(tdFecha)+"' " 
			sqlmatriz(2)="and nrocuenta = '"+ALLTRIM(bancos.nrocuenta)+"'"	
		ENDIF 	

		verror=sqlrun(vconeccionB,'ing_ini')
		IF !verror THEN 
			MESSAGEBOX('Error al obtener los ingresos de la Cuenta Nº: '+ALLTRIM(bancos.nrocuenta),0+48,'Error')
			*me desconecto
			=abreycierracon(vconeccionb,'')			
			RETURN .F.
		ENDIF 		
		SELECT ing_ini 
		GO TOP 
		IF !EOF() AND !ISNULL(ing_ini.monto) THEN 
			lnIngresos = ing_ini.monto
		ELSE
			lnIngresos = 0
		ENDIF 

		*EGRESOS
		IF lnAux = 0 THEN 		
			*No hay cierre ha tener en cuenta
			sqlmatriz(1)="Select sum(monto) as monto from ordenes where fecha <= '"+lcFecha+"' " 
			sqlmatriz(2)="and nrocuenta = '"+ALLTRIM(bancos.nrocuenta)+"'"		
		ELSE 
			*hay un cierre por esos los mov deben ser posterior al mismo y anterior o igual a la fecha pedida
			sqlmatriz(1)="Select sum(monto) as monto from ordenes where fecha > '"+lcFecha+"'  and fecha <= '"+DTOS(tdFecha)+"' " 
			sqlmatriz(2)="and nrocuenta = '"+ALLTRIM(bancos.nrocuenta)+"'"	
		ENDIF 	

		verror=sqlrun(vconeccionB,'egr_ini')
		IF !verror THEN 
			MESSAGEBOX('Error al obtener los egresos de la Cuenta Nº: '+ALLTRIM(bancos.nrocuenta),0+48,'Error')
			RETURN .F.
		ENDIF 		
		
		SELECT egr_ini
		GO TOP 
		IF !EOF() AND !ISNULL(egr_ini.monto) THEN 
			lnEgresos = egr_ini.monto
		ELSE
			lnEgresos = 0
		ENDIF 
		lnSaldof = (lnSaldoF + lnIngresos) - lnEgresos
		*Saldo a la fecha pedida
		INSERT INTO bcossalini(nrocuenta, saldo, fecha) ;
					 VALUES (bancos.nrocuenta, lnSaldof, tdFecha)
	ENDSCAN 
	*me desconecto
	=abreycierracon(vconeccionb,'')			
	RETURN .T.
ENDFUNC 

*ESTA FUNCION DEVUELVE -1 SI HUBO ERROR, 0 SI NO ENCONTRO CIERRE BANCARIOS 1 SI ENCONTRO UN CIERRE
*VERIFICA SI HAY UN CIERRE ANTERIOR AL PRIMER MOVIMIeNTO DE LA CUENTA YA SEA DE INGRESOS O EGRESOS
*DADO QUE SI ME PIDE UN SALDO A FECHA X Y NO AHY CIERRE MENORES IGUALES A LA FECHA Y SI
*HAY UN CIERRE POSTERIOR A ESA FECHA PERO ANTERIOR AL PRIMER MOVIMIENTO DE LA CUENTA
*LO TENGO QUE TOMAR A DICHO CIERRE COMO SALDO INICIAL
*
FUNCTION f_verificacierre(tdFechad, tdfechah, tcnrocuenta)
			
		LOCAL lcFecha &&fecha del primer mov de la cuenta
		vconeccionV=abreycierracon(0,'dbcomuna')
		*voy gaurdando en bco tmp las fechas de los movi, para luegfo determinar cual es el primero y a que tabla corresponde
		*al no tener en cuenta el campo espcial en recibo y ordnes incluyo ambas correcciones de comprobantes
		
		CREATE TABLE .\temp\bcotmp (nrocuenta C(20), fecha C(8), nombre C(20)) &&nombre = almcena nombre de la tabla a que corresponde la fecha
		
		sqlmatriz(1)="Select MIN(fecha) as fecha from recibo where nrocuenta = '"+ALLTRIM(tcnrocuenta)+"' and fecha >= '"+DTOS(tdFechad)+"' and fecha <= '"+DTOS(tdFechah)+"'"

		verror=sqlrun(vconeccionv,'vrec')
		IF !verror THEN 
			MESSAGEBOX('Error al Verficar Cierre Bancarios (Ingresos)',0+64,'Error')
			=abreycierracon(vconeccionV,'')
			RETURN -1
		ENDIF 
		sqlmatriz(1)="Select MIN(fecha) as fecha from ordenes where nrocuenta = '"+ALLTRIM(tcnrocuenta)+"' and fecha <= '"+DTOS(tdFechad)+"' and fecha <= '"+DTOS(tdFechah)+"'"
		verror=sqlrun(vconeccionv,'vord')
		IF !verror THEN 
			MESSAGEBOX('Error al Verficar Cierre Bancarios (Egresos)',0+64,'Error')
			=abreycierracon(vconeccionV,'')
			RETURN -1
		ENDIF 		

		SELECT vrec
		GO TOP 

		IF !EOF() AND !ISNULL(vrec.fecha) THEN 

			INSERT INTO bcotmp (nrocuenta, fecha, nombre) VALUES (tcnrocuenta, vrec.fecha, 'recibo')
		ENDIF 
		SELECT vord
		GO TOP 

		IF !EOF() AND !ISNULL(vord.fecha) THEN 

			INSERT INTO bcotmp (nrocuenta, fecha, nombre) VALUES (tcnrocuenta, vord.fecha, 'ordenes')
		ENDIF 

		SELECT MIN(fecha) as fecha, nombre FROM bcotmp INTO CURSOR curbcotmp GROUP BY nrocuenta
		SELECT curbcotmp
		GO TOP 
		*Busco un Cierre anterior al primer movimiento de la cuenta
		*y posterior al pedido inicial de los saldos 
		IF !EOF() THEN 
			lcFecha = curbcotmp.fecha
		ELSE 
			*la cuenta no tiene movimientos con la
			*fecha indicada
			=abreycierracon(vconeccionV,'')
			RETURN 0
		ENDIF

		sqlmatriz(1)="Select MAX(fechacie) as fechacie, saldoini, ingresos, egresos, saldofinal from cierreban where nrocuenta = '"+ALLTRIM(tcnrocuenta)+"' "
		sqlmatriz(2)=" and fechacie <= '"+lcfecha+"' group by nrocuenta"

		verror=sqlrun(vconeccionv,'ultcierre')
		IF !verror THEN 
			MESSAGEBOX('Error al Obtener la Fecha de Apertura (f_verificacierre)',0+48,'Error')
			*me desconecto
			=abreycierracon(vconeccionV,'')
			RETURN -1
		ENDIF 		
		SELECT ultcierre
		GO TOP 
		IF !EOF() AND !ISNULL(ultcierre.saldoini) THEN 	
			*cierre bancario (saldo inicial)
			=abreycierracon(vconeccionV,'')
			RETURN 1
		ELSE 
			*Sin cierre bancario
			=abreycierracon(vconeccionV,'')
			RETURN 0
		ENDIF 								
ENDFUNC 
*Saldo de la Boleta de Convenio. si paso el primer vencimiento el sado lo tiene 
*en venactz asi como también la fecha maxima de pago 
*en caso de que la fecha de pago es mayor a la act. solo lo informo
FUNCTION f_saldoboletac(tnidboleta, tdfechapago)
	LOCAL lnSaldo, lnImputado, lnInteres, lcmess
	SET SAFETY OFF 
	CREATE TABLE .\temp\saldob(saldo N(13,2), recargo N(13,2), imputado N(13,2))
	*
	sqlmatriz(1)= "Select h.*, p.idservicio from conveniosh h left join conveniosp p on h.idconvenio = p.idconvenio "
	sqlmatriz(2)= "where h.idboletac = "+SUBSTR(ALLTRIM(STR(tnidboleta)),2,8)
*	sqlmatriz(2)= "where h.idboletac = "+ALLTRIM(STR(tnidboleta))
*	lcmess = sqlmatriz(2)
*			MESSAGEBOX(lcmess)
	verror=sqlrun(vconeccion,"importeb")
	IF !verror THEN 

		MESSAGEBOX("Error, no se puede determinar el valor del Convenio",0+64,'Error. f_saldoboletac')
		RETURN .F.
	ENDIF 

	SELECT importeb 
	GO TOP 
	IF EOF() THEN 
		MESSAGEBOX('Error. No se encontro la Convenio idboletac: '+ALLTRIM(STR(tnidboleta)),0+64,'Error. f_saldoboletac')
		RETURN .F.
	ENDIF 		
	*Obtengo los pagos de la boleta
	sqlmatriz(1)="Select sum(pagosco.capital+pagosco.intereses) as impcuota,   conveniosp.idservicio, conveniosh.fechavenc "
	sqlmatriz(2)="from pagosco left join conveniosp on pagosco.idconvenio = conveniosp.idconvenio "
	sqlmatriz(3)="left join conveniosh on pagosco.idconvenio = conveniosh.idconvenio "
	sqlmatriz(4)="where pagosco.idboletac = "+SUBSTR(ALLTRIM(STR(tnidboleta)),2,9)+" group by pagosco.idboletac"
*	sqlmatriz(1)= "Select sum(pagosco.capital+pagosco.intereses) as impcuota  from pagosco where pagosco.idboletac = "+SUBSTR(ALLTRIM(STR(tnidboleta)),2,9)
	verror=sqlrun(vconeccion,"importep")
	IF !verror THEN 
		MESSAGEBOX('Error, no se puede determinar los pagos de la boleta.',0+64,'Error. f_saldoboleta')
		RETURN .F.
	ENDIF 
	SELECT importep
		GO TOP 
	IF EOF() OR ISNULL(importep.impcuota) THEN 
		*No tiene pagos controlar si ya pasaron todas
		*las fechas de vencimientos 
		lnImputado = 0
		DO CASE 
			CASE tdFechapago <= CTOD(SUBSTR(importeb.fechavenc,7,2)+"/"+SUBSTR(importeb.fechavenc,5,2)+"/"+SUBSTR(importeb.fechavenc,1,4))
				*Boleta No Vencida 					
				SELECT saldob 
				DELETE ALL 
				INSERT INTO saldob(saldo, recargo, imputado) VALUES (importeb.impcuota, 0, 0)
				RETURN .T.
			CASE tdFechapago <= CTOD(SUBSTR(importeb.venactz,7,2)+"/"+SUBSTR(importeb.venactz,5,2)+"/"+SUBSTR(importeb.venactz,1,4))
				* VENCIMIENTO actualizado
				SELECT saldob 
				DELETE ALL 
				lnInteres = imptotal - impcuota
				INSERT INTO saldob(saldo, recargo, imputado) VALUES (importeb.impcuota, lnInteres, 0)
				RETURN .T.				
			OTHERWISE 							
				lnInteres = f_interesd(importeb.fechavenc, tdFechapago, importeb.impcuota, importeb.idservicio)
				IF lnInteres < 0 THEN 
					RETURN .F. &&Error en f_interesd
				ENDIF 
				SELECT saldob
				DELETE ALL 
				INSERT INTO saldob(saldo, recargo, imputado) VALUES (importeb.impcuota, lnInteres, 0)
				RETURN .T.					
		ENDCASE
	ELSE
		*Total importe Abonado
		lnImputado = importep.impcuota
		lnSaldo = importeb.imptotal
		lnSaldo = lnSaldo - impcuota	

		lnInteres = f_interesd(importeb.fechavenc, tdFechapago, lnSaldo, importeb.idservicio)
		IF lnInteres < 0 THEN 
			RETURN .F. &&Error en f_interesd
		ENDIF 

		lnSaldo = lnSaldo + lnInteres
		SELECT saldob
			DELETE ALL 
		INSERT INTO saldob(saldo, recargo, imputado) VALUES (lnSaldo, lnInteres, lnImputado)
		RETURN .T.		
	ENDIF 
ENDFUNC

******************************
*funcion f_ingresos(tddesde, tdhasta)
*devuelve en una tabla tmp los ingresos con fecha desde-hasta como parametro
*retorna un valo logico T si el calculo  tuvo exito F caso contrario
*me conecto
FUNCTION f_ingresos(tdDesde, tdHasta)
	SET SAFETY OFF 
	CREATE TABLE .\temp\ingresos (nrorecibo i, codprove i, proveedor C(60), codpart i, nompart C(60), nrocuenta C(12), montopar N(13,2), fecha D(8), idrecibo i, especial i)
	
	vconeccion=abreycierracon(0,'dbcomuna')

	WAIT WINDOW "Obteniendo Ingresos..." NOWAIT 
	*Ingresos
	sqlmatriz(1)="Select redetall.codpart, redetall.nompart, redetall.nrorecibo, recibo.codprove, recibo.proveedor, "
	sqlmatriz(2)="recibo.nrocuenta, redetall.montopar, recibo.fecha, recibo.idrecibo from redetall left join recibo on redetall.idrecibo = recibo.idrecibo where recibo.fecha >= '"
	sqlmatriz(3)=DTOS(tdDesde)+"' and recibo.especial = 0 and recibo.fecha <= '"+DTOS(tdHasta)+"'"

	verror=sqlrun(vconeccion,'recibos')
	IF !verror THEN 
		MESSAGEBOX('Ha ocurrido un error al obtener los Recibos',0+48,'Error')
		RETURN .F.
	ENDIF 

	WAIT WINDOW "Obteniendo Correciones de Ingresos..." NOWAIT 
	*Cor Ing.
	sqlmatriz(1)="Select ordetall.codpart, ordetall.nompart, ordetall.nroorden, ordenes.codprove, ordenes.proveedor, "
	sqlmatriz(2)="ordenes.nrocuenta, ordetall.montopar*-1 as montopar, ordenes.fecha, ordenes.idorden from ordetall left join ordenes on ordetall.idorden = ordenes.idorden where ordenes.fecha >= '"
	sqlmatriz(3)=DTOS(tdDesde)+"' and ordenes.especial = 1 and ordenes.fecha <= '"+DTOS(tdHasta)+"'"

	verror=sqlrun(vconeccion,'correc')
	IF !verror THEN 
		MESSAGEBOX('Ha ocurrido un error al obtener las coreeciones de los Recibos',0+48,'Error')
		RETURN .F.
	ENDIF 

	*me desconecto
	=abreycierracon(vconeccion,'')


	*Transfiero los datos a las tablas temporales
	WAIT WINDOW "Transfiriendo Ingresos..." NOWAIT 
	SELECT recibos
	GO TOP 
	SCAN FOR !EOF()
	INSERT INTO ingresos (codpart, nompart, nrorecibo, codprove, proveedor, nrocuenta, montopar, fecha, idrecibo, especial) VALUES (;
						recibos.codpart, ALLTRIM(recibos.nompart), recibos.nrorecibo, recibos.codprove, ALLTRIM(recibos.proveedor), ;
						recibos.nrocuenta, recibos.montopar, CTOD(SUBSTR(recibos.fecha,7,2)+"/"+SUBSTR(recibos.fecha,5,2)+"/"+SUBSTR(recibos.fecha,1,4)), ;
						recibos.idrecibo, 0)
	ENDSCAN 

	WAIT WINDOW "Transfiriendo Correcciones de Ingresos..." NOWAIT 
	SELECT correc
	GO TOP 
	SCAN FOR !EOF()
	INSERT INTO ingresos (codpart, nompart, nrorecibo, codprove, proveedor, nrocuenta, montopar, fecha, idrecibo, especial) VALUES (;
						correc.codpart, ALLTRIM(correc.nompart), correc.nroorden, correc.codprove, ALLTRIM(correc.proveedor), ;
						correc.nrocuenta, correc.montopar, CTOD(SUBSTR(correc.fecha,7,2)+"/"+SUBSTR(correc.fecha,5,2)+"/"+SUBSTR(correc.fecha,1,4)), ;
						correc.idorden, 1)
	ENDSCAN 

	LOCAL lnTotal
	SELECT ingresos 
	GO TOP 	
	RETURN	.T.
ENDFUNC 


*******************************************************************************
*funcion f_egresos(tddesde, tdhasta)										  *
*devuelve en una tabla tmp los ingresos con fecha desde-hasta como parametro  *
*retorna un valo logico T si el calculo  tuvo exito F caso contrario          *
*******************************************************************************
FUNCTION f_egresos(tdDesde, tdHasta)
	SET SAFETY OFF 
	CREATE TABLE .\temp\egresos (nroorden i, codprove i, proveedor C(60), codpart i, nompart C(60), nrocuenta C(12), montopar N(13,2), formapago C(10), cheque i, fecha D(8), idorden i, especial i)
	*me conecto
	vconeccion=abreycierracon(0,'dbcomuna')

	WAIT WINDOW "Obteniendo Egresos..." NOWAIT 


	*Egresos
	sqlmatriz(1)="Select ordetall.codpart, ordetall.nompart, ordetall.nroorden, ordenes.codprove, ordenes.proveedor, "
	sqlmatriz(2)="ordenes.nrocuenta, ordetall.montopar, ordenes.formapago, ordenes.cheque, ordenes.fecha, ordenes.idorden from ordetall left join ordenes on ordetall.idorden = ordenes.idorden where ordenes.fecha >= '"
	sqlmatriz(3)=DTOS(tdDesde)+"' and ordenes.especial = 0 and ordenes.fecha <= '"+DTOS(tdHasta)+"'"

	verror=sqlrun(vconeccion,'ordenes')
	IF !verror THEN 
		MESSAGEBOX('Ha ocurrido un error al obtener los Ordenes',0+48,'Error')		
		RETURN .F.
	ENDIF 

	WAIT WINDOW  "Obteniendo Correciones de Egresos..." NOWAIT 
	*Cor Egr. (invierto el signo para que me reste)
	sqlmatriz(1)="Select redetall.codpart, redetall.nompart, redetall.nrorecibo, recibo.codprove, recibo.proveedor, "
	sqlmatriz(2)="recibo.nrocuenta, redetall.montopar*-1 as montopar, recibo.formapago, recibo.fecha, recibo.idrecibo from redetall left join recibo on redetall.idrecibo = recibo.idrecibo where recibo.fecha >= '"
	sqlmatriz(3)=DTOS(tdDesde)+"' and recibo.especial = 1 and  recibo.fecha <= '"+DTOS(tdHasta)+"'"

	verror=sqlrun(vconeccion,'corord')
	IF !verror THEN 
		MESSAGEBOX('Ha ocurrido un error al obtener las correciones de las Ordenes',0+48,'Error')
		RETURN .F.
	ENDIF 

	*me desconecto
	=abreycierracon(vconeccion,'')

	WAIT WINDOW  "Transfiriendo Egresos..." NOWAIT 
	*Transfiero los datos a las tablas temporales
	LOCAL lcFpago, lnCheque
	SELECT ordenes
	GO TOP 
	SCAN FOR !EOF()
		DO CASE 
			CASE ordenes.formapago = 1
				lcFpago = 'Cheque'
			CASE ordenes.formapago = 2
				lcFpago = 'Efvo'
			CASE ordenes.formapago = 3
				lcFpago = 'Nota Deb'
		ENDCASE 
		INSERT INTO egresos (codpart, nompart, nroorden, codprove, proveedor, nrocuenta, montopar, formapago, cheque, fecha, idorden, especial) VALUES (;
							ordenes.codpart, ALLTRIM(ordenes.nompart), ordenes.nroorden, ordenes.codprove, ALLTRIM(ordenes.proveedor), ;
							ordenes.nrocuenta, ordenes.montopar, lcFpago, ordenes.cheque, CTOD(SUBSTR(ordenes.fecha,7,2)+"/"+SUBSTR(ordenes.fecha,5,2)+"/"+SUBSTR(ordenes.fecha,1,4)), ;
							ordenes.idorden, 0)
	ENDSCAN 

	WAIT WINDOW "Transfiriendo Correciones de Egresos..." NOWAIT 


	SELECT corord
	GO TOP 
	SCAN FOR !EOF()
		DO CASE 
			CASE corord.formapago = 1
				lcFpago = 'Cheque'
			CASE corord.formapago = 2
				lcFpago = 'Efvo'
			CASE corord.formapago = 3
				lcFpago = 'Nota Deb'
		ENDCASE	
		INSERT INTO egresos (codpart, nompart, nroorden, codprove, proveedor, nrocuenta, montopar, formapago, cheque, fecha, idorden, especial) VALUES (;
							corord.codpart, ALLTRIM(corord.nompart), corord.nrorecibo, corord.codprove, ALLTRIM(corord.proveedor), ;
							corord.nrocuenta, corord.montopar, lcFpago, 0, CTOD(SUBSTR(corord.fecha,7,2)+"/"+SUBSTR(corord.fecha,5,2)+"/"+SUBSTR(corord.fecha,1,4)), ;
							corord.idrecibo, 1)
	ENDSCAN 

	LOCAL lnTotal
	SELECT egresos
	GO TOP 
	RETURN .T.
ENDFUNC 

*calcula la deuda de la cuenta sin intereses y la imprime en la boleta
FUNCTION f_leyendaboleta ()

	LOCAL llSaldo, lnsaldo_neto, llSaldo, ldUvenc, lnBasico, lnSaldo, lnRecargo, lnSaldocon, lnOld_id, lnMax, lnCant_reg
	
	********************************
	*barra de porcentaje 
	lnMax = RECCOUNT('boletas') &&Cantidad de registros a recorrer
	*Instanciar el objeto
	othermo = NEWOBJECT("Therm","custom.vcx")
	*Colocar los titulos
	oThermo.SetCaption("Calculando deudas...",1)
	oThermo.SetCaption("Calculando registros...",2)
	*Mostrar el porcentaje numerico
	oThermo.SelfUpdate = .t.
	*Cuento los Registros a procesar
	*Transfiero la Cantidad a MaxValue
	oThermo.MaxValue = lnMax
	lnCant_reg = 0 &&Cantidad de registros procesados
	***********************************************

	lnOld_id = 0&&idboleta, son nueve repetidos dado que en la impresion se usa una tabla para el encabezado y el datalle
	
	SELECT boletas
	GO TOP 		
	SCAN FOR !EOF()		
	
		oThermo.UpdateBar(lnCant_reg)
		oThermo.SetCaption(TRANSFORM(lnCant_reg)+" de "+TRANSFORM(oThermo.MaxValue)+" registros procesados.",2)
			
		IF lnOld_id > 0 THEN 
			IF boletas.idboleta = lnOld_id THEN 
				SELECT boletas 
				lnCant_reg = lnCant_reg + 1 &&Registros  procesados
				LOOP 
			ENDIF 
		ENDIF 
		
		*calculo la deuda de la cuenta actual
		sqlmatriz(1)= "SELECT * from boletap WHERE boletap.idlote = "+ALLTRIM(STR(boletas.idlote))
		sqlmatriz(2)= " AND boletap.idservicio = "+ALLTRIM(STR(boletas.idservicio))+" and boletap.idsubser = "+ALLTRIM(STR(boletas.idsubser))
		sqlmatriz(3)= " order by boletap.anio, boletap.periodo"
		verror=sqlrun(vconeccion,"tmp")
		IF !verror THEN 
			MESSAGEBOX("Error. No se puede obtener las boletas de la cuenta: ";
						+ALLTRIM(STR(boletas.idcontribu))+"-"+ALLTRIM(STR(boletas.idlote))+"-"+ALLTRIM(STR(boletas.idservicio))+"-";
						+ALLTRIM(STR(boletas.idsubser))+CHR(13)+"Verifique las Conexiones de Red y vuelva a intentarlo",0+64,"Error de Conexión")
			RETURN .F.
		ENDIF 
		*
		SELECT tmp
		GO TOP 
		IF EOF() OR ISNULL(tmp.idboleta) THEN 
			*cuentas actual no posee boletas anteriores por lo tanto no tiene deuda			
			*************************************************			
			SELECT boletas 
			SKIP 
			REPLACE leyenda WITH "SU CUENTA NO POSEE DEUDAS"
			SKIP 
			REPLACE leyenda WITH "AL "+DTOC(DATE())
			SELECT boletas 
			lnOld_id = boletas.idboleta		
			lnCant_reg = lnCant_reg + 3 &&Registros  procesados
			LOOP 
		ENDIF 
		
		lnBasico = 0
		lnSaldo = 0
		lnRecargo = 0
		*recorro tmp (todas las boletas de la cuenta actual)
		SCAN FOR !EOF()			
			ldUvenc = CTOD(SUBSTR(tmp.fechavenc,7,2)+"/"+SUBSTR(tmp.fechavenc,5,2)+"/"+SUBSTR(tmp.fechavenc,1,4))
			IF ldUvenc >= DATE() THEN 
				*No paso el ultimo vencimiento
				SELECT tmp 				
				LOOP 
			ENDIF 	
			llSaldo = f_saldoboleta(tmp.idboleta, DATE())
			IF llSaldo THEN 
				IF saldob.saldo > 0 THEN 
					lnBasico = lnBasico + tmp.imptotal
				ENDIF 			
				lnSaldo = lnSaldo + saldob.saldo
				lnRecargo = lnRecargo + saldob.recargo
			ELSE 
				MESSAGEBOX('Ha ocurrido un error al calcular el Saldo.'+CHR(13)+'Verifique las conexiones de red y vuelva a intentarlo',0+64,'Error')
				MESSAGEBOX('Id Boleta: '+ALLTRIM(STR(tmp.idboleta)),0+48,'Error')
				RETURN .F.
			ENDIF 
		ENDSCAN 

		*Verifico si la cuenta tiene un convenio de pagos
		sqlmatriz(1)="Select montoconv from conveniosp where idlote = "+ALLTRIM(STR(boletas.idlote)) 
		sqlmatriz(2)=" and idservicio = "+ALLTRIM(STR(boletas.idservicio))+" and anulado = 'N'"

		verror=sqlrun(vconeccion,'montoconv')
		IF !verror THEN 
			MESSAGEBOX('Error al verificar saldos en Convenios',0+48,'Error')
			RETURN .F.
		ENDIF  
		SELECT montoconv
		GO TOP 						

		IF EOF() OR ISNULL(montoconv.montoconv) THEN 
			*no tiene convenios			
			IF !lnSaldo > 0 THEN 
				*No posee deudas
				****************************************
				SELECT boletas 
				SKIP 
				REPLACE leyenda WITH "SU CUENTA NO POSEE DEUDAS"
				SKIP 
				REPLACE leyenda WITH "AL "+DTOC(DATE())
				lnOld_id = boletas.idboleta
				lnCant_reg = lnCant_reg + 3 &&Registros  procesados
				LOOP 
			ELSE 
				*tiene deuda convenicional y no tiene convenio de pagos adeudados
				SELECT boletas 
				SKIP &&un renglon en blanco
				replace leyenda WITH "SU CUENTA POSEE UNA DEUDA"
				SKIP 
				replace leyenda WITH "DE $ "+ALLTRIM(STR(lnBasico,13,2))
				SKIP 
				replace leyenda WITH "SIN INTERESES AL "+DTOC(DATE())
				SELECT boletas
				lnOld_id = boletas.idboleta
				lnCant_reg = lnCant_reg + 4 &&Registros  procesados
				LOOP 							
			ENDIF 
		ELSE 		
			*calcular deuda en convenio
			sqlmatriz(1)="SELECT sum(pagosco.capital+pagosco.intereses) as totalpago, conveniosp.idconvenio from pagosco LEFT JOIN conveniosp ON "
			sqlmatriz(2)="pagosco.idconvenio = conveniosp.idconvenio where conveniosp.idlote = "+ALLTRIM(STR(boletas.idlote))
			sqlmatriz(3)=" and conveniosp.idservicio = "+ALLTRIM(STR(boletas.idservicio))
			sqlmatriz(4)=" group by pagosco.idconvenio"

			verror=sqlrun(vconeccion,'pagocon')
			IF !verror THEN 
				MESSAGEBOX('Error al verificar saldos en Convenios',0+48,'Error')
				RETURN .F.			
			ENDIF  
			SELECT pagocon
			GO TOP 
			IF EOF() OR ISNULL(pagocon.totalpago) THEN 
				lnSaldocon = montoconv.montoconv
			ELSE  
				lnSaldocon = montoconv.montoconv - pagocon.totalpago
			ENDIF 
			IF lnSaldocon > 0 THEN 				
				*Deudas en Convenio Nº pagocon.idconvenio
				*************************************************		
				IF !lnSaldo > 0 THEN 
					SELECT boletas 
					SKIP 
					REPLACE leyenda WITH "SU CUENTA POSEE UN"
					SKIP 
					REPLACE leyenda WITH "CONVENIO DE PAGOS"
					lnOld_id = boletas.idboleta
					lnCant_reg = lnCant_reg + 3 &&Registros  procesados
					LOOP 
				ELSE 
					*deuda 
					*******************************************************************		
					SELECT boletas 
					SKIP &&un renglon en blanco
					replace leyenda WITH "SU CUENTA POSEE UNA DEUDA"
					SKIP 
					replace leyenda WITH "DE $ "+ALLTRIM(STR(lnBasico,13,2))
					SKIP 
					replace leyenda WITH "SIN INTERESES AL "+DTOC(DATE())
					SKIP 
					replace leyenda WITH "MAS UN CONVENIO DE PAGO"
					SKIP 
					replace leyenda WITH "POR DEUDA ANTERIOR"
					SELECT boletas
					lnOld_id = boletas.idboleta
					lnCant_reg = lnCant_reg + 6 &&Registros  procesados
					LOOP 
				ENDIF 				
			ENDIF 
		ENDIF 
		*fin calculo deuda cuenta actual
		SELECT boletas 
		lnOld_id = boletas.idboleta
		lnCant_reg = lnCant_reg + 1 &&Registros  procesados
		LOOP 	
	ENDSCAN 

	IF lnCant_reg = lnMax THEN 	
		oThermo.SetCaption("Enviando registros a la impresora...",1)
		oThermo.SetCaption("Espere esta operación puede tardar unos minutos...",2)
	ENDIF 		
	RELEASE oThermo  
ENDFUNC 


*----------------------------------------------------------------
*---------Función para convertir frx a pdf automatización--------
*--recibe nombre reporte, nombre archivo pdf, ubicación del pdf--
*----------------------------------------------------------------
FUNCTION ImpPdf
	PARAMETERS lcRepo, lcPdf, lcUbi
	=proclase()
	DECLARE Sleep IN WIN32API INTEGER
	ReadyState = 0 && Variable que indica que la impresora no está lista
	PDFCreator = CREATEOBJECT("PDFCreator.clsPDFCreator")
	PDFReady = CREATEOBJECT("PDFEvent") && Véase la definición de clase por debajo de
	EVENTHANDLER(PDFCreator,PDFReady)
	
	WITH PDFCreator
		*Inicio sin necesidad de iniciar el trabajo:
		.cStart ("/NoProcessingAtStartup")
		* Opciones de copia de seguridad:
		.cOption("UseAutosave") = 1
		.cOption("UseAutosaveDirectory") = 1
		.cOption("AutosaveDirectory") = "&lcUbi"
		.cOption("AutosaveFilename") = lcPdf
		.cOption("AutosaveFormat") = 0 &&0 para PDF
		*Modificación temporal de la impresora por defecto:
		DefaultPrinter = .cDefaultprinter
		.cDefaultprinter = "PDFCreator"
		.cClearcache
	ENDWITH
	
	REPORT FORM &lcRepo TO PRINTER NOCONSOLE
	
	* Lanzamiento de la impresión:
	PDFCreator.cPrinterStop = .F.
	* Espera hasta que la impresora está lista o 10 segundos transcurrido:
	c = 0
	DO WHILE (ReadyState = 0) AND (c < 10)
		c = c + 1
		Sleep (500)
	ENDDO
	PDFCreator.cDefaultprinter = DefaultPrinter
	Sleep (200)
	PDFCreator.cClearcache
	PDFCreator.cClose
	RELEASE PDFCreator
	RELEASE PDFReady
ENDFUNC

PROCEDURE proclase
*--------------------------------------------
* Definición del administrador de eventos:
DEFINE CLASS PDFEvent AS Custom
	IMPLEMENTS __clsPDFCreator IN "PDFCreator.clsPDFCreatorOptions"
	* Evento que indica si la impresora está lista
	PROCEDURE __clsPDFCreator_eReady() AS VOID
		ReadyState = 1
	ENDPROC
	*Getion de Erreros
	PROCEDURE __clsPDFCreator_eError() AS VOID
	ENDPROC
ENDDEFINE
*=imppdf(Mireporte, NombrePDF, Destino)
