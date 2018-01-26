procedure RECIBO
PARAMETERS COMPROBANTE,CODIGO_SOCIO,NOMBRE_SOCIO,CONCEPTO_RECIBO,IMPORTE_R,FECHA_R,ArrayFacturas
*-- Array Facturas: columnas que se corresponden con tabla RECIBOSFACT
*-- La primer columna debe ser toda == 0
*-- Devuelve el número de recibo si todo está OK
*- Entorno de datos
area = select()
NroReciboActual = max_nro(16,1)+1 &&Recibo = 16 en tabla comprobantes, Actividad=1
=incrementa_nro(16,1,NroReciboActual)

if NroReciboActual = 0
	=messagebox("Ha ocurrido un error con la numeración del recibo",16)
	Return -1
Endif

IF USED("RECIBOS")
	SELECT RECIBOS
	RecibosWasOpen = .T.
ELSE
	SELECT 0
	USE RECIBOS
	RecibosWasOpen = .F.	
ENDIF

*-- VALIDAR ALGO????
APPEND BLANK In Recibos
nromax = max_id(91) && 91=IdRecibo en Compactiv.dbf
replace RECIBOS.IdRecibo with nromax
REPLACE RECIBOS.Idcomp WITH COMPROBANTE
REPLACE RECIBOS.COD_SOCIO WITH CODIGO_SOCIO
REPLACE RECIBOS.NOMBRE WITH NOMBRE_SOCIO
REPLACE RECIBOS.CONCEPTO WITH CONCEPTO_RECIBO
REPLACE RECIBOS.IMPORTE WITH IMPORTE_R
REPLACE RECIBOS.FECHA WITH FECHA_R
REPLACE RECIBOS.NroRecibo WITH NroReciboActual
REPLACE RECIBOS.Contabilizado WITH 0
replace recibos.eracobroacuenta WITH "N"
replace recibos.saldo WITH 0

IF USED("RECIBOSFACT")
	SELECT RECIBOSFACT
	RecibosFactWasOpen = .T.
ELSE
	SELECT 0
	USE RECIBOSFACT
	RecibosFactWasOpen = .F.	
ENDIF
*- Asegurarse que la primer columna del array sea 0
For i = 1 to alen(arrayfacturas,1)
	ArrayFacturas(i,1) = 0
endfor
*- Agregar registros relacionados de facturas que se pagan
append from array ArrayFacturas
Replace all Idrecibo with recibos.idrecibo ;
	for recibosfact.idrecibo=0

v_id=recibos.idrecibo
SELECT MAX(idcobro) as maximo FROM cobroservicios INTO CURSOR mm
SELECT mm
GO top
v_idcobro = mm.maximo
USE IN mm
SELECT * from recibosfact WHERE idrecibo=v_id INTO CURSOR pp
SELECT pp
GO top
DO WHILE NOT EOF()
    SELECT facturas
    SET ORDER TO idregistro
    SEEK pp.idregistro
    * calcular idcobro
    v_idcobro = v_idcobro + 1
	INSERT INTO cobroservicios(idcobro,cod_socio,cod_servi,cod_subser,idcomp,actividad,;
	                           numero,idregistro,fech_pago,imp_pago,rec_pago,iva_recp,;
	                           confirmado,idcajaing,nro_asto,idrecibo)	;
	                   values(v_idcobro,facturas.cod_socio,facturas.cod_servi,facturas.cod_subser,;
	                          facturas.idcomp,facturas.actividad,facturas.numero,facturas.idregistro,;
	                          recibos.fecha,(pp.imputado+pp.rec_pago),pp.rec_pago,pp.iva_rec_pa,1,0,recibos.contabilizado,recibos.idrecibo)
	
	SELECT pp
	SKIP 1
ENDDO 
USE IN pp

*- Grabar la forma de Pago
IF USED("DETAPAGOS")
	SELECT DETAPAGOS
ELSE
	SELECT 0
	USE DETAPAGOS
ENDIF
IF USED("TMPDETPA")
	SELECT TMPDETPA
ELSE
	SELECT 0
	USE .\TEMP\TMPDETPA.DBF
ENDIF
* - 
store "" to v_formapago1, v_formapago2, v_formapago3, v_formapago4, v_formapago5, v_formapago6, v_formapago7, v_formapago8, v_firmas1, v_firmas2
*STORE SPACE(140)+"________________________" TO v_firma1
*STORE SPACE(140)+"             P/COSEMAR    " TO v_firma2

i=1
SELECT TMPDETPA
GO TOP
DO WHILE NOT EOF()
	SELECT DETAPAGOS
	append blank
	replace idrecibo         with nromax
	replace tipopago         with TMPDETPA.tipopago
	replace serie            with TMPDETPA.serie
	replace numero           with TMPDETPA.numero
	replace banco            with TMPDETPA.banco
	replace filial           with TMPDETPA.filial
	replace codpostal        with TMPDETPA.codpostal
	replace importe          with TMPDETPA.importe
	replace cod_imputa       with TMPDETPA.cod_imputa
	replace codigo_cta       with TMPDETPA.codigo_cta
	replace nombre           with TMPDETPA.nombre_cta
	replace entregadoa       with ""
	replace fechaentrega     with {}
	replace fechaemision     with TMPDETPA.fechaemisi
	replace fechavencimiento with TMPDETPA.fechavenci
	replace alaordende       with TMPDETPA.alaordende
	replace librador         with TMPDETPA.librador
	replace cuenta           with TMPDETPA.cuenta
	replace loentrega        with TMPDETPA.loentrega
	replace fechadevolucion  with {}
	replace motivodevolucion with ""
	replace motivoentrega    with ""
	v_sentencia=''
	if TMPDETPA.tipopago=1 OR tmpdetpa.tipopago = 3 OR tmpdetpa.tipopago = 6 OR tmpdetpa.tipopago = 5  && Pago en Efectivo o Pago en Lecop
		v_sentencia="v_formapago"+alltrim(str(i))+"=' "+alltrim(str(i))+" - "+alltrim(TMPDETPA.nompago)+" $ "+alltrim(str(tmpdetpa.importe,10,2))+"'"
	else
		v_sentencia="v_formapago"+alltrim(str(i))+"=' "+alltrim(str(i))+" - "+alltrim(TMPDETPA.nompago)+" $ "+alltrim(str(tmpdetpa.importe,10,2))+;
				"  "+tmpdetpa.serie+" "+alltrim(str(tmpdetpa.numero))+" "+alltrim(tmpdetpa.nombanco)+" Cuenta="+alltrim(tmpdetpa.cuenta)+;
				"  A la Orden de: "+alltrim(tmpdetpa.alaordende)+"  Librador: "+alltrim(tmpdetpa.librador)+"'"
	endif
	&v_sentencia
	i=i+1
	SELECT TMPDETPA
	SKIP 1
ENDDO

SUM importe TO var_importe

*- Preparar datos e imprimir recibo
select 1 as original, Recibos.*, RecibosFact.IdRegistro, RecibosFact.Imputado, ;
	Servicios.nom_servi, Comprobantes.comprobante as comproba, ;
	Facturas.Cod_Servi, Facturas.Imp_total, ;
	Facturas.saldo as saldof, Facturas.actividad, Facturas.Numero, Facturas.fecha as fechafac, Recibosfact.rec_pago as recargo ;
	from Recibos, RecibosFact, Facturas, Servicios, Comprobantes ;
	where Recibos.IdRecibo = RecibosFact.IdRecibo ;
		and Recibos.IdRecibo = nromax ;
		AND Facturas.IdRegistro = RecibosFact.IdRegistro ;
		AND Servicios.Cod_servi = Facturas.Cod_servi ;
		AND Comprobantes.Idcomp = Facturas.Idcomp ;
	Into cursor RecibosTmp READWRITE 
	

SELECT recibostmp 
DO WHILE RECCOUNT() < 11 
	APPEND BLANK 
	replace original WITH 1
ENDDO

select * from RecibosTmp Into TABLE .\temp\ReciTmp2
SELECT ReciTmp2
replace ALL original WITH 2  

SELECT RecibosTmp
APPEND FROM .\temp\ReciTmp2
GO TOP 
ercac = recibostmp.eracobroacuenta
replace ALL eracobroacuenta WITH ercac 
GO TOP 

MESSAGEBOX("Verifique que la Impresora esté lista y con papel en blanco",0+64+0,"Aviso del Sistema")
REPORT FORM RECIBO TO PRINTER NOCONSOLE 

* Actualizar la Contablidad
SELECT RECIBOS
SET ORDER TO NRORECIBO
IF SEEK(NroReciboActual)=.F.
	MESSAGEBOX("Hubo un Error en la búsqueda del recibo a contabilizar: "+alltrim(str(NroReciboActual)),0+48+0,"Comprobante no Existente")
	RETURN
ELSE
	pasoimporte = recibos.importe
	=GENASIENTOR(recibos.idcomp,0,recibos.nrorecibo)
	do form cargaasto1 with "RECIBO", pasoimporte
endif

*- Restaurar el entorno
Use in RecibosTmp
If !RecibosWasOpen Then
	use in Recibos
Endif
If !RecibosFactWasOpen Then
	use in RecibosFact
ENDIF


If alias(area)>' '
	select int(area)
Endif

RETURN

***********************************************************************************************
procedure RECIBOPROV
PARAMETERS COMPROBANTE,CODIGO_SOCIO,NOMBRE_SOCIO,CONCEPTO_RECIBO,IMPORTE_R,FECHA_R,ArrayFacturas
*-- Array Facturas: columnas que se corresponden con tabla RECIBOSFACTPROV
*-- La primer columna debe ser toda == 0
*-- Devuelve el número de recibo si todo está OK
*- Entorno de datos
area = select()
NroReciboActual = max_nro(14,1)+1  &&Recibo = 14 en tabla comprobantes, Actividad=0
=incrementa_nro(14,1,NroReciboActual)
if NroReciboActual = 0
	=messagebox("Ha ocurrido un error con la numeración del recibo",16)
	Return -1
ELSE
	=Confirmar_Nro(14,1)
Endif


IF USED("RECIBOSPROV")
	SELECT RECIBOSPROV
	RecibosWasOpen = .T.
ELSE
	SELECT 0
	USE RECIBOSPROV
	RecibosWasOpen = .F.	
ENDIF
nromax = 0
nromax = max_id(91) && 91=Id en Compactiv.dbf para Recibos y O.Pago

*-- VALIDAR ALGO????
APPEND BLANK In Recibosprov
replace RECIBOSPROV.IdRecibo with nromax
REPLACE RECIBOSPROV.Idcomp WITH COMPROBANTE
REPLACE RECIBOSPROV.COD_SOCIO WITH CODIGO_SOCIO
REPLACE RECIBOSPROV.NOMBRE WITH NOMBRE_SOCIO
REPLACE RECIBOSPROV.CONCEPTO WITH CONCEPTO_RECIBO
REPLACE RECIBOSPROV.IMPORTE WITH IMPORTE_R
REPLACE RECIBOSPROV.FECHA WITH FECHA_R
REPLACE RECIBOSPROV.NroRecibo WITH NroReciboActual
REPLACE RECIBOSPROV.Contabilizado WITH 0
REPLACE RECIBOSPROV.Saldo WITH 0
replace RECIBOSPROV.Erapagoacuenta WITH "N"
AUDITORIA("0003","RECIBOSPROV")

IF USED("RECIBOSFACTPROV")
	SELECT RECIBOSFACTPROV
	RecibosFactWasOpen = .T.
ELSE
	SELECT 0
	USE RECIBOSFACTPROV
	RecibosFactWasOpen = .F.	
ENDIF
*- Asegurarse que la primer columna del array sea 0
For i = 1 to alen(arrayfacturas,1)
	ArrayFacturas(i,1) = 0
ENDFOR

*- Agregar registros relacionados de facturas de proveedor que se pagan
SELECT RECIBOSFACTPROV
append from array ArrayFacturas
Replace all Idrecibo with recibosprov.idrecibo ;
	for recibosfactprov.idrecibo=0
	
*- Grabar la forma de Pago
IF USED("DETPAGOSPROV")
	SELECT DETPAGOSPROV
ELSE
	SELECT 0
	USE DETPAGOSPROV
ENDIF
IF USED("TMPDETPA")
	SELECT TMPDETPA
ELSE
	SELECT 0
	USE .\TEMP\TMPDETPA.DBF
ENDIF
* - 
store "" to v_formapago1, v_formapago2, v_formapago3, v_formapago4, v_formapago5, v_formapago6, v_formapago7, v_formapago8
i=1
SELECT TMPDETPA
GO TOP
DO WHILE NOT EOF()
	SELECT DETPAGOSPROV
	append blank
	replace idrecibo         with nromax
	replace tipopago         with TMPDETPA.tipopago
	replace serie            with TMPDETPA.serie
	replace numero           with TMPDETPA.numero
	replace banco            with TMPDETPA.banco
	replace filial           with TMPDETPA.filial
	replace codpostal        with TMPDETPA.codpostal
	replace importe          with TMPDETPA.importe
	replace cod_imputa       with TMPDETPA.cod_imputa
	replace codigo_cta       with TMPDETPA.codigo_cta
	replace nombre           with TMPDETPA.nombre_cta
	*replace entregadoa       with 0
	replace fechaentrega     with {//}
	replace fechaemision     with TMPDETPA.fechaemisi
	replace fechavencimiento with TMPDETPA.fechavenci
	replace alaordende       with TMPDETPA.alaordende
	replace librador         with TMPDETPA.librador
	replace cuenta           with TMPDETPA.cuenta
	replace loentrega        with TMPDETPA.loentrega
	*replace fechadevolucion  with {//}
	replace motivodevolucion with ""
	replace motivoentrega    with ""

	* Actualizar detapago
	select detapagos
	set order to detapago
	if TMPDETPA.tipopago = 2 AND TMPDETPA.idrecibo > 0
		if seek(str(TMPDETPA.idrecibo)+TMPDETPA.serie+str(TMPDETPA.numero)+str(TMPDETPA.banco)+str(TMPDETPA.filial) )
			replace fechaentrega  with FECHA_R
			replace entregadoa    with NOMBRE_SOCIO
			replace motivoentrega with "Pago a Proveedores"
		else
			messagebox("El Cheque "+TMPDETPA.serie+" "+alltrim(str(TMPDETPA.filial))+" - "+alltrim(str(TMPDETPA.numero))+" Del "+alltrim(str(TMPDETPA.banco))+chr(13)+;
			" No se Encontró en el Sistema (Detalle de Pagos)",;
			0+48+0,"Cheque NO Encontrado")
		endif
	endif	
	* Actualizo Caja ingreso
	select cajaingresoh
	set order to cheque
	if TMPDETPA.tipopago = 2 AND TMPDETPA.idcajaing > 0
		if seek(str(TMPDETPA.idcajaing)+str(TMPDETPA.banco)+str(TMPDETPA.filial)+TMPDETPA.serie+str(TMPDETPA.numero) )
			replace fechaentrega  with FECHA_R
			replace entregadoa    with NOMBRE_SOCIO
			replace motivoentrega with "Pago a Proveedores"
		else
			messagebox("El Cheque "+TMPDETPA.serie+" "+alltrim(str(TMPDETPA.filial))+" - "+alltrim(str(TMPDETPA.numero))+" Del "+alltrim(str(TMPDETPA.banco))+chr(13)+;
			" No se Encontró en el Sistema (Caja Ingreso)",;
			0+48+0,"Cheque NO Encontrado")
		endif
	endif	
	* Actualizar detapagosfc
	select detapagosfc
	set order to detapagosf
	if TMPDETPA.tipopago = 2 AND TMPDETPA.idregistro > 0
		if seek(str(TMPDETPA.idregistro)+TMPDETPA.serie+str(TMPDETPA.numero)+str(TMPDETPA.banco)+str(TMPDETPA.filial) )
			replace fechaentrega  with FECHA_R
			replace entregadoa    with NOMBRE_SOCIO
			replace motivoentrega with "Pago a Proveedores"
		else
			messagebox("El Cheque "+TMPDETPA.serie+" "+alltrim(str(TMPDETPA.filial))+" - "+alltrim(str(TMPDETPA.numero))+" Del "+alltrim(str(TMPDETPA.banco))+chr(13)+;
			" No se Encontró en el Sistema (Detalle de Pagos)",;
			0+48+0,"Cheque NO Encontrado")
		endif
	endif	

	
	v_sentencia=''
	if TMPDETPA.tipopago=1 OR TMPDETPA.tipopago=3 && Pago en Efectivo O Lecop
		v_sentencia="v_formapago"+alltrim(str(i))+"=' "+alltrim(str(i))+" - "+alltrim(TMPDETPA.nompago)+" $ "+alltrim(str(tmpdetpa.importe,10,2))+"'"
	else
		v_sentencia="v_formapago"+alltrim(str(i))+"=' "+alltrim(str(i))+" - "+alltrim(TMPDETPA.nompago)+" $ "+alltrim(str(tmpdetpa.importe,10,2))+;
				"  "+tmpdetpa.serie+" "+alltrim(str(tmpdetpa.numero))+" "+alltrim(tmpdetpa.nombanco)+" Cuenta="+alltrim(tmpdetpa.cuenta)+;
				"  A la Orden de: "+alltrim(tmpdetpa.alaordende)+"  Librador: "+alltrim(tmpdetpa.librador)+"'"
	endif
	&v_sentencia
	i=i+1
	SELECT TMPDETPA
	SKIP 1
ENDDO

SUM importe TO var_importe

*- Preparar datos e imprimir recibo de Proveedores
SELECT 1 as original, RecibosProv.*, RecibosFactProv.IdRegistro, RecibosFactProv.Imputado, ;
	compprov.nombre as nombrecom, FactProv.total, FactProv.saldo as saldofac, FactProv.tipo, Factprov.serie, ;
	FactProv.Numero, FactProv.fecha as fechafac ;
	from RecibosProv, RecibosFactProv, FactProv, compprov ;
	where RecibosProv.IdRecibo = RecibosFactProv.IdRecibo ;
		and RecibosProv.IdRecibo = nromax ;
		AND FactProv.IdRegistro = RecibosFactProv.IdRegistro ;
		AND ALLTRIM(compprov.codigo) == ALLTRIM(FactProv.comprobante) ;
	Into TABLE .\temp\RecibosTmp


SELECT recibostmp 
v_nom = recibostmp.nombre
v_cod = recibostmp.cod_socio
DO WHILE RECCOUNT() < 11 
	APPEND BLANK 
	replace original WITH 1
	replace nombre WITH v_nom
	replace cod_socio WITH v_cod
ENDDO


select * from RecibosTmp Into TABLE .\temp\ReciTmp2
SELECT ReciTmp2
replace ALL original WITH 2  

SELECT RecibosTmp
APPEND FROM .\temp\ReciTmp2

MESSAGEBOX("Verifique que la Impresora esté lista y con papel en blanco",0+64+0,"Aviso del Sistema")
REPO FORM RECIBOPROV TO PRINTER NOCONSOLE 

*******************************************
*******************************************
* Actualizar la Contablidad
SELECT RECIBOSPROV
SET ORDER TO NRORECIBO
IF SEEK(NroReciboActual)=.F.
	MESSAGEBOX("Hubo un Error en la búsqueda del recibo a contabilizar: "+alltrim(str(NroReciboActual)),0+48+0,"Comprobante no Existente")
	RETURN
ELSE
	pasoimporte = recibosprov.importe
	=GENASIENTORPROV(recibosprov.idcomp,0,recibosprov.nrorecibo)
	do form cargaasto1 with "RECIBOPROV", pasoimporte
endif

*- Restaurar el entorno
If !RecibosWasOpen Then
	use in RecibosProv
Endif
If !RecibosFactWasOpen Then
	use in RecibosFactProv
Endif
If alias(area)>' '
	select int(area)
Endif

RETURN

***********************************************************************************************
*- Esta funcion genera el siguiente valor autonumerico 
*- del campo Campo en la tabla Tabla
FUNCTION Insertar
PARAMETERS Campo, Tabla
Dimension nromax(1)
nromax = 0
ejec1 = "select max("+Campo+") from "+tabla+" into array nromax"
&ejec1
ejec2= "replace "+Campo+" with nromax +1"
&ejec2
return .t.
	
	
	
******************************************************
*- Esta funcion devuelve el pcio unitario del stock
FUNCTION pcio
PARAMETERS P_RUBRO, P_CODIGO
BASE = SELECT()

IF USED("STOCK")
	SELECT STOCK
	STOCKWasOpen = .T.
ELSE
	SELECT 0
	USE STOCK
	STOCKWasOpen = .F.	
ENDIF

SET ORDER TO RUB_COD
SEEK P_RUBRO + P_CODIGO
V_RETOR = STOCK.PCIOVTA

*- Restaurar el entorno
If !STOCKWasOpen Then
	use in STOCK
Endif
If alias(BASE)>' '
	select int(BASE)
Endif

RETURN V_RETOR



*///////////////////////////////////////////////*
*///////////////////////////////////////////////*
FUNCTION CONTAEMISION
PARAMETERS SERVICIO,CUALMES,CUALANIO, SERSOCIOS, FECHAASIE
IF USED("TMPASIENTO")
	SELECT TMPASIENTO
	USE
ENDIF
DELETE FILE .\TEMP\TMPASIENTO.dbf
DELETE FILE .\TEMP\TMPASIENTO.cdx
CREATE TABLE .\TEMP\TMPASIENTO FREE (SUBDIARIO C(2), NOMBRE_CTA C(80), CODIGO_CTA C(18), MONTO_DEBE N(10,2),MONTO_HABE N(10,2), FECHA D, ;
                                   DETALLE C(50),NRO_ASTO N(6), CODIGO_ACU C(18), MODELO N(4))
INDEX ON codigo_cta TAG codigo_cta

IF !USED("codigoimputar") then
	eje= "USE "+mmiservidor+"\datos\codigoimputar in 0"
	&eje
ENDIF

IF !USED("planctas") then
	eje= "USE "+mmiservidor+"\datos\planctas in 0"
	&eje
ENDIF

IF !USED("facturas") then
	eje= "USE "+mmiservidor+"\datos\facturas in 0"
	&eje
ENDIF

IF !USED("detfactu") then
	eje= "USE "+mmiservidor+"\datos\detfactu in 0"
	&eje
ENDIF
IF !USED("subdiarios") then
	eje= "USE "+mmiservidor+"\datos\subdiarios in 0"
	&eje
ENDIF

IF !USED("subdiarios") then
	eje= "USE "+mmiservidor+"\datos\asientos in 0"
	&eje
ENDIF

SET TALK OFF  
SET SAFETY OFF 

SELECT codigoimputar
SET ORDER TO indice  
SELECT planctas
SET ORDER TO CODIGO_CTA  

nombservi = ""
vseek_1 = 0
vseek_2 = 0
vseek_3 = 0
vseek_4 = 0
vseek_5 = 0
vvarios = 0
v_tivacpp  = 0.00
v_stivacpp = 0.00
DO CASE 
	CASE servicio = 1
		nomservi = "TELEFONIA"
		vseek_1 = 1101
		vseek_2 = 101
		vseek_3 = 102
		vseek_4 = 1125
		vseek_5 = 1102
		vvarios = 1126
		
	CASE servicio = 2
		nomservi = "AGUA"
		vseek_1 = 2101
		vseek_2 = 101
		vseek_3 = 102
		vseek_4 = 2112
		vseek_5 = 2102
		vvarios = 2000
		
	CASE servicio = 3
		nomservi = "CABLEVIDEO"
		vseek_1 = 3101
		vseek_2 = 101
		vseek_3 = 102
		vseek_4 = 0
		vseek_5 = 0
		vvarios = 4418
	CASE servicio = 4
		nomservi = "SEPELIO"
		vseek_1 = 4101
		vseek_2 = 0
		vseek_3 = 0
		vseek_4 = 4104
		vseek_5 = 4102
		vvarios = 4105

	CASE servicio = 5
		nomservi = "INTERNET"
		IF SERSOCIOS THEN 
			vseek_1 = 5101
			vseek_2 = 101
			vseek_3 = 102
			vseek_4 = 0
			vseek_5 = 0	
			vvarios = 5106
		ELSE
			vseek_1 = 5201
			vseek_2 = 101
			vseek_3 = 102
			vseek_4 = 0
			vseek_5 = 0
			vvarios = 5206	
		ENDIF

	CASE servicio = 9
		nomservi = "CLOACAS"
		vseek_1 = 9419
		vseek_2 = 0
		vseek_3 = 0
		vseek_4 = 4104
		vseek_5 = 4102
		vvarios = 4105

	CASE servicio = 7
		nomservi = "FM X "
		vseek_1 = 7401
		vseek_2 = 101
		vseek_3 = 0
		vseek_4 = 0
		vseek_5 = 0
		vvarios = 7402
		
ENDCASE


	SELECT idregistro FROM facturas INTO TABLE .\temp\tmpfacturas ;
	WHERE  cod_servi = servicio AND mes_fact = cualmes AND anio_fact = cualanio AND socio = SERSOCIOS
	

	SELECT Sum(imp_total) as imp_total, sum(i_iva_g) as i_iva_g, sum(ist_iva_g) as ist_iva_g, ;
	sum(i_iva_s) as i_iva_s, sum(ist_iva_s) as ist_iva_s FROM facturas INTO TABLE .\temp\tmptotfac ;
	WHERE cod_servi = servicio AND mes_fact = cualmes AND anio_fact = cualanio AND socio = SERSOCIOS
 
 	SELECT codigoimputar
	SEEK(vseek_1)
	SELECT planctas
	SEEK(codigoimputar.codigo_cta)
	SELECT tmpasiento
	APPEND BLANK 
	replace subdiario WITH " 1"
	replace nombre_cta WITH planctas.nombre
	replace codigo_cta WITH planctas.codigo_cta
	replace monto_debe WITH tmptotfac.imp_total
	replace fecha WITH FECHAASIE
	replace detalle WITH "Total Facturado Servicio de "+nombservi+" Periodo:"+nombremes(cualmes)+"/"+ALLTRIM(STR(cualanio))
	replace codigo_acu WITH planctas.sumarizaen


	SELECT codigoimputar
	IF SEEK(vseek_2) THEN 
		SELECT planctas
		SEEK(codigoimputar.codigo_cta)
		SELECT tmpasiento
		APPEND BLANK 
		replace subdiario WITH " 1"
		replace nombre_cta WITH planctas.nombre
		replace codigo_cta WITH planctas.codigo_cta
		replace monto_habe WITH tmptotfac.i_iva_g + tmptotfac.i_iva_s
		replace fecha WITH FECHAASIE
		replace detalle WITH "I.V.A. Tasa General Facturado Servicio "+nomservi+", Periodo:"+nombremes(cualmes)+"/"+ALLTRIM(STR(cualanio))
		replace codigo_acu WITH planctas.sumarizaen
	endif


	SELECT codigoimputar
	IF SEEK(vseek_3) THEN 
		SELECT planctas
		SEEK(codigoimputar.codigo_cta)
		SELECT tmpasiento
		APPEND BLANK 
		replace subdiario WITH " 1"
		replace nombre_cta WITH planctas.nombre
		replace codigo_cta WITH planctas.codigo_cta
		replace monto_habe WITH tmptotfac.ist_iva_g + tmptotfac.ist_iva_s
		replace fecha WITH FECHAASIE
		replace detalle WITH "I.V.A. Sobretasa Facturada Servicio "+nomservi+", Periodo:"+nombremes(cualmes)+"/"+ALLTRIM(STR(cualanio))
		replace codigo_acu WITH planctas.sumarizaen
	ENDIF
	

	SELECT cod_imputa, codigo_cta, nombre, sum(imp_total) as total, sum(it_iva_g) as totivag, ;
	       sum(ist_iva_g) as totsivag from detfactu INTO TABLE .\temp\tmptotdeta ;
	WHERE idregistro in (select idregistro FROM .\temp\tmpfacturas) ;
	ORDER BY codigo_cta GROUP BY codigo_cta  
	INDEX ON codigo_cta TAG codigo_cta

	SELECT codigoimputar
	IF SEEK(vseek_4) THEN 
		SELECT tmptotdeta
		IF SEEK(codigoimputar.codigo_cta) THEN 
			SELECT codigoimputar
			SEEK(vseek_5)
			SELECT planctas
			SEEK(codigoimputar.codigo_cta)
			SELECT tmpasiento
			APPEND BLANK 
			replace subdiario WITH " 1"
			replace nombre_cta WITH planctas.nombre
			replace codigo_cta WITH planctas.codigo_cta
			replace monto_debe WITH tmptotdeta.total
			replace fecha WITH FECHAASIE
			replace detalle WITH "Por cuotas sociales suscriptas en el Periodo:"+nombremes(cualmes)+"/"+ALLTRIM(STR(cualanio))
			replace codigo_acu WITH planctas.sumarizaen
			SELECT codigoimputar
			SEEK(vseek_1)
			SELECT tmpasiento
			SEEK(codigoimputar.codigo_cta)
			replace monto_debe WITH monto_debe - tmptotdeta.total
		
		ENDIF
	ENDIF
	
	
	SELECT tmptotdeta
	GO top
	DO WHILE !EOF()

*********************************************
*********************************************
		SELECT tmpasiento
		APPEND BLANK
		replace subdiario WITH " 1"
		IF !EMPTY(tmptotdeta.codigo_cta) THEN 
			replace codigo_cta WITH tmptotdeta.codigo_cta
			replace nombre_cta WITH tmptotdeta.nombre
			
			IF !(ALLTRIM(tmptotdeta.cod_imputa) == "1118") THEN 
				IF tmptotdeta.total >= 0 then
					replace monto_habe WITH tmptotdeta.total
				ELSE
					replace monto_debe WITH -(tmptotdeta.total)
				ENDIF
			ELSE
				IF tmptotdeta.total >= 0 then
					replace monto_habe WITH tmptotdeta.total+tmptotdeta.totivag+tmptotdeta.totsivag
					v_tivacpp  = tmptotdeta.totivag
					v_stivacpp = tmptotdeta.totsivag
				ELSE
					replace monto_debe WITH -(tmptotdeta.total+tmptotdeta.totivag+tmptotdeta.totsivag)
					v_tivacpp  = tmptotdeta.totivag
					v_stivacpp = tmptotdeta.totsivag
				ENDIF			
			ENDIF 
			replace fecha WITH FECHAASIE
			replace detalle WITH "Por Facturacion mensual Servicio "+nomservi+" Periodo:"+nombremes(cualmes)+"/"+ALLTRIM(STR(cualanio))
		
		ELSE
			SELECT codigoimputar
			IF SEEK(vvarios) THEN 
				SELECT planctas
				SEEK(codigoimputar.codigo_cta)
				SELECT tmpasiento
				replace nombre_cta WITH planctas.nombre
				replace codigo_cta WITH planctas.codigo_cta
				IF tmptotdeta.total >= 0 then
					replace monto_habe WITH tmptotdeta.total
				ELSE
					replace monto_debe WITH -(tmptotdeta.total)
				ENDIF
				replace fecha WITH FECHAASIE
				replace detalle WITH "Por Facturacion mensual Servicio "+nomservi+", Periodo:"+nombremes(cualmes)+"/"+ALLTRIM(STR(cualanio))
			ENDIF 
		ENDIF


		SELECT planctas
		SEEK(tmptotdeta.codigo_cta)
		SELECT tmpasiento 
		replace codigo_acu WITH planctas.sumarizaen
		SELECT tmptotdeta
		skip
*********************************************
*********************************************
	ENDDO

********* para descontar del iva cargado lo que corresponde a 
********* cpp si el servicio es telefonico
		IF v_tivacpp+v_stivacpp <> 0 THEN 
			SELECT codigoimputar
			SEEK(vseek_2)
			SELECT tmpasiento
			SEEK(codigoimputar.codigo_cta)
			replace monto_habe WITH monto_habe - v_tivacpp
			
			SELECT codigoimputar
			SEEK(vseek_3)
			SELECT tmpasiento
			SEEK(codigoimputar.codigo_cta)
			replace monto_habe WITH monto_habe - v_stivacpp
		ENDIF 
********* fin de descuento de iva para cpp ************************


	
	SELECT planctas
	GO TOP 

	*** CALCULO LOS NUMEROS DE ASIENTOS A UTILIZAR ***
	NUMEROASIENTO 	= INCRENROASTO()
	v_Asiento 		= DIVIDEASTO(NUMEROASIENTO,1)
	v_AsientoConta 	= DIVIDEASTO(NUMEROASIENTO,2)
	
	SELECT subdiarios
	maxasiento  = v_Asiento 
	maxasiconta = v_AsientoConta

*	CALCULATE MAX(nro_asto) 	  TO maxasiento
*	CALCULATE MAX(nro_asto_conta) TO maxasiconta FOR ejnumero = planctas.ejnumero
	APPEND BLANK
	replace subdiario WITH " 1"
	replace nro_asto 		WITH maxasiento 
	replace nro_asto_conta 	WITH maxasiconta 
	replace comp_tipo WITH 31
	replace anio WITH planctas.anio
	replace ejnumero WITH planctas.ejnumero
	replace fecha WITH FECHAASIE
	replace detalle WITH "Por Facturacion Mensual del Servicio "+nomservi+" Periodo:"+nombremes(cualmes)+"/"+ALLTRIM(STR(cualanio))
	SELECT tmpasiento
	GO top
	DO WHILE !EOF()
		SELECT asientos
		APPEND BLANK
		replace subdiario 		WITH " 1"
		replace codigo_cta  	WITH tmpasiento.codigo_cta
		replace nombre_cta  	WITH tmpasiento.nombre_cta
		replace monto_debe  	WITH tmpasiento.monto_debe
		replace monto_habe  	WITH tmpasiento.monto_habe
		replace fecha 			WITH tmpasiento.fecha
		replace detalle 		WITH tmpasiento.detalle
		replace nro_asto 		WITH subdiarios.nro_asto
		replace nro_asto_conta 	WITH subdiarios.nro_asto_conta
		replace ejnumero 		WITH subdiarios.ejnumero
		replace anio 			WITH subdiarios.anio
		replace codigo_acu  	WITH tmpasiento.codigo_acu
		
		SELECT tmpasiento
		skip
	ENDDO

	UPDATE facturas set contabilizado = subdiarios.nro_asto WHERE idregistro in (select idregistro from tmpfacturas)

	** GRABACIÓN DEL ASIENTO EN EL LIBRO DIARIO **
	
	select nro_asto ,fecha,detalle ;
	from Subdiarios ;
	where nro_asto=(maxasiento) ;
	order by nro_asto GROUP BY nro_asto ;
	into TABLE .\temp\asiediario

	IF !(aldiario2("asiediario",aldiario1("asiediario"),asiediario.fecha,asiediario.detalle) = 1) THEN
		=MESSAGEBOX("Se Registraron problemas al Grabar el Asiento en el Libro Diario",0+64,"Paso al Diario")
	ENDIF 	
	** fin de la grabación del asiento en el libro diario ***

	
ENDFUNC

************************************************************************************
************************************************************************************
* FUNCION PARA IMPRESION DE FACTURAS DE ACUERDO AL TIPO DE FACTURA Y AL SERVICIO
* PRIMERO SELECCIONA LA FACTURA DE ACUERDO AP P_IDREGI QUE ES EL IDREGISTRO PASADO
* ANALIZA QUE FACTURA ES E IMPRIME EN CONSECUENCIA

FUNCTION IMPRIFACTURAS
PARAMETERS p_idregi, P_FORMULARIO
	SELECT facturas
	SELECT * FROM FACTURAS INTO TABLE .\TEMP\FACTU1 WHERE idregistro = p_idregi
	SELECT * FROM detfactu INTO TABLE .\TEMP\FACTU2 WHERE idregistro = p_idregi
	
	SELECT factu2
	EJE = "report form "+P_FORMULARIO+" NOCONSOLE TO PRINTER"
	&EJE
	SELECT factu2
	EJE = "report form "+P_FORMULARIO+" NOCONSOLE TO PRINTER"
	&EJE
ENDFUNC



**///// SELECCION DE ASIENTOS DOS, DEBIERA FUNCIONAR MAS RAPIDO QUE LA FUNCION SELEASIENTOS ******
** recibe tambien como parametro despues de la F_DES Y F_HAS, un parametro , que si esta en blanco no afecta.
** pero si tiene valor es de tipo caracter e indica el nombre de una tabla que contiene las cuentas que deben
** ser seleccionadas para elegir los asientos.

FUNCTION SELASIENTOSQL
PARAMETERS F_DES, F_HAS, C_CUENTAS, N_DES, N_HAS, N_ANIO
WAIT windows "Aguarde un Momento... Ejecutando Consultas..." NOWAIT 
IF !USED("SUBDIARIOS") THEN 
	eje= "USE "+mmiservidor+"\datos\subdiarios in 0"
	&eje
ENDIF  
IF !USED("ASIENTOS") THEN 
	eje= "USE "+mmiservidor+"\datos\asientos in 0"
	&eje
ENDIF  
IF !USED("FACTURAS") THEN 
	eje= "USE "+mmiservidor+"\datos\facturas in 0"
	&eje
ENDIF  
IF !USED("RECIBOS") THEN 
	eje= "USE "+mmiservidor+"\datos\recibos in 0"
	&eje
ENDIF  
IF !USED("RECIBOSPROV") THEN 
	eje= "USE "+mmiservidor+"\datos\recibosprov in 0"
	&eje
ENDIF  
IF !USED("FACTPROV") THEN 
	eje= "USE "+mmiservidor+"\datos\factprov in 0"
	&eje
ENDIF  
IF !USED("DEPOBANCAP") THEN 
	eje= "USE "+mmiservidor+"\datos\depobancap in 0"
	&eje
ENDIF  
IF !USED("CAJAINGRESO") THEN 
	eje= "USE "+mmiservidor+"\datos\cajaingreso in 0"
	&eje
ENDIF  
IF !USED("CAJAEGRESO") then
	eje= "USE "+mmiservidor+"\datos\cajaegreso in 0"
	&eje
ENDIF
IF !USED("APLICAPAGOP") then
	eje= "USE "+mmiservidor+"\datos\aplicapagop in 0"
	&eje
ENDIF
IF !USED("TRANINTERCTA") then
	eje= "USE "+mmiservidor+"\datos\tranintercta in 0"
	&eje
ENDIF
IF !USED("COBROSPORVENTANILLA") then
	eje= "USE "+mmiservidor+"\datos\cobrosporventanilla in 0"
	&eje
ENDIF
IF !USED("EXTRACBANCARIAS") then
	eje= "USE "+mmiservidor+"\datos\extracbancarias in 0"
	&eje
ENDIF
IF !USED("APLICACOBROP") then
	eje= "USE "+mmiservidor+"\datos\aplicacobrop in 0"
	&eje
ENDIF
IF !USED("APLICAPAGOP") then
	eje= "USE "+mmiservidor+"\datos\aplicapagop in 0"
	&eje
ENDIF
IF !USED("COMPROBANTES") then
	eje= "USE "+mmiservidor+"\datos\comprobantes in 0"
	&eje
ENDIF
IF !USED("compprov") then
	eje= "USE "+mmiservidor+"\datos\compprov in 0"
	&eje
ENDIF

SET SAFETY OFF 

arch = mmiestacion+"\temp\tmpsqlasientos.dbf"
IF FILE(arch) THEN 
	IF USED("tmpsqlasientos") then
		SELECT tmpsqlasientos
		USE 
	ENDIF 
	DELETE FILE .\temp\tmpsqlasientos.dbf
	DELETE FILE .\temp\tmpsqlasientos.cdx
	DELETE FILE .\temp\tmpsqlasientos.fpt
ENDIF 

SET NULL ON 
CREATE TABLE .\temp\tmpsqlasientos FREE ( ;
						subdiario C(2), nombre_cta C(60),	codigo_cta	C(18), ;
						monto_debe N(12,2), monto_habe	N(12,2),fecha	D,detalle	C(40), ;
						nro_asto N(6), codigo_acu C(18),modelo	N(4),ejnumero	N(4), ;
						anio N(4), nro_asto_c N(6),idcomp N(6),sudetalle	M,sucomp_act N(4), ;
						sucomp_nro N(10),sunroastod N(6),sucomp_pro C(2), sucod_prov n(4), ;
						sutipo_pro c(1),sufecha_pr d,suidreg_pr	n(10),cocomproba c(60), reidrecibo n(6), ;
						renrorecib n(8),refecha	d,reimporte n(12,2), reconcepto	m, recod_soci n(4), ;
						renombre c(60),faactivida n(4),fanumero n(8),facod_soci	n(4),facod_serv	n(3), ;
						facod_subs n(6),faapellido	c(60),fanombre c(60),fafech_emi d,faimp_tota n(12,2), ;
						fafecha	d,facond_vta n(1),faidregist n(8),decod_prov n(4),desucursal n(4),denumero c(20),detipo n(3), ;
						decuenta c(18), decomproba n(10),defecha d, deiddepo n(10),deimportet n(12,2), ;
						fptipo c(1),fpserie n(4),fpnumero n(12),fpfecha	d,fpcod_prov n(4),fpnombre c(60), ;
						fptotal	y,fpidregist n(10),fpfechaing d,rpidrecibo n(6),rpnrorecib n(8),rpfecha	d, ;
						rpimporte n(12,2),rpconcepto m,rpcod_soci n(4),rpnombre	c(30),rperapagoa c(1), ;
						ciidcajain n(10),cifecha d, cicod_soci n(4),ciapellido c(60),cinombre c(60),ciconcepto c(250), ;
						citotaling y,ceidcajaeg n(10),cefecha d,cecod_soci n(4),ceapellido c(60),cenombre c(60), ;
						ceconcepto c(250),cetotaling y,cpcodigo c(2), cpnombre c(80),cpidcomppr	n(6), ;
						cptipo c(1),tridtran i,trfecha d,trimporte y,trnrocomp i,trbancoor n(4),trnbancor c(80), ;
						trsucuori n(4),trnumeroo c(20),trnctaori c(50),trbancode n(4),trnbancod c(80),trsucudes n(4), ;
						trnumerod c(20),trtipodes n(3),trnctades c(80), exidextra i, exfecha d,eximporte y, exnrocomp i, ;
						exbancoor n(4),exnombanc c(80),exsucursa n(4),exnumeroo c(20),extipoori n(3),cvidcobro i, ;
						cvcobropr n(1),cvfecha d,cvnrocomp i,cvimporte y,cvbancoor n(4),cvnbancor c(80),cvsucuori n(4), ;
						cvnumeroo c(20),cvtipoori n(3),cvserie c(2),cvnumero n(15),cvbanco n(4), cvfilial n(4), ;
						cvfechaem d, cvfechave d, cvalaorde	c(40), cvlibrado c(40), cvloentre c(40),cvidrecib n(6), ;
						cvidcajai n(10),apidaplic n(20),apfecha d,apcod_pro n(4),apapellid c(40),apnombre c(40), ;
						aptotapli n(12,2),apfaccanc	n(5),appagosac n(5),acidaplic n(20), acfecha d,accod_cli n(4), ;
						acapellid c(60),acnombre c(60),actotapli n(12,2),acfaccanc n(5), acpagosac n(5))


*MESSAGEBOX("dentro seleasientosql despues de crear las tablas")
**** SELECCION PARA EL MAYOR ***

c_where = ""
IF !EMPTY(c_cuentas) THEN 
	c_where = "asientos.codigo_cta in (select codigo_cta from .\temp\"+ALLTRIM(c_cuentas)+" ) and "
ENDIF 


IF !EMPTY(F_DES) AND !EMPTY(F_HAS) THEN
	SELECT * from asientos INTO TABLE .\TEMP\TASIENTOS WHERE fecha >= F_DES AND fecha <= F_HAS AND &c_where !DELETED() ;
			 ORDER BY nro_asto 
ELSE
	SELECT * from asientos INTO TABLE .\TEMP\TASIENTOS WHERE nro_asto_conta >= N_DES AND nro_asto_conta <= N_HAS AND anio = n_anio AND &c_where !DELETED() ;
			 ORDER BY nro_asto 
ENDIF 




SELECT tmpsqlasientos
APPEND FROM .\temp\tasientos 


*BROWSE 

** AQUI TENGO QUE EMPEZAR A PONER LAS SELECT CON LOS LEFT JOIN PARCIALES Y LUEGO AGREGARLOS AL FINAL A TODOS A LA TABLA
** TMPSQLASIENTOS

*=MESSAGEBOX("aqui empiezan los reemplazos")

** carga todos los datos del subdiario en tmpsqlasientos
*-*SELECT subdiarios 
*-*SET ORDER TO nro_asto
*-*SELECT tmpsqlasientos

*-*SET RELATION TO nro_asto INTO subdiarios
*-*GO top
*-*replace ALL sudetalle 	WITH subdiarios.detalle, ;
*-*			idcomp 		WITH subdiarios.comp_tipo, ;
*-*			sucomp_act	WITH subdiarios.comp_act, ;
*-*			sucomp_nro	WITH subdiarios.comp_nro, ;
*-*			sunroastod	WITH subdiarios.nro_asto_d, ;
*-*			sucomp_pro	WITH subdiarios.comp_prov, ;
*-*			sucod_prov	WITH subdiarios.cod_prov, ;
*-*			sutipo_pro	WITH subdiarios.tipo_prov, ;
*-*			sufecha_pr	WITH subdiarios.fecha_prov, ;
*-*			suidreg_pr	WITH subdiarios.idreg_prov

*-*SET RELATION TO 
** reemplazo lo anterior por una consulta sql con left join
** AQUI JUNTO LOS ASIENTOS ANTERIORES CON SU CABECERA EN UN NUEVO TMPSQLASIENTO

*BROWSE 

SELECT  T.subdiario, ;
		T.nombre_cta, ;
		T.codigo_cta, ;
		T.monto_debe, ;
		T.monto_habe, ;
		T.fecha, ;
		T.detalle, ;
		T.nro_asto, ;
		T.codigo_acu, ;
		T.ejnumero, ;
		T.anio, ;
		T.nro_asto_c, ;
		S.detalle 		as sudetalle, ; 
		S.comp_tipo 	as idcomp, ;
		S.comp_act 		as sucomp_act, ;
		S.comp_nro 		as sucomp_nro, ;
		S.nro_asto_d 	as sunroastod, ;
		S.comp_prov 	as sucomp_pro, ;
		S.cod_prov 		as sucod_prov, ;
		S.tipo_prov 	as sutipo_pro, ;
		S.fecha_prov 	as sufecha_pr, ;
		S.idreg_prov 	as suidreg_pr, ;
		T.cocomproba ;
FROM tmpsqlasientos T ;
LEFT JOIN subdiarios S ON T.nro_asto = S.nro_asto ;
INTO TABLE  .\temp\tmpsql01

*BROWSE 
*RETURN 
*SET RELATION TO 

*** carga el detalle del comprobante, su descripcion
SELECT comprobantes
SET ORDER TO idcomp
*-*SELECT tmpsqlasientos
SELECT tmpsql01
SET RELATION TO idcomp INTO comprobantes
GO top
replace ALL cocomproba 	WITH comprobantes.comprobante
SET RELATION TO 

*********************************************************
*** carga el detalle del recibo


*-*SELECT recibos  && idcomp = 16
*-*SET ORDER TO asiento
*-*SELECT tmpsqlasientos
*-*SET RELATION TO nro_asto INTO recibos
*-*GO top


*-*replace reidrecibo	WITH recibos.idrecibo, ;
*-*		renrorecib	WITH recibos.nrorecibo, ;
*-*		refecha		WITH recibos.fecha, ;
*-*		reimporte	WITH recibos.importe, ;
*-*		reconcepto	WITH recibos.concepto, ;
*-*		recod_soci	WITH recibos.cod_socio, ;
*-*		renombre	WITH recibos.nombre ;
*-*				FOR idcomp = 16 

*-*SET RELATION TO 

*********************************************************
*********************************************************
** ASIENTOS DE MINUTAS CONTABLES

SELECT  * FROM tmpsql01 INTO TABLE  .\temp\tmpsql00 WHERE (tmpsql01.idcomp = 15 OR tmpsql01.idcomp = 31)
*BROWSE 

*********************************************************
*********************************************************

*** CARGO DETLLE DE RECIBO CON SQL

SELECT  T.subdiario, ;
		T.nombre_cta, ;
		T.codigo_cta, ;
		T.monto_debe, ;
		T.monto_habe, ;
		T.fecha, ;
		T.detalle, ;
		T.nro_asto, ;
		T.codigo_acu, ;
		T.ejnumero, ;
		T.anio, ;
		T.nro_asto_c, ;
		T.sudetalle, ; 
		T.idcomp, ;
		T.sucomp_act, ;
		T.sucomp_nro, ;
		T.sunroastod, ;
		T.sucomp_pro, ;
		T.sucod_prov, ;
		T.sutipo_pro, ;
		T.sufecha_pr, ;
		T.suidreg_pr, ;
		T.cocomproba, ;
		R.idrecibo 	as reidrecibo, ;
		R.nrorecibo as renrorecib, ;
		R.fecha 	as refecha, ;
		R.importe 	as reimporte, ;
		R.concepto 	as reconcepto, ;
		R.cod_socio as recod_soci, ;
		R.nombre 	as renombre;
FROM tmpsql01 T ;
LEFT JOIN recibos R ON T.nro_asto = R.contabilizado;
INTO TABLE  .\temp\tmpsql02 WHERE T.idcomp = 16


*BROWSE 

*********************************************************
*** carga el detalle de la factura 


*-*SELECT facturas 
*-*SET ORDER TO asiento
*-*SELECT tmpsqlasientos
*-*SET RELATION TO nro_asto INTO facturas
*-*GO TOP 


*-*replace faactivida	WITH facturas.actividad, ;
*-*		fanumero	WITH facturas.numero, ;
*-*		facod_soci	WITH facturas.cod_socio, ;
*-*		facod_serv	WITH facturas.cod_servi, ;
*-*		facod_subs	WITH facturas.cod_subser, ;
*-*		faapellido 	WITH facturas.apellido, ;
*-*		fanombre	WITH facturas.nombre, ;
*-*		fafech_emi	WITH facturas.fech_emit, ;
*-*		facond_vta	WITH facturas.cond_vta, ;
*-*		faimp_tota  WITH facturas.imp_total, ;
*-*		fafecha		WITH facturas.fecha, ;
*-*		faidregist	WITH facturas.idregistro ;
*-*		FOR idcomp = 1 OR idcomp = 2 OR idcomp = 5 OR idcomp = 6 OR idcomp = 7 OR ;
*-*		idcomp = 8 OR idcomp = 3 OR idcomp = 9 OR idcomp = 10 OR idcomp = 11 OR ;
*-*		idcomp = 12 OR idcomp = 4 OR idcomp = 17 OR idcomp = 18 OR idcomp = 19 OR ;
*-*		idcomp = 20 OR idcomp = 21 OR idcomp = 22

*-*SET RELATION TO 

* CARGA DETALLE DE FACTURA CON SQL

SELECT  T.subdiario, ;
		T.nombre_cta, ;
		T.codigo_cta, ;
		T.monto_debe, ;
		T.monto_habe, ;
		T.fecha, ;
		T.detalle, ;
		T.nro_asto, ;
		T.codigo_acu, ;
		T.ejnumero, ;
		T.anio, ;
		T.nro_asto_c, ;
		T.sudetalle, ; 
		T.idcomp, ;
		T.sucomp_act, ;
		T.sucomp_nro, ;
		T.sunroastod, ;
		T.sucomp_pro, ;
		T.sucod_prov, ;
		T.sutipo_pro, ;
		T.sufecha_pr, ;
		T.suidreg_pr, ;
		T.cocomproba, ;
		F.actividad		as faactivida, ;
		F.numero		as fanumero, ;
		F.cod_socio		as facod_soci, ;
		F.cod_servi		as facod_serv, ;
		F.cod_subser	as facod_subs, ;
		F.apellido		as faapellido, ;
		F.nombre		as fanombre, ;
		F.fech_emit		as fafech_emi, ;
		F.cond_vta		as facond_vta, ;
		F.imp_total 	as faimp_tota, ;
		F.fecha 		as fafecha, ;
		F.idregistro 	as faidregist ;
FROM tmpsql01 T ;
LEFT JOIN facturas F ON T.nro_asto = F.contabilizado;
INTO TABLE  .\temp\tmpsql03 WHERE T.idcomp = 1 OR T.idcomp = 2 OR T.idcomp = 5 OR T.idcomp = 6 OR T.idcomp = 7 OR ;
		T.idcomp = 8 OR T.idcomp = 3 OR T.idcomp = 9 OR T.idcomp = 10 OR T.idcomp = 11 OR ;
		T.idcomp = 12 OR T.idcomp = 4 OR T.idcomp = 17 OR T.idcomp = 18 OR T.idcomp = 19 OR ;
		T.idcomp = 20 OR T.idcomp = 21 OR T.idcomp = 22




*********************************************************
*** carga el detalle del deposito bancario

*-*SELECT depobancap 
*-*SET ORDER TO asiento
*-*SELECT tmpsqlasientos
*-**SET RELATION TO nro_asto INTO depobancap
*-**GO top


*-**replace decod_prov	WITH depobancap.cod_prov, ;
*-*		desucursal	WITH depobancap.sucursal, ;
*-*		denumero	WITH depobancap.numero, ;
*-*		detipo		WITH depobancap.tipo, ;
*-*		decuenta	WITH depobancap.cuenta, ;
*-*		decomproba	WITH depobancap.comprobante, ;
*-*		defecha		WITH depobancap.fecha, ;
*-*		deiddepo	WITH depobancap.iddepo, ;
*-*		deimportet	WITH depobancap.importetotal ;
*-*				FOR idcomp = 23

*-*SET RELATION TO 

** CARGA DETALLE DEPOSITOS BANCARIOS CON SQL

SELECT  T.subdiario, ;
		T.nombre_cta, ;
		T.codigo_cta, ;
		T.monto_debe, ;
		T.monto_habe, ;
		T.fecha, ;
		T.detalle, ;
		T.nro_asto, ;
		T.codigo_acu, ;
		T.ejnumero, ;
		T.anio, ;
		T.nro_asto_c, ;
		T.sudetalle, ; 
		T.idcomp, ;
		T.sucomp_act, ;
		T.sucomp_nro, ;
		T.sunroastod, ;
		T.sucomp_pro, ;
		T.sucod_prov, ;
		T.sutipo_pro, ;
		T.sufecha_pr, ;
		T.suidreg_pr, ;
		T.cocomproba, ;
		D.cod_prov		as	decod_prov, ;
		D.sucursal		as	desucursal, ;
		D.numero		as	denumero, ;
		D.tipo			as	detipo, ;
		D.cuenta		as	decuenta, ;
		D.comprobante	as decomproba, ;
		D.fecha			as	defecha, ;
		D.iddepo		as	deiddepo, ;
		D.importetotal	as	deimportet ;
FROM tmpsql01 T ;
LEFT JOIN depobancap D ON T.nro_asto = D.contabilizado ;
INTO TABLE  .\temp\tmpsql04 WHERE T.idcomp = 23

*BROWSE 

*********************************************************
*** carga el detalle de Facturas de Proveedores
*-*SELECT compprov
*-*SET ORDER TO codigo
*-*SELECT factprov 
*-*SET ORDER TO asiento
*-*SET RELATION TO comprobante INTO compprov 
*-*SELECT tmpsqlasientos
*-*SET RELATION TO nro_asto INTO factprov
*-*GO top


*-*replace cpcodigo	WITH compprov.codigo, ;
*-*		cpnombre	WITH compprov.nombre, ;
*-*		cpidcomppr	WITH compprov.idcompprov, ;
*-*		cptipo		WITH compprov.tipo, ;
*-*		fptipo		WITH factprov.tipo, ;
*-*		fpserie		WITH factprov.serie, ;
*-*		fpnumero	WITH factprov.numero, ;
*-*		fpfecha		WITH factprov.fecha, ;
*-*		fpcod_prov	WITH factprov.cod_prov, ;
*-*		fpnombre	WITH factprov.nombre, ;
*-*		fptotal		WITH factprov.total, ;
*-*		fpidregist	WITH factprov.idregistro, ;
*-*		fpfechaing	WITH factprov.fechaingreso ;
*-*				FOR idcomp = 24
*-*SELECT factprov 
*-*SET RELATION TO 
*-*SELECT tmpsqlasientos
*-*SET RELATION TO 


** FACTURAS DE PROVEEDORES 

SELECT  T.subdiario, ;
		T.nombre_cta, ;
		T.codigo_cta, ;
		T.monto_debe, ;
		T.monto_habe, ;
		T.fecha, ;
		T.detalle, ;
		T.nro_asto, ;
		T.codigo_acu, ;
		T.ejnumero, ;
		T.anio, ;
		T.nro_asto_c, ;
		T.sudetalle, ; 
		T.idcomp, ;
		T.sucomp_act, ;
		T.sucomp_nro, ;
		T.sunroastod, ;
		T.sucomp_pro, ;
		T.sucod_prov, ;
		T.sutipo_pro, ;
		T.sufecha_pr, ;
		T.suidreg_pr, ;
		T.cocomproba, ;
		C.codigo as cpcodigo, ;
		C.nombre as cpnombre, ;
		C.idcompprov as cpidcomppr, ;
		C.tipo as cptipo, ;
		F.tipo as fptipo, ;
		F.serie as fpserie, ;
		F.numero as fpnumero, ;
		F.fecha as fpfecha, ;
		F.cod_prov as fpcod_prov, ;
		F.nombre as fpnombre, ;
		F.total as fptotal, ;
		F.idregistro as fpidregist, ;
		F.fechaingreso as fpfechaing ;
FROM tmpsql01 T ;
LEFT JOIN factprov F ON T.nro_asto = F.contabilizado ;
left join compprov C on F.comprobante = C.codigo ;
INTO TABLE  .\temp\tmpsql05 WHERE T.idcomp = 24

*BROWSE 

*********************************************************
*** carga el detalle del recibo del proveedor


*-*SELECT recibosprov
*-*SET ORDER TO ASIENTO
*-*SELECT tmpsqlasientos
*-*SET RELATION TO nro_asto INTO recibosprov
*-*GO top
*-*replace rpidrecibo	WITH recibosprov.idrecibo, ;
*-*		rpnrorecib	WITH recibosprov.nrorecibo, ;
*-*		rpfecha		WITH recibosprov.fecha, ;
*-*		rpimporte	WITH recibosprov.importe, ;
*-*		rpconcepto	WITH recibosprov.concepto, ;
*-*		rpcod_soci	WITH recibosprov.cod_socio, ;
*-*		rpnombre	WITH recibosprov.nombre, ;
*-*		rperapagoa	WITH recibosprov.erapagoacuenta  ;
*-*				FOR idcomp = 14

*-*SET RELATION TO 


SELECT  T.subdiario, ;
		T.nombre_cta, ;
		T.codigo_cta, ;
		T.monto_debe, ;
		T.monto_habe, ;
		T.fecha, ;
		T.detalle, ;
		T.nro_asto, ;
		T.codigo_acu, ;
		T.ejnumero, ;
		T.anio, ;
		T.nro_asto_c, ;
		T.sudetalle, ; 
		T.idcomp, ;
		T.sucomp_act, ;
		T.sucomp_nro, ;
		T.sunroastod, ;
		T.sucomp_pro, ;
		T.sucod_prov, ;
		T.sutipo_pro, ;
		T.sufecha_pr, ;
		T.suidreg_pr, ;
		T.cocomproba, ;
		R.idrecibo	as rpidrecibo, ;
		R.nrorecibo as rpnrorecib, ;
		R.fecha 	as rpfecha, ;
		R.importe 	as rpimporte, ;
		R.concepto 	as rpconcepto, ;
		R.cod_socio as rpcod_soci, ;
		R.nombre 	as rpnombre, ;
		R.erapagoacuenta as rperapagoa ;
FROM tmpsql01 T ;
LEFT JOIN recibosprov R ON T.nro_asto = R.contabilizado ;
INTO TABLE  .\temp\tmpsql06 WHERE T.idcomp = 14

*BROWSE 

*********************************************************
*** carga el detalle del caja ingreso


*-*SELECT cajaingreso
*-*SET ORDER TO ASIENTO
*-*SELECT tmpsqlasientos
*-*SET RELATION TO nro_asto INTO cajaingreso
*-*GO top


*-*replace ciidcajain	WITH cajaingreso.idcajaing, ;
*-*		cifecha		WITH cajaingreso.fecha, ;
*-*		cicod_soci	WITH cajaingreso.cod_socio, ;
*-*		ciapellido	WITH cajaingreso.apellido, ;
*-*		cinombre	WITH cajaingreso.nombre, ;
*-*		ciconcepto	WITH cajaingreso.concepto, ;
*-*		citotaling	WITH cajaingreso.totaling ;
*-*				FOR idcomp = 25

*-*SET RELATION TO 
*DETALLE DEL CAJA INGRESO CON CONSULTAS SQL

SELECT  T.subdiario, ;
		T.nombre_cta, ;
		T.codigo_cta, ;
		T.monto_debe, ;
		T.monto_habe, ;
		T.fecha, ;
		T.detalle, ;
		T.nro_asto, ;
		T.codigo_acu, ;
		T.ejnumero, ;
		T.anio, ;
		T.nro_asto_c, ;
		T.sudetalle, ; 
		T.idcomp, ;
		T.sucomp_act, ;
		T.sucomp_nro, ;
		T.sunroastod, ;
		T.sucomp_pro, ;
		T.sucod_prov, ;
		T.sutipo_pro, ;
		T.sufecha_pr, ;
		T.suidreg_pr, ;
		T.cocomproba, ;
		C.idcajaing as ciidcajain, ;
		C.fecha 	as cifecha, ;
		C.cod_socio as cicod_soci, ;
		C.apellido	as ciapellido, ;
		C.nombre	as cinombre, ;
		C.concepto	as ciconcepto, ;
		C.totaling	as citotaling ;
FROM tmpsql01 T ;
LEFT JOIN CAJAINGRESO C ON T.nro_asto = C.contabilizado ;
INTO TABLE  .\temp\tmpsql07 WHERE T.idcomp = 25

*BROWSE 

*********************************************************
*** carga el detalle del Caja Egreso


*-*SELECT cajaegreso
*-*SET ORDER TO ASIENTO
*-*SELECT tmpsqlasientos
*-*SET RELATION TO nro_asto INTO cajaegreso
*-*GO top
*-*replace ceidcajaeg	WITH cajaegreso.idcajaegr, ;
*-*		cefecha		WITH cajaegreso.fecha, ;
*-*		cecod_soci	WITH cajaegreso.cod_socio, ;
*-*		ceapellido	WITH cajaegreso.apellido, ;
*-*		cenombre	WITH cajaegreso.nombre, ;
*-*		ceconcepto	WITH cajaegreso.concepto, ;
*-*		cetotaling	WITH cajaegreso.totaling ;
*-*				FOR idcomp = 26
*-*
*-*SET RELATION TO 

SELECT  T.subdiario, ;
		T.nombre_cta, ;
		T.codigo_cta, ;
		T.monto_debe, ;
		T.monto_habe, ;
		T.fecha, ;
		T.detalle, ;
		T.nro_asto, ;
		T.codigo_acu, ;
		T.ejnumero, ;
		T.anio, ;
		T.nro_asto_c, ;
		T.sudetalle, ; 
		T.idcomp, ;
		T.sucomp_act, ;
		T.sucomp_nro, ;
		T.sunroastod, ;
		T.sucomp_pro, ;
		T.sucod_prov, ;
		T.sutipo_pro, ;
		T.sufecha_pr, ;
		T.suidreg_pr, ;
		T.cocomproba, ;
		C.idcajaegr	as ceidcajaeg, ;
		C.fecha		as cefecha, ;
		C.cod_socio as cecod_soci, ;
		C.apellido 	as ceapellido, ;
		C.nombre	as cenombre, ;
		C.concepto	as ceconcepto, ;
		C.totaling	as cetotaling ;
FROM tmpsql01 T ;
LEFT JOIN cajaegreso C ON T.nro_asto = C.contabilizado ;
INTO TABLE  .\temp\tmpsql08 WHERE T.idcomp = 26

*BROWSE 

*********************************************************
*** carga el detalle de Transferencia entre Cuentas

*-*SELECT tranintercta
*-*SET ORDER TO ASIENTO
*-*SELECT tmpsqlasientos
*-*SET RELATION TO nro_asto INTO tranintercta
*-*GO top
*-*replace tridtran	WITH tranintercta.idtran, ;
*-*		trfecha		WITH tranintercta.fecha, ;
*-*		trimporte	WITH tranintercta.importe, ;
*-*		trnrocomp	WITH tranintercta.nrocomprobco, ;
*-*		trbancoor	WITH tranintercta.bancoori, ;
*-*		trnbancor	WITH tranintercta.nombancoori, ;
*-*		trsucuori	WITH tranintercta.sucursalori, ;
*-*		trnumeroo	WITH tranintercta.numeroori, ;
*-*		trnctaori	WITH tranintercta.nombcuentaori, ;
*-*		trbancode	WITH tranintercta.bancodes, ;
*-*		trnbancod	WITH tranintercta.nombancodes, ;
*-*		trsucudes	WITH tranintercta.sucursaldes, ;
*-*		trnumerod	WITH tranintercta.numerodes, ;
*-*		trtipodes	WITH tranintercta.tipodes, ;
*-*		trnctades	WITH tranintercta.nombcuentades ;
*-*				FOR idcomp = 28

*-*SET RELATION TO 

* DETALLE DE TRANSFERENCIAS CON SQL

SELECT  T.subdiario, ;
		T.nombre_cta, ;
		T.codigo_cta, ;
		T.monto_debe, ;
		T.monto_habe, ;
		T.fecha, ;
		T.detalle, ;
		T.nro_asto, ;
		T.codigo_acu, ;
		T.ejnumero, ;
		T.anio, ;
		T.nro_asto_c, ;
		T.sudetalle, ; 
		T.idcomp, ;
		T.sucomp_act, ;
		T.sucomp_nro, ;
		T.sunroastod, ;
		T.sucomp_pro, ;
		T.sucod_prov, ;
		T.sutipo_pro, ;
		T.sufecha_pr, ;
		T.suidreg_pr, ;
		T.cocomproba, ;
		U.idtran		as tridtran	, ;
		U.fecha 		as trfecha, ;
		U.importe		as trimporte, ;
		U.nrocomprobco 	as trnrocomp, ;
		U.bancoori		as trbancoor, ;
		U.nombancoori	as trnbancor, ;
		U.sucursalori	as trsucuori, ;
		U.numeroori		as trnumeroo, ;
		U.nombcuentaori	as trnctaori, ;
		U.bancodes		as trbancode, ;
		U.nombancodes	as trnbancod, ;
		U.sucursaldes	as trsucudes, ;
		U.numerodes		as trnumerod, ;
		U.tipodes		as trtipodes, ;
		U.nombcuentades as trnctades ;
FROM tmpsql01 T ;
LEFT JOIN tranintercta U ON T.nro_asto = U.contabilizado ;
INTO TABLE  .\temp\tmpsql09 WHERE T.idcomp = 28

*BROWSE 


*********************************************************
*** carga el detalle Extracciones Bancarias



*-*SELECT extracbancarias
*-*SET ORDER TO ASIENTO
*-*SELECT tmpsqlasientos
*-*SET RELATION TO nro_asto INTO extracbancarias
*-*GO top
*-*replace exidextra	WITH extracbancarias.idextrac, ;
*-*		exfecha		WITH extracbancarias.fecha, ;
*-*		eximporte	WITH extracbancarias.importe, ;
*-*		exnrocomp	WITH extracbancarias.nrocomprobco, ;
*-*		exbancoor	WITH extracbancarias.bancoori, ;
*-*		exnombanc	WITH extracbancarias.nombancoori, ;
*-*		exsucursa	WITH extracbancarias.sucursalori, ;
*-*		exnumeroo	WITH extracbancarias.numeroori, ;
*-*		extipoori	WITH extracbancarias.tipoori ;
*-*				FOR idcomp = 30

*-*SET RELATION TO 

** DETALLE DE EXTRACCIONES BANCARIAS CON SQL

SELECT  T.subdiario, ;
		T.nombre_cta, ;
		T.codigo_cta, ;
		T.monto_debe, ;
		T.monto_habe, ;
		T.fecha, ;
		T.detalle, ;
		T.nro_asto, ;
		T.codigo_acu, ;
		T.ejnumero, ;
		T.anio, ;
		T.nro_asto_c, ;
		T.sudetalle, ; 
		T.idcomp, ;
		T.sucomp_act, ;
		T.sucomp_nro, ;
		T.sunroastod, ;
		T.sucomp_pro, ;
		T.sucod_prov, ;
		T.sutipo_pro, ;
		T.sufecha_pr, ;
		T.suidreg_pr, ;
		T.cocomproba, ;
		E.idextrac 		as exidextra, ;
		E.fecha			as	exfecha, ;
		E.importe		as	eximporte, ;
		E.nrocomprobco	as	exnrocomp, ;
		E.bancoori		as	exbancoor, ;
		E.nombancoori	as exnombanc, ;
		E.sucursalori	as	exsucursa, ;
		E.numeroori		as	exnumeroo, ;
		E.tipoori		as	extipoori ;
FROM tmpsql01 T ;
LEFT JOIN extracbancarias E ON T.nro_asto = E.contabilizado ;
INTO TABLE  .\temp\tmpsql10 WHERE T.idcomp = 30

*BROWSE 


*** carga el detalle Extracciones Bancarias

*-*SELECT cobrosporventanilla
*-*SET ORDER TO ASIENTO
*-*SELECT tmpsqlasientos
*-*SET RELATION TO nro_asto INTO cobrosporventanilla
*-*GO top


*-*replace cvidcobro	WITH cobrosporventanilla.idcobroven, ;
*-*		cvcobropr	WITH cobrosporventanilla.cobropropio3ro, ;
*-*		cvfecha		WITH cobrosporventanilla.fecha, ;
*-*		cvnrocomp	WITH cobrosporventanilla.nrocomprobco, ;
*-*		cvimporte	WITH cobrosporventanilla.importe, ;
*-*		cvbancoor	WITH cobrosporventanilla.bancoori, ;
*-*		cvnbancor	WITH cobrosporventanilla.nombancoori, ;
*-*		cvsucuori	WITH cobrosporventanilla.sucursalori, ;
*-*		cvnumeroo	WITH cobrosporventanilla.numeroori, ;
*-*		cvtipoori	WITH cobrosporventanilla.tipoori, ;
*-*		cvserie		WITH cobrosporventanilla.serie, ;
*-*		cvnumero	WITH cobrosporventanilla.numero, ;
*-*		cvbanco		WITH cobrosporventanilla.banco, ;
*-*		cvfilial	WITH cobrosporventanilla.filial, ;
*-*		cvfechaem	WITH cobrosporventanilla.fechaemision, ;
*-*		cvfechave	WITH cobrosporventanilla.fechavencimiento, ;
*-*		cvalaorde	WITH cobrosporventanilla.alaordende, ;
*-*		cvlibrado	WITH cobrosporventanilla.librador, ;
*-*		cvloentre	WITH cobrosporventanilla.loentrega, ;
*-*		cvidrecib	WITH cobrosporventanilla.idrecibo, ;
*-*		cvidcajai	WITH cobrosporventanilla.idcajaingreso ;
*-*				FOR idcomp = 29

*-*SET RELATION TO 


** COBROS POR VENTANILLA CON SQL


** DETALLE DE EXTRACCIONES BANCARIAS CON SQL

SELECT  T.subdiario, ;
		T.nombre_cta, ;
		T.codigo_cta, ;
		T.monto_debe, ;
		T.monto_habe, ;
		T.fecha, ;
		T.detalle, ;
		T.nro_asto, ;
		T.codigo_acu, ;
		T.ejnumero, ;
		T.anio, ;
		T.nro_asto_c, ;
		T.sudetalle, ; 
		T.idcomp, ;
		T.sucomp_act, ;
		T.sucomp_nro, ;
		T.sunroastod, ;
		T.sucomp_pro, ;
		T.sucod_prov, ;
		T.sutipo_pro, ;
		T.sufecha_pr, ;
		T.suidreg_pr, ;
		T.cocomproba, ;
		C.idcobroven		as	cvidcobro, ;
		C.cobropropio3ro	as cvcobropr, ;
		C.fecha				as	cvfecha, ;
		C.nrocomprobco		as	cvnrocomp, ;
		C.importe			as	cvimporte, ;
		C.bancoori			as	cvbancoor, ;
		C.nombancoori		as	cvnbancor, ;
		C.sucursalori		as	cvsucuori, ;
		C.numeroori			as	cvnumeroo, ;
		C.tipoori			as	cvtipoori, ;
		C.serie				as	cvserie, ;
		C.numero			as	cvnumero, ;
		C.banco				as	cvbanco, ;
		C.filial			as	cvfilial, ;
		C.fechaemision		as	cvfechaem, ;
		C.fechavencimiento	as	cvfechave, ;
		C.alaordende		as	cvalaorde, ;
		C.librador			as	cvlibrado, ;
		C.loentrega			as	cvloentre, ;
		C.idrecibo			as	cvidrecib, ;
		C.idcajaingreso		as	cvidcajai ;
FROM tmpsql01 T ;
LEFT JOIN cobrosporventanilla C ON T.nro_asto = C.contabilizado ;
INTO TABLE  .\temp\tmpsql11 WHERE T.idcomp = 29

*BROWSE 


*** carga el detalle AplicaPagoP
*-*SELECT aplicapagop
*-*SET ORDER TO ASIENTO
*-*SELECT tmpsqlasientos
*-*SET RELATION TO nro_asto INTO aplicapagop
*-*GO top


*-*replace apidaplic	WITH aplicapagop.idaplicapago, ;
*-*		apfecha		WITH aplicapagop.fecha, ;
*-*		apcod_pro	WITH aplicapagop.cod_prov, ;
*-*		apapellid	WITH aplicapagop.apellido, ;
*-*		apnombre	WITH aplicapagop.nombre, ;
*-*		aptotapli	WITH aplicapagop.totalaplicado, ;
*-*		apfaccanc	WITH aplicapagop.facturascanceladas, ;
*-*		appagosac	WITH aplicapagop.pagosacuentausados ;
*-*				FOR idcomp = 27


*-*SET RELATION TO 

** APLICAPAGO CON SQL

SELECT  T.subdiario, ;
		T.nombre_cta, ;
		T.codigo_cta, ;
		T.monto_debe, ;
		T.monto_habe, ;
		T.fecha, ;
		T.detalle, ;
		T.nro_asto, ;
		T.codigo_acu, ;
		T.ejnumero, ;
		T.anio, ;
		T.nro_asto_c, ;
		T.sudetalle, ; 
		T.idcomp, ;
		T.sucomp_act, ;
		T.sucomp_nro, ;
		T.sunroastod, ;
		T.sucomp_pro, ;
		T.sucod_prov, ;
		T.sutipo_pro, ;
		T.sufecha_pr, ;
		T.suidreg_pr, ;
		T.cocomproba, ;
		A.idaplicapago	as	apidaplic, ;
		A.fecha			as	apfecha, ;
		A.cod_prov		as	apcod_pro, ;
		A.apellido		as	apapellid, ;
		A.nombre		as	apnombre, ;
		A.totalaplicado as  aptotapli, ;
		A.facturascanceladas	as	apfaccanc, ;
		A.pagosacuentausados	as	appagosac ;
FROM tmpsql01 T ;
LEFT JOIN aplicapagop A ON T.nro_asto = A.contabilizado ;
INTO TABLE  .\temp\tmpsql12 WHERE T.idcomp = 27

*BROWSE 


*** carga el detalle AplicaCobroP

*-*SELECT aplicacobrop
*-*SET ORDER TO ASIENTO
*-*SELECT tmpsqlasientos
*-*SET RELATION TO nro_asto INTO aplicacobrop
*-*GO top

*-*replace acidaplic	WITH aplicacobrop.idaplicapago, ;
*-*		acfecha		WITH aplicacobrop.fecha, ;
*-*		accod_cli	WITH aplicacobrop.cod_cli, ;
*-*		acapellid	WITH aplicacobrop.apellido, ;
*-*		acnombre	WITH aplicacobrop.nombre, ;
*-*		actotapli	WITH aplicacobrop.totalaplicado, ;
*-*		acfaccanc	WITH aplicacobrop.factuascanceladas, ;
*-*		acpagosac	WITH aplicacobrop.pagosacuentausados ;
*-*				FOR idcomp = 32

*-*SET RELATION TO 

** APLICACOBROS CON SQL

SELECT  T.subdiario, ;
		T.nombre_cta, ;
		T.codigo_cta, ;
		T.monto_debe, ;
		T.monto_habe, ;
		T.fecha, ;
		T.detalle, ;
		T.nro_asto, ;
		T.codigo_acu, ;
		T.ejnumero, ;
		T.anio, ;
		T.nro_asto_c, ;
		T.sudetalle, ; 
		T.idcomp, ;
		T.sucomp_act, ;
		T.sucomp_nro, ;
		T.sunroastod, ;
		T.sucomp_pro, ;
		T.sucod_prov, ;
		T.sutipo_pro, ;
		T.sufecha_pr, ;
		T.suidreg_pr, ;
		T.cocomproba, ;
		A.idaplicapago	as	acidaplic, ;
		A.fecha			as	acfecha, ;
		A.cod_cli		as	accod_cli, ;
		A.apellido		as	acapellid, ;
		A.nombre		as	acnombre, ;
		A.totalaplicado as  actotapli, ;
		A.facturascanceladas	as acfaccanc, ;
		A.pagosacuentausados	as	acpagosac ;
FROM tmpsql01 T ;
LEFT JOIN aplicacobrop A ON T.nro_asto = A.contabilizado ;
INTO TABLE  .\temp\tmpsql13 WHERE T.idcomp = 32

*BROWSE 

*=MESSAGEBOX("aqui terminaron los reemplazos")



WAIT CLEAR 
SELECT tmpsqlasientos
*MESSAGEBOX(STR(RECCOUNT()))
ZAP 
APPEND FROM .\temp\tmpsql00
APPEND FROM .\temp\tmpsql02
APPEND FROM .\temp\tmpsql03
APPEND FROM .\temp\tmpsql04
APPEND FROM .\temp\tmpsql05
APPEND FROM .\temp\tmpsql06
APPEND FROM .\temp\tmpsql07
APPEND FROM .\temp\tmpsql08
APPEND FROM .\temp\tmpsql09
APPEND FROM .\temp\tmpsql10
APPEND FROM .\temp\tmpsql11
APPEND FROM .\temp\tmpsql12
APPEND FROM .\temp\tmpsql13

USE IN tmpsql00
USE IN tmpsql01
USE IN tmpsql02
USE IN tmpsql03
USE IN tmpsql04
USE IN tmpsql05
USE IN tmpsql06
USE IN tmpsql07
USE IN tmpsql08
USE IN tmpsql09
USE IN tmpsql10
USE IN tmpsql11
USE IN tmpsql12
USE IN tmpsql13
DELETE FILE .\temp\tmpsql00.*
DELETE FILE .\temp\tmpsql01.*
DELETE FILE .\temp\tmpsql02.*
DELETE FILE .\temp\tmpsql03.*
DELETE FILE .\temp\tmpsql04.*
DELETE FILE .\temp\tmpsql05.*
DELETE FILE .\temp\tmpsql06.*
DELETE FILE .\temp\tmpsql07.*
DELETE FILE .\temp\tmpsql08.*
DELETE FILE .\temp\tmpsql09.*
DELETE FILE .\temp\tmpsql10.*
DELETE FILE .\temp\tmpsql11.*
DELETE FILE .\temp\tmpsql12.*
DELETE FILE .\temp\tmpsql13.*

*MESSAGEBOX(STR(RECCOUNT()))
SELECT tmpsqlasientos
USE 

SET NULL OFF 

ENDFUNC

**/////////////////////////////////////////////////**
**/////////////////////////////////////////////////**


*//////************************************************\\\\\*
*//////       SELECCION DE ASIENTOS Y COMPROBANTES     \\\\\*

FUNCTION SELEASIENTOS
PARAMETERS F_DES, F_HAS, N_DES, N_HAS, N_ANIO
WAIT windows "Aguarde un Momento... Ejecutando Consultas..." NOWAIT 
IF !USED("SUBDIARIOS") THEN 
	eje= "USE "+mmiservidor+"\datos\subdiarios in 0"
	&eje
ENDIF  
IF !USED("ASIENTOS") THEN 
	eje= "USE "+mmiservidor+"\datos\asientos in 0"
	&eje
ENDIF  
IF !USED("FACTURAS") THEN 
	eje= "USE "+mmiservidor+"\datos\facturas in 0"
	&eje
ENDIF  
IF !USED("RECIBOS") THEN 
	eje= "USE "+mmiservidor+"\datos\recibos in 0"
	&eje
ENDIF  
IF !USED("RECIBOSPROV") THEN 
	eje= "USE "+mmiservidor+"\datos\recibosprov in 0"
	&eje
ENDIF  
IF !USED("FACTPROV") THEN 
	eje= "USE "+mmiservidor+"\datos\factprov in 0"
	&eje
ENDIF  
IF !USED("DEPOBANCAP") THEN 
	eje= "USE "+mmiservidor+"\datos\depobancap in 0"
	&eje
ENDIF  
IF !USED("CAJAINGRESO") THEN 
	eje= "USE "+mmiservidor+"\datos\cajaingreso in 0"
	&eje
ENDIF  
IF !USED("CAJAEGRESO") then
	eje= "USE "+mmiservidor+"\datos\cajaegreso in 0"
	&eje
ENDIF
IF !USED("APLICAPAGOP") then
	eje= "USE "+mmiservidor+"\datos\aplicapagop in 0"
	&eje
ENDIF
IF !USED("TRANINTERCTA") then
	eje= "USE "+mmiservidor+"\datos\tranintercta in 0"
	&eje
ENDIF
IF !USED("COBROSPORVENTANILLA") then
	eje= "USE "+mmiservidor+"\datos\cobrosporventanilla in 0"
	&eje
ENDIF
IF !USED("EXTRACBANCARIAS") then
	eje= "USE "+mmiservidor+"\datos\extracbancarias in 0"
	&eje
ENDIF
IF !USED("APLICACOBROP") then
	eje= "USE "+mmiservidor+"\datos\aplicacobrop in 0"
	&eje
ENDIF
IF !USED("APLICAPAGOP") then
	eje= "USE "+mmiservidor+"\datos\aplicapagop in 0"
	&eje
ENDIF
IF !USED("COMPROBANTES") then
	eje= "USE "+mmiservidor+"\datos\comprobantes in 0"
	&eje
ENDIF
IF !USED("compprov") then
	eje= "USE "+mmiservidor+"\datos\compprov in 0"
	&eje
ENDIF

SET SAFETY OFF 

arch = mmiestacion+"\temp\tmpsqlasientos.dbf"
IF FILE(arch) THEN 
	IF USED("tmpsqlasientos") then
		SELECT tmpsqlasientos
		USE 
	ENDIF 
	DELETE FILE .\temp\tmpsqlasientos.dbf
	DELETE FILE .\temp\tmpsqlasientos.cdx
	DELETE FILE .\temp\tmpsqlasientos.fpt
ENDIF 

*CREATE TABLE tmpsqlasientos FREE ( ;
*						subdiario			C(2), ;
*						nombre_cta			C(20), ;
*						codigo_cta			C(18), ;
*						monto_debe			N(12,2), ;
*						monto_habe			N(12,2), ;
*						fecha				D, ;
*						detalle				C(40), ;
*						nro_asto			N(6), ;
*						codigo_acu			C(18), ;
*						modelo				N(4), ;
*						ejnumero			N(4), ;
*						anio				N(4), ;
*						nro_asto_c			N(6), ;
*						idcomp				N(6), ;
*						sudetalle			M, ;
*						sucomp_act			N(4), ;
*						sucomp_nro			N(10), ;
*						sunroastod			N(6), ;
*						sucomp_pro			C(2), ;
*						sucod_prov			n(4), ;
*						sutipo_pro			c(1), ;
*						sufecha_pr			d, ;
*						suidreg_pr			n(10), ;
*						cocomproba			c(60), ;
*						reidrecibo			n(6), ;
*						renrorecib			n(8), ;
*						refecha				d, ;
*						reimporte			n(12,2), ;
*						reconcepto			m, ;
*						recod_soci			n(4), ;
*						renombre			c(60), ;
*						faactivida			n(4), ;
*						fanumero			n(8), ;
*						facod_soci			n(4), ;
*						facod_serv			n(3), ;
*						facod_subs			n(6), ;
*						faapellido			c(60), ;
*						fanombre			c(60), ;
*						fafech_emi			d, ;
*						faimp_tota			n(12,2), ;
*						fafecha				d, ;
*						facond_vta			n(1), ;
*						faidregist			n(8), ;
*						decod_prov			n(4), ;
*						desucursal			n(4), ;
*						denumero			c(20), ;
*						detipo				n(3), ;
*						decuenta			c(18), ;
*						decomproba			n(10), ;
*						defecha				d, ;
*						deiddepo			n(10), ;
*						deimportet			n(12,2), ;
*						fptipo				c(1), ;
*						fpserie				n(4), ;
*						fpnumero			n(12), ;
*						fpfecha				d, ;
*						fpcod_prov			n(4), ;
*						fpnombre			c(60), ;
*						fptotal				y, ;
*						fpidregist			n(10), ;
*						fpfechaing			d, ;
*						rpidrecibo			n(6), ;
*						rpnrorecib			n(8), ;
*						rpfecha				d, ;
*						rpimporte			n(12,2), ;
*						rpconcepto			m, ;
*						rpcod_soci			n(4), ;
*						rpnombre			c(30), ;
*						rperapagoa			c(1), ;
*						ciidcajain			n(10), ;
*						cifecha				d, ;
*						cicod_soci			n(4), ;
*						ciapellido			c(60), ;
*						cinombre			c(60), ;
*						ciconcepto			c(250), ;
*						citotaling			y, ;
*						ceidcajaeg			n(10), ;
*						cefecha				d, ;
*						cecod_soci			n(4), ;
*						ceapellido			c(60), ;
*						cenombre			c(60), ;
*						ceconcepto			c(250), ;
*						cetotaling			y, ;
*						cpcodigo			c(2), ;
*						cpnombre			c(80), ;
*						cpidcomppr			n(6), ;
*						cptipo				c(1), ;
*						tridtran			i, ;
*						trfecha				d, ;
*						trimporte			y, ;
*						trnrocomp			i, ;
*						trbancoor			n(4), ;
*						trnbancor			c(80), ;
*						trsucuori			n(4), ;
*						trnumeroo			c(20), ;
*						trnctaori			c(50), ;
*						trbancode			n(4), ;
*						trnbancod			c(80), ;
*						trsucudes			n(4), ;
*						trnumerod			c(20), ;
*						trtipodes			n(3), ;
*						trnctades			c(80), ;
*						exidextra			i, ;
*						exfecha				d, ;
*						eximporte			y, ;
*						exnrocomp			i, ;
*						exbancoor			n(4), ;
*						exnombanc			c(80), ;
*						exsucursa			n(4), ;
*						exnumeroo			c(20), ;
*						extipoori			n(3), ;
*						cvidcobro			i, ;
*						cvcobropr			n(1), ;
*						cvfecha				d, ;
*						cvnrocomp			i, ;
*						cvimporte			y, ;
*						cvbancoor			n(4), ;
*						cvnbancor			c(80), ;
*						cvsucuori			n(4), ;
*						cvnumeroo			c(20), ;
*						cvtipoori			n(3), ;
*						cvserie				c(2), ;
*						cvnumero			n(15), ;
*						cvbanco				n(4), ;
*						cvfilial			n(4), ;
*						cvfechaem			d, ;
*						cvfechave			d, ;
*						cvalaorde			c(40), ;
*						cvlibrado			c(40), ;
*						cvloentre			c(40), ;
*						cvidrecib			n(6), ;
*						cvidcajai			n(10), ;
*						apidaplic			n(20), ;
*						apfecha				d, ;
*						apcod_pro			c(40), ;
*						apapellid			c(40), ;
*						apnombre			c(40), ;
*						aptotapli			n(12,2), ;
*						apfaccanc			n(5), ;
*						appagosac			n(5), ;
*						acidaplic			n(20), ;
*						acfecha				d, ;
*						accod_cli			n(4), ;
*						acapellid			c(60), ;
*						acnombre			c(60), ;
*						actotapli			n(12,2), ;
*						acfaccanc			n(5), ;
*						acpagosac			n(5))
*						
*
CREATE TABLE .\temp\tmpsqlasientos FREE ( ;
						subdiario C(2), nombre_cta C(60),	codigo_cta	C(18), ;
						monto_debe N(12,2), monto_habe	N(12,2),fecha	D,detalle	C(40), ;
						nro_asto N(6), codigo_acu C(18),modelo	N(4),ejnumero	N(4), ;
						anio N(4), nro_asto_c N(6),idcomp N(6),sudetalle	M,sucomp_act N(4), ;
						sucomp_nro N(10),sunroastod N(6),sucomp_pro C(2), sucod_prov n(4), ;
						sutipo_pro c(1),sufecha_pr d,suidreg_pr	n(10),cocomproba c(60), reidrecibo n(6), ;
						renrorecib n(8),refecha	d,reimporte n(12,2), reconcepto	m, recod_soci n(4), ;
						renombre c(60),faactivida n(4),fanumero n(8),facod_soci	n(4),facod_serv	n(3), ;
						facod_subs n(6),faapellido	c(60),fanombre c(60),fafech_emi d,faimp_tota n(12,2), ;
						fafecha	d,facond_vta n(1),faidregist n(8),decod_prov n(4),desucursal n(4),denumero c(20),detipo n(3), ;
						decuenta c(18), decomproba n(10),defecha d, deiddepo n(10),deimportet n(12,2), ;
						fptipo c(1),fpserie n(4),fpnumero n(12),fpfecha	d,fpcod_prov n(4),fpnombre c(60), ;
						fptotal	y,fpidregist n(10),fpfechaing d,rpidrecibo n(6),rpnrorecib n(8),rpfecha	d, ;
						rpimporte n(12,2),rpconcepto m,rpcod_soci n(4),rpnombre	c(30),rperapagoa c(1), ;
						ciidcajain n(10),cifecha d, cicod_soci n(4),ciapellido c(60),cinombre c(60),ciconcepto c(250), ;
						citotaling y,ceidcajaeg n(10),cefecha d,cecod_soci n(4),ceapellido c(60),cenombre c(60), ;
						ceconcepto c(250),cetotaling y,cpcodigo c(2), cpnombre c(80),cpidcomppr	n(6), ;
						cptipo c(1),tridtran i,trfecha d,trimporte y,trnrocomp i,trbancoor n(4),trnbancor c(80), ;
						trsucuori n(4),trnumeroo c(20),trnctaori c(50),trbancode n(4),trnbancod c(80),trsucudes n(4), ;
						trnumerod c(20),trtipodes n(3),trnctades c(80), exidextra i, exfecha d,eximporte y, exnrocomp i, ;
						exbancoor n(4),exnombanc c(80),exsucursa n(4),exnumeroo c(20),extipoori n(3),cvidcobro i, ;
						cvcobropr n(1),cvfecha d,cvnrocomp i,cvimporte y,cvbancoor n(4),cvnbancor c(80),cvsucuori n(4), ;
						cvnumeroo c(20),cvtipoori n(3),cvserie c(2),cvnumero n(15),cvbanco n(4), cvfilial n(4), ;
						cvfechaem d, cvfechave d, cvalaorde	c(40), cvlibrado c(40), cvloentre c(40),cvidrecib n(6), ;
						cvidcajai n(10),apidaplic n(20),apfecha d,apcod_pro n(4),apapellid c(40),apnombre c(40), ;
						aptotapli n(12,2),apfaccanc	n(5),appagosac n(5),acidaplic n(20), acfecha d,accod_cli n(4), ;
						acapellid c(60),acnombre c(60),actotapli n(12,2),acfaccanc n(5), acpagosac n(5))

IF !EMPTY(F_DES) AND !EMPTY(F_HAS) THEN
	SELECT * from asientos INTO TABLE .\TEMP\TASIENTOS WHERE fecha >= F_DES AND fecha <= F_HAS AND !DELETED() ORDER BY nro_asto 
ELSE
	SELECT * from asientos INTO TABLE .\TEMP\TASIENTOS WHERE nro_asto_conta >= N_DES AND nro_asto_conta <= N_HAS AND anio = n_anio AND !DELETED() ORDER BY nro_asto 
ENDIF 

SELECT tmpsqlasientos
APPEND FROM .\temp\tasientos 

** carga todos los datos del subdiario en tmpsqlasientos
SELECT subdiarios 
SET ORDER TO nro_asto
SELECT tmpsqlasientos

SET RELATION TO nro_asto INTO subdiarios
GO top
replace ALL sudetalle 	WITH subdiarios.detalle, ;
			idcomp 		WITH subdiarios.comp_tipo, ;
			sucomp_act	WITH subdiarios.comp_act, ;
			sucomp_nro	WITH subdiarios.comp_nro, ;
			sunroastod	WITH subdiarios.nro_asto_d, ;
			sucomp_pro	WITH subdiarios.comp_prov, ;
			sucod_prov	WITH subdiarios.cod_prov, ;
			sutipo_pro	WITH subdiarios.tipo_prov, ;
			sufecha_pr	WITH subdiarios.fecha_prov, ;
			suidreg_pr	WITH subdiarios.idreg_prov

SET RELATION TO 

*********************************************************
*** carga el detalle del comprobante, su descripcion
SELECT comprobantes
SET ORDER TO idcomp
SELECT tmpsqlasientos
SET RELATION TO idcomp INTO comprobantes
GO top
replace ALL cocomproba 	WITH comprobantes.comprobante
SET RELATION TO 
*********************************************************
*** carga el detalle del recibo


SELECT recibos  && idcomp = 16
SET ORDER TO asiento
SELECT tmpsqlasientos
SET RELATION TO nro_asto INTO recibos
GO top


replace reidrecibo	WITH recibos.idrecibo, ;
		renrorecib	WITH recibos.nrorecibo, ;
		refecha		WITH recibos.fecha, ;
		reimporte	WITH recibos.importe, ;
		reconcepto	WITH recibos.concepto, ;
		recod_soci	WITH recibos.cod_socio, ;
		renombre	WITH recibos.nombre ;
				FOR idcomp = 16 

SET RELATION TO 


*********************************************************
*** carga el detalle de la factura 


SELECT facturas 
SET ORDER TO asiento
SELECT tmpsqlasientos
SET RELATION TO nro_asto INTO facturas
GO TOP 


replace faactivida	WITH facturas.actividad, ;
		fanumero	WITH facturas.numero, ;
		facod_soci	WITH facturas.cod_socio, ;
		facod_serv	WITH facturas.cod_servi, ;
		facod_subs	WITH facturas.cod_subser, ;
		faapellido 	WITH facturas.apellido, ;
		fanombre	WITH facturas.nombre, ;
		fafech_emi	WITH facturas.fech_emit, ;
		facond_vta	WITH facturas.cond_vta, ;
		faimp_tota  WITH facturas.imp_total, ;
		fafecha		WITH facturas.fecha, ;
		faidregist	WITH facturas.idregistro ;
		FOR idcomp = 1 OR idcomp = 2 OR idcomp = 5 OR idcomp = 6 OR idcomp = 7 OR ;
		idcomp = 8 OR idcomp = 3 OR idcomp = 9 OR idcomp = 10 OR idcomp = 11 OR ;
		idcomp = 12 OR idcomp = 4 OR idcomp = 17 OR idcomp = 18 OR idcomp = 19 OR ;
		idcomp = 20 OR idcomp = 21 OR idcomp = 22

SET RELATION TO 


*********************************************************
*** carga el detalle del deposito bancario

SELECT depobancap 
SET ORDER TO asiento
SELECT tmpsqlasientos
SET RELATION TO nro_asto INTO depobancap
GO top


replace decod_prov	WITH depobancap.cod_prov, ;
		desucursal	WITH depobancap.sucursal, ;
		denumero	WITH depobancap.numero, ;
		detipo		WITH depobancap.tipo, ;
		decuenta	WITH depobancap.cuenta, ;
		decomproba	WITH depobancap.comprobante, ;
		defecha		WITH depobancap.fecha, ;
		deiddepo	WITH depobancap.iddepo, ;
		deimportet	WITH depobancap.importetotal ;
				FOR idcomp = 23

SET RELATION TO 


*********************************************************
*** carga el detalle de Facturas de Proveedores
SELECT compprov
SET ORDER TO codigo
SELECT factprov 
SET ORDER TO asiento
SET RELATION TO comprobante INTO compprov 
SELECT tmpsqlasientos
SET RELATION TO nro_asto INTO factprov
GO top


replace cpcodigo	WITH compprov.codigo, ;
		cpnombre	WITH compprov.nombre, ;
		cpidcomppr	WITH compprov.idcompprov, ;
		cptipo		WITH compprov.tipo, ;
		fptipo		WITH factprov.tipo, ;
		fpserie		WITH factprov.serie, ;
		fpnumero	WITH factprov.numero, ;
		fpfecha		WITH factprov.fecha, ;
		fpcod_prov	WITH factprov.cod_prov, ;
		fpnombre	WITH factprov.nombre, ;
		fptotal		WITH factprov.total, ;
		fpidregist	WITH factprov.idregistro, ;
		fpfechaing	WITH factprov.fechaingreso ;
				FOR idcomp = 24
SELECT factprov 
SET RELATION TO 
SELECT tmpsqlasientos
SET RELATION TO 

*********************************************************
*** carga el detalle del recibo del proveedor


SELECT recibosprov
SET ORDER TO ASIENTO
SELECT tmpsqlasientos
SET RELATION TO nro_asto INTO recibosprov
GO top
replace rpidrecibo	WITH recibosprov.idrecibo, ;
		rpnrorecib	WITH recibosprov.nrorecibo, ;
		rpfecha		WITH recibosprov.fecha, ;
		rpimporte	WITH recibosprov.importe, ;
		rpconcepto	WITH recibosprov.concepto, ;
		rpcod_soci	WITH recibosprov.cod_socio, ;
		rpnombre	WITH recibosprov.nombre, ;
		rperapagoa	WITH recibosprov.erapagoacuenta  ;
				FOR idcomp = 14

SET RELATION TO 


*********************************************************
*** carga el detalle del caja ingreso


SELECT cajaingreso
SET ORDER TO ASIENTO
SELECT tmpsqlasientos
SET RELATION TO nro_asto INTO cajaingreso
GO top


replace ciidcajain	WITH cajaingreso.idcajaing, ;
		cifecha		WITH cajaingreso.fecha, ;
		cicod_soci	WITH cajaingreso.cod_socio, ;
		ciapellido	WITH cajaingreso.apellido, ;
		cinombre	WITH cajaingreso.nombre, ;
		ciconcepto	WITH cajaingreso.concepto, ;
		citotaling	WITH cajaingreso.totaling ;
				FOR idcomp = 25

SET RELATION TO 

*********************************************************
*** carga el detalle del Caja Egreso


SELECT cajaegreso
SET ORDER TO ASIENTO
SELECT tmpsqlasientos
SET RELATION TO nro_asto INTO cajaegreso
GO top
replace ceidcajaeg	WITH cajaegreso.idcajaegr, ;
		cefecha		WITH cajaegreso.fecha, ;
		cecod_soci	WITH cajaegreso.cod_socio, ;
		ceapellido	WITH cajaegreso.apellido, ;
		cenombre	WITH cajaegreso.nombre, ;
		ceconcepto	WITH cajaegreso.concepto, ;
		cetotaling	WITH cajaegreso.totaling ;
				FOR idcomp = 26

SET RELATION TO 

*********************************************************
*** carga el detalle de Transferencia entre Cuentas



SELECT tranintercta
SET ORDER TO ASIENTO
SELECT tmpsqlasientos
SET RELATION TO nro_asto INTO tranintercta
GO top
replace tridtran	WITH tranintercta.idtran, ;
		trfecha		WITH tranintercta.fecha, ;
		trimporte	WITH tranintercta.importe, ;
		trnrocomp	WITH tranintercta.nrocomprobco, ;
		trbancoor	WITH tranintercta.bancoori, ;
		trnbancor	WITH tranintercta.nombancoori, ;
		trsucuori	WITH tranintercta.sucursalori, ;
		trnumeroo	WITH tranintercta.numeroori, ;
		trnctaori	WITH tranintercta.nombcuentaori, ;
		trbancode	WITH tranintercta.bancodes, ;
		trnbancod	WITH tranintercta.nombancodes, ;
		trsucudes	WITH tranintercta.sucursaldes, ;
		trnumerod	WITH tranintercta.numerodes, ;
		trtipodes	WITH tranintercta.tipodes, ;
		trnctades	WITH tranintercta.nombcuentades ;
				FOR idcomp = 28

SET RELATION TO 

*********************************************************
*** carga el detalle Extracciones Bancarias



SELECT extracbancarias
SET ORDER TO ASIENTO
SELECT tmpsqlasientos
SET RELATION TO nro_asto INTO extracbancarias
GO top
replace exidextra	WITH extracbancarias.idextrac, ;
		exfecha		WITH extracbancarias.fecha, ;
		eximporte	WITH extracbancarias.importe, ;
		exnrocomp	WITH extracbancarias.nrocomprobco, ;
		exbancoor	WITH extracbancarias.bancoori, ;
		exnombanc	WITH extracbancarias.nombancoori, ;
		exsucursa	WITH extracbancarias.sucursalori, ;
		exnumeroo	WITH extracbancarias.numeroori, ;
		extipoori	WITH extracbancarias.tipoori ;
				FOR idcomp = 30

SET RELATION TO 


*** carga el detalle Extracciones Bancarias
SELECT cobrosporventanilla
SET ORDER TO ASIENTO
SELECT tmpsqlasientos
SET RELATION TO nro_asto INTO cobrosporventanilla
GO top


replace cvidcobro	WITH cobrosporventanilla.idcobroven, ;
		cvcobropr	WITH cobrosporventanilla.cobropropio3ro, ;
		cvfecha		WITH cobrosporventanilla.fecha, ;
		cvnrocomp	WITH cobrosporventanilla.nrocomprobco, ;
		cvimporte	WITH cobrosporventanilla.importe, ;
		cvbancoor	WITH cobrosporventanilla.bancoori, ;
		cvnbancor	WITH cobrosporventanilla.nombancoori, ;
		cvsucuori	WITH cobrosporventanilla.sucursalori, ;
		cvnumeroo	WITH cobrosporventanilla.numeroori, ;
		cvtipoori	WITH cobrosporventanilla.tipoori, ;
		cvserie		WITH cobrosporventanilla.serie, ;
		cvnumero	WITH cobrosporventanilla.numero, ;
		cvbanco		WITH cobrosporventanilla.banco, ;
		cvfilial	WITH cobrosporventanilla.filial, ;
		cvfechaem	WITH cobrosporventanilla.fechaemision, ;
		cvfechave	WITH cobrosporventanilla.fechavencimiento, ;
		cvalaorde	WITH cobrosporventanilla.alaordende, ;
		cvlibrado	WITH cobrosporventanilla.librador, ;
		cvloentre	WITH cobrosporventanilla.loentrega, ;
		cvidrecib	WITH cobrosporventanilla.idrecibo, ;
		cvidcajai	WITH cobrosporventanilla.idcajaingreso ;
				FOR idcomp = 29

SET RELATION TO 


*** carga el detalle AplicaPagoP
SELECT aplicapagop
SET ORDER TO ASIENTO
SELECT tmpsqlasientos
SET RELATION TO nro_asto INTO aplicapagop
GO top


replace apidaplic	WITH aplicapagop.idaplicapago, ;
		apfecha		WITH aplicapagop.fecha, ;
		apcod_pro	WITH aplicapagop.cod_prov, ;
		apapellid	WITH aplicapagop.apellido, ;
		apnombre	WITH aplicapagop.nombre, ;
		aptotapli	WITH aplicapagop.totalaplicado, ;
		apfaccanc	WITH aplicapagop.facturascanceladas, ;
		appagosac	WITH aplicapagop.pagosacuentausados ;
				FOR idcomp = 27


SET RELATION TO 

*** carga el detalle AplicaPagoP

SELECT aplicacobrop
SET ORDER TO ASIENTO
SELECT tmpsqlasientos
SET RELATION TO nro_asto INTO aplicacobrop
GO top



replace acidaplic	WITH aplicacobrop.idaplicapago, ;
		acfecha		WITH aplicacobrop.fecha, ;
		accod_cli	WITH aplicacobrop.cod_cli, ;
		acapellid	WITH aplicacobrop.apellido, ;
		acnombre	WITH aplicacobrop.nombre, ;
		actotapli	WITH aplicacobrop.totalaplicado, ;
		acfaccanc	WITH aplicacobrop.factuascanceladas, ;
		acpagosac	WITH aplicacobrop.pagosacuentausados ;
				FOR idcomp = 32

SET RELATION TO 
WAIT CLEAR 
SELECT tmpsqlasientos
USE 
ENDFUNC


FUNCTION codigocuenta
PARAMETERS ELCODIGO
RETORNO = ALLTRIM(STRTRAN(ELCODIGO,".",""))
CANTCAR = LEN(ALLTRIM(RETORNO))
IF !(MOD(CANTCAR,2) = 0) THEN 
	RETORNO = ALLTRIM(RETORNO)+"0"
	CANTCAR = CANTCAR+1
ENDIF

RETORNA = ""
FOR I = 1 TO CANTCAR
	IF MOD(I,2)=0 AND I > 1 THEN
		RETORNA = RETORNA + SUBSTR(RETORNO,I-1,2)+"."
	ENDIF
ENDFOR
RETORNA = SUBSTR(RETORNA,1,LEN(ALLTRIM(RETORNA))-1)
RETURN RETORNA



*////////////////*//////////////////*/////////////*/
***************************************************/
*/*/ FUNCION QUE  RECIBE COMO PARAMTRO UNA TABLA TEMPORARIA
*/*/ LLAMADA en la variable ARCHI y RETORNA UNA TABLA TEMPORARIA
*/*/ CON     TASTODIARIO.DBF CONTENIENDO EL ASIENTO RESUMEN PARA EL DIARIO
*/*************************************************************************
FUNCTION ALDIARIO1
PARAMETERS ARCHI
	WAIT windows "Aguarde un momento..." NOWAIT 
	SET SAFETY OFF 
	IF !USED(archi) then
		eje= "USE "+mmiestacion+"\temp\"+ALLTRIM(archi)+" in 0"
		&eje
	ENDIF
	IF !USED("subdiarios") then
		eje= "USE "+mmiservidor+"\datos\subdiarios in 0"
		&eje
	ENDIF
	IF !USED("asientos") then
		eje= "USE "+mmiservidor+"\datos\asientos in 0"
		&eje
	ENDIF
	IF USED("tastodiario") then
		USE IN tastodiario 		
	ENDIF
	DELETE FILE .\temp\tastodiario.dbf 
	CREATE TABLE .\temp\tastodiario.dbf FREE ( ;
				subdiario		c(2), ;
				nombre_cta		c(50), ;
				codigo_cta		c(18), ;
				monto_debe		n(12,2), ;
				monto_habe 		n(12,2), ;
				fecha			d, ;
				detalle			c(40), ;
				nro_asto_d		n(6), ;
				codigo_acu		c(18), ;
				modelo			n(4), ;
				ejnumero		n(4), ;
				anio			n(4), ;
				nro_asto_c  	n(6))
	
	*** selecciono los asientos segun los numeros pasados en la tabla 
	SELECT nro_asto FROM subdiarios ;
	INTO TABLE .\temp\subt1 ;
	WHERE !subdiarios.anulado AND subdiarios.nro_asto_d = 0 AND ;
	subdiarios.nro_asto in (select nro_asto FROM .\temp\&archi)
	** selecciono el detalle de los asientos seleccionados antes 
	** con totales debitados y acreditados
	
	***LOS AGRUPA O NO SEGUN EL PARAMETRO RECIBIDO SI GRUPO = 0 AGRUPA, SI ES 1 NO AGRUPA****
*	IF P_GRUPO = 0 THEN 
		SELECT codigo_cta, nombre_cta, sum(monto_debe) as monto_debe, ;
		       sum(monto_habe) as monto_habe, codigo_acu ;
		from asientos INTO TABLE .\temp\asit1 ;
		WHERE nro_asto in (select nro_asto FROM .\temp\subt1) ;
		ORDER BY codigo_cta GROUP BY codigo_cta 
**	ELSE && ESTE ES EL AGREGADO PARA NO AGRUPAR
**		SELECT codigo_cta, nombre_cta, monto_debe as monto_debe, ;
**		       monto_habe as monto_habe, codigo_acu ;
**		from asientos INTO TABLE .\temp\asit1 ;
**		WHERE nro_asto in (select nro_asto FROM .\temp\subt1) 
**	ENDIF 	
	
	SELECT asit1
	GO top
	DO WHILE !EOF()
		v_saldo = asit1.monto_debe - asit1.monto_habe
		SELECT tastodiario
		INSERT INTO tastodiario (codigo_cta, nombre_cta, monto_debe, monto_habe, codigo_acu) ;
					values(asit1.codigo_cta, asit1.nombre_cta, IIF(v_saldo > 0,v_saldo,0),IIF(v_saldo < 0,ABS(v_saldo),0),asit1.codigo_acu)
		
		SELECT asit1 
		SKIP 
	ENDDO 
	USE IN asit1
	USE IN subt1
	USE IN tastodiario
	WAIT CLEAR 
	RETURN "tastodiario"
ENDFUNC 

**********************************************************
**********************************************************
** FUNCION QUE REGISTRA EL ASIENTO RESUMEN EN EL DIARIO
** A PARTIR DE LOS ASIENTOS PASADOS COMO PARAMETROS EN 
** UNA TABLA TEMPORARIA
**********************************************************

FUNCTION ALDIARIO2
PARAMETERS ARCHI1,ARCHI2,PFECHA,PDETALLE
	WAIT windows "Aguarde un momento..." NOWAIT 
	SET SAFETY OFF 
	IF !USED(archi1) THEN && el archivo con los nro_asto del subdiario a actualizar
		eje= "USE "+mmiestacion+"\temp\"+ALLTRIM(archi1)+" in 0"
		&eje
	ENDIF
	IF !USED(archi2) THEN && el archivo con el asiento resumen de los nro_asto anteriores
		eje= "USE "+mmiestacion+"\temp\"+ALLTRIM(archi2)+" in 0"
		&eje
	ENDIF
	SELECT &archi2
	GO TOP 
	IF EOF() then
		=MESSAGEBOX("No se Generó asiento para el Libro Diario",0+48,"Pasajes al Libro Diario")
		RETURN -1
	ENDIF 

	IF !USED("subdiarios") then
		eje= "USE "+mmiservidor+"\datos\subdiarios in 0"
		&eje
	ENDIF
	IF !USED("asientos") then
		eje= "USE "+mmiservidor+"\datos\asientos in 0"
		&eje
	ENDIF

	IF !USED("diario") then
		eje= "USE "+mmiservidor+"\datos\diario in 0"
		&eje
	ENDIF
	IF !USED("asientosdiario") then
		eje= "USE "+mmiservidor+"\datos\asientosdiario in 0"
		&eje
	ENDIF
	IF !USED("planctas") then
		eje= "USE "+mmiservidor+"\datos\planctas in 0"
		&eje
	ENDIF
	vejnumero   = planctas.ejnumero
	vanio 		= planctas.anio
	SELECT diario
	CALCULATE MAX(nro_asto_d) TO maxnastod
	CALCULATE MAX(nro_asto_conta) FOR ejnumero = vejnumero TO maxnastoc 
	maxnastod = maxnastod + 1
	maxnastoc = maxnastoc + 1
	
	SELECT diario
	INSERT INTO diario (fecha, detalle,nro_asto_d, ejnumero, anio, nro_asto_conta) ;
				VALUES (PFECHA,PDETALLE,maxnastod, vejnumero,vanio,maxnastoc)
		
	SELECT planctas
	SET ORDER TO codigo_cta
				
	SELECT &archi2
	GO top
	DO WHILE !EOF()
		SELECT planctas
		varchi2    = archi2+".codigo_cta"
		vmontodebe = archi2+".monto_debe"
		vmontohabe = archi2+".monto_habe"
		IF SEEK(ALLTRIM(&varchi2)) THEN 
			SELECT asientosdiario
			INSERT INTO asientosdiario ( nombre_cta, codigo_cta, monto_debe, monto_habe, fecha, detalle, ;
										  nro_asto_d, codigo_acu, ejnumero, anio, nro_asto_conta) ;
								VALUES ( planctas.nombre, planctas.codigo_cta, &vmontodebe, &vmontohabe, ;
								         PFECHA, PDETALLE, diario.nro_asto_d,planctas.sumarizaen, diario.ejnumero, diario.anio, ;
								         diario.nro_asto_conta  )
		
		ELSE
			=MESSAGEBOX("ERROR GENERAL INFORMAR AL ADMINISTRADOR "+ALLTRIM(&varchi2)+CHR(13)+"NO SE ENCONTRO LA CUENTA EN EL PLAN DE CUENTAS",16,"Error de Datos")
			RETURN -1
		ENDIF 	
		SELECT &archi2
		SKIP 
	ENDDO 
	
	UPDATE subdiarios set nro_asto_d=diario.nro_asto_d WHERE subdiarios.nro_asto in (select nro_asto from &archi1) ;
					AND subdiarios.nro_asto_d = 0
	
	WAIT CLEAR 
	RETURN 1
ENDFUNC 




*//////////////////////////////////////////////////**
*//////************************************************\\\\\*
*//////SELECCION DE ASIENTOS DEL LIBRO DIARIO \\\\\*

FUNCTION SELASIENTODI
PARAMETERS F_DES, F_HAS, N_DES, N_HAS, N_ANIO
WAIT windows "Aguarde un Momento... Ejecutando Consultas..." NOWAIT 
IF !USED("DIARIO") THEN 
	eje= "USE "+mmiservidor+"\datos\diario in 0"
	&eje
ENDIF  
IF !USED("ASIENTOSDIARIO") THEN 
	eje= "USE "+mmiservidor+"\datos\asientosdiario in 0"
	&eje
ENDIF  

SET SAFETY OFF 

arch = mmiestacion+"\temp\tmpsqlasientos.dbf"
IF FILE(arch) THEN 
	IF USED("tmpsqlasientos") then
		SELECT tmpsqlasientos
		USE 
	ENDIF 
	DELETE FILE .\temp\tmpsqlasientos.dbf
	DELETE FILE .\temp\tmpsqlasientos.cdx
	DELETE FILE .\temp\tmpsqlasientos.fpt
ENDIF 

*CREATE TABLE tmpsqlasientos FREE ( ;
*						subdiario			C(2), ;
*						nombre_cta			C(20), ;
*						codigo_cta			C(18), ;
*						monto_debe			N(10,2), ;
*						monto_habe			N(10,2), ;
*						fecha				D, ;
*						detalle				C(40), ;
*						nro_asto_d			N(6), ;
*						codigo_acu			C(18), ;
*						modelo				N(4), ;
*						ejnumero			N(4), ;
*						anio				N(4), ;
*						nro_asto_c			N(6), ;
*						sudetalle			M)
						

CREATE TABLE .\temp\tmpsqlasientos FREE ( ;
						subdiario C(2), nombre_cta C(60),	codigo_cta	C(18), ;
						monto_debe N(12,2), monto_habe	N(12,2),fecha	D,detalle	C(40), ;
						nro_asto_d N(6), codigo_acu C(18),modelo	N(4),ejnumero	N(4), ;
						anio N(4), nro_asto_c N(6), didetalle C(80) )


IF !EMPTY(F_DES) AND !EMPTY(F_HAS) THEN
	SELECT * from asientosdiario INTO TABLE .\TEMP\TASIENTOS WHERE fecha >= F_DES AND fecha <= F_HAS AND !DELETED() ORDER BY nro_asto_d 
ELSE
	SELECT * from asientosdiario INTO TABLE .\TEMP\TASIENTOS WHERE nro_asto_conta >= N_DES AND nro_asto_conta <= N_HAS AND anio = n_anio AND !DELETED() ORDER BY nro_asto_d 
ENDIF 

SELECT tmpsqlasientos
APPEND FROM .\temp\tasientos 

** carga todos los datos del subdiario en tmpsqlasientos
SELECT diario
SET ORDER TO nro_asto_d
SELECT tmpsqlasientos
SET RELATION TO nro_asto_d INTO diario
GO top
replace ALL didetalle 	WITH ALLTRIM(diario.detalle)

SET RELATION TO 
WAIT CLEAR 
SELECT tmpsqlasientos
USE 
ENDFUNC





*//////************************************************\\\\\*
*//////       SELECCION DE ASIENTOS LIBRO DIARIO     \\\\\*

FUNCTION SELEADIARIO
PARAMETERS F_DES, F_HAS, N_DES, N_HAS, N_ANIO
WAIT windows "Aguarde un Momento... Ejecutando Consultas..." NOWAIT 
IF !USED("DIARIO") THEN 
	eje= "USE "+mmiservidor+"\datos\diario in 0"
	&eje
ENDIF  
IF !USED("asientosdiario") THEN 
	eje= "USE "+mmiservidor+"\datos\asientosdiario in 0"
	&eje
ENDIF  

SET SAFETY OFF 

arch = mmiestacion+"\temp\tmpsqlasientos.dbf"
IF FILE(arch) THEN 
	IF USED("tmpsqlasientos") then
		SELECT tmpsqlasientos
		USE 
	ENDIF 
	DELETE FILE .\temp\tmpsqlasientos.dbf
	DELETE FILE .\temp\tmpsqlasientos.cdx
	DELETE FILE .\temp\tmpsqlasientos.fpt
ENDIF 

*CREATE TABLE tmpsqlasientos FREE ( ;
*						subdiario			C(2), ;
*						nombre_cta			C(20), ;
*						codigo_cta			C(18), ;
*						monto_debe			N(10,2), ;
*						monto_habe			N(10,2), ;
*						fecha				D, ;
*						detalle				C(40), ;
*						nro_asto_d			N(6), ;
*						codigo_acu			C(18), ;
*						modelo				N(4), ;
*						ejnumero			N(4), ;
*						anio				N(4), ;
*						nro_asto_c			N(6), ;
*						idcomp				N(6), ;
*						didetalle			M, ;
*						dicomp_act			N(4), ;
*						dicomp_nro			N(10), ;
*						dinroastod			N(6))
*						
CREATE TABLE .\temp\tmpsqlasientos FREE ( ;
						subdiario C(2), nombre_cta C(60),	codigo_cta	C(18), ;
						monto_debe N(12,2), monto_habe	N(12,2),fecha	D,detalle	C(40), ;
						nro_asto_d N(6), codigo_acu C(18),modelo	N(4),ejnumero	N(4), ;
						anio N(4), nro_asto_c N(6),idcomp N(6),didetalle	M,dicomp_act N(4), ;
						dicomp_nro N(10),dinroastod N(6))

IF !EMPTY(F_DES) AND !EMPTY(F_HAS) THEN
	SELECT * from asientosdiario INTO TABLE .\TEMP\TASIENTOS WHERE fecha >= F_DES AND fecha <= F_HAS AND !DELETED() ORDER BY nro_asto_d 
ELSE
	SELECT * from asientosdiario INTO TABLE .\TEMP\TASIENTOS WHERE nro_asto_conta >= N_DES AND nro_asto_conta <= N_HAS AND anio = n_anio AND !DELETED() ORDER BY nro_asto_d 
ENDIF 

SELECT tmpsqlasientos
APPEND FROM .\temp\tasientos 

** carga todos los datos del subdiario en tmpsqlasientos
SELECT diario
SET ORDER TO nro_asto_d
SELECT tmpsqlasientos
SET RELATION TO nro_asto_d INTO diario
GO top
replace ALL didetalle 	WITH diario.detalle, ;
			idcomp 		WITH diario.comp_tipo, ;
			dicomp_act	WITH diario.comp_act, ;
			dicomp_nro	WITH diario.comp_nro, ;
			dinroastod	WITH diario.nro_asto_d
SET RELATION TO 
WAIT CLEAR 
SELECT tmpsqlasientos
USE 
ENDFUNC




*//////************************************************\\\\\*
*//////       SELECCION DE ASIENTOS LIBRO DIARIO  MAS RAPIDO    \\\\\*
*** RECIBE COMO PARAMETRO UNA TABLA CON LAS CUENTAS CUYOS ASIENTOS DEBE ELEGIR ***
*** selecciona entonces a partir de esa el parametro es C_CUENTAS

FUNCTION SELDIARIOSQL
PARAMETERS F_DES, F_HAS, C_CUENTAS, N_DES, N_HAS, N_ANIO
WAIT windows "Aguarde un Momento... Ejecutando Consultas..." NOWAIT 
IF !USED("DIARIO") THEN 
	eje= "USE "+mmiservidor+"\datos\diario in 0"
	&eje
ENDIF  
IF !USED("asientosdiario") THEN 
	eje= "USE "+mmiservidor+"\datos\asientosdiario in 0"
	&eje
ENDIF  

SET SAFETY OFF 

arch = mmiestacion+"\temp\tmpsqlasientos.dbf"
IF FILE(arch) THEN 
	IF USED("tmpsqlasientos") then
		SELECT tmpsqlasientos
		USE 
	ENDIF 
	DELETE FILE .\temp\tmpsqlasientos.dbf
	DELETE FILE .\temp\tmpsqlasientos.cdx
	DELETE FILE .\temp\tmpsqlasientos.fpt
ENDIF 


*						
CREATE TABLE .\temp\tmpsqlasientos FREE ( ;
						subdiario C(2), nombre_cta C(60),	codigo_cta	C(18), ;
						monto_debe N(12,2), monto_habe	N(12,2),fecha	D,detalle	C(40), ;
						nro_asto_d N(6), codigo_acu C(18),modelo	N(4),ejnumero	N(4), ;
						anio N(4), nro_asto_c N(6),idcomp N(6),didetalle	M,dicomp_act N(4), ;
						dicomp_nro N(10),dinroastod N(6))

c_where = ""
IF !EMPTY(c_cuentas) THEN 
	c_where = "asientosdiario.codigo_cta in (select codigo_cta from .\temp\"+ALLTRIM(c_cuentas)+" ) and "
ENDIF 

IF !EMPTY(F_DES) AND !EMPTY(F_HAS) THEN
	SELECT * from asientosdiario INTO TABLE .\TEMP\TASIENTOS WHERE fecha >= F_DES AND fecha <= F_HAS AND &c_where !DELETED() ;
			ORDER BY nro_asto_d 
ELSE
	SELECT * from asientosdiario INTO TABLE .\TEMP\TASIENTOS WHERE nro_asto_conta >= N_DES AND nro_asto_conta <= N_HAS AND anio = n_anio AND &c_where !DELETED() ;
			ORDER BY nro_asto_d 
ENDIF 

SELECT tmpsqlasientos
APPEND FROM .\temp\tasientos 

** carga todos los datos del subdiario en tmpsqlasientos
SELECT diario
SET ORDER TO nro_asto_d
SELECT tmpsqlasientos
SET RELATION TO nro_asto_d INTO diario
GO top
replace ALL didetalle 	WITH diario.detalle, ;
			idcomp 		WITH diario.comp_tipo, ;
			dicomp_act	WITH diario.comp_act, ;
			dicomp_nro	WITH diario.comp_nro, ;
			dinroastod	WITH diario.nro_asto_d
SET RELATION TO 
WAIT CLEAR 
SELECT tmpsqlasientos
USE 
ENDFUNC

*************************************************************


FUNCTION IMPUTACODIGO
PARAMETERS P_INDICE, PCUEN
******************************************************************************************
*  RETORNA EL CODIGO_CTA DE LA CUENTA EN LA CUAL SE DEBE IMPUTAR O LA CUAL SE SELECCIONARA
*  DE ACUERDO AL INDICE PASADO , SI PCUEN =1 RETORNA LA CUENTA SI ES 2 EL NOMBRE
******************************************************************************************
 
*- Entorno de datos
area = select()
IF !USED("codigoimputar") THEN 
 EJE = "use "+MMISERVIDOR+"\CODIGOIMPUTAR IN 0"
 &EJE
ENDIF 
SELECT CODIGOIMPUTAR
 
var_retor1 = ""
var_retor2 = ""
select codigo_cta, nombre from codigoimputar into cursor selcodimpu ;
where codigoimputar.indice = P_INDICE
 
if _tally = 0
	 VAR_RETOR1 = ""
	 VAR_RETOR2 = ""
ELSE
	 VAR_RETOR1 = ALLTRIM(selcodimpu.codigo_cta)
	 VAR_RETOR2 = ALLTRIM(selcodimpu.nombre)
endif
 
*- Restaura entorno
USE IN selcodimpu
If alias(area)>' '
	 select int(area)
Endif
 
IF PCUEN = 1 THEN 
	RETURN var_retor1
ELSE 
	RETURN var_retor2
ENDIF 
ENDFUNC 
 
 

 
***/////////////////////////////////////////////////***
***    REENUMERACION DE ASIENTOS SUBDIARIOS         ***
***/////////////////////////////////////////////////***
FUNCTION NUMERASUBDI
PARAMETERS P_PERIODO
IF !USED("subdiarios") THEN 
	eje= "USE "+mmiservidor+"\datos\subdiarios in 0"
	&eje
ENDIF  
IF !USED("asientos") THEN 
	eje= "USE "+mmiservidor+"\datos\asientos in 0"
	&eje
ENDIF  
SELECT FECHA, NRO_ASTO, nro_asto_conta as nro_asto_c, 0 AS RENUMERADO FROM subdiarios ;
INTO TABLE .\TEMP\TMPCONTROL ;
WHERE ANIO = P_PERIODO 
INDEX ON FECHA TAG FECHA
GO TOP
N = 0
DO WHILE !EOF()
	N = N + 1
	WAIT WINDOWS "Numerando Asiento N°:  "+ALLTRIM(STR(N)) NOWAIT 
	UPDATE subdiarios SET nro_asto_conta=N 			WHERE nro_asto = tmpcontrol.nro_asto
	UPDATE asientos   set nro_asto_conta=N 	        WHERE nro_asto = tmpcontrol.nro_asto
	SELECT tmpcontrol
	replace renumerado WITH 1
	SKIP 
ENDDO 
WAIT WINDOWS "Numeración Terminada..." NOWAIT 
ENDFUNC 


**//////////////////////////////////////////////////***
***  REENUMERACION DE ASIENTOS LIBRO DIARIO         ***
***/////////////////////////////////////////////////***
FUNCTION NUMERADIARIO
PARAMETERS P_PERIODO
IF !USED("diario") THEN 
	eje= "USE "+mmiservidor+"\datos\diario in 0"
	&eje
ENDIF  
IF !USED("asientosdiario") THEN 
	eje= "USE "+mmiservidor+"\datos\asientosdiario in 0"
	&eje
ENDIF  
SELECT FECHA,RECNO() as regnro, NRO_ASTO_D, nro_asto_conta as nro_asto_c, 0 AS RENUMERADO FROM DIARIO ;
INTO TABLE .\TEMP\TMPCONTROL ;
WHERE ANIO = P_PERIODO 
INDEX ON DTOC(FECHA)+STR(regnro) TAG FECHA
GO TOP
N = 0
DO WHILE !EOF()
	N = N + 1
	WAIT WINDOWS "Numerando Asiento N°:  "+ALLTRIM(STR(N)) NOWAIT 
	UPDATE diario SET nro_asto_conta=N 			WHERE nro_asto_d = tmpcontrol.nro_asto_d
	UPDATE asientosdiario set nro_asto_conta=N 	WHERE nro_asto_d = tmpcontrol.nro_asto_d
	SELECT tmpcontrol
	replace renumerado WITH 1
	SKIP 
ENDDO 
WAIT WINDOWS "Numeración Terminada..." NOWAIT 
ENDFUNC 



**** INCREMENTA OBTIENE E INCREMENTA EL NRO DE ASIENTO Y NRO_ASTO_CONTA
**** PARA EVITAR QUE SE DUPLIQUE EL NUMERO
FUNCTION INCRENROASTO
NAREAN = ALIAS()
IF !USED("PARAMETROS") THEN 
	eje= "USE "+mmiservidor+"\datos\parametros in 0"
	&eje
ENDIF  
SELECT parametros
GO TOP 
devuelve = "#"
i = 0
DO WHILE i = 0
	IF LOCK("parametros")=.t. THEN 
		replace parametros.nro_asto WITH (parametros.nro_asto + 1), parametros.nro_asto_conta WITH (parametros.nro_asto_conta + 1)
		UNLOCK IN parametros 
		devuelve = ALLTRIM(STR(parametros.nro_asto))+"#"+ALLTRIM(STR(parametros.nro_asto_conta))
		i = 1
	ENDIF 
ENDDO 
WAIT CLEAR 
SELECT &NAREAN 
RETURN DEVUELVE
ENDFUNC 


FUNCTION DIVIDEASTO
PARAMETERS DIVIDIR , DEVOLVER
VAL1 = SUBSTR(DIVIDIR,1,(ATC("#",DIVIDIR)-1))
VAL2 = SUBSTR(DIVIDIR,(ATC("#",DIVIDIR)+1))
IF DEVOLVER = 1 THEN
	NASIENTON = INT(VAL(VAL1))
ELSE
	NASIENTON = INT(VAL(VAL2))
ENDIF 
RETURN NASIENTON
ENDFUNC 