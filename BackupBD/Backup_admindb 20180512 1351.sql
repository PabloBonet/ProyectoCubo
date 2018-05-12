-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.55-0+deb8u1


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema admindb
--

CREATE DATABASE IF NOT EXISTS admindb;
USE admindb;

--
-- Definition of table `bibliotecaf`
--

DROP TABLE IF EXISTS `bibliotecaf`;
CREATE TABLE `bibliotecaf` (
  `nombre` char(50) NOT NULL,
  `parametros` char(100) NOT NULL,
  `tipo` char(1) NOT NULL,
  `detalle` char(254) NOT NULL,
  `libreria` char(50) NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bibliotecaf`
--

/*!40000 ALTER TABLE `bibliotecaf` DISABLE KEYS */;
INSERT INTO `bibliotecaf` (`nombre`,`parametros`,`tipo`,`detalle`,`libreria`) VALUES 
 ('FUNCION1','TITULO, ID','F','FUNCION 1 BLA BLA BLA BLAAAAA','LIBRERIA1'),
 ('FUNCION2','PARAMETRO1, PARAMETRO2','P','DAKDLADKASDASDJASLKDAJSDKLSKDALL','LIBRERIA2');
/*!40000 ALTER TABLE `bibliotecaf` ENABLE KEYS */;


--
-- Definition of table `esquemas`
--

DROP TABLE IF EXISTS `esquemas`;
CREATE TABLE `esquemas` (
  `idesquema` int(11) NOT NULL DEFAULT '0',
  `descrip` char(50) NOT NULL DEFAULT '',
  `schemma` char(25) NOT NULL DEFAULT '',
  `driver` char(50) NOT NULL DEFAULT '',
  `host` char(50) NOT NULL DEFAULT '',
  `port` char(4) NOT NULL DEFAULT '3306',
  `usuario` char(20) NOT NULL DEFAULT '',
  `password` char(25) NOT NULL DEFAULT '',
  `fondo` char(200) NOT NULL DEFAULT 'N',
  `colorfondo` char(200) NOT NULL,
  `habilitado` char(1) NOT NULL DEFAULT 'S',
  `idempresa` int(10) unsigned NOT NULL,
  `idsucursal` int(10) unsigned NOT NULL,
  `path` varchar(80) NOT NULL,
  PRIMARY KEY (`idesquema`),
  KEY `schemma` (`schemma`),
  KEY `usuario` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `esquemas`
--

/*!40000 ALTER TABLE `esquemas` DISABLE KEYS */;
INSERT INTO `esquemas` (`idesquema`,`descrip`,`schemma`,`driver`,`host`,`port`,`usuario`,`password`,`fondo`,`colorfondo`,`habilitado`,`idempresa`,`idsucursal`,`path`) VALUES 
 (0,'Server Fede','trsoftdb','{MySQL ODBC 3.51 Driver}','192.168.1.100','3306','tulior','owntod93','N','8454016','S',0,0,''),
 (1,'COSEMAR','cosemardb','{MySQL ODBC 3.51 Driver}','tuly.changeip.org','3306','tulior','owntod93','','8454143','S',0,0,''),
 (2,'COSEMAR-CASA','cosemardb','{MySQL ODBC 3.51 Driver}','server.casa','3306','tulior','owntod93','','8454143','S',0,0,''),
 (3,'TRSoft-IT','trsoftdb','{MySQL ODBC 3.51 Driver}','10.0.1.2','3306','tulior','owntod93','','8454143','S',0,0,''),
 (4,'KRUMBEIN-CASA-EXT','krumbeindb','{MySQL ODBC 3.51 Driver}','tuly.changeip.org','3306','tulior','owntod93','','8454143','S',0,0,'C:/Proyectos/Krumbein/MKMySQL/Fuentes/'),
 (5,'Esquema de Cosemar Para Fede','cosemarfede','{MySQL ODBC 3.51 Driver}','tuly.changeip.org','3306','tulior','owntod93','','8454143','S',0,0,''),
 (6,'Comuna Margarita','dbcomuna','{MySQL ODBC 3.51 Driver}','debian','3306','tulior','owntod93','20131231_220946.jpg','8454016','S',0,0,''),
 (7,'TRSoft-Desarrollo','trsoftdb','{MySQL ODBC 3.51 Driver}','190.225.164.12','3307','tulior','owntod93','N','8454016','S',0,0,' '),
 (8,'localhost','trsoftdb','{MySQL ODBC 3.51 Driver}','localhost','3306','root','root','','8454016','S',0,0,' '),
 (9,'Debian Virtual','trsoftdb','{MySQL ODBC 3.51 Driver}','192.168.150.100','3306','tulior','owntod93','N','8454016','S',0,0,' ');
/*!40000 ALTER TABLE `esquemas` ENABLE KEYS */;


--
-- Definition of table `iconos`
--

DROP TABLE IF EXISTS `iconos`;
CREATE TABLE `iconos` (
  `idicono` int(10) unsigned NOT NULL,
  `nombre` char(50) NOT NULL,
  `archivo` char(50) NOT NULL,
  `tooltip` char(50) NOT NULL,
  `teclafn` char(50) NOT NULL,
  PRIMARY KEY (`idicono`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `iconos`
--

/*!40000 ALTER TABLE `iconos` DISABLE KEYS */;
INSERT INTO `iconos` (`idicono`,`nombre`,`archivo`,`tooltip`,`teclafn`) VALUES 
 (0,'cerrar','cerrar.png','Cerrar',''),
 (1,'editar','editar.png','Editar',''),
 (2,'eliminar','eliminar.png','Eliminar',''),
 (3,'guardar','guardar.png','Guardar',''),
 (4,'imprimir','imprimir.png','Imprimir',''),
 (5,'nuevo','nuevo.png','Nuevo',''),
 (6,'cancelar','cancelar.png','Cancelar',''),
 (7,'actualizar','actualizar.png','Actualizar',''),
 (8,'credito','peso.png','Crédito',''),
 (9,'empleado','empleado.png','Empleados / Contactos',''),
 (10,'servicios','perfil.png','Servicios - Sub Cuentas',''),
 (11,'importar','subir.png','Importar desde archivo',''),
 (12,'nuevo1','nuevo1.png','Nuevo',''),
 (13,'editar1','editar1.png','Editar',''),
 (14,'anular','eliminar2.png','Anular',''),
 (15,'buscar1','buscar1.png','buscar',''),
 (16,'ayuda','info1.png','Ayuda',''),
 (17,'entidad','entidad.png','Entidad','');
/*!40000 ALTER TABLE `iconos` ENABLE KEYS */;


--
-- Definition of table `modulossys`
--

DROP TABLE IF EXISTS `modulossys`;
CREATE TABLE `modulossys` (
  `idmodulo` int(10) unsigned NOT NULL,
  `modulo` char(254) NOT NULL,
  `habilitado` char(1) NOT NULL,
  PRIMARY KEY (`idmodulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `modulossys`
--

/*!40000 ALTER TABLE `modulossys` DISABLE KEYS */;
INSERT INTO `modulossys` (`idmodulo`,`modulo`,`habilitado`) VALUES 
 (1,'modulo 1','1'),
 (2,'modulo 2','1');
/*!40000 ALTER TABLE `modulossys` ENABLE KEYS */;


--
-- Definition of table `settoolbarsys`
--

DROP TABLE IF EXISTS `settoolbarsys`;
CREATE TABLE `settoolbarsys` (
  `idset` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form` char(100) NOT NULL,
  `idobjeto` char(2) NOT NULL,
  `icono` char(100) NOT NULL,
  `funcion` char(100) NOT NULL,
  `habilita` char(1) NOT NULL,
  `visible` char(1) NOT NULL,
  `tooltip` char(100) NOT NULL,
  `active` char(1) NOT NULL,
  PRIMARY KEY (`idset`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settoolbarsys`
--

/*!40000 ALTER TABLE `settoolbarsys` DISABLE KEYS */;
INSERT INTO `settoolbarsys` (`idset`,`form`,`idobjeto`,`icono`,`funcion`,`habilita`,`visible`,`tooltip`,`active`) VALUES 
 (1,'provinciasabm','14','cerrar1.png','cerrar()','1','1','Cerrar Otro','1'),
 (2,'provinciasabm','08','imprimir1.png','imprimir()','1','1','Imprimir','1'),
 (3,'_screen','01','cerrar1.png','salirmenu()','1','1','Cerrar Sistema','0'),
 (4,'provinciasabm','12','','filtrar()','1','1','Ingrese Texto','1'),
 (5,'provinciasabm','13','buscar1.png','filtrar()','1','1','Buscar','1'),
 (6,'serviciosabm2','14','cerrar1.png','cerrar()','1','1','Cerrar','1'),
 (7,'serviciosabm2','01','imprimir1.png','imprimir()','1','1','Imprimir','1'),
 (8,'serviciosabm2','12','','filtrar()','1','1','Ingrese Texto','1'),
 (9,'serviciosabm2','13','buscar1.png','filtrar()','1','1','Buscar','1'),
 (10,'toolbarsysabm','13','cerrar1.png','cerrar()','1','1','Cerrar','1'),
 (11,'entidades','14','cerrar1.png','cerrar()','1','1','Cerrar','1'),
 (12,'entidades','12','','filtrar()','1','1','Buscar','1'),
 (13,'entidades','13','buscar1.png','filtrar()','1','1','Filtrar','1'),
 (14,'toolbarsysabm','10','actualizar1.png','actualizar()','1','1','Actualizar Barra','1'),
 (15,'toolbarsysabm','01','nuevo1.png','nuevo()','1','1','Nuevo','1'),
 (16,'lineasabm','14','cerrar1.png','cerrar()','1','1','Cerrar','1'),
 (17,'lineasabm','12','','filtrar()','1','1','Buscar Texto','1'),
 (18,'toolbarsysabm','02','gurdar1.png','guardar()','1','1','Guardar','1'),
 (19,'toolbarsysabm','12','','filtrar()','1','0','Ingrese Texto','1'),
 (20,'empresasabm','18','cerrar1.png','cerrar()','1','1','Cerrar','1'),
 (21,'articulos','20','cerrar1.png','cerrar()','1','1','Cerrar','1'),
 (22,'articulos','12','','filtrar()','1','1','Ingrese Texto','1'),
 (23,'articulos','01','nuevo1.png','nuevo','1','0','Nuevo Artículo','1'),
 (24,'articulos','03','gurdar1.png','guardar','1','1','Guardar','1'),
 (25,'articulos','04','eliminar1.png','eliminar','1','1','Eliminar Artículo','1'),
 (26,'articulos','02','cancelar1.png','cancelar','1','1','Cancelar','1'),
 (27,'articulos','06','editar1.png','modificar','1','1','Modificar','1'),
 (28,'entidades','06','peso1.png','credito','1','1','Crédito','1'),
 (29,'zonasabm','19','cerrar1.png','cerrar()','1','1','Cerrar Zona','1'),
 (30,'entidades','01','nuevo1.png','nuevo()','1','1','Nuevo','1'),
 (31,'entidades','02','editar1.png','modificar()','1','1','Modificar','1'),
 (34,'entidades','07','empleado1.png','empleados()','1','1','Empleados / Contactos','1'),
 (35,'entidades','05','imprimir1.png','imprimir()','1','1','Imprimir','1'),
 (36,'entidades','03','eliminar1.png','eliminar','1','1','Eliminar','1'),
 (37,'toolbarsysabm','03','eliminar1.png','eliminar()','1','1','Eliminar','1'),
 (38,'toolbarsysabm','04','imprimir1.png','imprimir','1','1','Imprimir','1'),
 (39,'iconosabm','14','cerrar1.png','cerrar()','1','1','Cerrar','1'),
 (40,'articulos','05','imprimir1.png','imprimir','1','1','Imprimir','1'),
 (41,'facturas','20','cerrar1.png','cerrar()','1','1','','1'),
 (42,'otpedidos','20','cerrar1.png','cerrar','1','1','Cerrar','1'),
 (43,'otejecum','20','cerrar1.png','cerrar','1','1','Cerrar','1'),
 (44,'otejecum','01','gurdar1.png','guardar','1','1','Guardar','1'),
 (45,'otejecum','03','buscar1.png','buscarotMateriales','1','1','Buscar Materiales','1'),
 (46,'otejecum','02','buscar1.png','buscarot','1','1','Buscar OT','1'),
 (47,'otmovistock','01','gurdar1.png','guardar','1','1','Guardar','1'),
 (48,'otmovistock','02','imprimir1.png','imprimir','1','1','Imprimir','1'),
 (49,'otmovistock','03','entidad1.png','buscarentidades','1','1','Entidades','1'),
 (50,'otmovistock','20','cerrar1.png','cerrar','1','1','Cerrar','1'),
 (51,'otmateriales','01','nuevo1.png','nuevo','1','1','Nuevo','1'),
 (52,'otmateriales','02','cancelar1.png','cancelar','1','1','Cancelar','1'),
 (53,'otmateriales','03','gurdar1.png','guardar','1','1','Guardar','1'),
 (54,'otmateriales','04','eliminar1.png','eliminar','1','1','Eliminar','1'),
 (55,'otmateriales','05','imprimir1.png','imprimir','1','1','Imprimir','1'),
 (56,'otmateriales','06','actualizar1.png','actualizar','1','1','Actualizar','1'),
 (57,'otmateriales','07','subir1.png','importarLista','1','1','Importar LIsta','1'),
 (58,'otmateriales','20','cerrar1.png','cerrar','1','1','Cerrar','1'),
 (59,'otetapas','01','nuevo1.png','nuevo','1','1','Nuevo','1'),
 (60,'otetapas','02','cancelar1.png','cancelar','1','1','Cancelar','1'),
 (61,'otetapas','03','gurdar1.png','guardar','1','1','Guardar','1'),
 (62,'otetapas','04','eliminar1.png','eliminar','1','1','Eliminar','1'),
 (63,'otetapas','05','imprimir1.png','imprimir','1','1','Imprimir','1'),
 (64,'otetapas','20','cerrar1.png','cerrar','1','1','Cerrar','1'),
 (65,'buscaotmateriales','01','ok1.png','seleccionar','1','1','Seleccionar','1'),
 (66,'buscaotmateriales','20','cerrar1.png','cerrar','1','1','Salir','1'),
 (67,'otlistadostock','01','imprimir1.png','imprimir','1','1','Imprimir','1'),
 (68,'otlistadostock','02','materiales1.png','buscarotMateriales','1','1','Materiales','1'),
 (69,'otlistadostock','20','cerrar1.png','cerrar','1','1','Cerrar','1');
/*!40000 ALTER TABLE `settoolbarsys` ENABLE KEYS */;


--
-- Definition of table `varpublicas`
--

DROP TABLE IF EXISTS `varpublicas`;
CREATE TABLE `varpublicas` (
  `variable` char(50) NOT NULL,
  `tipo` char(1) NOT NULL,
  `valor` char(100) NOT NULL,
  `detalle` char(254) NOT NULL,
  `grupo` char(2) NOT NULL,
  `eliminar` char(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`variable`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `varpublicas`
--

/*!40000 ALTER TABLE `varpublicas` DISABLE KEYS */;
INSERT INTO `varpublicas` (`variable`,`tipo`,`valor`,`detalle`,`grupo`,`eliminar`) VALUES 
 ('_SYSADMIN','C','admin','Usuario administrador para acceso a configuracion de Menues','1','S'),
 ('_SYSBMPFONDO','C','\"\"','Archivo con Imagen de Fondo','1','S'),
 ('_SYSCAJARECA','N','0','Variable control de grabación de caja recaudadora','1','N'),
 ('_SYSCOLORFONDO','C','RGB(192,192,192)','Color del Fondo de Sistema','1','S'),
 ('_SYSCONCEPTOAFIP','N','1','Guarda Concepto AFIP (1: Prod. 2: Serv. 3: Productos y Servicios','','S'),
 ('_SYSDESCRIP','C','Administración Principal','Descripcion de la Base de Datos conectada','1','S'),
 ('_SYSESTACION','C','C:\\TRSofttmp','Carpeta de destino de los archivos borrados','1','S'),
 ('_SYSLONGCART','N','10','Longitud de codificacion de Articulos','1','S'),
 ('_SYSPAPELERA','C','RECYCLE','Indica si los delete van a parar a la papelera','1','S'),
 ('_SYSPASSADMIN','C','1','Password para usuario administrador de Menues y seteos','1','S'),
 ('_SYSREPORTES','C','reportes','Ubicacion dentro del Sistema de los Reportes','1','N'),
 ('_SYSTITULO','C','TRSoft V0','Titulo para arranque del sistema en la barra superior','1','S');
/*!40000 ALTER TABLE `varpublicas` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
