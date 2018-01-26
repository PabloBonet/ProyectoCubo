lcServer="debian" 
lcDatabase="dbcomuna"
lcUser="tulio"
lcPassword="tulior"
lcStringConn="Driver={MySQL ODBC 3.51 Driver};Port=3306"+;
";Server="+lcServer+;
";Database="+lcDatabase+;
";Uid="+lcUser+;
";Pwd="+lcPassWord
***Evitar que aparezca la ventana de login 
*SQLSETPROP(0,"DispLogin",3)
PUBLIC lnHandle
lnHandle=SQLSTRINGCONNECT(lcStringConn)
IF lnHandle > 0
*	SQLEXEC(lnHandle,"insert into prueba (item,idp,codigo,cantidad,detalle,unidad,proveedor) values (1,2,'a',10,'deta','uni','provee')","sin")
*	?SQLTABLES(lnHandle,"TABLES")
	?SQLEXEC(lnHandle,"select * from boletah ","auxi")
*	?SQLEXEC(lnHandle,"CREATE TABLE `maestros`.`movimientos`(`movimiento` INTEGER ,  `nombre` char(80) ,  `documov` char(10) ,  `registro` char(14) ,  `fhregistro` char(16) ,  INDEX `NOMBRE`(`nombre`),  INDEX `MOVIMIENTO`(`movimiento`),  INDEX `FHREGISTRO`(`fhregistro`),  INDEX `REGISTRO`(`registro`))TYPE = MYISAM ","aux")
	BROWSE 
*	SQLDISCONNECT(lnHandle)
ELSE
	=AERROR(laError)
	MESSAGEBOX("Error de conexión"+CHR(13)+;
	"Descripcion:"+laError[2])
ENDIF

*"CREATE TABLE `maestros`.`movimientos` (  `movimiento` INTEGER ,  `nombre` char(80) ,  `documov` char(10) ,  `registro` char(14) ,  `fhregistro` char(16) ,  INDEX `NOMBRE`(`nombre`),  INDEX `MOVIMIENTO`(`movimiento`),  INDEX `FHREGISTRO`(`fhregistro`),  INDEX `REGISTRO`(`registro`))TYPE = MYISAM "