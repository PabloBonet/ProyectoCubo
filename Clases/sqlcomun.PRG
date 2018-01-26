unddatos='\\lario7000\sanguango\datos\'
set step on

set classlib to \\lario7000\ctascte\sqlcomun
public SQLMatriz(20), SQLObjeto
SQLObjeto=CREATEOBJECT("sqlcomun.SQLClass")

&&--esto esta definido en el login---
public on_error	
on_error=' do f:\errores.prg with error(), message(), message(1), program(), lineno()'
*on error do f:\errores.prg with error(), message(), message(1), program(), lineno()
on error &on_error
&&------------------------------------

set step on
wait window "Conectandose con el servidor de SQL..." NOWAIT
if SQLObjeto.InicioSQLServer('DATOS') &&DATOSPRU, DATOSEST o DATOS
	wait clear
	
	**ejemplo
*	if SQLObjeto.sqlIniciarTrans()
*		if SQLObjeto.sqlCerrarTrans()  &&1:commit, 0:rollback
*		else
*			**no se pudo cerrar transaccion
*		endif
		sqlmatriz(1)="select .1* from depositos "
		if SQLObjeto.SQLRun("SQLRESULT")
		else
			**error 
		endif
*	else
		**no se puede iniciar transaccion
*	endif

	SQLObjeto.FinSQLServer()
endif
release SQLObjeto
