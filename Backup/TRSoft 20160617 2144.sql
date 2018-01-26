-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.73-1-log


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
 (3,'TRSoft-IT','trsoftdb','{MySQL ODBC 3.51 Driver}','server.casa','3306','tulior','owntod93','','8454143','S',0,0,''),
 (4,'KRUMBEIN-CASA-EXT','krumbeindb','{MySQL ODBC 3.51 Driver}','tuly.changeip.org','3306','tulior','owntod93','','8454143','S',0,0,'C:/Proyectos/Krumbein/MKMySQL/Fuentes/'),
 (5,'Esquema de Cosemar Para Fede','cosemarfede','{MySQL ODBC 3.51 Driver}','tuly.changeip.org','3306','tulior','owntod93','','8454143','S',0,0,''),
 (6,'Comuna Margarita','dbcomuna','{MySQL ODBC 3.51 Driver}','debian','3306','tulior','owntod93','20131231_220946.jpg','8454016','S',0,0,''),
 (7,'TRSoft-Desarrollo','trsoftdb','{MySQL ODBC 3.51 Driver}','190.225.164.12','3307','tulior','owntod93','N','8454016','S',0,0,' ');
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
  PRIMARY KEY (`idicono`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `iconos`
--

/*!40000 ALTER TABLE `iconos` DISABLE KEYS */;
INSERT INTO `iconos` (`idicono`,`nombre`,`archivo`,`tooltip`) VALUES 
 (0,'cerrar','cerrar.png','Cerrar'),
 (2,'eliminar','eliminar.png','Eliminar'),
 (3,'guardar','guardar.png','Guardar');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settoolbarsys`
--

/*!40000 ALTER TABLE `settoolbarsys` DISABLE KEYS */;
INSERT INTO `settoolbarsys` (`idset`,`form`,`idobjeto`,`icono`,`funcion`,`habilita`,`visible`,`tooltip`,`active`) VALUES 
 (1,'provinciasabm','14','exit1.png','cerrar()','1','1','Cerrar','1'),
 (2,'provinciasabm','02','wzprint.bmp','imprimir()','1','1','Imprimir','1'),
 (3,'_screen','01','exit1.png','salirmenu()','1','1','Cerrar Sistema','0'),
 (4,'provinciasabm','12','','filtrar()','1','1','Ingrese Texto','1'),
 (5,'provinciasabm','13','locate.bmp','filtrar()','1','1','Buscar','1'),
 (6,'provinciasabm','21','','','1','1','','1'),
 (7,'provinciasabm','22','','','1','1','','1');
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
  PRIMARY KEY (`variable`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `varpublicas`
--

/*!40000 ALTER TABLE `varpublicas` DISABLE KEYS */;
INSERT INTO `varpublicas` (`variable`,`tipo`,`valor`,`detalle`,`grupo`) VALUES 
 ('_SYSADMIN','C','admin','Usuario administrador para acceso a configuracion de Menues','1'),
 ('_SYSBMPFONDO','C','\"\"','Archivo con Imagen de Fondo','1'),
 ('_SYSCOLORFONDO','C','RGB(192,192,192)','Color del Fondo de Sistema','1'),
 ('_SYSDESCRIP','C','Administración Principal','Descripcion de la Base de Datos conectada','1'),
 ('_SYSESTACION','C','C:\\TRSofttmp','Carpeta de destino de los archivos borrados','1'),
 ('_SYSPAPELERA','C','RECYCLE','Indica si los delete van a parar a la papelera','1'),
 ('_SYSPASSADMIN','C','1','Password para usuario administrador de Menues y seteos','1'),
 ('_SYSTITULO','C','TRSoft_Proyecto V0','Titulo para arranque del sistema en la barra superior','1');
/*!40000 ALTER TABLE `varpublicas` ENABLE KEYS */;

--
-- Create schema cosemarfede
--

CREATE DATABASE IF NOT EXISTS cosemarfede;
USE cosemarfede;

--
-- Definition of table `agendan`
--

DROP TABLE IF EXISTS `agendan`;
CREATE TABLE `agendan` (
  `idagenda` int(11) NOT NULL DEFAULT '0',
  `fechan` char(8) NOT NULL DEFAULT '',
  `horan` char(10) NOT NULL DEFAULT '',
  `detallen` char(254) NOT NULL DEFAULT '',
  PRIMARY KEY (`idagenda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agendan`
--

/*!40000 ALTER TABLE `agendan` DISABLE KEYS */;
/*!40000 ALTER TABLE `agendan` ENABLE KEYS */;


--
-- Definition of table `agendap`
--

DROP TABLE IF EXISTS `agendap`;
CREATE TABLE `agendap` (
  `idagenda` int(11) NOT NULL DEFAULT '0',
  `fecha` char(8) NOT NULL DEFAULT '',
  `hora` char(10) NOT NULL DEFAULT '',
  `usuario1` char(20) NOT NULL DEFAULT '',
  `usuario2` char(20) NOT NULL DEFAULT '',
  `codigosp` int(11) NOT NULL DEFAULT '0',
  `nombre` char(100) NOT NULL DEFAULT '',
  `socioprove` char(1) NOT NULL DEFAULT '',
  `fechalar` char(8) NOT NULL DEFAULT '',
  `horaalar` char(10) NOT NULL DEFAULT '',
  `alarma` char(1) NOT NULL DEFAULT '',
  `detalle` char(254) NOT NULL DEFAULT '',
  PRIMARY KEY (`idagenda`),
  KEY `horaalar` (`horaalar`),
  KEY `fechalar` (`fechalar`),
  KEY `codigosp` (`codigosp`),
  KEY `usuario1` (`usuario1`),
  KEY `hora` (`hora`),
  KEY `fecha` (`fecha`),
  KEY `fechahoraa` (`fechalar`,`horaalar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agendap`
--

/*!40000 ALTER TABLE `agendap` DISABLE KEYS */;
/*!40000 ALTER TABLE `agendap` ENABLE KEYS */;


--
-- Definition of table `aplicacobroh`
--

DROP TABLE IF EXISTS `aplicacobroh`;
CREATE TABLE `aplicacobroh` (
  `idaplicapago` int(11) NOT NULL DEFAULT '0',
  `idrecibo` int(11) NOT NULL DEFAULT '0',
  `importerecibo` float(13,2) NOT NULL DEFAULT '0.00',
  `importeaplicado` float(13,2) NOT NULL DEFAULT '0.00',
  `usadototalmente` char(1) NOT NULL DEFAULT '',
  KEY `idrecibo` (`idrecibo`),
  KEY `idaplicapa` (`idaplicapago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aplicacobroh`
--

/*!40000 ALTER TABLE `aplicacobroh` DISABLE KEYS */;
/*!40000 ALTER TABLE `aplicacobroh` ENABLE KEYS */;


--
-- Definition of table `aplicacobrop`
--

DROP TABLE IF EXISTS `aplicacobrop`;
CREATE TABLE `aplicacobrop` (
  `idaplicapago` int(11) NOT NULL DEFAULT '0',
  `fecha` char(8) NOT NULL DEFAULT '',
  `cod_cli` int(11) NOT NULL DEFAULT '0',
  `apellido` char(60) NOT NULL DEFAULT '',
  `nombre` char(60) NOT NULL DEFAULT '',
  `cuit` char(13) NOT NULL DEFAULT '',
  `cond_iva` int(11) NOT NULL DEFAULT '0',
  `calle` char(40) NOT NULL DEFAULT '',
  `deudatotal` float(13,2) NOT NULL DEFAULT '0.00',
  `totalaplicado` float(13,2) NOT NULL DEFAULT '0.00',
  `facturascanceladas` int(11) NOT NULL DEFAULT '0',
  `pagosacuentausados` int(11) NOT NULL DEFAULT '0',
  `contabilizado` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idaplicapago`),
  KEY `cod_cli` (`cod_cli`),
  KEY `fecha` (`fecha`),
  KEY `asiento` (`contabilizado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aplicacobrop`
--

/*!40000 ALTER TABLE `aplicacobrop` DISABLE KEYS */;
/*!40000 ALTER TABLE `aplicacobrop` ENABLE KEYS */;


--
-- Definition of table `aplicapagoh`
--

DROP TABLE IF EXISTS `aplicapagoh`;
CREATE TABLE `aplicapagoh` (
  `idaplicapago` int(11) NOT NULL DEFAULT '0',
  `idrecibo` int(11) NOT NULL DEFAULT '0',
  `importerecibo` float(13,2) NOT NULL DEFAULT '0.00',
  `importeaplicado` float(13,2) NOT NULL DEFAULT '0.00',
  `usadototalmente` char(1) NOT NULL DEFAULT '',
  KEY `idrecibo` (`idrecibo`),
  KEY `idaplicapa` (`idaplicapago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aplicapagoh`
--

/*!40000 ALTER TABLE `aplicapagoh` DISABLE KEYS */;
/*!40000 ALTER TABLE `aplicapagoh` ENABLE KEYS */;


--
-- Definition of table `aplicapagop`
--

DROP TABLE IF EXISTS `aplicapagop`;
CREATE TABLE `aplicapagop` (
  `idaplicapago` int(11) NOT NULL DEFAULT '0',
  `fecha` char(8) NOT NULL DEFAULT '',
  `cod_prov` int(11) NOT NULL DEFAULT '0',
  `apellido` char(40) NOT NULL DEFAULT '',
  `nombre` char(40) NOT NULL DEFAULT '',
  `cuit` char(13) NOT NULL DEFAULT '',
  `cond_iva` int(11) NOT NULL DEFAULT '0',
  `calle` char(40) NOT NULL DEFAULT '',
  `deudatotal` float(13,2) NOT NULL DEFAULT '0.00',
  `totalaplicado` float(13,2) NOT NULL DEFAULT '0.00',
  `facturascanceladas` int(11) NOT NULL DEFAULT '0',
  `pagosacuentausados` int(11) NOT NULL DEFAULT '0',
  `contabilizado` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idaplicapago`),
  KEY `cod_prov` (`cod_prov`),
  KEY `fecha` (`fecha`),
  KEY `asiento` (`contabilizado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aplicapagop`
--

/*!40000 ALTER TABLE `aplicapagop` DISABLE KEYS */;
/*!40000 ALTER TABLE `aplicapagop` ENABLE KEYS */;


--
-- Definition of table `arqueocaja`
--

DROP TABLE IF EXISTS `arqueocaja`;
CREATE TABLE `arqueocaja` (
  `planilla` char(1) NOT NULL DEFAULT '',
  `numero` int(11) NOT NULL DEFAULT '0',
  `fecha` char(8) NOT NULL DEFAULT '',
  `cheques` float(13,2) NOT NULL DEFAULT '0.00',
  `efectivo` float(13,2) NOT NULL DEFAULT '0.00',
  `cupones` float(13,2) NOT NULL DEFAULT '0.00',
  `bill100` int(11) NOT NULL DEFAULT '0',
  `bill050` int(11) NOT NULL DEFAULT '0',
  `bill020` int(11) NOT NULL DEFAULT '0',
  `bill010` int(11) NOT NULL DEFAULT '0',
  `bill005` int(11) NOT NULL DEFAULT '0',
  `bill002` int(11) NOT NULL DEFAULT '0',
  `mon1` int(11) NOT NULL DEFAULT '0',
  `mon050` int(11) NOT NULL DEFAULT '0',
  `mon025` int(11) NOT NULL DEFAULT '0',
  `mon010` int(11) NOT NULL DEFAULT '0',
  `mon005` int(11) NOT NULL DEFAULT '0',
  KEY `numero` (`numero`),
  KEY `fecha` (`fecha`),
  KEY `planilla` (`planilla`,`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `arqueocaja`
--

/*!40000 ALTER TABLE `arqueocaja` DISABLE KEYS */;
/*!40000 ALTER TABLE `arqueocaja` ENABLE KEYS */;


--
-- Definition of table `asientos`
--

DROP TABLE IF EXISTS `asientos`;
CREATE TABLE `asientos` (
  `subdiario` char(2) NOT NULL DEFAULT '',
  `nombre_cta` char(80) NOT NULL DEFAULT '',
  `codigo_cta` char(18) NOT NULL DEFAULT '',
  `monto_debe` float(13,2) NOT NULL DEFAULT '0.00',
  `monto_habe` float(13,2) NOT NULL DEFAULT '0.00',
  `fecha` char(8) NOT NULL DEFAULT '',
  `detalle` char(254) NOT NULL DEFAULT '',
  `nro_asto` int(11) NOT NULL DEFAULT '0',
  `codigo_acu` char(18) NOT NULL DEFAULT '',
  `modelo` int(11) NOT NULL DEFAULT '0',
  `ejnumero` int(11) NOT NULL DEFAULT '0',
  `anio` int(11) NOT NULL DEFAULT '0',
  `nro_asto_conta` int(11) NOT NULL DEFAULT '0',
  `comp_tipo` int(11) NOT NULL DEFAULT '0',
  `comp_prov` char(2) NOT NULL DEFAULT '',
  `tipo_prov` char(1) NOT NULL DEFAULT '',
  `comp_act` int(11) NOT NULL DEFAULT '0',
  `comp_nro` int(11) NOT NULL DEFAULT '0',
  `fecha_prov` char(8) NOT NULL DEFAULT '',
  `idreg_prov` int(11) NOT NULL DEFAULT '0',
  `cod_prov` int(11) NOT NULL DEFAULT '0',
  `usuario` char(30) NOT NULL DEFAULT '',
  `usuario_fe` char(8) NOT NULL DEFAULT '',
  `nro_asto_d` int(11) NOT NULL DEFAULT '0',
  KEY `nro_asto` (`nro_asto`),
  KEY `codigo_cta` (`codigo_cta`),
  KEY `nombre_cta` (`nombre_cta`),
  KEY `nro_asto_c` (`nro_asto_conta`),
  KEY `fecha` (`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `asientos`
--

/*!40000 ALTER TABLE `asientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `asientos` ENABLE KEYS */;


--
-- Definition of table `asientosdiario`
--

DROP TABLE IF EXISTS `asientosdiario`;
CREATE TABLE `asientosdiario` (
  `subdiario` char(2) NOT NULL DEFAULT '',
  `nombre_cta` char(80) NOT NULL DEFAULT '',
  `codigo_cta` char(18) NOT NULL DEFAULT '',
  `monto_debe` float(13,2) NOT NULL DEFAULT '0.00',
  `monto_habe` float(13,2) NOT NULL DEFAULT '0.00',
  `fecha` char(8) NOT NULL DEFAULT '',
  `detalle` char(254) NOT NULL DEFAULT '',
  `nro_asto_d` int(11) NOT NULL DEFAULT '0',
  `codigo_acu` char(18) NOT NULL DEFAULT '',
  `modelo` int(11) NOT NULL DEFAULT '0',
  `ejnumero` int(11) NOT NULL DEFAULT '0',
  `anio` int(11) NOT NULL DEFAULT '0',
  `nro_asto_conta` int(11) NOT NULL DEFAULT '0',
  `comp_tipo` int(11) NOT NULL DEFAULT '0',
  `tipo_prov` char(1) NOT NULL DEFAULT '',
  `comp_act` int(11) NOT NULL DEFAULT '0',
  `comp_nro` int(11) NOT NULL DEFAULT '0',
  `comp_prov` char(2) NOT NULL DEFAULT '',
  `fecha_prov` char(8) NOT NULL DEFAULT '',
  `idreg_prov` int(11) NOT NULL DEFAULT '0',
  `cod_prov` int(11) NOT NULL DEFAULT '0',
  `usuario` char(30) NOT NULL DEFAULT '',
  `usuario_fecha` char(8) NOT NULL DEFAULT '',
  KEY `nro_asto_d` (`nro_asto_d`),
  KEY `nombre_cta` (`nombre_cta`),
  KEY `nro_asto_c` (`nro_asto_conta`),
  KEY `fecha` (`fecha`),
  KEY `codigo_cta` (`codigo_cta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `asientosdiario`
--

/*!40000 ALTER TABLE `asientosdiario` DISABLE KEYS */;
/*!40000 ALTER TABLE `asientosdiario` ENABLE KEYS */;


--
-- Definition of table `asientosmodelo`
--

DROP TABLE IF EXISTS `asientosmodelo`;
CREATE TABLE `asientosmodelo` (
  `subdiario` char(2) NOT NULL DEFAULT '',
  `nombre_cta` char(30) NOT NULL DEFAULT '',
  `codigo_cta` char(18) NOT NULL DEFAULT '',
  `monto_debe` float(13,2) NOT NULL DEFAULT '0.00',
  `monto_habe` float(13,2) NOT NULL DEFAULT '0.00',
  `fecha` char(8) NOT NULL DEFAULT '',
  `detalle` char(25) NOT NULL DEFAULT '',
  `nro_asto` int(11) NOT NULL DEFAULT '0',
  `movimiento` char(8) NOT NULL DEFAULT '',
  `modelo` int(11) NOT NULL DEFAULT '0',
  `detalle_g` char(200) NOT NULL DEFAULT '',
  KEY `modelo` (`modelo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `asientosmodelo`
--

/*!40000 ALTER TABLE `asientosmodelo` DISABLE KEYS */;
/*!40000 ALTER TABLE `asientosmodelo` ENABLE KEYS */;


--
-- Definition of table `astocuenta`
--

DROP TABLE IF EXISTS `astocuenta`;
CREATE TABLE `astocuenta` (
  `nro_asto` int(11) NOT NULL DEFAULT '0',
  `cod_cta` char(18) NOT NULL DEFAULT '',
  `dh` char(1) NOT NULL DEFAULT '',
  `detalle` char(50) NOT NULL DEFAULT '',
  `cod_valor` int(11) NOT NULL DEFAULT '0',
  KEY `cod_valor` (`cod_valor`),
  KEY `nro_asto` (`nro_asto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `astocuenta`
--

/*!40000 ALTER TABLE `astocuenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `astocuenta` ENABLE KEYS */;


--
-- Definition of table `astofactura`
--

DROP TABLE IF EXISTS `astofactura`;
CREATE TABLE `astofactura` (
  `idcomp` int(11) NOT NULL DEFAULT '0',
  `cod_servi` int(11) NOT NULL DEFAULT '0',
  `socio` char(1) NOT NULL DEFAULT '',
  `cond_vta` int(11) NOT NULL DEFAULT '0',
  `ing_egr` char(1) NOT NULL DEFAULT '',
  `nro_asto` int(11) NOT NULL DEFAULT '0',
  `iva` int(11) NOT NULL DEFAULT '0',
  `bonifica` char(1) NOT NULL DEFAULT '',
  `recargo` char(1) NOT NULL DEFAULT '',
  `op_exenta` char(1) NOT NULL DEFAULT '',
  `detalle` char(200) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `astofactura`
--

/*!40000 ALTER TABLE `astofactura` DISABLE KEYS */;
/*!40000 ALTER TABLE `astofactura` ENABLE KEYS */;


--
-- Definition of table `astovalor`
--

DROP TABLE IF EXISTS `astovalor`;
CREATE TABLE `astovalor` (
  `cod_valor` int(11) NOT NULL DEFAULT '0',
  `tabla` char(15) NOT NULL DEFAULT '',
  `campo` char(12) NOT NULL DEFAULT '',
  `operacion` int(11) NOT NULL DEFAULT '0',
  KEY `cod_valor` (`cod_valor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `astovalor`
--

/*!40000 ALTER TABLE `astovalor` DISABLE KEYS */;
/*!40000 ALTER TABLE `astovalor` ENABLE KEYS */;


--
-- Definition of table `auditoria`
--

DROP TABLE IF EXISTS `auditoria`;
CREATE TABLE `auditoria` (
  `codigo` char(4) NOT NULL DEFAULT '',
  `descripcion` char(80) NOT NULL DEFAULT '',
  KEY `codigo` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auditoria`
--

/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;


--
-- Definition of table `bancos`
--

DROP TABLE IF EXISTS `bancos`;
CREATE TABLE `bancos` (
  `codigo` int(11) NOT NULL DEFAULT '0',
  `nombre` char(100) NOT NULL DEFAULT '',
  `ctacontable` char(18) NOT NULL DEFAULT '',
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bancos`
--

/*!40000 ALTER TABLE `bancos` DISABLE KEYS */;
/*!40000 ALTER TABLE `bancos` ENABLE KEYS */;


--
-- Definition of table `basiagua`
--

DROP TABLE IF EXISTS `basiagua`;
CREATE TABLE `basiagua` (
  `categoria` int(11) NOT NULL DEFAULT '0',
  `m3desde` float(13,2) NOT NULL DEFAULT '0.00',
  `m3hasta` float(13,2) NOT NULL DEFAULT '0.00',
  `descrip` char(60) NOT NULL DEFAULT '',
  `importe` float(13,2) NOT NULL DEFAULT '0.00',
  `bid` float(13,2) NOT NULL DEFAULT '0.00',
  `enres` float(13,2) NOT NULL DEFAULT '0.00',
  `m3exedente` float(13,2) NOT NULL DEFAULT '0.00',
  `m3exede` float(13,2) NOT NULL DEFAULT '0.00',
  `m3exede2` float(13,2) NOT NULL DEFAULT '0.00',
  `m3exedente2` float(13,2) NOT NULL DEFAULT '0.00',
  KEY `categoria` (`categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `basiagua`
--

/*!40000 ALTER TABLE `basiagua` DISABLE KEYS */;
/*!40000 ALTER TABLE `basiagua` ENABLE KEYS */;


--
-- Definition of table `basicable`
--

DROP TABLE IF EXISTS `basicable`;
CREATE TABLE `basicable` (
  `categoria` int(11) NOT NULL DEFAULT '0',
  `importe` float(13,2) NOT NULL DEFAULT '0.00',
  `codificado` float(13,2) NOT NULL DEFAULT '0.00',
  `descrip` char(60) NOT NULL DEFAULT '',
  KEY `categoria` (`categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `basicable`
--

/*!40000 ALTER TABLE `basicable` DISABLE KEYS */;
/*!40000 ALTER TABLE `basicable` ENABLE KEYS */;


--
-- Definition of table `basicloacas`
--

DROP TABLE IF EXISTS `basicloacas`;
CREATE TABLE `basicloacas` (
  `categoria` int(11) NOT NULL DEFAULT '0',
  `importe` float(13,2) NOT NULL DEFAULT '0.00',
  `descrip` char(60) NOT NULL DEFAULT '',
  `cuotas` int(11) NOT NULL DEFAULT '0',
  KEY `categoria` (`categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `basicloacas`
--

/*!40000 ALTER TABLE `basicloacas` DISABLE KEYS */;
/*!40000 ALTER TABLE `basicloacas` ENABLE KEYS */;


--
-- Definition of table `basifm`
--

DROP TABLE IF EXISTS `basifm`;
CREATE TABLE `basifm` (
  `categoria` int(11) NOT NULL DEFAULT '0',
  `importe` float(13,2) NOT NULL DEFAULT '0.00',
  `descrip` char(60) NOT NULL DEFAULT '',
  `emisiones` int(11) NOT NULL DEFAULT '0',
  KEY `categoria` (`categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `basifm`
--

/*!40000 ALTER TABLE `basifm` DISABLE KEYS */;
/*!40000 ALTER TABLE `basifm` ENABLE KEYS */;


--
-- Definition of table `basiinternet`
--

DROP TABLE IF EXISTS `basiinternet`;
CREATE TABLE `basiinternet` (
  `categoria` int(11) NOT NULL DEFAULT '0',
  `descrip` char(60) NOT NULL DEFAULT '',
  `abono` float(13,2) NOT NULL DEFAULT '0.00',
  `imp_hnave` float(13,2) NOT NULL DEFAULT '0.00',
  `imp_correo` float(13,2) NOT NULL DEFAULT '0.00',
  `imp_plocal` float(13,2) NOT NULL DEFAULT '0.00',
  `imp_pldist` float(13,2) NOT NULL DEFAULT '0.00',
  `conexion` float(13,2) NOT NULL DEFAULT '0.00',
  KEY `categoria` (`categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `basiinternet`
--

/*!40000 ALTER TABLE `basiinternet` DISABLE KEYS */;
/*!40000 ALTER TABLE `basiinternet` ENABLE KEYS */;


--
-- Definition of table `basisepelio`
--

DROP TABLE IF EXISTS `basisepelio`;
CREATE TABLE `basisepelio` (
  `categoria` int(11) NOT NULL DEFAULT '0',
  `descrip` char(60) NOT NULL DEFAULT '',
  `importe` float(13,2) NOT NULL DEFAULT '0.00',
  `inscrip` float(13,2) NOT NULL DEFAULT '0.00',
  `nuevo0_49` int(11) NOT NULL DEFAULT '0',
  `nuevo50_69` int(11) NOT NULL DEFAULT '0',
  `nuevo70_` int(11) NOT NULL DEFAULT '0',
  `viejo0_49` int(11) NOT NULL DEFAULT '0',
  `viejo50_` int(11) NOT NULL DEFAULT '0',
  KEY `categoria` (`categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `basisepelio`
--

/*!40000 ALTER TABLE `basisepelio` DISABLE KEYS */;
/*!40000 ALTER TABLE `basisepelio` ENABLE KEYS */;


--
-- Definition of table `basitele`
--

DROP TABLE IF EXISTS `basitele`;
CREATE TABLE `basitele` (
  `categoria` int(11) NOT NULL DEFAULT '0',
  `descrip` char(60) NOT NULL DEFAULT '',
  `pulsdesde` int(11) NOT NULL DEFAULT '0',
  `pulshasta` int(11) NOT NULL DEFAULT '0',
  `pesosdesde` float(13,2) NOT NULL DEFAULT '0.00',
  `pesoshasta` float(13,2) NOT NULL DEFAULT '0.00',
  `telecom` float(13,2) NOT NULL DEFAULT '0.00',
  `libtelecom` int(11) NOT NULL DEFAULT '0',
  `dctocons` float(13,2) NOT NULL DEFAULT '0.00',
  `imp_pulso` float(13,2) NOT NULL DEFAULT '0.00',
  `observa` char(200) NOT NULL DEFAULT '',
  `abosincons` float(13,2) NOT NULL DEFAULT '0.00',
  `porcscons` float(13,2) NOT NULL DEFAULT '0.00',
  KEY `categoria` (`categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `basitele`
--

/*!40000 ALTER TABLE `basitele` DISABLE KEYS */;
/*!40000 ALTER TABLE `basitele` ENABLE KEYS */;


--
-- Definition of table `bienes`
--

DROP TABLE IF EXISTS `bienes`;
CREATE TABLE `bienes` (
  `rubro` char(15) NOT NULL DEFAULT '',
  `subrubro` char(15) NOT NULL DEFAULT '',
  `bien` char(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bienes`
--

/*!40000 ALTER TABLE `bienes` DISABLE KEYS */;
/*!40000 ALTER TABLE `bienes` ENABLE KEYS */;


--
-- Definition of table `cajaegreso`
--

DROP TABLE IF EXISTS `cajaegreso`;
CREATE TABLE `cajaegreso` (
  `idcajaegr` int(11) NOT NULL DEFAULT '0',
  `fecha` char(8) NOT NULL DEFAULT '',
  `cod_socio` int(11) NOT NULL DEFAULT '0',
  `apellido` char(60) NOT NULL DEFAULT '',
  `nombre` char(60) NOT NULL DEFAULT '',
  `direccion` char(30) NOT NULL DEFAULT '',
  `cuit` char(13) NOT NULL DEFAULT '',
  `socio` char(1) NOT NULL DEFAULT '',
  `iva` int(11) NOT NULL DEFAULT '0',
  `concepto` char(250) NOT NULL DEFAULT '',
  `contabilizado` int(11) NOT NULL DEFAULT '0',
  `anulado` char(1) NOT NULL DEFAULT '',
  `totaling` float(13,2) NOT NULL DEFAULT '0.00',
  `nro_arqueo` int(11) NOT NULL DEFAULT '0',
  `socioprove` char(1) NOT NULL DEFAULT '',
  KEY `idcajaegr` (`idcajaegr`),
  KEY `nro_arqueo` (`nro_arqueo`),
  KEY `fecha` (`fecha`),
  KEY `apeynom` (`apellido`,`nombre`),
  KEY `asiento` (`contabilizado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cajaegreso`
--

/*!40000 ALTER TABLE `cajaegreso` DISABLE KEYS */;
/*!40000 ALTER TABLE `cajaegreso` ENABLE KEYS */;


--
-- Definition of table `cajaegresoh`
--

DROP TABLE IF EXISTS `cajaegresoh`;
CREATE TABLE `cajaegresoh` (
  `idcajaegr` int(11) NOT NULL DEFAULT '0',
  `tipopago` int(11) NOT NULL DEFAULT '0',
  `nombrepago` char(30) NOT NULL DEFAULT '',
  `serie` char(2) NOT NULL DEFAULT '',
  `numero` int(11) NOT NULL DEFAULT '0',
  `banco` int(11) NOT NULL DEFAULT '0',
  `nombrebanco` char(30) NOT NULL DEFAULT '',
  `filial` int(11) NOT NULL DEFAULT '0',
  `detercero` int(11) NOT NULL DEFAULT '0',
  `importe` float(13,2) NOT NULL DEFAULT '0.00',
  `codpostal` char(10) NOT NULL DEFAULT '',
  `fechaentrega` char(8) NOT NULL DEFAULT '',
  `entregadoa` char(100) NOT NULL DEFAULT '',
  `fechaemision` char(8) NOT NULL DEFAULT '',
  `fechavencimiento` char(8) NOT NULL DEFAULT '',
  `alaordende` char(40) NOT NULL DEFAULT '',
  `librador` char(40) NOT NULL DEFAULT '',
  `loentrega` char(40) NOT NULL DEFAULT '',
  `cuenta` char(20) NOT NULL DEFAULT '',
  `fechadevolucion` char(8) NOT NULL DEFAULT '',
  `motivodevolucion` char(50) NOT NULL DEFAULT '',
  `motivoentrega` char(50) NOT NULL DEFAULT '',
  `codigo_cta` char(18) NOT NULL DEFAULT '',
  KEY `idcajaegr` (`idcajaegr`),
  KEY `cheque` (`idcajaegr`,`banco`,`filial`,`serie`,`numero`),
  KEY `codigo_cta` (`codigo_cta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cajaegresoh`
--

/*!40000 ALTER TABLE `cajaegresoh` DISABLE KEYS */;
/*!40000 ALTER TABLE `cajaegresoh` ENABLE KEYS */;


--
-- Definition of table `cajaingreso`
--

DROP TABLE IF EXISTS `cajaingreso`;
CREATE TABLE `cajaingreso` (
  `idcajaing` int(11) NOT NULL DEFAULT '0',
  `fecha` char(8) NOT NULL DEFAULT '',
  `cod_socio` int(11) NOT NULL DEFAULT '0',
  `apellido` char(60) NOT NULL DEFAULT '',
  `nombre` char(60) NOT NULL DEFAULT '',
  `direccion` char(30) NOT NULL DEFAULT '',
  `cuit` char(13) NOT NULL DEFAULT '',
  `socio` char(1) NOT NULL DEFAULT '',
  `iva` int(11) NOT NULL DEFAULT '0',
  `concepto` char(250) NOT NULL DEFAULT '',
  `contabilizado` int(11) NOT NULL DEFAULT '0',
  `anulado` char(1) NOT NULL DEFAULT '',
  `totaling` float(13,2) NOT NULL DEFAULT '0.00',
  `nro_arqueo` int(11) NOT NULL DEFAULT '0',
  `socioprove` char(1) NOT NULL DEFAULT '',
  KEY `idcajaing` (`idcajaing`),
  KEY `nro_arqueo` (`nro_arqueo`),
  KEY `fecha` (`fecha`),
  KEY `apeynom` (`apellido`,`nombre`),
  KEY `asiento` (`contabilizado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cajaingreso`
--

/*!40000 ALTER TABLE `cajaingreso` DISABLE KEYS */;
/*!40000 ALTER TABLE `cajaingreso` ENABLE KEYS */;


--
-- Definition of table `cajaingresoh`
--

DROP TABLE IF EXISTS `cajaingresoh`;
CREATE TABLE `cajaingresoh` (
  `idcajaing` int(11) NOT NULL DEFAULT '0',
  `tipopago` int(11) NOT NULL DEFAULT '0',
  `nombrepago` char(30) NOT NULL DEFAULT '',
  `serie` char(2) NOT NULL DEFAULT '',
  `numero` int(11) NOT NULL DEFAULT '0',
  `banco` int(11) NOT NULL DEFAULT '0',
  `nombrebanco` char(30) NOT NULL DEFAULT '',
  `filial` int(11) NOT NULL DEFAULT '0',
  `importe` float(13,2) NOT NULL DEFAULT '0.00',
  `codpostal` char(10) NOT NULL DEFAULT '',
  `detercero` int(11) NOT NULL DEFAULT '0',
  `fechaentrega` char(8) NOT NULL DEFAULT '',
  `entregadoa` char(100) NOT NULL DEFAULT '',
  `fechaemision` char(8) NOT NULL DEFAULT '',
  `fechavencimiento` char(8) NOT NULL DEFAULT '',
  `alaordende` char(40) NOT NULL DEFAULT '',
  `librador` char(40) NOT NULL DEFAULT '',
  `loentrega` char(40) NOT NULL DEFAULT '',
  `cuenta` char(20) NOT NULL DEFAULT '',
  `fechadevolucion` char(8) NOT NULL DEFAULT '',
  `motivodevolucion` char(50) NOT NULL DEFAULT '',
  `motivoentrega` char(50) NOT NULL DEFAULT '',
  `codigo_cta` char(18) NOT NULL DEFAULT '',
  KEY `idcajaing` (`idcajaing`),
  KEY `cheque` (`idcajaing`,`banco`,`filial`,`serie`,`numero`),
  KEY `codigo_cta` (`codigo_cta`),
  KEY `cheques` (`serie`,`numero`,`banco`,`filial`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cajaingresoh`
--

/*!40000 ALTER TABLE `cajaingresoh` DISABLE KEYS */;
/*!40000 ALTER TABLE `cajaingresoh` ENABLE KEYS */;


--
-- Definition of table `cobroscaja`
--

DROP TABLE IF EXISTS `cobroscaja`;
CREATE TABLE `cobroscaja` (
  `archivo` char(14) NOT NULL DEFAULT '',
  `enuso` char(1) NOT NULL DEFAULT '',
  `usuario` char(20) NOT NULL DEFAULT '',
  `procesado` char(1) NOT NULL DEFAULT '',
  `fechahora1` char(16) NOT NULL DEFAULT '',
  `fechahora2` char(16) NOT NULL DEFAULT '',
  `fechaproc` char(16) NOT NULL DEFAULT '',
  `usuariop` char(20) NOT NULL DEFAULT '',
  KEY `archivo` (`archivo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cobroscaja`
--

/*!40000 ALTER TABLE `cobroscaja` DISABLE KEYS */;
/*!40000 ALTER TABLE `cobroscaja` ENABLE KEYS */;


--
-- Definition of table `cobroservicios`
--

DROP TABLE IF EXISTS `cobroservicios`;
CREATE TABLE `cobroservicios` (
  `idcobro` int(11) NOT NULL DEFAULT '0',
  `cod_socio` int(11) NOT NULL DEFAULT '0',
  `cod_servi` int(11) NOT NULL DEFAULT '0',
  `cod_subser` int(11) NOT NULL DEFAULT '0',
  `idcomp` int(11) NOT NULL DEFAULT '0',
  `actividad` int(11) NOT NULL DEFAULT '0',
  `numero` int(11) NOT NULL DEFAULT '0',
  `idregistro` int(11) NOT NULL DEFAULT '0',
  `fech_pago` char(8) NOT NULL DEFAULT '',
  `imp_pago` float(13,2) NOT NULL DEFAULT '0.00',
  `rec_pago` float(13,2) NOT NULL DEFAULT '0.00',
  `iva_recp` float(13,2) NOT NULL DEFAULT '0.00',
  `confirmado` int(11) NOT NULL DEFAULT '0',
  `idcajaing` int(11) NOT NULL DEFAULT '0',
  `nro_asto` int(11) NOT NULL DEFAULT '0',
  `idrecibo` int(11) NOT NULL DEFAULT '0',
  `socio` char(1) NOT NULL DEFAULT '',
  `idfacturas` int(11) NOT NULL DEFAULT '0',
  KEY `idcobro` (`idcobro`),
  KEY `cod_socio` (`cod_socio`),
  KEY `confirmado` (`confirmado`),
  KEY `idregistro` (`idregistro`),
  KEY `fech_pago` (`fech_pago`),
  KEY `idcajaing` (`idcajaing`),
  KEY `idrecibo` (`idrecibo`),
  KEY `idfacturas` (`idfacturas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cobroservicios`
--

/*!40000 ALTER TABLE `cobroservicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `cobroservicios` ENABLE KEYS */;


--
-- Definition of table `cobrosporventanilla`
--

DROP TABLE IF EXISTS `cobrosporventanilla`;
CREATE TABLE `cobrosporventanilla` (
  `idcobroven` int(11) NOT NULL DEFAULT '0',
  `cobropropio3ro` int(11) NOT NULL DEFAULT '0',
  `fecha` char(8) NOT NULL DEFAULT '',
  `contabilizado` int(11) NOT NULL DEFAULT '0',
  `nrocomprobco` int(11) NOT NULL DEFAULT '0',
  `importe` float(13,2) NOT NULL DEFAULT '0.00',
  `bancoori` int(11) NOT NULL DEFAULT '0',
  `nombancoori` char(80) NOT NULL DEFAULT '',
  `sucursalori` int(11) NOT NULL DEFAULT '0',
  `numeroori` char(20) NOT NULL DEFAULT '',
  `tipoori` int(11) NOT NULL DEFAULT '0',
  `nombrecuentaori` char(50) NOT NULL DEFAULT '',
  `ctacontableori` char(18) NOT NULL DEFAULT '',
  `serie` char(2) NOT NULL DEFAULT '',
  `numero` int(11) NOT NULL DEFAULT '0',
  `banco` int(11) NOT NULL DEFAULT '0',
  `filial` int(11) NOT NULL DEFAULT '0',
  `codpostal` char(10) NOT NULL DEFAULT '',
  `fechaemision` char(8) NOT NULL DEFAULT '',
  `fechavencimiento` char(8) NOT NULL DEFAULT '',
  `alaordende` char(40) NOT NULL DEFAULT '',
  `librador` char(40) NOT NULL DEFAULT '',
  `loentrega` char(40) NOT NULL DEFAULT '',
  `cuenta` char(20) NOT NULL DEFAULT '',
  `idrecibo` int(11) NOT NULL DEFAULT '0',
  `idcajaingreso` int(11) NOT NULL DEFAULT '0',
  `idregistro` int(11) NOT NULL DEFAULT '0',
  KEY `idcajaingr` (`idcajaingreso`),
  KEY `idrecibo` (`idrecibo`),
  KEY `idregistro` (`idregistro`),
  KEY `nrocomprob` (`nrocomprobco`),
  KEY `fecha` (`fecha`),
  KEY `idcobroven` (`idcobroven`),
  KEY `asiento` (`contabilizado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cobrosporventanilla`
--

/*!40000 ALTER TABLE `cobrosporventanilla` DISABLE KEYS */;
/*!40000 ALTER TABLE `cobrosporventanilla` ENABLE KEYS */;


--
-- Definition of table `codigoimputar`
--

DROP TABLE IF EXISTS `codigoimputar`;
CREATE TABLE `codigoimputar` (
  `cod_imputa` char(4) NOT NULL DEFAULT '',
  `codigo_cta` char(18) NOT NULL DEFAULT '',
  `nombre` char(80) NOT NULL DEFAULT '',
  `indice` int(11) NOT NULL DEFAULT '0',
  `concepto` char(80) NOT NULL DEFAULT '',
  `cod_servi` int(11) NOT NULL DEFAULT '0',
  KEY `cod_imputa` (`cod_imputa`),
  KEY `codimputa` (`cod_imputa`),
  KEY `codigo_cta` (`codigo_cta`),
  KEY `indice` (`indice`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `codigoimputar`
--

/*!40000 ALTER TABLE `codigoimputar` DISABLE KEYS */;
/*!40000 ALTER TABLE `codigoimputar` ENABLE KEYS */;


--
-- Definition of table `compactiv`
--

DROP TABLE IF EXISTS `compactiv`;
CREATE TABLE `compactiv` (
  `idnumera` int(11) NOT NULL DEFAULT '0',
  `actividad` int(11) NOT NULL DEFAULT '0',
  `max_nro` int(11) NOT NULL DEFAULT '0',
  `descripcion` char(30) NOT NULL DEFAULT '',
  `max_conf` int(11) NOT NULL DEFAULT '0',
  KEY `idnumera` (`idnumera`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `compactiv`
--

/*!40000 ALTER TABLE `compactiv` DISABLE KEYS */;
/*!40000 ALTER TABLE `compactiv` ENABLE KEYS */;


--
-- Definition of table `compprov`
--

DROP TABLE IF EXISTS `compprov`;
CREATE TABLE `compprov` (
  `codigo` char(2) NOT NULL DEFAULT '',
  `nombre` char(80) NOT NULL DEFAULT '',
  `contadocc` int(11) NOT NULL DEFAULT '0',
  `idcompprov` int(11) NOT NULL DEFAULT '0',
  `tipo` char(1) NOT NULL DEFAULT '',
  `opera` int(11) NOT NULL DEFAULT '0',
  KEY `idcompprov` (`idcompprov`),
  KEY `nombre` (`nombre`),
  KEY `codigo` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `compprov`
--

/*!40000 ALTER TABLE `compprov` DISABLE KEYS */;
/*!40000 ALTER TABLE `compprov` ENABLE KEYS */;


--
-- Definition of table `comprobantes`
--

DROP TABLE IF EXISTS `comprobantes`;
CREATE TABLE `comprobantes` (
  `comprobante` char(60) NOT NULL DEFAULT '',
  `cod_comp` int(11) NOT NULL DEFAULT '0',
  `tipo` char(1) NOT NULL DEFAULT '',
  `idcomp` int(11) NOT NULL DEFAULT '0',
  `operacion` int(11) NOT NULL DEFAULT '0',
  `archeader` char(50) NOT NULL DEFAULT '',
  KEY `tipo` (`tipo`),
  KEY `cod_comp` (`cod_comp`),
  KEY `idcomp` (`idcomp`),
  KEY `comprobant` (`comprobante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comprobantes`
--

/*!40000 ALTER TABLE `comprobantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprobantes` ENABLE KEYS */;


--
-- Definition of table `comprobantesycompactiv`
--

DROP TABLE IF EXISTS `comprobantesycompactiv`;
CREATE TABLE `comprobantesycompactiv` (
  `idcomp` int(11) NOT NULL DEFAULT '0',
  `idnumera` int(11) NOT NULL DEFAULT '0',
  KEY `idnumera` (`idnumera`),
  KEY `idcomp` (`idcomp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comprobantesycompactiv`
--

/*!40000 ALTER TABLE `comprobantesycompactiv` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprobantesycompactiv` ENABLE KEYS */;


--
-- Definition of table `comprobantesyservicios`
--

DROP TABLE IF EXISTS `comprobantesyservicios`;
CREATE TABLE `comprobantesyservicios` (
  `cod_servi` int(11) NOT NULL DEFAULT '0',
  `idcomp` int(11) NOT NULL DEFAULT '0',
  `actividad` int(11) NOT NULL DEFAULT '0',
  KEY `cod_servi` (`cod_servi`),
  KEY `idcomp` (`idcomp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comprobantesyservicios`
--

/*!40000 ALTER TABLE `comprobantesyservicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprobantesyservicios` ENABLE KEYS */;


--
-- Definition of table `condiva`
--

DROP TABLE IF EXISTS `condiva`;
CREATE TABLE `condiva` (
  `cod_iva` int(11) NOT NULL DEFAULT '0',
  `desc_iva` char(20) NOT NULL DEFAULT '',
  KEY `cod_iva` (`cod_iva`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `condiva`
--

/*!40000 ALTER TABLE `condiva` DISABLE KEYS */;
/*!40000 ALTER TABLE `condiva` ENABLE KEYS */;


--
-- Definition of table `config`
--

DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `idctacte` char(18) NOT NULL DEFAULT '',
  `nro_asto_m` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `config`
--

/*!40000 ALTER TABLE `config` DISABLE KEYS */;
/*!40000 ALTER TABLE `config` ENABLE KEYS */;


--
-- Definition of table `cosecable`
--

DROP TABLE IF EXISTS `cosecable`;
CREATE TABLE `cosecable` (
  `cod_socio` int(11) NOT NULL DEFAULT '0',
  `cod_socioc` int(11) NOT NULL DEFAULT '0',
  KEY `cod_socio` (`cod_socio`),
  KEY `cod_socioc` (`cod_socioc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cosecable`
--

/*!40000 ALTER TABLE `cosecable` DISABLE KEYS */;
/*!40000 ALTER TABLE `cosecable` ENABLE KEYS */;


--
-- Definition of table `cppproveedor`
--

DROP TABLE IF EXISTS `cppproveedor`;
CREATE TABLE `cppproveedor` (
  `codprove` int(11) NOT NULL DEFAULT '0',
  `nombre` char(50) NOT NULL DEFAULT '',
  KEY `codprove` (`codprove`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cppproveedor`
--

/*!40000 ALTER TABLE `cppproveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `cppproveedor` ENABLE KEYS */;


--
-- Definition of table `cpptelefono`
--

DROP TABLE IF EXISTS `cpptelefono`;
CREATE TABLE `cpptelefono` (
  `telefono` int(11) NOT NULL DEFAULT '0',
  `mes_fact` int(11) NOT NULL DEFAULT '0',
  `anio_fact` int(11) NOT NULL DEFAULT '0',
  `cppprov` int(11) NOT NULL DEFAULT '0',
  `cod_coop` int(11) NOT NULL DEFAULT '0',
  `nsecfeco` int(11) NOT NULL DEFAULT '0',
  `car_llama` int(11) NOT NULL DEFAULT '0',
  `nllamado` char(15) NOT NULL DEFAULT '',
  `fech_inic` char(8) NOT NULL DEFAULT '',
  `hora_inic` char(8) NOT NULL DEFAULT '',
  `segu_real` int(11) NOT NULL DEFAULT '0',
  `segu_valor` int(11) NOT NULL DEFAULT '0',
  `valor_llam` float(13,2) NOT NULL DEFAULT '0.00',
  `tipo_llam` int(11) NOT NULL DEFAULT '0',
  `fech_gene` char(8) NOT NULL DEFAULT '',
  `hora_gene` char(8) NOT NULL DEFAULT '',
  `secuencia` int(11) NOT NULL DEFAULT '0',
  `facturado` char(1) NOT NULL DEFAULT '',
  `idcomp` int(11) NOT NULL DEFAULT '0',
  `actividad` int(11) NOT NULL DEFAULT '0',
  `numero` int(11) NOT NULL DEFAULT '0',
  `idregistro` int(11) NOT NULL DEFAULT '0',
  KEY `telefono` (`telefono`),
  KEY `secuencia` (`secuencia`),
  KEY `mesanio` (`anio_fact`,`mes_fact`),
  KEY `idregistro` (`idregistro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cpptelefono`
--

/*!40000 ALTER TABLE `cpptelefono` DISABLE KEYS */;
/*!40000 ALTER TABLE `cpptelefono` ENABLE KEYS */;


--
-- Definition of table `cuentasbancarias`
--

DROP TABLE IF EXISTS `cuentasbancarias`;
CREATE TABLE `cuentasbancarias` (
  `cod_prov` int(11) NOT NULL DEFAULT '0',
  `sucursal` int(11) NOT NULL DEFAULT '0',
  `numero` char(20) NOT NULL DEFAULT '',
  `tipo` int(11) NOT NULL DEFAULT '0',
  `nombre` char(50) NOT NULL DEFAULT '',
  `cuenta` char(18) NOT NULL DEFAULT '',
  KEY `cuentas` (`cod_prov`,`sucursal`,`numero`,`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cuentasbancarias`
--

/*!40000 ALTER TABLE `cuentasbancarias` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuentasbancarias` ENABLE KEYS */;


--
-- Definition of table `ddecutele`
--

DROP TABLE IF EXISTS `ddecutele`;
CREATE TABLE `ddecutele` (
  `telefono` int(11) NOT NULL DEFAULT '0',
  `llamadosa` char(15) NOT NULL DEFAULT '',
  `segnormal` int(11) NOT NULL DEFAULT '0',
  `impnormal` float(13,2) NOT NULL DEFAULT '0.00',
  `segreduci` int(11) NOT NULL DEFAULT '0',
  `impreduci` float(13,2) NOT NULL DEFAULT '0.00',
  `hsnormalc` int(11) NOT NULL DEFAULT '0',
  `hsreducic` int(11) NOT NULL DEFAULT '0',
  `mes_fact` int(11) NOT NULL DEFAULT '0',
  `anio_fact` int(11) NOT NULL DEFAULT '0',
  KEY `telefono` (`telefono`),
  KEY `llamadosa` (`llamadosa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ddecutele`
--

/*!40000 ALTER TABLE `ddecutele` DISABLE KEYS */;
/*!40000 ALTER TABLE `ddecutele` ENABLE KEYS */;


--
-- Definition of table `depobancah`
--

DROP TABLE IF EXISTS `depobancah`;
CREATE TABLE `depobancah` (
  `iddepo` int(11) NOT NULL DEFAULT '0',
  `idrecibo` int(11) NOT NULL DEFAULT '0',
  `idcajaing` int(11) NOT NULL DEFAULT '0',
  `idregistro` int(11) NOT NULL DEFAULT '0',
  `tipopago` int(11) NOT NULL DEFAULT '0',
  `serie` char(2) NOT NULL DEFAULT '',
  `numero` int(11) NOT NULL DEFAULT '0',
  `banco` int(11) NOT NULL DEFAULT '0',
  `filial` int(11) NOT NULL DEFAULT '0',
  `importe` float(13,2) NOT NULL DEFAULT '0.00',
  KEY `idrecibo` (`idrecibo`),
  KEY `iddepo` (`iddepo`),
  KEY `idcajaing` (`idcajaing`),
  KEY `idregistro` (`idregistro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depobancah`
--

/*!40000 ALTER TABLE `depobancah` DISABLE KEYS */;
/*!40000 ALTER TABLE `depobancah` ENABLE KEYS */;


--
-- Definition of table `depobancap`
--

DROP TABLE IF EXISTS `depobancap`;
CREATE TABLE `depobancap` (
  `cod_prov` int(11) NOT NULL DEFAULT '0',
  `sucursal` int(11) NOT NULL DEFAULT '0',
  `numero` char(20) NOT NULL DEFAULT '',
  `tipo` int(11) NOT NULL DEFAULT '0',
  `cuenta` char(18) NOT NULL DEFAULT '',
  `comprobante` int(11) NOT NULL DEFAULT '0',
  `fecha` char(8) NOT NULL DEFAULT '',
  `iddepo` int(11) NOT NULL DEFAULT '0',
  `importetotal` float(13,2) NOT NULL DEFAULT '0.00',
  `contabilizado` int(11) NOT NULL DEFAULT '0',
  KEY `numero` (`numero`),
  KEY `fecha` (`fecha`),
  KEY `iddepo` (`iddepo`),
  KEY `cuenta` (`cod_prov`,`tipo`),
  KEY `asiento` (`contabilizado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depobancap`
--

/*!40000 ALTER TABLE `depobancap` DISABLE KEYS */;
/*!40000 ALTER TABLE `depobancap` ENABLE KEYS */;


--
-- Definition of table `descutele`
--

DROP TABLE IF EXISTS `descutele`;
CREATE TABLE `descutele` (
  `telefono` int(11) NOT NULL DEFAULT '0',
  `llamadasa` char(15) NOT NULL DEFAULT '',
  `hsnormal` int(11) NOT NULL DEFAULT '0',
  `hsreduci` int(11) NOT NULL DEFAULT '0',
  KEY `telefono` (`telefono`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `descutele`
--

/*!40000 ALTER TABLE `descutele` DISABLE KEYS */;
/*!40000 ALTER TABLE `descutele` ENABLE KEYS */;


--
-- Definition of table `detapagos`
--

DROP TABLE IF EXISTS `detapagos`;
CREATE TABLE `detapagos` (
  `idrecibo` int(11) NOT NULL DEFAULT '0',
  `tipopago` int(11) NOT NULL DEFAULT '0',
  `serie` char(2) NOT NULL DEFAULT '',
  `numero` int(11) NOT NULL DEFAULT '0',
  `banco` int(11) NOT NULL DEFAULT '0',
  `filial` int(11) NOT NULL DEFAULT '0',
  `importe` float(13,2) NOT NULL DEFAULT '0.00',
  `codpostal` char(10) NOT NULL DEFAULT '',
  `detercero` int(11) NOT NULL DEFAULT '0',
  `cod_imputa` char(4) NOT NULL DEFAULT '',
  `codigo_cta` char(18) NOT NULL DEFAULT '',
  `nombre` char(30) NOT NULL DEFAULT '',
  `fechaentrega` char(8) NOT NULL DEFAULT '',
  `entregadoa` char(100) NOT NULL DEFAULT '',
  `fechaemision` char(8) NOT NULL DEFAULT '',
  `fechavencimiento` char(8) NOT NULL DEFAULT '',
  `alaordende` char(40) NOT NULL DEFAULT '',
  `librador` char(40) NOT NULL DEFAULT '',
  `loentrega` char(40) NOT NULL DEFAULT '',
  `cuenta` char(20) NOT NULL DEFAULT '',
  `fechadevolucion` char(8) NOT NULL DEFAULT '',
  `motivodevolucion` char(50) NOT NULL DEFAULT '',
  `motivoentrega` char(50) NOT NULL DEFAULT '',
  KEY `idrecibo` (`idrecibo`),
  KEY `detapago` (`idrecibo`,`serie`,`numero`,`banco`,`filial`),
  KEY `cheques` (`serie`,`numero`,`banco`,`filial`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detapagos`
--

/*!40000 ALTER TABLE `detapagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `detapagos` ENABLE KEYS */;


--
-- Definition of table `detapagosfc`
--

DROP TABLE IF EXISTS `detapagosfc`;
CREATE TABLE `detapagosfc` (
  `idregistro` int(11) NOT NULL DEFAULT '0',
  `tipopago` int(11) NOT NULL DEFAULT '0',
  `serie` char(2) NOT NULL DEFAULT '',
  `numero` int(11) NOT NULL DEFAULT '0',
  `banco` int(11) NOT NULL DEFAULT '0',
  `filial` int(11) NOT NULL DEFAULT '0',
  `importe` float(13,2) NOT NULL DEFAULT '0.00',
  `codpostal` char(10) NOT NULL DEFAULT '',
  `detercero` int(11) NOT NULL DEFAULT '0',
  `cod_imputa` char(4) NOT NULL DEFAULT '',
  `codigo_cta` char(18) NOT NULL DEFAULT '',
  `nombre` char(30) NOT NULL DEFAULT '',
  `fechaentrega` char(8) NOT NULL DEFAULT '',
  `entregadoa` char(100) NOT NULL DEFAULT '',
  `fechaemision` char(8) NOT NULL DEFAULT '',
  `fechavencimiento` char(8) NOT NULL DEFAULT '',
  `alaordende` char(40) NOT NULL DEFAULT '',
  `librador` char(40) NOT NULL DEFAULT '',
  `loentrega` char(40) NOT NULL DEFAULT '',
  `cuenta` char(20) NOT NULL DEFAULT '',
  `fechadevolucion` char(8) NOT NULL DEFAULT '',
  `motivodevolucion` char(50) NOT NULL DEFAULT '',
  `motivoentrega` char(50) NOT NULL DEFAULT '',
  KEY `idregistro` (`idregistro`),
  KEY `cheques` (`serie`,`numero`,`banco`,`filial`),
  KEY `detapagosf` (`idregistro`,`serie`,`numero`,`banco`,`filial`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detapagosfc`
--

/*!40000 ALTER TABLE `detapagosfc` DISABLE KEYS */;
/*!40000 ALTER TABLE `detapagosfc` ENABLE KEYS */;


--
-- Definition of table `detfactu`
--

DROP TABLE IF EXISTS `detfactu`;
CREATE TABLE `detfactu` (
  `idcomp` int(11) NOT NULL DEFAULT '0',
  `actividad` int(11) NOT NULL DEFAULT '0',
  `numero` int(11) NOT NULL DEFAULT '0',
  `rubro` char(3) NOT NULL DEFAULT '',
  `codigo` char(6) NOT NULL DEFAULT '',
  `detalle_aux` char(60) NOT NULL DEFAULT '',
  `pcio_unit` float(13,2) NOT NULL DEFAULT '0.00',
  `imp_total` float(13,2) NOT NULL DEFAULT '0.00',
  `t_iva_g` float(13,2) NOT NULL DEFAULT '0.00',
  `it_iva_g` float(13,2) NOT NULL DEFAULT '0.00',
  `st_iva_g` float(13,2) NOT NULL DEFAULT '0.00',
  `ist_iva_g` float(13,2) NOT NULL DEFAULT '0.00',
  `cantidad` float(13,2) NOT NULL DEFAULT '0.00',
  `idregistro` int(11) NOT NULL DEFAULT '0',
  `cod_imputa` char(4) NOT NULL DEFAULT '',
  `codigo_cta` char(18) NOT NULL DEFAULT '',
  `nombre` char(50) NOT NULL DEFAULT '',
  `cod_deta` int(11) NOT NULL DEFAULT '0',
  `nro_cuota` int(11) NOT NULL DEFAULT '0',
  `cant_ctas` int(11) NOT NULL DEFAULT '0',
  `col_padron` int(11) NOT NULL DEFAULT '0',
  `idregaso` int(11) NOT NULL DEFAULT '0',
  `detalle` char(200) NOT NULL DEFAULT '',
  KEY `idregistro` (`idregistro`),
  KEY `rub_cod` (`rubro`,`codigo`),
  KEY `idregaso` (`idregaso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detfactu`
--

/*!40000 ALTER TABLE `detfactu` DISABLE KEYS */;
/*!40000 ALTER TABLE `detfactu` ENABLE KEYS */;


--
-- Definition of table `detpagosprov`
--

DROP TABLE IF EXISTS `detpagosprov`;
CREATE TABLE `detpagosprov` (
  `idrecibo` int(11) NOT NULL DEFAULT '0',
  `tipopago` int(11) NOT NULL DEFAULT '0',
  `serie` char(2) NOT NULL DEFAULT '',
  `numero` int(11) NOT NULL DEFAULT '0',
  `banco` int(11) NOT NULL DEFAULT '0',
  `filial` int(11) NOT NULL DEFAULT '0',
  `importe` float(13,2) NOT NULL DEFAULT '0.00',
  `codpostal` char(10) NOT NULL DEFAULT '',
  `detercero` int(11) NOT NULL DEFAULT '0',
  `cod_imputa` char(4) NOT NULL DEFAULT '',
  `codigo_cta` char(18) NOT NULL DEFAULT '',
  `nombre` char(30) NOT NULL DEFAULT '',
  `fechaentrega` char(8) NOT NULL DEFAULT '',
  `entregadoa` char(100) NOT NULL DEFAULT '',
  `fechaemision` char(8) NOT NULL DEFAULT '',
  `fechavencimiento` char(8) NOT NULL DEFAULT '',
  `alaordende` char(40) NOT NULL DEFAULT '',
  `librador` char(40) NOT NULL DEFAULT '',
  `loentrega` char(40) NOT NULL DEFAULT '',
  `cuenta` char(20) NOT NULL DEFAULT '',
  `fechadevolucion` char(8) NOT NULL DEFAULT '',
  `motivodevolucion` char(50) NOT NULL DEFAULT '',
  `motivoentrega` char(50) NOT NULL DEFAULT '',
  KEY `idrecibo` (`idrecibo`),
  KEY `detapagos` (`idrecibo`,`serie`,`numero`,`banco`,`filial`),
  KEY `cheques` (`serie`,`numero`,`banco`,`filial`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detpagosprov`
--

/*!40000 ALTER TABLE `detpagosprov` DISABLE KEYS */;
/*!40000 ALTER TABLE `detpagosprov` ENABLE KEYS */;


--
-- Definition of table `ejercicios`
--

DROP TABLE IF EXISTS `ejercicios`;
CREATE TABLE `ejercicios` (
  `ejnumero` int(11) NOT NULL DEFAULT '0',
  `nombre` char(80) NOT NULL DEFAULT '',
  `codigo_cta` char(18) NOT NULL DEFAULT '',
  `nivel` int(11) NOT NULL DEFAULT '0',
  `numero_cta` char(4) NOT NULL DEFAULT '',
  `sumarizaen` char(18) NOT NULL DEFAULT '',
  `sumaen_nom` char(80) NOT NULL DEFAULT '',
  `recibe_ato` char(1) NOT NULL DEFAULT '',
  `activa` char(1) NOT NULL DEFAULT '',
  `saldo_acum` float(13,2) NOT NULL DEFAULT '0.00',
  `subdiario1` char(1) NOT NULL DEFAULT '',
  `subdiario2` char(1) NOT NULL DEFAULT '',
  `subdiario3` char(1) NOT NULL DEFAULT '',
  `subdiario4` char(1) NOT NULL DEFAULT '',
  `subdiario5` char(1) NOT NULL DEFAULT '',
  `mov_deudor` char(1) NOT NULL DEFAULT '',
  `mov_acreed` char(1) NOT NULL DEFAULT '',
  `when_acred` char(200) NOT NULL DEFAULT '',
  `when_debit` char(200) NOT NULL DEFAULT '',
  `excepcion` char(200) NOT NULL DEFAULT '',
  `raiz` char(1) NOT NULL DEFAULT '',
  `aume_dh` int(11) NOT NULL DEFAULT '0',
  `anio` int(11) NOT NULL DEFAULT '0',
  `fech_aper` char(8) NOT NULL DEFAULT '',
  `fech_cierr` char(8) NOT NULL DEFAULT '',
  `saldo_ini` float(13,2) NOT NULL DEFAULT '0.00',
  `movi_debe` float(13,2) NOT NULL DEFAULT '0.00',
  `movi_habe` float(13,2) NOT NULL DEFAULT '0.00',
  `saldo_fin` float(13,2) NOT NULL DEFAULT '0.00',
  KEY `ejnumero` (`ejnumero`),
  KEY `anio` (`anio`),
  KEY `codigo_cta` (`codigo_cta`),
  KEY `ejecodigo` (`ejnumero`,`codigo_cta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ejercicios`
--

/*!40000 ALTER TABLE `ejercicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `ejercicios` ENABLE KEYS */;


--
-- Definition of table `extracbancarias`
--

DROP TABLE IF EXISTS `extracbancarias`;
CREATE TABLE `extracbancarias` (
  `idextrac` int(11) NOT NULL DEFAULT '0',
  `fecha` char(8) NOT NULL DEFAULT '',
  `importe` float(13,2) NOT NULL DEFAULT '0.00',
  `nrocomprobco` int(11) NOT NULL DEFAULT '0',
  `bancoori` int(11) NOT NULL DEFAULT '0',
  `nombancoori` char(80) NOT NULL DEFAULT '',
  `sucursalori` int(11) NOT NULL DEFAULT '0',
  `numeroori` char(20) NOT NULL DEFAULT '',
  `tipoori` int(11) NOT NULL DEFAULT '0',
  `nombcuentaori` char(50) NOT NULL DEFAULT '',
  `ctacontableori` char(18) NOT NULL DEFAULT '',
  `contabilizado` int(11) NOT NULL DEFAULT '0',
  KEY `nrocomprob` (`nrocomprobco`),
  KEY `fecha` (`fecha`),
  KEY `idextrac` (`idextrac`),
  KEY `asiento` (`contabilizado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `extracbancarias`
--

/*!40000 ALTER TABLE `extracbancarias` DISABLE KEYS */;
/*!40000 ALTER TABLE `extracbancarias` ENABLE KEYS */;


--
-- Definition of table `factprov`
--

DROP TABLE IF EXISTS `factprov`;
CREATE TABLE `factprov` (
  `comprobante` char(2) NOT NULL DEFAULT '',
  `tipocompro` int(11) NOT NULL DEFAULT '0',
  `tipo` char(1) NOT NULL DEFAULT '',
  `serie` int(11) NOT NULL DEFAULT '0',
  `numero` int(11) NOT NULL DEFAULT '0',
  `fecha` char(8) NOT NULL DEFAULT '',
  `cod_prov` int(11) NOT NULL DEFAULT '0',
  `nombre` char(60) NOT NULL DEFAULT '',
  `cuit` char(13) NOT NULL DEFAULT '',
  `iva` int(11) NOT NULL DEFAULT '0',
  `cond_vta` int(11) NOT NULL DEFAULT '0',
  `nroremito` int(11) NOT NULL DEFAULT '0',
  `nropedido` int(11) NOT NULL DEFAULT '0',
  `subtotal` float(13,2) NOT NULL DEFAULT '0.00',
  `alic_iva_1` float(13,2) NOT NULL DEFAULT '0.00',
  `imp_iva_1` float(13,2) NOT NULL DEFAULT '0.00',
  `alic_iva_2` float(13,2) NOT NULL DEFAULT '0.00',
  `imp_iva_2` float(13,2) NOT NULL DEFAULT '0.00',
  `alic_iva_3` float(13,2) NOT NULL DEFAULT '0.00',
  `imp_iva_3` float(13,2) NOT NULL DEFAULT '0.00',
  `impuesto` float(13,2) NOT NULL DEFAULT '0.00',
  `percep_iva` float(13,2) NOT NULL DEFAULT '0.00',
  `percep_otro` float(13,2) NOT NULL DEFAULT '0.00',
  `imp_exento` float(13,2) NOT NULL DEFAULT '0.00',
  `no_gravado` float(13,2) NOT NULL DEFAULT '0.00',
  `alic_bonif` float(13,2) NOT NULL DEFAULT '0.00',
  `imp_bonif` float(13,2) NOT NULL DEFAULT '0.00',
  `alic_iva_reg_rg_3337` float(13,2) NOT NULL DEFAULT '0.00',
  `imp_iva_reg_rg_3337` float(13,2) NOT NULL DEFAULT '0.00',
  `alic_ing_brutos_perc` float(13,2) NOT NULL DEFAULT '0.00',
  `imp_ing_brutos_perc` float(13,2) NOT NULL DEFAULT '0.00',
  `total` float(13,2) NOT NULL DEFAULT '0.00',
  `saldo` float(13,2) NOT NULL DEFAULT '0.00',
  `contabilizado` int(11) NOT NULL DEFAULT '0',
  `anulada` char(1) NOT NULL DEFAULT '',
  `fechacarga` char(16) NOT NULL DEFAULT '',
  `usuariocarga` char(10) NOT NULL DEFAULT '',
  `idregistro` int(11) NOT NULL DEFAULT '0',
  `fechaingreso` char(8) NOT NULL DEFAULT '',
  KEY `cuit` (`cuit`),
  KEY `nombre` (`nombre`),
  KEY `asiento` (`contabilizado`),
  KEY `factprov` (`comprobante`,`tipo`,`serie`,`numero`,`fecha`,`cod_prov`),
  KEY `idregistro` (`idregistro`),
  KEY `fechaingre` (`fechaingreso`),
  KEY `fecha` (`fecha`),
  KEY `tipocompro` (`tipocompro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `factprov`
--

/*!40000 ALTER TABLE `factprov` DISABLE KEYS */;
/*!40000 ALTER TABLE `factprov` ENABLE KEYS */;


--
-- Definition of table `factuperiodos`
--

DROP TABLE IF EXISTS `factuperiodos`;
CREATE TABLE `factuperiodos` (
  `mes_fact` int(11) NOT NULL DEFAULT '0',
  `anio_fact` int(11) NOT NULL DEFAULT '0',
  `cod_servi` int(11) NOT NULL DEFAULT '0',
  `fech_venc` char(8) NOT NULL DEFAULT '',
  `fech_ven2` char(8) NOT NULL DEFAULT '',
  `fech_ven3` char(8) NOT NULL DEFAULT '',
  `proxvenc` char(8) NOT NULL DEFAULT '',
  `fechatoma` char(8) NOT NULL DEFAULT '',
  `fech_emis` char(8) NOT NULL DEFAULT '',
  `fech_desc` char(8) NOT NULL DEFAULT '',
  `impresas` char(1) NOT NULL DEFAULT '',
  `imputadas` char(1) NOT NULL DEFAULT '',
  `confirmada` char(1) NOT NULL DEFAULT '',
  KEY `periservi` (`anio_fact`,`mes_fact`,`cod_servi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `factuperiodos`
--

/*!40000 ALTER TABLE `factuperiodos` DISABLE KEYS */;
/*!40000 ALTER TABLE `factuperiodos` ENABLE KEYS */;


--
-- Definition of table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
CREATE TABLE `facturas` (
  `idcomp` int(11) NOT NULL DEFAULT '0',
  `actividad` int(11) NOT NULL DEFAULT '0',
  `numero` int(11) NOT NULL DEFAULT '0',
  `cod_socio` int(11) NOT NULL DEFAULT '0',
  `cod_servi` int(11) NOT NULL DEFAULT '0',
  `cod_subser` int(11) NOT NULL DEFAULT '0',
  `apellido` char(60) NOT NULL DEFAULT '',
  `nombre` char(60) NOT NULL DEFAULT '',
  `direccion` char(30) NOT NULL DEFAULT '',
  `localidad` char(40) NOT NULL DEFAULT '',
  `iva` int(11) NOT NULL DEFAULT '0',
  `cuit` char(13) NOT NULL DEFAULT '',
  `socio` char(1) NOT NULL DEFAULT '',
  `telefono` int(11) NOT NULL DEFAULT '0',
  `nro_boca` char(10) NOT NULL DEFAULT '',
  `partida` char(40) NOT NULL DEFAULT '',
  `manzana` char(10) NOT NULL DEFAULT '',
  `cuotasclo` int(11) NOT NULL DEFAULT '0',
  `ctanroclo` int(11) NOT NULL DEFAULT '0',
  `ctaimpclo` float(13,2) NOT NULL DEFAULT '0.00',
  `categoria` int(11) NOT NULL DEFAULT '0',
  `jubilado` char(1) NOT NULL DEFAULT '',
  `fech_emit` char(8) NOT NULL DEFAULT '',
  `fech_venc` char(8) NOT NULL DEFAULT '',
  `cond_vta` int(11) NOT NULL DEFAULT '0',
  `imp_neto` float(13,2) NOT NULL DEFAULT '0.00',
  `subtotal` float(13,2) NOT NULL DEFAULT '0.00',
  `t_iva_g` float(13,2) NOT NULL DEFAULT '0.00',
  `i_iva_g` float(13,2) NOT NULL DEFAULT '0.00',
  `st_iva_g` float(13,2) NOT NULL DEFAULT '0.00',
  `ist_iva_g` float(13,2) NOT NULL DEFAULT '0.00',
  `t_iva_s` float(13,2) NOT NULL DEFAULT '0.00',
  `i_iva_s` float(13,2) NOT NULL DEFAULT '0.00',
  `st_iva_s` float(13,2) NOT NULL DEFAULT '0.00',
  `ist_iva_s` float(13,2) NOT NULL DEFAULT '0.00',
  `descuento` float(13,2) NOT NULL DEFAULT '0.00',
  `imp_desc` float(13,2) NOT NULL DEFAULT '0.00',
  `recargo` float(13,2) NOT NULL DEFAULT '0.00',
  `imp_recar` float(13,2) NOT NULL DEFAULT '0.00',
  `imp_total` float(13,2) NOT NULL DEFAULT '0.00',
  `oper_exent` char(1) NOT NULL DEFAULT '',
  `anulada` char(1) NOT NULL DEFAULT '',
  `observa` char(200) NOT NULL DEFAULT '',
  `fecha` char(8) NOT NULL DEFAULT '',
  `idregistro` int(11) NOT NULL DEFAULT '0',
  `saldo` float(13,2) NOT NULL DEFAULT '0.00',
  `pul_lib_t` int(11) NOT NULL DEFAULT '0',
  `dctocons` float(13,2) NOT NULL DEFAULT '0.00',
  `abono` float(13,2) NOT NULL DEFAULT '0.00',
  `imp_correo` float(13,2) NOT NULL DEFAULT '0.00',
  `mes_fact` int(11) NOT NULL DEFAULT '0',
  `anio_fact` int(11) NOT NULL DEFAULT '0',
  `costopulso` float(13,2) NOT NULL DEFAULT '0.00',
  `costom3ex` float(13,2) NOT NULL DEFAULT '0.00',
  `costom3ex2` float(13,2) NOT NULL DEFAULT '0.00',
  `ruta1` int(11) NOT NULL DEFAULT '0',
  `folio1` int(11) NOT NULL DEFAULT '0',
  `ruta2` int(11) NOT NULL DEFAULT '0',
  `folio2` int(11) NOT NULL DEFAULT '0',
  `fech_pago` char(8) NOT NULL DEFAULT '',
  `segu_venc` char(8) NOT NULL DEFAULT '',
  `terc_venc` char(8) NOT NULL DEFAULT '',
  `fech_desc` char(8) NOT NULL DEFAULT '',
  `proxvenc` char(8) NOT NULL DEFAULT '',
  `rec_ven1` float(13,2) NOT NULL DEFAULT '0.00',
  `iva_rec_v1` float(13,2) NOT NULL DEFAULT '0.00',
  `rec_ven2` float(13,2) NOT NULL DEFAULT '0.00',
  `iva_rec_v2` float(13,2) NOT NULL DEFAULT '0.00',
  `rec_pago` float(13,2) NOT NULL DEFAULT '0.00',
  `iva_rec_pa` float(13,2) NOT NULL DEFAULT '0.00',
  `contabilizado` int(11) NOT NULL DEFAULT '0',
  `confirmada` char(1) NOT NULL DEFAULT '',
  `rec_pago_aux` float(13,2) NOT NULL DEFAULT '0.00',
  `iva_rec_pa_aux` float(13,2) NOT NULL DEFAULT '0.00',
  `ven_unico` char(1) NOT NULL DEFAULT '',
  `deudacta` float(13,2) NOT NULL DEFAULT '0.00',
  `idasociado` int(11) NOT NULL DEFAULT '0',
  KEY `idregistro` (`idregistro`),
  KEY `idcomp` (`idcomp`),
  KEY `telefono` (`telefono`),
  KEY `rutafolio1` (`ruta1`,`folio1`),
  KEY `rutafolio2` (`ruta2`,`folio2`),
  KEY `socifactu` (`cod_socio`,`cod_servi`,`cod_subser`,`idcomp`,`actividad`,`numero`),
  KEY `asiento` (`contabilizado`),
  KEY `terc_venc` (`terc_venc`),
  KEY `segu_venc` (`segu_venc`),
  KEY `fech_venc` (`fech_venc`),
  KEY `cod_socio` (`cod_socio`),
  KEY `indfactura` (`idcomp`,`actividad`,`numero`),
  KEY `fecha` (`fecha`),
  KEY `fech_emit` (`fech_emit`),
  KEY `servimensu` (`cod_servi`,`anio_fact`,`mes_fact`),
  KEY `apeynom` (`apellido`,`nombre`),
  KEY `calleape` (`localidad`,`apellido`,`nombre`),
  KEY `socsersub` (`cod_socio`,`cod_servi`,`cod_subser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facturas`
--

/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;


--
-- Definition of table `grupfamsepelio`
--

DROP TABLE IF EXISTS `grupfamsepelio`;
CREATE TABLE `grupfamsepelio` (
  `cod_socio` int(11) NOT NULL DEFAULT '0',
  `cod_servi` int(11) NOT NULL DEFAULT '0',
  `cod_subser` int(11) NOT NULL DEFAULT '0',
  `documento` int(11) NOT NULL DEFAULT '0',
  `tipodocu` char(3) NOT NULL DEFAULT '',
  `nombre` char(30) NOT NULL DEFAULT '',
  `apellido` char(30) NOT NULL DEFAULT '',
  `fech_nac` char(8) NOT NULL DEFAULT '',
  `parentesco` char(20) NOT NULL DEFAULT '',
  `fech_alta` char(8) NOT NULL DEFAULT '',
  `dias_vigen` int(11) NOT NULL DEFAULT '0',
  `fech_vigen` char(8) NOT NULL DEFAULT '',
  `idregistro` int(11) NOT NULL DEFAULT '0',
  `sexo` int(11) NOT NULL DEFAULT '0',
  `edad` int(11) NOT NULL DEFAULT '0',
  KEY `socisersub` (`cod_socio`,`cod_servi`,`cod_subser`),
  KEY `idregistro` (`idregistro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grupfamsepelio`
--

/*!40000 ALTER TABLE `grupfamsepelio` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupfamsepelio` ENABLE KEYS */;


--
-- Definition of table `gruposepelio`
--

DROP TABLE IF EXISTS `gruposepelio`;
CREATE TABLE `gruposepelio` (
  `mes_fact` int(11) NOT NULL DEFAULT '0',
  `anio_fact` int(11) NOT NULL DEFAULT '0',
  `facturar` char(1) NOT NULL DEFAULT '',
  `categoria` int(11) NOT NULL DEFAULT '0',
  `descrip` char(60) NOT NULL DEFAULT '',
  `cantgrupos` int(11) NOT NULL DEFAULT '0',
  `cantperso` int(11) NOT NULL DEFAULT '0',
  KEY `aniomes` (`anio_fact`,`mes_fact`),
  KEY `factucate` (`facturar`,`categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gruposepelio`
--

/*!40000 ALTER TABLE `gruposepelio` DISABLE KEYS */;
/*!40000 ALTER TABLE `gruposepelio` ENABLE KEYS */;


--
-- Definition of table `inventar`
--

DROP TABLE IF EXISTS `inventar`;
CREATE TABLE `inventar` (
  `nro` int(11) NOT NULL DEFAULT '0',
  `parte_de` int(11) NOT NULL DEFAULT '0',
  `rubro` char(15) NOT NULL DEFAULT '',
  `subrubro` char(15) NOT NULL DEFAULT '',
  `bien` char(20) NOT NULL DEFAULT '',
  `modelo` char(15) NOT NULL DEFAULT '',
  `serie` char(10) NOT NULL DEFAULT '',
  `proveedor` char(30) NOT NULL DEFAULT '',
  `fecha_adq` char(8) NOT NULL DEFAULT '',
  `cantidad` int(11) NOT NULL DEFAULT '0',
  `pcio_unit` float(13,2) NOT NULL DEFAULT '0.00',
  `ubicacion` char(20) NOT NULL DEFAULT '',
  `encargado` char(20) NOT NULL DEFAULT '',
  `observac` char(200) NOT NULL DEFAULT '',
  `operador` char(10) NOT NULL DEFAULT '',
  KEY `rubro` (`rubro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventar`
--

/*!40000 ALTER TABLE `inventar` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventar` ENABLE KEYS */;


--
-- Definition of table `ivacpra`
--

DROP TABLE IF EXISTS `ivacpra`;
CREATE TABLE `ivacpra` (
  `mescpra` char(2) NOT NULL DEFAULT '',
  `anocpra` char(4) NOT NULL DEFAULT '',
  `fecha` char(8) NOT NULL DEFAULT '',
  `tipo_fac` char(1) NOT NULL DEFAULT '',
  `nro_fac` char(13) NOT NULL DEFAULT '',
  `nro_prov` int(11) NOT NULL DEFAULT '0',
  `nomb` char(28) NOT NULL DEFAULT '',
  `cuit` char(13) NOT NULL DEFAULT '',
  `cond_iva` char(3) NOT NULL DEFAULT '',
  `netograv` float(13,2) NOT NULL DEFAULT '0.00',
  `operexc` float(13,2) NOT NULL DEFAULT '0.00',
  `iva_gral` float(13,2) NOT NULL DEFAULT '0.00',
  `iva_ni` float(13,2) NOT NULL DEFAULT '0.00',
  `retenciva` float(13,2) NOT NULL DEFAULT '0.00',
  `retencing` float(13,2) NOT NULL DEFAULT '0.00',
  `imp_fac` float(13,2) NOT NULL DEFAULT '0.00',
  KEY `fecha` (`anocpra`,`mescpra`,`fecha`,`tipo_fac`,`nro_fac`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ivacpra`
--

/*!40000 ALTER TABLE `ivacpra` DISABLE KEYS */;
/*!40000 ALTER TABLE `ivacpra` ENABLE KEYS */;


--
-- Definition of table `jerarquias`
--

DROP TABLE IF EXISTS `jerarquias`;
CREATE TABLE `jerarquias` (
  `jerarquia` char(10) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jerarquias`
--

/*!40000 ALTER TABLE `jerarquias` DISABLE KEYS */;
/*!40000 ALTER TABLE `jerarquias` ENABLE KEYS */;


--
-- Definition of table `largadistancia`
--

DROP TABLE IF EXISTS `largadistancia`;
CREATE TABLE `largadistancia` (
  `mes_fact` int(11) NOT NULL DEFAULT '0',
  `anio_fact` int(11) NOT NULL DEFAULT '0',
  `telefono` int(11) NOT NULL DEFAULT '0',
  `fech_llam` char(8) NOT NULL DEFAULT '',
  `nro_disca` char(20) NOT NULL DEFAULT '',
  `consumo` int(11) NOT NULL DEFAULT '0',
  `importe` float(13,2) NOT NULL DEFAULT '0.00',
  `t_iva_g` float(13,2) NOT NULL DEFAULT '0.00',
  `st_iva_g` float(13,2) NOT NULL DEFAULT '0.00',
  `it_iva_g` float(13,2) NOT NULL DEFAULT '0.00',
  `ist_iva_g` float(13,2) NOT NULL DEFAULT '0.00',
  `facturado` char(1) NOT NULL DEFAULT '',
  `cod_imputa` char(4) NOT NULL DEFAULT '',
  `codigo_cta` char(18) NOT NULL DEFAULT '',
  `nombre` char(30) NOT NULL DEFAULT '',
  `observa` char(60) NOT NULL DEFAULT '',
  `idcomp` int(11) NOT NULL DEFAULT '0',
  `actividad` int(11) NOT NULL DEFAULT '0',
  `numero` int(11) NOT NULL DEFAULT '0',
  `idregistro` int(11) NOT NULL DEFAULT '0',
  KEY `cod_imputa` (`cod_imputa`),
  KEY `codimputa` (`cod_imputa`),
  KEY `nombre` (`nombre`),
  KEY `codigo_cta` (`codigo_cta`),
  KEY `idregistro` (`idregistro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `largadistancia`
--

/*!40000 ALTER TABLE `largadistancia` DISABLE KEYS */;
/*!40000 ALTER TABLE `largadistancia` ENABLE KEYS */;


--
-- Definition of table `librosocios`
--

DROP TABLE IF EXISTS `librosocios`;
CREATE TABLE `librosocios` (
  `cod_socio` int(11) NOT NULL DEFAULT '0',
  `cod_servi` int(11) NOT NULL DEFAULT '0',
  `apellido` char(50) NOT NULL DEFAULT '',
  `domicilio` char(100) NOT NULL DEFAULT '',
  `localidad` char(50) NOT NULL DEFAULT '',
  `dnicuit` char(15) NOT NULL DEFAULT '',
  `fechaing` char(8) NOT NULL DEFAULT '',
  `actanro` char(10) NOT NULL DEFAULT '',
  `nrosolici` int(11) NOT NULL DEFAULT '0',
  `capsusc` float(13,2) NOT NULL DEFAULT '0.00',
  `capreint` float(13,2) NOT NULL DEFAULT '0.00',
  `bajatrans` float(13,2) NOT NULL DEFAULT '0.00',
  `capemiti` float(13,2) NOT NULL DEFAULT '0.00',
  `capinteg` float(13,2) NOT NULL DEFAULT '0.00',
  `fechabaja` char(8) NOT NULL DEFAULT '',
  `causabaja` char(100) NOT NULL DEFAULT '',
  `observa` char(150) NOT NULL DEFAULT '',
  `fecha` char(8) NOT NULL DEFAULT '',
  `idcomp` int(11) NOT NULL DEFAULT '0',
  `actividad` int(11) NOT NULL DEFAULT '0',
  `numero` int(11) NOT NULL DEFAULT '0',
  `nro_asto` int(11) NOT NULL DEFAULT '0',
  `idregistro` int(11) NOT NULL DEFAULT '0',
  `idmsocio` int(11) NOT NULL DEFAULT '0',
  KEY `idmsocio` (`idmsocio`),
  KEY `idregistro` (`idregistro`),
  KEY `nro_asto` (`nro_asto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `librosocios`
--

/*!40000 ALTER TABLE `librosocios` DISABLE KEYS */;
/*!40000 ALTER TABLE `librosocios` ENABLE KEYS */;


--
-- Definition of table `medagua`
--

DROP TABLE IF EXISTS `medagua`;
CREATE TABLE `medagua` (
  `mes_fact` int(11) NOT NULL DEFAULT '0',
  `anio_fact` int(11) NOT NULL DEFAULT '0',
  `cod_socio` int(11) NOT NULL DEFAULT '0',
  `cod_servi` int(11) NOT NULL DEFAULT '0',
  `cod_subser` int(11) NOT NULL DEFAULT '0',
  `apellido` char(40) NOT NULL DEFAULT '',
  `nombre` char(40) NOT NULL DEFAULT '',
  `nro_boca` char(10) NOT NULL DEFAULT '',
  `fecha` char(8) NOT NULL DEFAULT '',
  `vue_ante` int(11) NOT NULL DEFAULT '0',
  `med_ante` int(11) NOT NULL DEFAULT '0',
  `vue_actu` int(11) NOT NULL DEFAULT '0',
  `med_actu` int(11) NOT NULL DEFAULT '0',
  `consumo` int(11) NOT NULL DEFAULT '0',
  `ruta1` int(11) NOT NULL DEFAULT '0',
  `folio1` int(11) NOT NULL DEFAULT '0',
  `ruta2` int(11) NOT NULL DEFAULT '0',
  `folio2` int(11) NOT NULL DEFAULT '0',
  `facturado` char(1) NOT NULL DEFAULT '',
  `idcomp` int(11) NOT NULL DEFAULT '0',
  `actividad` int(11) NOT NULL DEFAULT '0',
  `numero` int(11) NOT NULL DEFAULT '0',
  `idregistro` int(11) NOT NULL DEFAULT '0',
  KEY `nro_boca` (`nro_boca`),
  KEY `mesanio` (`anio_fact`,`mes_fact`),
  KEY `codigo` (`cod_socio`,`cod_servi`,`cod_subser`),
  KEY `apeynom` (`apellido`,`nombre`),
  KEY `rutafolio1` (`ruta1`,`folio1`),
  KEY `rutafolio2` (`ruta2`,`folio2`),
  KEY `periboca` (`anio_fact`,`mes_fact`,`nro_boca`),
  KEY `pericuenta` (`anio_fact`,`mes_fact`,`cod_socio`,`cod_servi`,`cod_subser`),
  KEY `idregistro` (`idregistro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medagua`
--

/*!40000 ALTER TABLE `medagua` DISABLE KEYS */;
/*!40000 ALTER TABLE `medagua` ENABLE KEYS */;


--
-- Definition of table `medtelefono`
--

DROP TABLE IF EXISTS `medtelefono`;
CREATE TABLE `medtelefono` (
  `telefono` int(11) NOT NULL DEFAULT '0',
  `mes_fact` int(11) NOT NULL DEFAULT '0',
  `anio_fact` int(11) NOT NULL DEFAULT '0',
  `fecha` char(16) NOT NULL DEFAULT '',
  `med_ante_l` int(11) NOT NULL DEFAULT '0',
  `med_actu_l` int(11) NOT NULL DEFAULT '0',
  `med_anteld` int(11) NOT NULL DEFAULT '0',
  `med_actuld` int(11) NOT NULL DEFAULT '0',
  `med_ante` int(11) NOT NULL DEFAULT '0',
  `med_actu` int(11) NOT NULL DEFAULT '0',
  `consumo` int(11) NOT NULL DEFAULT '0',
  `pulddn1` int(11) NOT NULL DEFAULT '0',
  `pulddn2` int(11) NOT NULL DEFAULT '0',
  `pesos_n` float(13,2) NOT NULL DEFAULT '0.00',
  `pesos_r` float(13,2) NOT NULL DEFAULT '0.00',
  `pesos` float(13,2) NOT NULL DEFAULT '0.00',
  `canddn1` int(11) NOT NULL DEFAULT '0',
  `durddn1` int(11) NOT NULL DEFAULT '0',
  `pesosddn1` float(13,2) NOT NULL DEFAULT '0.00',
  `canddn2` int(11) NOT NULL DEFAULT '0',
  `durddn2` int(11) NOT NULL DEFAULT '0',
  `pesosddn2` float(13,2) NOT NULL DEFAULT '0.00',
  `canddi1` int(11) NOT NULL DEFAULT '0',
  `durddi1` int(11) NOT NULL DEFAULT '0',
  `pesosddi1` float(13,2) NOT NULL DEFAULT '0.00',
  `canddi2` int(11) NOT NULL DEFAULT '0',
  `durddi2` int(11) NOT NULL DEFAULT '0',
  `pesosddi2` float(13,2) NOT NULL DEFAULT '0.00',
  `canloc1` int(11) NOT NULL DEFAULT '0',
  `durloc1` int(11) NOT NULL DEFAULT '0',
  `pesosloc1` float(13,2) NOT NULL DEFAULT '0.00',
  `canloc2` int(11) NOT NULL DEFAULT '0',
  `durloc2` int(11) NOT NULL DEFAULT '0',
  `pesosloc2` float(13,2) NOT NULL DEFAULT '0.00',
  `facturado` char(1) NOT NULL DEFAULT '',
  `idcomp` int(11) NOT NULL DEFAULT '0',
  `actividad` int(11) NOT NULL DEFAULT '0',
  `numero` int(11) NOT NULL DEFAULT '0',
  `idregistro` int(11) NOT NULL DEFAULT '0',
  KEY `telefono` (`telefono`),
  KEY `mesanio` (`anio_fact`,`mes_fact`),
  KEY `telaniomes` (`telefono`,`anio_fact`,`mes_fact`),
  KEY `idcomp` (`idcomp`),
  KEY `idregistro` (`idregistro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medtelefono`
--

/*!40000 ALTER TABLE `medtelefono` DISABLE KEYS */;
/*!40000 ALTER TABLE `medtelefono` ENABLE KEYS */;


--
-- Definition of table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `idmenu` int(11) NOT NULL DEFAULT '0',
  `idmenup` int(11) NOT NULL DEFAULT '0',
  `nivel` char(2) NOT NULL DEFAULT '',
  `codigo` char(14) NOT NULL DEFAULT '',
  `descrip` char(50) NOT NULL DEFAULT '',
  `arranque` char(254) NOT NULL DEFAULT '',
  `comando` char(254) NOT NULL DEFAULT '',
  `opcion` char(2) NOT NULL DEFAULT '',
  `prun` char(1) NOT NULL DEFAULT 'S',
  `pusu` char(1) NOT NULL DEFAULT 'S',
  `habilitado` char(1) NOT NULL DEFAULT 'S',
  `orden` char(2) NOT NULL DEFAULT '00',
  `usuario` char(20) NOT NULL DEFAULT '',
  `fechahora` char(18) NOT NULL DEFAULT '',
  PRIMARY KEY (`idmenu`),
  KEY `idmenu` (`idmenu`),
  KEY `nivel` (`nivel`),
  KEY `codigo` (`codigo`),
  KEY `habilitado` (`habilitado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;


--
-- Definition of table `menusql`
--

DROP TABLE IF EXISTS `menusql`;
CREATE TABLE `menusql` (
  `idmenu` int(11) NOT NULL DEFAULT '0',
  `idmenup` int(11) NOT NULL DEFAULT '0',
  `nivel` char(2) NOT NULL DEFAULT '',
  `codigo` char(14) NOT NULL DEFAULT '',
  `descrip` char(50) NOT NULL DEFAULT '',
  `arranque` char(254) NOT NULL DEFAULT '',
  `comando` char(254) NOT NULL DEFAULT '',
  `opcion` char(2) NOT NULL DEFAULT '',
  `prun` char(1) NOT NULL DEFAULT 'S',
  `pusu` char(1) NOT NULL DEFAULT 'S',
  `habilitado` char(1) NOT NULL DEFAULT 'S',
  `orden` char(2) NOT NULL DEFAULT '00',
  `usuario` char(20) NOT NULL DEFAULT '',
  `fechahora` char(18) NOT NULL DEFAULT '',
  PRIMARY KEY (`idmenu`),
  KEY `idmenu` (`idmenu`),
  KEY `nivel` (`nivel`),
  KEY `codigo` (`codigo`),
  KEY `habilitado` (`habilitado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menusql`
--

/*!40000 ALTER TABLE `menusql` DISABLE KEYS */;
/*!40000 ALTER TABLE `menusql` ENABLE KEYS */;


--
-- Definition of table `padagua`
--

DROP TABLE IF EXISTS `padagua`;
CREATE TABLE `padagua` (
  `codigo` char(12) NOT NULL DEFAULT '',
  `nro_boca` char(10) NOT NULL DEFAULT '',
  `apeynom` char(40) NOT NULL DEFAULT '',
  `factnro` int(11) NOT NULL DEFAULT '0',
  `lante` int(11) NOT NULL DEFAULT '0',
  `lactu` int(11) NOT NULL DEFAULT '0',
  `consumo` int(11) NOT NULL DEFAULT '0',
  `abono` float(13,2) NOT NULL DEFAULT '0.00',
  `impexede` float(13,2) NOT NULL DEFAULT '0.00',
  `bid` float(13,2) NOT NULL DEFAULT '0.00',
  `acciones` float(13,2) NOT NULL DEFAULT '0.00',
  `ivainsc` float(13,2) NOT NULL DEFAULT '0.00',
  `ivanoinsc` float(13,2) NOT NULL DEFAULT '0.00',
  `enres` float(13,2) NOT NULL DEFAULT '0.00',
  `cloaca` float(13,2) NOT NULL DEFAULT '0.00',
  `enrcloa` float(13,2) NOT NULL DEFAULT '0.00',
  `neto` float(13,2) NOT NULL DEFAULT '0.00',
  `totcreca` float(13,2) NOT NULL DEFAULT '0.00',
  `mes_fact` int(11) NOT NULL DEFAULT '0',
  `anio_fact` int(11) NOT NULL DEFAULT '0',
  KEY `apeynom` (`apeynom`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `padagua`
--

/*!40000 ALTER TABLE `padagua` DISABLE KEYS */;
/*!40000 ALTER TABLE `padagua` ENABLE KEYS */;


--
-- Definition of table `padtelefono`
--

DROP TABLE IF EXISTS `padtelefono`;
CREATE TABLE `padtelefono` (
  `codigo` char(12) NOT NULL DEFAULT '',
  `telefono` int(11) NOT NULL DEFAULT '0',
  `apeynom` char(40) NOT NULL DEFAULT '',
  `factnro` int(11) NOT NULL DEFAULT '0',
  `abono` float(13,2) NOT NULL DEFAULT '0.00',
  `lante` int(11) NOT NULL DEFAULT '0',
  `lactu` float(13,2) NOT NULL DEFAULT '0.00',
  `pulsos` float(13,2) NOT NULL DEFAULT '0.00',
  `imppulsos` float(13,2) NOT NULL DEFAULT '0.00',
  `guias` float(13,2) NOT NULL DEFAULT '0.00',
  `ldistancia` float(13,2) NOT NULL DEFAULT '0.00',
  `acciones` float(13,2) NOT NULL DEFAULT '0.00',
  `cntt` float(13,2) NOT NULL DEFAULT '0.00',
  `matyotros` float(13,2) NOT NULL DEFAULT '0.00',
  `seguros` float(13,2) NOT NULL DEFAULT '0.00',
  `varios` float(13,2) NOT NULL DEFAULT '0.00',
  `cti` float(13,2) NOT NULL DEFAULT '0.00',
  `cargcons` float(13,2) NOT NULL DEFAULT '0.00',
  `cadmin` float(13,2) NOT NULL DEFAULT '0.00',
  `ivainsc` float(13,2) NOT NULL DEFAULT '0.00',
  `ivanoinsc` float(13,2) NOT NULL DEFAULT '0.00',
  `bonif` float(13,2) NOT NULL DEFAULT '0.00',
  `neto` float(13,2) NOT NULL DEFAULT '0.00',
  `totcreca` float(13,2) NOT NULL DEFAULT '0.00',
  `mes_fact` int(11) NOT NULL DEFAULT '0',
  `anio_fact` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `padtelefono`
--

/*!40000 ALTER TABLE `padtelefono` DISABLE KEYS */;
/*!40000 ALTER TABLE `padtelefono` ENABLE KEYS */;


--
-- Definition of table `parametros`
--

DROP TABLE IF EXISTS `parametros`;
CREATE TABLE `parametros` (
  `boletadepo` int(11) NOT NULL DEFAULT '0',
  `nro_asto` int(11) NOT NULL DEFAULT '0',
  `nro_asto_conta` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parametros`
--

/*!40000 ALTER TABLE `parametros` DISABLE KEYS */;
/*!40000 ALTER TABLE `parametros` ENABLE KEYS */;


--
-- Definition of table `perfilmh`
--

DROP TABLE IF EXISTS `perfilmh`;
CREATE TABLE `perfilmh` (
  `idperfil` int(11) NOT NULL DEFAULT '0',
  `idmenu` int(11) NOT NULL DEFAULT '0',
  `habilitado` char(1) NOT NULL DEFAULT 'S',
  KEY `idmenu` (`idmenu`),
  KEY `idperfil` (`idperfil`),
  KEY `habilitado` (`habilitado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perfilmh`
--

/*!40000 ALTER TABLE `perfilmh` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfilmh` ENABLE KEYS */;


--
-- Definition of table `perfilmp`
--

DROP TABLE IF EXISTS `perfilmp`;
CREATE TABLE `perfilmp` (
  `idperfil` int(11) NOT NULL DEFAULT '0',
  `perfil` char(20) NOT NULL DEFAULT '',
  `descrip` char(200) NOT NULL DEFAULT '',
  `habilitado` char(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`idperfil`),
  KEY `idperfil` (`idperfil`),
  KEY `habilitado` (`habilitado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perfilmp`
--

/*!40000 ALTER TABLE `perfilmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfilmp` ENABLE KEYS */;


--
-- Definition of table `perfilusu`
--

DROP TABLE IF EXISTS `perfilusu`;
CREATE TABLE `perfilusu` (
  `idperfil` int(11) NOT NULL DEFAULT '0',
  `usuario` char(20) NOT NULL DEFAULT '',
  `habilitado` char(1) NOT NULL DEFAULT 'S',
  `activo` int(11) NOT NULL DEFAULT '0',
  KEY `idperfil` (`idperfil`),
  KEY `usuario` (`usuario`),
  KEY `habilitado` (`habilitado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perfilusu`
--

/*!40000 ALTER TABLE `perfilusu` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfilusu` ENABLE KEYS */;


--
-- Definition of table `planctas`
--

DROP TABLE IF EXISTS `planctas`;
CREATE TABLE `planctas` (
  `nombre` char(50) NOT NULL DEFAULT '',
  `codigo_cta` char(18) NOT NULL DEFAULT '',
  `nivel` int(11) NOT NULL DEFAULT '0',
  `numero_cta` char(4) NOT NULL DEFAULT '',
  `sumarizaen` char(18) NOT NULL DEFAULT '',
  `sumaen_nom` char(50) NOT NULL DEFAULT '',
  `recibe_ato` char(1) NOT NULL DEFAULT '',
  `activa` char(1) NOT NULL DEFAULT '',
  `saldo_acum` float(13,2) NOT NULL DEFAULT '0.00',
  `subdiario1` char(1) NOT NULL DEFAULT '',
  `subdiario2` char(1) NOT NULL DEFAULT '',
  `subdiario3` char(1) NOT NULL DEFAULT '',
  `subdiario4` char(1) NOT NULL DEFAULT '',
  `subdiario5` char(1) NOT NULL DEFAULT '',
  `mov_deudor` char(1) NOT NULL DEFAULT '',
  `mov_acreed` char(1) NOT NULL DEFAULT '',
  `when_acred` char(200) NOT NULL DEFAULT '',
  `when_debit` char(200) NOT NULL DEFAULT '',
  `excepcion` char(200) NOT NULL DEFAULT '',
  `raiz` char(1) NOT NULL DEFAULT '',
  `aume_dh` int(11) NOT NULL DEFAULT '0',
  `ejnumero` int(11) NOT NULL DEFAULT '0',
  `anio` int(11) NOT NULL DEFAULT '0',
  KEY `codigo_cta` (`codigo_cta`),
  KEY `nombre` (`nombre`),
  KEY `anio` (`anio`),
  KEY `ejnumero` (`ejnumero`),
  KEY `ejecodigo` (`ejnumero`,`codigo_cta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `planctas`
--

/*!40000 ALTER TABLE `planctas` DISABLE KEYS */;
/*!40000 ALTER TABLE `planctas` ENABLE KEYS */;


--
-- Definition of table `planillacaja`
--

DROP TABLE IF EXISTS `planillacaja`;
CREATE TABLE `planillacaja` (
  `planilla` char(1) NOT NULL DEFAULT '',
  `fecha` char(8) NOT NULL DEFAULT '',
  `numero` int(11) NOT NULL DEFAULT '0',
  `saldoanterior` float(13,2) NOT NULL DEFAULT '0.00',
  `ingresos` float(13,2) NOT NULL DEFAULT '0.00',
  `egresos` float(13,2) NOT NULL DEFAULT '0.00',
  `arqueo` float(13,2) NOT NULL DEFAULT '0.00',
  KEY `fecha` (`fecha`),
  KEY `planilla` (`planilla`,`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `planillacaja`
--

/*!40000 ALTER TABLE `planillacaja` DISABLE KEYS */;
/*!40000 ALTER TABLE `planillacaja` ENABLE KEYS */;


--
-- Definition of table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores` (
  `cod_prov` int(11) NOT NULL DEFAULT '0',
  `apellido` char(40) NOT NULL DEFAULT '',
  `nombre` char(40) NOT NULL DEFAULT '',
  `cargo` char(15) NOT NULL DEFAULT '',
  `compania` char(40) NOT NULL DEFAULT '',
  `cuit` char(13) NOT NULL DEFAULT '',
  `calle_cli` char(40) NOT NULL DEFAULT '',
  `calle_cnia` char(40) NOT NULL DEFAULT '',
  `iva` int(11) NOT NULL DEFAULT '0',
  `saldo_gral` float(13,2) NOT NULL DEFAULT '0.00',
  `fech_ing` char(8) NOT NULL DEFAULT '',
  `fech_baja` char(8) NOT NULL DEFAULT '',
  `tel_cli` char(15) NOT NULL DEFAULT '',
  `tel_cnia` char(15) NOT NULL DEFAULT '',
  `ciudad_cli` char(12) NOT NULL DEFAULT '',
  `ciudad_cni` char(12) NOT NULL DEFAULT '',
  `cp_cli` char(10) NOT NULL DEFAULT '',
  `cp_cnia` char(10) NOT NULL DEFAULT '',
  `provin_cnia` char(30) NOT NULL DEFAULT '',
  `provin_cli` char(30) NOT NULL DEFAULT '',
  `fax_cli` char(15) NOT NULL DEFAULT '',
  `fax_cnia` char(15) NOT NULL DEFAULT '',
  `email_cli` char(40) NOT NULL DEFAULT '',
  `email_cnia` char(40) NOT NULL DEFAULT '',
  `dni` int(11) NOT NULL DEFAULT '0',
  `nacim` char(8) NOT NULL DEFAULT '',
  `banco` char(1) NOT NULL DEFAULT '',
  `ctacontable` char(18) NOT NULL DEFAULT '',
  KEY `compania` (`compania`),
  KEY `apellido` (`apellido`),
  KEY `cod_prov` (`cod_prov`),
  KEY `cuit` (`cuit`),
  KEY `ciudad_cni` (`ciudad_cni`),
  KEY `calle_cnia` (`calle_cnia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `proveedores`
--

/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;


--
-- Definition of table `recibos`
--

DROP TABLE IF EXISTS `recibos`;
CREATE TABLE `recibos` (
  `idrecibo` int(11) NOT NULL DEFAULT '0',
  `idcomp` int(11) NOT NULL DEFAULT '0',
  `nrorecibo` int(11) NOT NULL DEFAULT '0',
  `fecha` char(8) NOT NULL DEFAULT '',
  `importe` float(13,2) NOT NULL DEFAULT '0.00',
  `concepto` char(200) NOT NULL DEFAULT '',
  `cod_socio` int(11) NOT NULL DEFAULT '0',
  `nombre` char(60) NOT NULL DEFAULT '',
  `contabilizado` int(11) NOT NULL DEFAULT '0',
  `nro_arqueo` int(11) NOT NULL DEFAULT '0',
  `saldo` float(13,2) NOT NULL DEFAULT '0.00',
  `eracobroacuenta` char(1) NOT NULL DEFAULT '',
  KEY `nrorecibo` (`nrorecibo`),
  KEY `idrecibo` (`idrecibo`),
  KEY `cod_socio` (`cod_socio`),
  KEY `idcomp` (`idcomp`),
  KEY `nro_arqueo` (`nro_arqueo`),
  KEY `cobroacuen` (`cod_socio`,`eracobroacuenta`),
  KEY `fecha` (`fecha`),
  KEY `asiento` (`contabilizado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recibos`
--

/*!40000 ALTER TABLE `recibos` DISABLE KEYS */;
/*!40000 ALTER TABLE `recibos` ENABLE KEYS */;


--
-- Definition of table `recibosfact`
--

DROP TABLE IF EXISTS `recibosfact`;
CREATE TABLE `recibosfact` (
  `idrecibo` int(11) NOT NULL DEFAULT '0',
  `idregistro` int(11) NOT NULL DEFAULT '0',
  `imputado` float(13,2) NOT NULL DEFAULT '0.00',
  `rec_pago` float(13,2) NOT NULL DEFAULT '0.00',
  `iva_rec_pa` float(13,2) NOT NULL DEFAULT '0.00',
  KEY `idregistro` (`idregistro`),
  KEY `idrecibo` (`idrecibo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recibosfact`
--

/*!40000 ALTER TABLE `recibosfact` DISABLE KEYS */;
/*!40000 ALTER TABLE `recibosfact` ENABLE KEYS */;


--
-- Definition of table `recibosfactprov`
--

DROP TABLE IF EXISTS `recibosfactprov`;
CREATE TABLE `recibosfactprov` (
  `idrecibo` int(11) NOT NULL DEFAULT '0',
  `idregistro` int(11) NOT NULL DEFAULT '0',
  `imputado` float(13,2) NOT NULL DEFAULT '0.00',
  `idfacturas` int(11) NOT NULL DEFAULT '0',
  KEY `idregistro` (`idregistro`),
  KEY `idrecibo` (`idrecibo`),
  KEY `idfacturas` (`idfacturas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recibosfactprov`
--

/*!40000 ALTER TABLE `recibosfactprov` DISABLE KEYS */;
/*!40000 ALTER TABLE `recibosfactprov` ENABLE KEYS */;


--
-- Definition of table `recibosprov`
--

DROP TABLE IF EXISTS `recibosprov`;
CREATE TABLE `recibosprov` (
  `idrecibo` int(11) NOT NULL DEFAULT '0',
  `idcomp` int(11) NOT NULL DEFAULT '0',
  `nrorecibo` int(11) NOT NULL DEFAULT '0',
  `fecha` char(8) NOT NULL DEFAULT '',
  `importe` float(13,2) NOT NULL DEFAULT '0.00',
  `concepto` char(200) NOT NULL DEFAULT '',
  `cod_socio` int(11) NOT NULL DEFAULT '0',
  `nombre` char(30) NOT NULL DEFAULT '',
  `contabilizado` int(11) NOT NULL DEFAULT '0',
  `saldo` float(13,2) NOT NULL DEFAULT '0.00',
  `erapagoacuenta` char(1) NOT NULL DEFAULT '',
  KEY `nrorecibo` (`nrorecibo`),
  KEY `cod_socio` (`cod_socio`),
  KEY `idcomp` (`idcomp`),
  KEY `idrecibo` (`idrecibo`),
  KEY `pagocuenta` (`cod_socio`,`erapagoacuenta`),
  KEY `asiento` (`contabilizado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recibosprov`
--

/*!40000 ALTER TABLE `recibosprov` DISABLE KEYS */;
/*!40000 ALTER TABLE `recibosprov` ENABLE KEYS */;


--
-- Definition of table `regtasa`
--

DROP TABLE IF EXISTS `regtasa`;
CREATE TABLE `regtasa` (
  `tasa` char(1) NOT NULL DEFAULT '',
  `horadesde` int(11) NOT NULL DEFAULT '0',
  `horahasta` int(11) NOT NULL DEFAULT '0',
  `tipobanda` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `regtasa`
--

/*!40000 ALTER TABLE `regtasa` DISABLE KEYS */;
/*!40000 ALTER TABLE `regtasa` ENABLE KEYS */;


--
-- Definition of table `rubros`
--

DROP TABLE IF EXISTS `rubros`;
CREATE TABLE `rubros` (
  `rubro` char(3) NOT NULL DEFAULT '',
  `detalle` char(30) NOT NULL DEFAULT '',
  KEY `rubro` (`rubro`),
  KEY `detalle` (`detalle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rubros`
--

/*!40000 ALTER TABLE `rubros` DISABLE KEYS */;
/*!40000 ALTER TABLE `rubros` ENABLE KEYS */;


--
-- Definition of table `servdetalle`
--

DROP TABLE IF EXISTS `servdetalle`;
CREATE TABLE `servdetalle` (
  `cod_servi` int(11) NOT NULL DEFAULT '0',
  `cod_deta` int(11) NOT NULL DEFAULT '0',
  `cant_ctas` int(11) NOT NULL DEFAULT '0',
  `nro_cuota` int(11) NOT NULL DEFAULT '0',
  `rubro` char(3) NOT NULL DEFAULT '',
  `codigo` char(6) NOT NULL DEFAULT '',
  `cantidad` float(13,2) NOT NULL DEFAULT '0.00',
  `detalle` char(60) NOT NULL DEFAULT '',
  `unitario` float(13,2) NOT NULL DEFAULT '0.00',
  `t_iva_g` float(13,2) NOT NULL DEFAULT '0.00',
  `st_iva_g` float(13,2) NOT NULL DEFAULT '0.00',
  `it_iva_g` float(13,2) NOT NULL DEFAULT '0.00',
  `ist_iva_g` float(13,2) NOT NULL DEFAULT '0.00',
  `tot_deta` float(13,2) NOT NULL DEFAULT '0.00',
  `codigo_cta` char(18) NOT NULL DEFAULT '',
  `cod_imputa` char(4) NOT NULL DEFAULT '',
  `nombre` char(30) NOT NULL DEFAULT '',
  `todo_meses` char(1) NOT NULL DEFAULT '',
  `sobretasa` char(1) NOT NULL DEFAULT '',
  `col_padron` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `servdetalle`
--

/*!40000 ALTER TABLE `servdetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `servdetalle` ENABLE KEYS */;


--
-- Definition of table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
CREATE TABLE `servicios` (
  `cod_servi` int(11) NOT NULL DEFAULT '0',
  `nom_servi` char(20) NOT NULL DEFAULT '',
  `descrip` char(200) NOT NULL DEFAULT '',
  `fech_alta` char(8) NOT NULL DEFAULT '',
  `fech_baja` char(8) NOT NULL DEFAULT '',
  `t_iva_g` float(13,2) NOT NULL DEFAULT '0.00',
  `st_iva_g` float(13,2) NOT NULL DEFAULT '0.00',
  `t_iva_s` float(13,2) NOT NULL DEFAULT '0.00',
  `st_iva_s` float(13,2) NOT NULL DEFAULT '0.00',
  `int_mes` float(13,2) NOT NULL DEFAULT '0.00',
  `int_diario` float(13,2) NOT NULL DEFAULT '0.00',
  `dias_2venc` int(11) NOT NULL DEFAULT '0',
  `dias_3venc` int(11) NOT NULL DEFAULT '0',
  `dias_desc` int(11) NOT NULL DEFAULT '0',
  KEY `cod_servi` (`cod_servi`),
  KEY `fech_alta` (`fech_alta`),
  KEY `nom_servi` (`nom_servi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `servicios`
--

/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;


--
-- Definition of table `socios`
--

DROP TABLE IF EXISTS `socios`;
CREATE TABLE `socios` (
  `cod_socio` int(11) NOT NULL DEFAULT '0',
  `apellido` char(60) NOT NULL DEFAULT '',
  `nombre` char(60) NOT NULL DEFAULT '',
  `cargo` char(15) NOT NULL DEFAULT '',
  `compania` char(40) NOT NULL DEFAULT '',
  `cuit` char(13) NOT NULL DEFAULT '',
  `socio` char(1) NOT NULL DEFAULT '',
  `calle_cli` char(40) NOT NULL DEFAULT '',
  `calle_cnia` char(40) NOT NULL DEFAULT '',
  `iva` int(11) NOT NULL DEFAULT '0',
  `saldo_gral` float(13,2) NOT NULL DEFAULT '0.00',
  `fech_ing` char(8) NOT NULL DEFAULT '',
  `fech_baja` char(8) NOT NULL DEFAULT '',
  `tel_cli` char(40) NOT NULL DEFAULT '',
  `tel_cnia` char(40) NOT NULL DEFAULT '',
  `ciudad_cli` char(40) NOT NULL DEFAULT '',
  `ciudad_cni` char(40) NOT NULL DEFAULT '',
  `cp_cli` char(10) NOT NULL DEFAULT '',
  `cp_cnia` char(10) NOT NULL DEFAULT '',
  `fax_cli` char(40) NOT NULL DEFAULT '',
  `fax_cnia` char(40) NOT NULL DEFAULT '',
  `email_cli` char(100) NOT NULL DEFAULT '',
  `email_cnia` char(100) NOT NULL DEFAULT '',
  `dni` int(11) NOT NULL DEFAULT '0',
  `nacim` char(8) NOT NULL DEFAULT '',
  `jubilado` char(1) NOT NULL DEFAULT '',
  `cliprov` char(1) NOT NULL DEFAULT 'C',
  KEY `cod_socio` (`cod_socio`),
  KEY `cuit` (`cuit`),
  KEY `dni` (`dni`),
  KEY `compania` (`compania`),
  KEY `apellido` (`apellido`,`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `socios`
--

/*!40000 ALTER TABLE `socios` DISABLE KEYS */;
/*!40000 ALTER TABLE `socios` ENABLE KEYS */;


--
-- Definition of table `sociserv`
--

DROP TABLE IF EXISTS `sociserv`;
CREATE TABLE `sociserv` (
  `cod_socio` int(11) NOT NULL DEFAULT '0',
  `cod_servi` int(11) NOT NULL DEFAULT '0',
  `cod_subser` int(11) NOT NULL DEFAULT '0',
  `apellido` char(60) NOT NULL DEFAULT '',
  `nombre` char(60) NOT NULL DEFAULT '',
  `calle_cli` char(40) NOT NULL DEFAULT '',
  `ciudad_cli` char(40) NOT NULL DEFAULT '',
  `saldo` float(13,2) NOT NULL DEFAULT '0.00',
  `fech_ing` char(8) NOT NULL DEFAULT '',
  `fech_baja` char(8) NOT NULL DEFAULT '',
  `mes_fact` int(11) NOT NULL DEFAULT '0',
  `anio_fact` int(11) NOT NULL DEFAULT '0',
  `facturar` char(1) NOT NULL DEFAULT '',
  `jubilado` char(1) NOT NULL DEFAULT '',
  `partida` char(40) NOT NULL DEFAULT '',
  `manzana` char(10) NOT NULL DEFAULT '',
  `cuotasclo` int(11) NOT NULL DEFAULT '0',
  `ctanroclo` int(11) NOT NULL DEFAULT '0',
  `ctaimpclo` float(13,2) NOT NULL DEFAULT '0.00',
  `categoria` int(11) NOT NULL DEFAULT '0',
  `cajacable` int(11) NOT NULL DEFAULT '0',
  `ruta1` int(11) NOT NULL DEFAULT '0',
  `folio1` int(11) NOT NULL DEFAULT '0',
  `ruta2` int(11) NOT NULL DEFAULT '0',
  `folio2` int(11) NOT NULL DEFAULT '0',
  `nro_boca` char(10) NOT NULL DEFAULT '',
  `med_ante` int(11) NOT NULL DEFAULT '0',
  `nro_factu` int(11) NOT NULL DEFAULT '0',
  `iva_comun` float(13,2) NOT NULL DEFAULT '0.00',
  `iva_comer` float(13,2) NOT NULL DEFAULT '0.00',
  `siva_comun` float(13,2) NOT NULL DEFAULT '0.00',
  `siva_comer` float(13,2) NOT NULL DEFAULT '0.00',
  `iva` int(11) NOT NULL DEFAULT '0',
  `cuit` char(13) NOT NULL DEFAULT '',
  `telefono` int(11) NOT NULL DEFAULT '0',
  `socio` char(1) NOT NULL DEFAULT '',
  `nom_inter` char(60) NOT NULL DEFAULT '',
  `email` char(100) NOT NULL DEFAULT '',
  `navegadas` float(13,2) NOT NULL DEFAULT '0.00',
  `fac_abono` char(1) NOT NULL DEFAULT '',
  `fac_cons` char(1) NOT NULL DEFAULT '',
  `fac_email` char(1) NOT NULL DEFAULT '',
  `fac_enres` char(1) NOT NULL DEFAULT '',
  `fac_bid` char(1) NOT NULL DEFAULT '',
  `ven_unico` char(1) NOT NULL DEFAULT '',
  `idregistro` int(11) NOT NULL DEFAULT '0',
  KEY `cod_servi` (`cod_servi`),
  KEY `cod_socio` (`cod_socio`),
  KEY `sociserv` (`cod_socio`,`cod_servi`),
  KEY `cod_subser` (`cod_subser`),
  KEY `socservsub` (`cod_socio`,`cod_servi`,`cod_subser`),
  KEY `iva_comun` (`iva_comun`),
  KEY `idregistro` (`idregistro`),
  KEY `servitele` (`cod_servi`,`telefono`),
  KEY `rutafolio1` (`ruta1`,`folio1`),
  KEY `rutafolio2` (`ruta2`,`folio2`),
  KEY `telefono` (`telefono`),
  KEY `apeynom` (`apellido`,`nombre`),
  KEY `serviagua` (`cod_servi`,`apellido`,`nombre`),
  KEY `servisepe` (`cod_servi`,`apellido`,`nombre`),
  KEY `callecli` (`ciudad_cli`,`apellido`,`nombre`),
  KEY `servicloa` (`cod_servi`,`apellido`,`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sociserv`
--

/*!40000 ALTER TABLE `sociserv` DISABLE KEYS */;
/*!40000 ALTER TABLE `sociserv` ENABLE KEYS */;


--
-- Definition of table `sociservdeta`
--

DROP TABLE IF EXISTS `sociservdeta`;
CREATE TABLE `sociservdeta` (
  `cod_socio` int(11) NOT NULL DEFAULT '0',
  `cod_servi` int(11) NOT NULL DEFAULT '0',
  `cod_subser` int(11) NOT NULL DEFAULT '0',
  `cod_deta` int(11) NOT NULL DEFAULT '0',
  `cant_ctas` int(11) NOT NULL DEFAULT '0',
  `nro_cuota` int(11) NOT NULL DEFAULT '0',
  `rubro` char(3) NOT NULL DEFAULT '',
  `codigo` char(6) NOT NULL DEFAULT '',
  `cantidad` float(13,2) NOT NULL DEFAULT '0.00',
  `detalle` char(60) NOT NULL DEFAULT '',
  `unitario` float(13,2) NOT NULL DEFAULT '0.00',
  `tot_deta` float(13,2) NOT NULL DEFAULT '0.00',
  `t_iva_g` float(13,2) NOT NULL DEFAULT '0.00',
  `st_iva_g` float(13,2) NOT NULL DEFAULT '0.00',
  `it_iva_g` float(13,2) NOT NULL DEFAULT '0.00',
  `ist_iva_g` float(13,2) NOT NULL DEFAULT '0.00',
  `cod_imputa` char(4) NOT NULL DEFAULT '',
  `codigo_cta` char(18) NOT NULL DEFAULT '',
  `nombre` char(30) NOT NULL DEFAULT '',
  `todo_meses` char(1) NOT NULL DEFAULT '',
  `sobretasa` char(1) NOT NULL DEFAULT '',
  `col_padron` int(11) NOT NULL DEFAULT '0',
  `idregistro` int(11) NOT NULL DEFAULT '0',
  KEY `socisersub` (`cod_socio`,`cod_servi`,`cod_subser`),
  KEY `idregistro` (`idregistro`),
  KEY `cod_imputa` (`cod_imputa`),
  KEY `codigo_cta` (`codigo_cta`),
  KEY `nombre` (`nombre`),
  KEY `codimputa` (`cod_imputa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sociservdeta`
--

/*!40000 ALTER TABLE `sociservdeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `sociservdeta` ENABLE KEYS */;


--
-- Definition of table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `rubro` char(3) NOT NULL DEFAULT '',
  `codigo` char(6) NOT NULL DEFAULT '',
  `detalle` char(45) NOT NULL DEFAULT '',
  `cantidad` float(13,2) NOT NULL DEFAULT '0.00',
  `pciovta` float(13,2) NOT NULL DEFAULT '0.00',
  `pciocosto` float(13,2) NOT NULL DEFAULT '0.00',
  `stockmin` float(13,2) NOT NULL DEFAULT '0.00',
  KEY `rubro` (`rubro`),
  KEY `rub_cod` (`rubro`,`codigo`),
  KEY `detalle` (`detalle`),
  KEY `codigo` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock`
--

/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;


--
-- Definition of table `tasadia`
--

DROP TABLE IF EXISTS `tasadia`;
CREATE TABLE `tasadia` (
  `anio` int(11) NOT NULL DEFAULT '0',
  `mes` int(11) NOT NULL DEFAULT '0',
  `dias` char(31) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tasadia`
--

/*!40000 ALTER TABLE `tasadia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasadia` ENABLE KEYS */;


--
-- Definition of table `tipocuentabancaria`
--

DROP TABLE IF EXISTS `tipocuentabancaria`;
CREATE TABLE `tipocuentabancaria` (
  `codigo` int(11) NOT NULL DEFAULT '0',
  `nombre` char(50) NOT NULL DEFAULT '',
  KEY `nombre` (`nombre`),
  KEY `codigo` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipocuentabancaria`
--

/*!40000 ALTER TABLE `tipocuentabancaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipocuentabancaria` ENABLE KEYS */;


--
-- Definition of table `tipogastos`
--

DROP TABLE IF EXISTS `tipogastos`;
CREATE TABLE `tipogastos` (
  `codigo` int(11) NOT NULL DEFAULT '0',
  `detalle` char(80) NOT NULL DEFAULT '',
  `abrevia` char(4) NOT NULL DEFAULT '',
  KEY `codigo` (`codigo`),
  KEY `detalle` (`detalle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipogastos`
--

/*!40000 ALTER TABLE `tipogastos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipogastos` ENABLE KEYS */;


--
-- Definition of table `tipopago`
--

DROP TABLE IF EXISTS `tipopago`;
CREATE TABLE `tipopago` (
  `codigo` int(11) NOT NULL DEFAULT '0',
  `nombre` char(40) NOT NULL DEFAULT '',
  `estarjeta` char(1) NOT NULL DEFAULT '',
  KEY `nombre` (`nombre`),
  KEY `codigo` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipopago`
--

/*!40000 ALTER TABLE `tipopago` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipopago` ENABLE KEYS */;


--
-- Definition of table `tranintercta`
--

DROP TABLE IF EXISTS `tranintercta`;
CREATE TABLE `tranintercta` (
  `idtran` int(11) NOT NULL DEFAULT '0',
  `fecha` char(8) NOT NULL DEFAULT '',
  `importe` float(13,2) NOT NULL DEFAULT '0.00',
  `nrocomprobco` int(11) NOT NULL DEFAULT '0',
  `bancoori` int(11) NOT NULL DEFAULT '0',
  `nombancoori` char(80) NOT NULL DEFAULT '',
  `sucursalori` int(11) NOT NULL DEFAULT '0',
  `numeroori` char(20) NOT NULL DEFAULT '',
  `tipoori` int(11) NOT NULL DEFAULT '0',
  `nombcuentaori` char(50) NOT NULL DEFAULT '',
  `ctacontableori` char(18) NOT NULL DEFAULT '',
  `bancodes` int(11) NOT NULL DEFAULT '0',
  `nombancodes` char(80) NOT NULL DEFAULT '',
  `sucursaldes` int(11) NOT NULL DEFAULT '0',
  `numerodes` char(20) NOT NULL DEFAULT '',
  `tipodes` int(11) NOT NULL DEFAULT '0',
  `nombcuentades` char(50) NOT NULL DEFAULT '',
  `ctacontabledes` char(18) NOT NULL DEFAULT '',
  `contabilizado` int(11) NOT NULL DEFAULT '0',
  KEY `nrocomprob` (`nrocomprobco`),
  KEY `fecha` (`fecha`),
  KEY `idtran` (`idtran`),
  KEY `asiento` (`contabilizado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tranintercta`
--

/*!40000 ALTER TABLE `tranintercta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tranintercta` ENABLE KEYS */;


--
-- Definition of table `transcajah`
--

DROP TABLE IF EXISTS `transcajah`;
CREATE TABLE `transcajah` (
  `idtrcaja` int(11) NOT NULL DEFAULT '0',
  `tipopago` int(11) NOT NULL DEFAULT '0',
  `serie` char(2) NOT NULL DEFAULT '',
  `numero` int(11) NOT NULL DEFAULT '0',
  `banco` int(11) NOT NULL DEFAULT '0',
  `nombanco` char(50) NOT NULL DEFAULT '',
  `filial` int(11) NOT NULL DEFAULT '0',
  `importe` float(13,2) NOT NULL DEFAULT '0.00',
  `cod_postal` char(10) NOT NULL DEFAULT '',
  `detercero` int(11) NOT NULL DEFAULT '0',
  `fechaemision` char(8) NOT NULL DEFAULT '',
  `fechavencimiento` char(8) NOT NULL DEFAULT '',
  `alaordende` char(40) NOT NULL DEFAULT '',
  `librador` char(40) NOT NULL DEFAULT '',
  `loentrega` char(40) NOT NULL DEFAULT '',
  `cuenta` char(20) NOT NULL DEFAULT '',
  `cajaorigen` char(50) NOT NULL DEFAULT '',
  `cajadestin` char(50) NOT NULL DEFAULT '',
  KEY `idtrcaja` (`idtrcaja`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transcajah`
--

/*!40000 ALTER TABLE `transcajah` DISABLE KEYS */;
/*!40000 ALTER TABLE `transcajah` ENABLE KEYS */;


--
-- Definition of table `transcajap`
--

DROP TABLE IF EXISTS `transcajap`;
CREATE TABLE `transcajap` (
  `idtrcaja` int(11) NOT NULL DEFAULT '0',
  `fecha` char(8) NOT NULL DEFAULT '',
  `importe` float(13,2) NOT NULL DEFAULT '0.00',
  `impcheques` float(13,2) NOT NULL DEFAULT '0.00',
  `cajaorigen` char(50) NOT NULL DEFAULT '',
  `ctaorigen` char(20) NOT NULL DEFAULT '',
  `cajadestin` char(50) NOT NULL DEFAULT '',
  `ctadestin` char(20) NOT NULL DEFAULT '',
  `observa` char(250) NOT NULL DEFAULT '',
  `nro_asto` int(11) NOT NULL DEFAULT '0',
  KEY `fecha` (`fecha`),
  KEY `idtrcaja` (`idtrcaja`),
  KEY `nro_asto` (`nro_asto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transcajap`
--

/*!40000 ALTER TABLE `transcajap` DISABLE KEYS */;
/*!40000 ALTER TABLE `transcajap` ENABLE KEYS */;


--
-- Definition of table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `usuario` char(15) NOT NULL DEFAULT '',
  `nombre` char(100) NOT NULL DEFAULT '',
  `clave` char(15) NOT NULL DEFAULT '',
  `jerarquia` char(60) NOT NULL DEFAULT '',
  `seccion` char(20) NOT NULL DEFAULT '',
  `email` varchar(80) NOT NULL DEFAULT '',
  `habilitado` char(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`usuario`),
  KEY `usuario` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuarios`
--

/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`usuario`,`nombre`,`clave`,`jerarquia`,`seccion`,`email`,`habilitado`) VALUES 
 ('1','FEDE','F','','','','S');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

--
-- Create schema trsoftdb
--

CREATE DATABASE IF NOT EXISTS trsoftdb;
USE trsoftdb;

--
-- Definition of table `ajustestocke`
--

DROP TABLE IF EXISTS `ajustestocke`;
CREATE TABLE `ajustestocke` (
  `idajuste` int(10) unsigned NOT NULL,
  `idajusteh` int(10) unsigned NOT NULL,
  `etiqueta` char(50) NOT NULL,
  PRIMARY KEY (`idajuste`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ajustestocke`
--

/*!40000 ALTER TABLE `ajustestocke` DISABLE KEYS */;
/*!40000 ALTER TABLE `ajustestocke` ENABLE KEYS */;


--
-- Definition of table `ajustestockh`
--

DROP TABLE IF EXISTS `ajustestockh`;
CREATE TABLE `ajustestockh` (
  `idajuste` int(10) unsigned NOT NULL,
  `articulo` char(20) NOT NULL,
  `detalle` char(200) NOT NULL,
  `idtipomov` int(10) unsigned NOT NULL,
  `descmov` char(200) NOT NULL,
  `ie` int(10) unsigned NOT NULL,
  `cantidad` float(13,4) NOT NULL,
  `idajusteh` int(10) unsigned NOT NULL,
  `renglon` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idajuste`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ajustestockh`
--

/*!40000 ALTER TABLE `ajustestockh` DISABLE KEYS */;
/*!40000 ALTER TABLE `ajustestockh` ENABLE KEYS */;


--
-- Definition of table `ajustestockp`
--

DROP TABLE IF EXISTS `ajustestockp`;
CREATE TABLE `ajustestockp` (
  `idajuste` int(10) unsigned NOT NULL,
  `actividad` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `entidad` int(10) unsigned NOT NULL,
  `nombre` char(254) NOT NULL,
  `responsable` char(254) NOT NULL,
  `observa1` char(254) NOT NULL,
  `observa2` char(254) NOT NULL,
  `observa3` char(254) NOT NULL,
  `observa4` char(254) NOT NULL,
  `anulado` char(1) NOT NULL,
  `idtipomov` int(10) unsigned NOT NULL,
  `descmov` char(254) NOT NULL,
  `deposito` int(10) unsigned NOT NULL,
  `descdepo` char(254) NOT NULL,
  PRIMARY KEY (`idajuste`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ajustestockp`
--

/*!40000 ALTER TABLE `ajustestockp` DISABLE KEYS */;
/*!40000 ALTER TABLE `ajustestockp` ENABLE KEYS */;


--
-- Definition of table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
CREATE TABLE `articulos` (
  `articulo` char(50) NOT NULL,
  `detalle` char(254) NOT NULL,
  `unidad` char(200) NOT NULL,
  `abrevia` char(50) NOT NULL,
  `codbarra` char(100) NOT NULL,
  `costo` float(13,4) NOT NULL,
  `linea` char(20) NOT NULL,
  PRIMARY KEY (`articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `articulos`
--

/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;


--
-- Definition of table `articulosf`
--

DROP TABLE IF EXISTS `articulosf`;
CREATE TABLE `articulosf` (
  `articulo` char(50) NOT NULL,
  `base` float(13,2) NOT NULL,
  `unidadf` char(50) NOT NULL,
  PRIMARY KEY (`articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `articulosf`
--

/*!40000 ALTER TABLE `articulosf` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulosf` ENABLE KEYS */;


--
-- Definition of table `articulosimg`
--

DROP TABLE IF EXISTS `articulosimg`;
CREATE TABLE `articulosimg` (
  `idartimg` int(10) unsigned NOT NULL,
  `articulo` char(50) NOT NULL,
  `archivoimg` char(50) NOT NULL,
  `fechaalta` char(8) NOT NULL,
  PRIMARY KEY (`idartimg`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `articulosimg`
--

/*!40000 ALTER TABLE `articulosimg` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulosimg` ENABLE KEYS */;


--
-- Definition of table `articulosimp`
--

DROP TABLE IF EXISTS `articulosimp`;
CREATE TABLE `articulosimp` (
  `articulo` char(50) NOT NULL,
  `impuesto` int(10) unsigned NOT NULL,
  `detalle` char(100) NOT NULL,
  `razon` float(13,2) NOT NULL,
  PRIMARY KEY (`articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `articulosimp`
--

/*!40000 ALTER TABLE `articulosimp` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulosimp` ENABLE KEYS */;


--
-- Definition of table `asientos`
--

DROP TABLE IF EXISTS `asientos`;
CREATE TABLE `asientos` (
  `idasiento` int(10) unsigned NOT NULL,
  `nroasiento` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `idplan` int(10) unsigned NOT NULL,
  `codigocta` char(20) NOT NULL,
  `nombrecta` char(254) NOT NULL,
  `debe` float(13,4) NOT NULL,
  `haber` float(13,4) NOT NULL,
  `detalle` char(254) NOT NULL,
  PRIMARY KEY (`idasiento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `asientos`
--

/*!40000 ALTER TABLE `asientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `asientos` ENABLE KEYS */;


--
-- Definition of table `asientoscompro`
--

DROP TABLE IF EXISTS `asientoscompro`;
CREATE TABLE `asientoscompro` (
  `idasiento` int(10) unsigned NOT NULL,
  `idcomproba` int(10) unsigned NOT NULL,
  `idregicomp` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idasiento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `asientoscompro`
--

/*!40000 ALTER TABLE `asientoscompro` DISABLE KEYS */;
/*!40000 ALTER TABLE `asientoscompro` ENABLE KEYS */;


--
-- Definition of table `bocaservicios`
--

DROP TABLE IF EXISTS `bocaservicios`;
CREATE TABLE `bocaservicios` (
  `entidad` int(10) unsigned NOT NULL,
  `servicio` int(10) unsigned NOT NULL,
  `cuenta` int(10) unsigned NOT NULL,
  `identidadh` int(10) unsigned NOT NULL,
  `bocanumero` char(50) NOT NULL,
  `ruta1` int(10) unsigned NOT NULL,
  `folio1` int(10) unsigned NOT NULL,
  `ruta2` int(10) unsigned NOT NULL,
  `folio2` int(10) unsigned NOT NULL,
  `facturar` char(1) NOT NULL,
  `habilitado` char(1) NOT NULL,
  PRIMARY KEY (`entidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bocaservicios`
--

/*!40000 ALTER TABLE `bocaservicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `bocaservicios` ENABLE KEYS */;


--
-- Definition of table `cajaie`
--

DROP TABLE IF EXISTS `cajaie`;
CREATE TABLE `cajaie` (
  `idcajaie` int(10) unsigned NOT NULL,
  `puntovta` int(10) unsigned NOT NULL,
  `idcomproba` int(10) unsigned NOT NULL,
  `actividad` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `entidad` int(10) unsigned NOT NULL,
  `apellido` char(254) NOT NULL,
  `nombre` char(254) NOT NULL,
  `direccion` char(254) NOT NULL,
  `cuit` char(13) NOT NULL,
  `concepto` char(254) NOT NULL,
  `contabilizado` int(10) unsigned NOT NULL,
  `importe` float(13,4) NOT NULL,
  PRIMARY KEY (`idcajaie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cajaie`
--

/*!40000 ALTER TABLE `cajaie` DISABLE KEYS */;
/*!40000 ALTER TABLE `cajaie` ENABLE KEYS */;


--
-- Definition of table `carterach`
--

DROP TABLE IF EXISTS `carterach`;
CREATE TABLE `carterach` (
  `idcartera` int(10) unsigned NOT NULL,
  `detalle` char(254) NOT NULL,
  `fechaalta` char(8) NOT NULL,
  `codigocta` char(20) NOT NULL,
  PRIMARY KEY (`idcartera`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `carterach`
--

/*!40000 ALTER TABLE `carterach` DISABLE KEYS */;
/*!40000 ALTER TABLE `carterach` ENABLE KEYS */;


--
-- Definition of table `carterachdeta`
--

DROP TABLE IF EXISTS `carterachdeta`;
CREATE TABLE `carterachdeta` (
  `idcartera` int(10) unsigned NOT NULL,
  `idtipocomp` int(10) unsigned NOT NULL,
  `idcheque` int(10) unsigned NOT NULL,
  `fechaing` char(8) NOT NULL,
  `fechaegr` char(8) NOT NULL,
  `serie` char(8) NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `banco` int(10) unsigned NOT NULL,
  `filial` int(10) unsigned NOT NULL,
  `cp` char(50) NOT NULL,
  `detercero` char(1) NOT NULL,
  `importe` float(13,4) NOT NULL,
  `codigocta` char(20) NOT NULL,
  `nombrecta` char(100) NOT NULL,
  `fechaentre` char(8) NOT NULL,
  `entregadoa` char(254) NOT NULL,
  `fechaemisi` char(8) NOT NULL,
  `fechavence` char(8) NOT NULL,
  `alaordende` char(254) NOT NULL,
  `librador` char(254) NOT NULL,
  `loentrega` char(254) NOT NULL,
  `ctacte` char(50) NOT NULL,
  `fechaacred` char(8) NOT NULL,
  PRIMARY KEY (`idcartera`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `carterachdeta`
--

/*!40000 ALTER TABLE `carterachdeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `carterachdeta` ENABLE KEYS */;


--
-- Definition of table `cobros`
--

DROP TABLE IF EXISTS `cobros`;
CREATE TABLE `cobros` (
  `idcobro` int(10) unsigned NOT NULL,
  `entidad` int(10) unsigned NOT NULL,
  `servicio` int(10) unsigned NOT NULL,
  `cuenta` int(10) unsigned NOT NULL,
  `idcomproba` int(10) unsigned NOT NULL,
  `puntovta` int(10) unsigned NOT NULL,
  `actividad` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `idfactura` int(10) unsigned NOT NULL,
  `tipo` char(1) NOT NULL,
  `fechapago` char(8) NOT NULL,
  `importe` float(13,4) NOT NULL,
  `recargo` float(13,4) NOT NULL,
  `ivarecargo` float(13,4) NOT NULL,
  `idcomprobap` int(10) unsigned NOT NULL,
  `puntovtap` int(10) unsigned NOT NULL,
  `actividadp` int(10) unsigned NOT NULL,
  `numerop` int(10) unsigned NOT NULL,
  `idregipago` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idcobro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cobros`
--

/*!40000 ALTER TABLE `cobros` DISABLE KEYS */;
/*!40000 ALTER TABLE `cobros` ENABLE KEYS */;


--
-- Definition of table `compactiv`
--

DROP TABLE IF EXISTS `compactiv`;
CREATE TABLE `compactiv` (
  `idnumera` int(10) unsigned NOT NULL,
  `puntovta` int(10) unsigned NOT NULL,
  `maxnumero` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idnumera`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `compactiv`
--

/*!40000 ALTER TABLE `compactiv` DISABLE KEYS */;
/*!40000 ALTER TABLE `compactiv` ENABLE KEYS */;


--
-- Definition of table `compiservi`
--

DROP TABLE IF EXISTS `compiservi`;
CREATE TABLE `compiservi` (
  `idcomproba` int(10) unsigned NOT NULL,
  `servicio` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idcomproba`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `compiservi`
--

/*!40000 ALTER TABLE `compiservi` DISABLE KEYS */;
/*!40000 ALTER TABLE `compiservi` ENABLE KEYS */;


--
-- Definition of table `comprobantes`
--

DROP TABLE IF EXISTS `comprobantes`;
CREATE TABLE `comprobantes` (
  `idcomproba` int(10) unsigned NOT NULL,
  `comprobante` char(100) NOT NULL,
  `idnumera` int(10) unsigned NOT NULL,
  `idtipocom` int(10) unsigned NOT NULL,
  `tipo` char(1) NOT NULL,
  `ctacte` char(1) NOT NULL,
  PRIMARY KEY (`idcomproba`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comprobantes`
--

/*!40000 ALTER TABLE `comprobantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprobantes` ENABLE KEYS */;


--
-- Definition of table `conceptogrupo`
--

DROP TABLE IF EXISTS `conceptogrupo`;
CREATE TABLE `conceptogrupo` (
  `idconceptg` int(10) unsigned NOT NULL,
  `idconcepto` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idconceptg`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `conceptogrupo`
--

/*!40000 ALTER TABLE `conceptogrupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `conceptogrupo` ENABLE KEYS */;


--
-- Definition of table `conceptoimpu`
--

DROP TABLE IF EXISTS `conceptoimpu`;
CREATE TABLE `conceptoimpu` (
  `impuesto` int(10) unsigned NOT NULL,
  `idconcepto` int(10) unsigned NOT NULL,
  PRIMARY KEY (`impuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `conceptoimpu`
--

/*!40000 ALTER TABLE `conceptoimpu` DISABLE KEYS */;
/*!40000 ALTER TABLE `conceptoimpu` ENABLE KEYS */;


--
-- Definition of table `conceptolimit`
--

DROP TABLE IF EXISTS `conceptolimit`;
CREATE TABLE `conceptolimit` (
  `idconcepto` int(10) unsigned NOT NULL,
  `servicio` int(10) unsigned NOT NULL,
  `concepto` char(20) NOT NULL,
  `consudesde` float(13,4) NOT NULL,
  `consuhasta` float(13,4) NOT NULL,
  `unidad` char(50) NOT NULL,
  `detalle` char(254) NOT NULL,
  `importe` float(13,2) NOT NULL,
  PRIMARY KEY (`idconcepto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `conceptolimit`
--

/*!40000 ALTER TABLE `conceptolimit` DISABLE KEYS */;
/*!40000 ALTER TABLE `conceptolimit` ENABLE KEYS */;


--
-- Definition of table `conceptoser`
--

DROP TABLE IF EXISTS `conceptoser`;
CREATE TABLE `conceptoser` (
  `idconcepto` int(10) unsigned NOT NULL,
  `servicio` int(10) unsigned NOT NULL,
  `concepto` char(20) NOT NULL,
  `detalle` char(254) NOT NULL,
  `abrevia` char(100) NOT NULL,
  `cantidad` float(13,4) NOT NULL,
  `importe` float(13,4) NOT NULL,
  `unidad` char(20) NOT NULL,
  `facturar` char(1) NOT NULL,
  `cuotasfact` int(10) unsigned NOT NULL,
  `cantcuotas` int(10) unsigned NOT NULL,
  `funcion` char(254) NOT NULL,
  `vigedesde` char(8) NOT NULL,
  `vigehasta` char(8) NOT NULL,
  `vigencia` char(1) NOT NULL,
  `padron` int(10) unsigned NOT NULL,
  `compuesto` char(1) NOT NULL,
  PRIMARY KEY (`idconcepto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `conceptoser`
--

/*!40000 ALTER TABLE `conceptoser` DISABLE KEYS */;
/*!40000 ALTER TABLE `conceptoser` ENABLE KEYS */;


--
-- Definition of table `condfiscal`
--

DROP TABLE IF EXISTS `condfiscal`;
CREATE TABLE `condfiscal` (
  `idcondfis` int(10) unsigned NOT NULL,
  `detalle` char(200) NOT NULL,
  PRIMARY KEY (`idcondfis`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `condfiscal`
--

/*!40000 ALTER TABLE `condfiscal` DISABLE KEYS */;
/*!40000 ALTER TABLE `condfiscal` ENABLE KEYS */;


--
-- Definition of table `cpptelefono`
--

DROP TABLE IF EXISTS `cpptelefono`;
CREATE TABLE `cpptelefono` (
  `bocanumero` char(50) NOT NULL,
  `mes` int(10) unsigned NOT NULL,
  `anio` int(10) unsigned NOT NULL,
  `secuencia` int(10) unsigned NOT NULL,
  `cppprov` int(10) unsigned NOT NULL,
  `cod_coop` int(10) unsigned NOT NULL,
  `nsecfeco` int(10) unsigned NOT NULL,
  `carllama` int(10) unsigned NOT NULL,
  `nllamado` char(20) NOT NULL,
  `fechaini` char(8) NOT NULL,
  `horaini` char(8) NOT NULL,
  `segureal` int(10) unsigned NOT NULL,
  `valorllama` float(13,2) NOT NULL,
  `tipollama` int(10) unsigned NOT NULL,
  `fechgene` char(8) NOT NULL,
  `horagene` char(8) NOT NULL,
  `secuencia2` int(10) unsigned NOT NULL,
  `facturado` char(1) NOT NULL,
  `facturar` char(1) NOT NULL,
  `idfactura` int(10) unsigned NOT NULL,
  PRIMARY KEY (`bocanumero`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cpptelefono`
--

/*!40000 ALTER TABLE `cpptelefono` DISABLE KEYS */;
/*!40000 ALTER TABLE `cpptelefono` ENABLE KEYS */;


--
-- Definition of table `cuentasdispon`
--

DROP TABLE IF EXISTS `cuentasdispon`;
CREATE TABLE `cuentasdispon` (
  `idcuenta` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `codcuenta` char(100) NOT NULL,
  `detalle` char(254) NOT NULL,
  `idtipo` int(10) unsigned NOT NULL,
  `banco` char(50) NOT NULL,
  `filial` char(50) NOT NULL,
  `nombanco` char(254) NOT NULL,
  `cuentabco` char(100) NOT NULL,
  PRIMARY KEY (`idcuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cuentasdispon`
--

/*!40000 ALTER TABLE `cuentasdispon` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuentasdispon` ENABLE KEYS */;


--
-- Definition of table `depositos`
--

DROP TABLE IF EXISTS `depositos`;
CREATE TABLE `depositos` (
  `deposito` int(10) unsigned NOT NULL,
  `detalle` char(254) NOT NULL,
  `direccion` char(254) NOT NULL,
  PRIMARY KEY (`deposito`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depositos`
--

/*!40000 ALTER TABLE `depositos` DISABLE KEYS */;
/*!40000 ALTER TABLE `depositos` ENABLE KEYS */;


--
-- Definition of table `destinooti`
--

DROP TABLE IF EXISTS `destinooti`;
CREATE TABLE `destinooti` (
  `destinooti` int(10) unsigned NOT NULL,
  `detalle` int(10) unsigned NOT NULL,
  PRIMARY KEY (`destinooti`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `destinooti`
--

/*!40000 ALTER TABLE `destinooti` DISABLE KEYS */;
/*!40000 ALTER TABLE `destinooti` ENABLE KEYS */;


--
-- Definition of table `detafactu`
--

DROP TABLE IF EXISTS `detafactu`;
CREATE TABLE `detafactu` (
  `idfactura` int(10) unsigned NOT NULL,
  `idcomproba` int(10) unsigned NOT NULL,
  `puntovta` int(10) unsigned NOT NULL,
  `actividad` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `tipo` char(1) NOT NULL,
  `idfacturah` int(10) unsigned NOT NULL,
  `articulo` char(20) NOT NULL,
  `idconcepto` int(10) unsigned NOT NULL,
  `servicio` int(10) unsigned NOT NULL,
  `cantidad` float(13,4) NOT NULL,
  `unidad` char(10) NOT NULL,
  `cantidadfc` float(13,4) NOT NULL,
  `unidadfc` char(10) NOT NULL,
  `detalle` char(254) NOT NULL,
  `unitario` float(13,4) NOT NULL,
  `impuesto` float(13,4) NOT NULL,
  `total` float(13,4) NOT NULL,
  `codigocta` char(20) NOT NULL,
  `nombrecta` char(100) NOT NULL,
  `cuota` int(10) unsigned NOT NULL,
  `cancuotas` int(10) unsigned NOT NULL,
  `padron` int(10) unsigned NOT NULL,
  `idimpuesto` int(10) unsigned NOT NULL,
  `razonimp` float(13,4) NOT NULL,
  `neto` float(13,4) NOT NULL,
  PRIMARY KEY (`idfactura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detafactu`
--

/*!40000 ALTER TABLE `detafactu` DISABLE KEYS */;
/*!40000 ALTER TABLE `detafactu` ENABLE KEYS */;


--
-- Definition of table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE `empresa` (
  `empresa` char(100) NOT NULL,
  `nomfiscal` char(100) NOT NULL,
  `cuit` char(13) NOT NULL,
  `iva` char(100) NOT NULL,
  `iibb` char(100) NOT NULL,
  `direccion` char(200) NOT NULL,
  `localidad` char(100) NOT NULL,
  `inicioact` char(8) NOT NULL,
  `telefono` char(100) NOT NULL,
  `email` char(200) NOT NULL,
  `web` char(200) NOT NULL,
  `logoempre` char(200) NOT NULL,
  PRIMARY KEY (`empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `empresa`
--

/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` (`empresa`,`nomfiscal`,`cuit`,`iva`,`iibb`,`direccion`,`localidad`,`inicioact`,`telefono`,`email`,`web`,`logoempre`) VALUES 
 ('TRSoftIT Tulio Rossi','Tulio Rossi','20-22141497-8','IVA Responsable Inscripto','EXENTO','Avellaneda 6737','(3000) Santa Fe - Santa Fe','20160101','342-4693586 - Cel 342-15-5456398','trossi@cosemar.com.ar','www.cosemar.com.ar','');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;


--
-- Definition of table `entidades`
--

DROP TABLE IF EXISTS `entidades`;
CREATE TABLE `entidades` (
  `entidad` int(11) NOT NULL DEFAULT '0',
  `apellido` char(100) NOT NULL,
  `nombre` char(100) NOT NULL,
  `cargo` char(100) NOT NULL,
  `compania` char(100) NOT NULL,
  `cuit` char(13) NOT NULL,
  `direccion` char(100) NOT NULL,
  `localidad` char(50) NOT NULL,
  `iva` int(10) unsigned NOT NULL,
  `fechaalta` char(8) NOT NULL,
  `telefono` char(50) NOT NULL,
  `cp` char(50) NOT NULL,
  `fax` char(50) NOT NULL,
  `email` char(254) NOT NULL,
  `web` char(254) NOT NULL,
  `dni` int(10) unsigned NOT NULL,
  `doctipo` char(3) NOT NULL,
  `fechanac` char(8) NOT NULL,
  PRIMARY KEY (`entidad`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entidades`
--

/*!40000 ALTER TABLE `entidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `entidades` ENABLE KEYS */;


--
-- Definition of table `entidadesc`
--

DROP TABLE IF EXISTS `entidadesc`;
CREATE TABLE `entidadesc` (
  `idcontacto` int(10) unsigned NOT NULL,
  `entidad` int(10) unsigned NOT NULL,
  `apellido` char(100) NOT NULL,
  `nombre` char(100) NOT NULL,
  `cargo` char(100) NOT NULL,
  `compania` char(100) NOT NULL,
  `direccion` char(100) NOT NULL,
  `localidad` char(50) NOT NULL,
  `iva` int(10) unsigned NOT NULL,
  `fechaalta` char(8) NOT NULL,
  `telefono` char(50) NOT NULL,
  `cp` char(50) NOT NULL,
  `fax` char(50) NOT NULL,
  `email` char(254) NOT NULL,
  `dni` int(10) unsigned NOT NULL,
  `doctipo` char(3) NOT NULL,
  `fechanac` char(8) NOT NULL,
  `cuit` char(13) NOT NULL,
  PRIMARY KEY (`idcontacto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entidadesc`
--

/*!40000 ALTER TABLE `entidadesc` DISABLE KEYS */;
/*!40000 ALTER TABLE `entidadesc` ENABLE KEYS */;


--
-- Definition of table `entidadescr`
--

DROP TABLE IF EXISTS `entidadescr`;
CREATE TABLE `entidadescr` (
  `entidad` int(10) unsigned NOT NULL DEFAULT '0',
  `fecha` char(8) NOT NULL,
  `importe` float(13,4) NOT NULL,
  `autorizo` char(50) NOT NULL,
  `operacion` char(1) NOT NULL,
  PRIMARY KEY (`entidad`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entidadescr`
--

/*!40000 ALTER TABLE `entidadescr` DISABLE KEYS */;
/*!40000 ALTER TABLE `entidadescr` ENABLE KEYS */;


--
-- Definition of table `entidadesd`
--

DROP TABLE IF EXISTS `entidadesd`;
CREATE TABLE `entidadesd` (
  `entidad` int(10) unsigned NOT NULL,
  `servicio` int(10) unsigned NOT NULL,
  `cuenta` int(10) unsigned NOT NULL,
  `idconcepto` int(10) unsigned NOT NULL,
  `cuotasfact` int(10) unsigned NOT NULL,
  `nrocuotas` int(10) unsigned NOT NULL,
  `articulo` char(50) NOT NULL,
  `detalle` char(254) NOT NULL,
  `abreviado` char(50) NOT NULL,
  `unitario` float(13,2) NOT NULL,
  `neto` float(13,2) NOT NULL,
  `impuesto` float(13,2) NOT NULL,
  `total` float(13,2) NOT NULL,
  `unidad` char(50) NOT NULL,
  `funcion` char(100) NOT NULL,
  `identidadh` int(10) unsigned NOT NULL,
  `identindadd` int(10) unsigned NOT NULL,
  `mensual` char(1) NOT NULL,
  `facturar` char(1) NOT NULL,
  `codigocta` char(20) NOT NULL,
  `padron` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entidadesd`
--

/*!40000 ALTER TABLE `entidadesd` DISABLE KEYS */;
/*!40000 ALTER TABLE `entidadesd` ENABLE KEYS */;


--
-- Definition of table `entidadesh`
--

DROP TABLE IF EXISTS `entidadesh`;
CREATE TABLE `entidadesh` (
  `entidad` int(10) unsigned NOT NULL,
  `servicio` int(10) unsigned NOT NULL,
  `cuenta` int(10) unsigned NOT NULL,
  `apellido` char(100) NOT NULL,
  `nombre` char(100) NOT NULL,
  `cargo` char(100) NOT NULL,
  `compania` char(100) NOT NULL,
  `cuit` char(13) NOT NULL,
  `direccion` char(100) NOT NULL,
  `localidad` char(50) NOT NULL,
  `iva` int(10) unsigned NOT NULL,
  `fechaalt` char(8) NOT NULL,
  `telefono` char(100) NOT NULL,
  `cp` char(50) NOT NULL,
  `fax` char(50) NOT NULL,
  `email` char(254) NOT NULL,
  `dni` int(10) unsigned NOT NULL,
  `doctipo` char(3) NOT NULL,
  `fechanac` char(8) NOT NULL,
  `ruta1` int(10) unsigned NOT NULL,
  `folio1` int(10) unsigned NOT NULL,
  `ruta2` int(10) unsigned NOT NULL,
  `folio2` int(10) unsigned NOT NULL,
  `identidadh` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entidadesh`
--

/*!40000 ALTER TABLE `entidadesh` DISABLE KEYS */;
/*!40000 ALTER TABLE `entidadesh` ENABLE KEYS */;


--
-- Definition of table `entidadg`
--

DROP TABLE IF EXISTS `entidadg`;
CREATE TABLE `entidadg` (
  `entidad` int(10) unsigned NOT NULL,
  `servicio` int(10) unsigned NOT NULL,
  `cuenta` int(10) unsigned NOT NULL,
  `idgrupoe` int(10) unsigned NOT NULL,
  `descripcion` char(100) NOT NULL,
  `fecha` char(8) NOT NULL,
  PRIMARY KEY (`entidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entidadg`
--

/*!40000 ALTER TABLE `entidadg` DISABLE KEYS */;
/*!40000 ALTER TABLE `entidadg` ENABLE KEYS */;


--
-- Definition of table `etiquetas`
--

DROP TABLE IF EXISTS `etiquetas`;
CREATE TABLE `etiquetas` (
  `articulo` char(50) NOT NULL,
  `etiqueta` char(50) NOT NULL,
  `fechaalta` char(8) NOT NULL,
  PRIMARY KEY (`articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `etiquetas`
--

/*!40000 ALTER TABLE `etiquetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `etiquetas` ENABLE KEYS */;


--
-- Definition of table `factclaro`
--

DROP TABLE IF EXISTS `factclaro`;
CREATE TABLE `factclaro` (
  `bocanumero` char(20) NOT NULL,
  `usuario` char(50) NOT NULL,
  `plan` char(5) NOT NULL,
  `abono` float(13,4) NOT NULL,
  `pabono` float(13,4) NOT NULL,
  `tabono` float(13,4) NOT NULL,
  `impserv` float(13,4) NOT NULL,
  `pserv` float(13,4) NOT NULL,
  `tserv` float(13,4) NOT NULL,
  `cargos` float(13,4) NOT NULL,
  `pcargos` float(13,4) NOT NULL,
  `tcargos` float(13,4) NOT NULL,
  `minaire` float(13,4) NOT NULL,
  `minaireex` float(13,4) NOT NULL,
  `impaire` float(13,4) NOT NULL,
  `paire` float(13,4) NOT NULL,
  `taire` float(13,4) NOT NULL,
  `minldn` float(13,4) NOT NULL,
  `impldn` float(13,4) NOT NULL,
  `pldn` float(13,4) NOT NULL,
  `tldn` float(13,4) NOT NULL,
  `minldi` float(13,4) NOT NULL,
  `impldi` float(13,4) NOT NULL,
  `pldi` float(13,4) NOT NULL,
  `tldi` float(13,4) NOT NULL,
  `minldim` float(13,4) NOT NULL,
  `impldim` float(13,4) NOT NULL,
  `pldim` float(13,4) NOT NULL,
  `tldim` float(13,4) NOT NULL,
  `datau` float(13,4) NOT NULL,
  `dataimp` float(13,4) NOT NULL,
  `pdata` float(13,4) NOT NULL,
  `tdata` float(13,4) NOT NULL,
  `impeq` float(13,4) NOT NULL,
  `peq` float(13,4) NOT NULL,
  `teq` float(13,4) NOT NULL,
  `varios` float(13,4) NOT NULL,
  `pvarios` float(13,4) NOT NULL,
  `tvarios` float(13,4) NOT NULL,
  `tclaro` float(13,4) NOT NULL,
  `total` float(13,4) NOT NULL,
  `nroreg` int(10) unsigned NOT NULL,
  `mes` int(10) unsigned NOT NULL,
  `anio` int(10) unsigned NOT NULL,
  `secuencia` int(10) unsigned NOT NULL,
  `zona` int(10) unsigned NOT NULL,
  `idfactura` int(10) unsigned NOT NULL,
  PRIMARY KEY (`bocanumero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `factclaro`
--

/*!40000 ALTER TABLE `factclaro` DISABLE KEYS */;
/*!40000 ALTER TABLE `factclaro` ENABLE KEYS */;


--
-- Definition of table `factuperiodos`
--

DROP TABLE IF EXISTS `factuperiodos`;
CREATE TABLE `factuperiodos` (
  `servicio` int(10) unsigned NOT NULL,
  `mes` int(10) unsigned NOT NULL,
  `anio` int(10) unsigned NOT NULL,
  `secuencia` int(10) unsigned NOT NULL,
  `zona` char(50) NOT NULL,
  `fechavenc1` char(8) NOT NULL,
  `fechavenc2` char(8) NOT NULL,
  `fechavenc3` char(8) NOT NULL,
  `proxvenc` char(8) NOT NULL,
  `fechatoma` char(8) NOT NULL,
  `fechaemite` char(8) NOT NULL,
  `fechadesco` char(8) NOT NULL,
  `impresas` char(1) NOT NULL,
  `confirmadas` char(1) NOT NULL,
  `cesp` char(50) NOT NULL,
  `cespvence` char(8) NOT NULL,
  PRIMARY KEY (`servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `factuperiodos`
--

/*!40000 ALTER TABLE `factuperiodos` DISABLE KEYS */;
/*!40000 ALTER TABLE `factuperiodos` ENABLE KEYS */;


--
-- Definition of table `factuprove`
--

DROP TABLE IF EXISTS `factuprove`;
CREATE TABLE `factuprove` (
  `idfacprove` int(10) unsigned NOT NULL,
  `idtipocomp` int(10) unsigned NOT NULL,
  `tipo` char(1) NOT NULL,
  `actividad` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `entidad` int(10) unsigned NOT NULL,
  `apellido` char(254) NOT NULL,
  `nombre` char(254) NOT NULL,
  `cuit` char(13) NOT NULL,
  `dni` int(10) unsigned NOT NULL,
  `tipodocu` char(3) NOT NULL,
  `iva` int(10) unsigned NOT NULL,
  `condvta` int(10) unsigned NOT NULL,
  `nroremito` int(10) unsigned NOT NULL,
  `nropedido` int(10) unsigned NOT NULL,
  `neto` float(13,4) NOT NULL,
  `impuesto` float(13,4) NOT NULL,
  `exento` float(13,4) NOT NULL,
  `nograbado` float(13,4) NOT NULL,
  `total` float(13,4) NOT NULL,
  `contabilizado` int(10) unsigned NOT NULL,
  `fechacarga` char(8) NOT NULL,
  `fechaingreso` char(8) NOT NULL,
  PRIMARY KEY (`idfacprove`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `factuprove`
--

/*!40000 ALTER TABLE `factuprove` DISABLE KEYS */;
/*!40000 ALTER TABLE `factuprove` ENABLE KEYS */;


--
-- Definition of table `factuproved`
--

DROP TABLE IF EXISTS `factuproved`;
CREATE TABLE `factuproved` (
  `idfacprove` int(10) unsigned NOT NULL,
  `idfacproveh` int(10) unsigned NOT NULL,
  `articulo` char(20) NOT NULL,
  `codigoprov` char(20) NOT NULL,
  `cantidad` int(10) unsigned NOT NULL,
  `unidad` char(10) NOT NULL,
  `detalle` char(254) NOT NULL,
  `unitario` float(13,4) NOT NULL,
  `impuesto` float(13,4) NOT NULL,
  `total` float(13,4) NOT NULL,
  `idimpuesto` int(10) unsigned NOT NULL,
  `razonimp` float(13,4) NOT NULL,
  PRIMARY KEY (`idfacprove`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `factuproved`
--

/*!40000 ALTER TABLE `factuproved` DISABLE KEYS */;
/*!40000 ALTER TABLE `factuproved` ENABLE KEYS */;


--
-- Definition of table `factuproveimp`
--

DROP TABLE IF EXISTS `factuproveimp`;
CREATE TABLE `factuproveimp` (
  `idfacprove` int(10) unsigned NOT NULL,
  `idtipocomp` int(10) unsigned NOT NULL,
  `idimpuesto` int(10) unsigned NOT NULL,
  `detalle` char(254) NOT NULL,
  `neto` float(13,4) NOT NULL,
  `razon` float(13,4) NOT NULL,
  `importe` float(13,4) NOT NULL,
  PRIMARY KEY (`idfacprove`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `factuproveimp`
--

/*!40000 ALTER TABLE `factuproveimp` DISABLE KEYS */;
/*!40000 ALTER TABLE `factuproveimp` ENABLE KEYS */;


--
-- Definition of table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
CREATE TABLE `facturas` (
  `idfactura` int(10) unsigned NOT NULL,
  `idcomproba` int(10) unsigned NOT NULL,
  `puntovta` int(10) unsigned NOT NULL,
  `actividad` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `tipo` char(1) NOT NULL,
  `fecha` char(8) NOT NULL,
  `entidad` int(10) unsigned NOT NULL,
  `servicio` int(10) unsigned NOT NULL,
  `cuenta` int(10) unsigned NOT NULL,
  `apellido` char(254) NOT NULL,
  `nombre` char(254) NOT NULL,
  `direccion` char(254) NOT NULL,
  `localidad` char(10) NOT NULL,
  `iva` int(10) unsigned NOT NULL,
  `cuit` char(13) NOT NULL,
  `doctipo` char(3) NOT NULL,
  `dni` int(10) unsigned NOT NULL,
  `telefono` char(50) NOT NULL,
  `cp` char(50) NOT NULL,
  `fax` char(50) NOT NULL,
  `email` char(254) NOT NULL,
  `transporte` int(10) unsigned NOT NULL,
  `nomtransp` char(254) NOT NULL,
  `direntrega` char(254) NOT NULL,
  `stock` char(1) NOT NULL,
  `condvta` char(1) NOT NULL,
  `neto` float(13,4) NOT NULL,
  `subtotal` float(13,4) NOT NULL,
  `descuento` float(13,4) NOT NULL,
  `recargo` float(13,4) NOT NULL,
  `total` float(13,4) NOT NULL,
  `totalimpu` float(13,4) NOT NULL,
  `operexenta` char(1) NOT NULL,
  `anulado` char(1) NOT NULL,
  `observa1` char(254) NOT NULL,
  `observa2` char(254) NOT NULL,
  `observa3` char(254) NOT NULL,
  `observa4` char(254) NOT NULL,
  `mes` int(10) unsigned NOT NULL,
  `anio` int(10) unsigned NOT NULL,
  `secuencia` int(10) unsigned NOT NULL,
  `zona` char(50) NOT NULL,
  `ruta1` int(10) unsigned NOT NULL,
  `folio1` int(10) unsigned NOT NULL,
  `ruta2` int(10) unsigned NOT NULL,
  `folio2` int(10) unsigned NOT NULL,
  `fechavenc1` char(8) NOT NULL,
  `fechavenc2` char(8) NOT NULL,
  `fechavenc3` char(8) NOT NULL,
  `fechadesco` char(8) NOT NULL,
  `proxvenc` char(8) NOT NULL,
  `confirmada` char(1) NOT NULL,
  `astoconta` int(10) unsigned NOT NULL,
  `deudacta` float(13,4) NOT NULL,
  `cespcae` char(100) NOT NULL,
  `caecespven` char(8) NOT NULL,
  `idfe` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idfactura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facturas`
--

/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;


--
-- Definition of table `facturasanul`
--

DROP TABLE IF EXISTS `facturasanul`;
CREATE TABLE `facturasanul` (
  `idfactura` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idcomproba` int(10) unsigned NOT NULL,
  `puntovta` int(10) unsigned NOT NULL,
  `actividad` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `tipo` char(1) NOT NULL,
  `fecha` char(8) NOT NULL,
  PRIMARY KEY (`idfactura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facturasanul`
--

/*!40000 ALTER TABLE `facturasanul` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturasanul` ENABLE KEYS */;


--
-- Definition of table `facturascta`
--

DROP TABLE IF EXISTS `facturascta`;
CREATE TABLE `facturascta` (
  `idcuotafc` int(10) unsigned NOT NULL,
  `idfactura` int(10) unsigned NOT NULL,
  `idcomproba` int(10) unsigned NOT NULL,
  `puntovta` int(10) unsigned NOT NULL,
  `actividad` int(10) unsigned NOT NULL,
  `cuota` int(10) unsigned NOT NULL,
  `cancuotas` int(10) unsigned NOT NULL,
  `totalfc` float(13,4) NOT NULL,
  `importe` float(13,4) NOT NULL,
  `imppago` float(13,4) NOT NULL,
  `fechavenc` char(8) NOT NULL,
  PRIMARY KEY (`idcuotafc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facturascta`
--

/*!40000 ALTER TABLE `facturascta` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturascta` ENABLE KEYS */;


--
-- Definition of table `facturasfe`
--

DROP TABLE IF EXISTS `facturasfe`;
CREATE TABLE `facturasfe` (
  `idfe` int(10) unsigned NOT NULL,
  `idfactura` int(10) unsigned NOT NULL,
  `idcomproba` int(10) unsigned NOT NULL,
  `puntovta` int(10) unsigned NOT NULL,
  `actividad` int(10) unsigned NOT NULL,
  `numeroori` int(10) unsigned NOT NULL,
  `numeroaut` int(10) unsigned NOT NULL,
  `tipo` char(1) NOT NULL,
  `fecha` char(8) NOT NULL,
  `resultado` char(1) NOT NULL,
  `caecesp` char(50) NOT NULL,
  `caecespven` char(8) NOT NULL,
  `caecespfec` char(8) NOT NULL,
  `pathpdffe` char(254) NOT NULL,
  `idtipofe` int(10) unsigned NOT NULL,
  `idtranafip` int(10) unsigned NOT NULL,
  `observa` char(254) NOT NULL,
  `coderror` char(20) NOT NULL,
  PRIMARY KEY (`idfe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facturasfe`
--

/*!40000 ALTER TABLE `facturasfe` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturasfe` ENABLE KEYS */;


--
-- Definition of table `facturasimp`
--

DROP TABLE IF EXISTS `facturasimp`;
CREATE TABLE `facturasimp` (
  `idfactura` int(10) unsigned NOT NULL,
  `idcomproba` int(10) unsigned NOT NULL,
  `puntovta` int(10) unsigned NOT NULL,
  `actividad` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `tipo` char(1) NOT NULL,
  `impuesto` int(10) unsigned NOT NULL,
  `detalle` char(254) NOT NULL,
  `neto` float(13,4) NOT NULL,
  `razon` float(13,4) NOT NULL,
  `importe` float(13,4) NOT NULL,
  PRIMARY KEY (`idfactura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facturasimp`
--

/*!40000 ALTER TABLE `facturasimp` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturasimp` ENABLE KEYS */;


--
-- Definition of table `facturasrec`
--

DROP TABLE IF EXISTS `facturasrec`;
CREATE TABLE `facturasrec` (
  `idfactura` int(10) unsigned NOT NULL,
  `idcomproba` int(10) unsigned NOT NULL,
  `puntovta` int(10) unsigned NOT NULL,
  `actividad` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `tipo` char(8) NOT NULL,
  `recneto` float(13,4) NOT NULL,
  `impuesto` int(10) unsigned NOT NULL,
  `total` float(13,4) NOT NULL,
  `razon` float(13,4) NOT NULL,
  PRIMARY KEY (`idfactura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facturasrec`
--

/*!40000 ALTER TABLE `facturasrec` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturasrec` ENABLE KEYS */;


--
-- Definition of table `grupose`
--

DROP TABLE IF EXISTS `grupose`;
CREATE TABLE `grupose` (
  `idgrupoe` int(10) unsigned NOT NULL DEFAULT '0',
  `descripcion` char(100) NOT NULL,
  `observa` char(254) NOT NULL,
  `fecha` char(8) NOT NULL,
  PRIMARY KEY (`idgrupoe`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grupose`
--

/*!40000 ALTER TABLE `grupose` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupose` ENABLE KEYS */;


--
-- Definition of table `gruposepelio`
--

DROP TABLE IF EXISTS `gruposepelio`;
CREATE TABLE `gruposepelio` (
  `entidad` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `servicio` int(10) unsigned NOT NULL,
  `cuenta` int(10) unsigned NOT NULL,
  `dni` int(10) unsigned NOT NULL,
  `tipodocu` char(3) NOT NULL,
  `apellido` char(100) NOT NULL,
  `nombre` char(100) NOT NULL,
  `fechanac` char(8) NOT NULL,
  `parentesco` char(100) NOT NULL,
  `fechaalta` char(8) NOT NULL,
  `fechabaja` char(8) NOT NULL,
  `diasvigen` int(10) unsigned NOT NULL,
  `sexo` char(1) NOT NULL,
  `edad` int(10) unsigned NOT NULL,
  `identidadh` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gruposepelio`
--

/*!40000 ALTER TABLE `gruposepelio` DISABLE KEYS */;
/*!40000 ALTER TABLE `gruposepelio` ENABLE KEYS */;


--
-- Definition of table `impuestos`
--

DROP TABLE IF EXISTS `impuestos`;
CREATE TABLE `impuestos` (
  `impuesto` int(10) unsigned NOT NULL,
  `detalle` char(8) NOT NULL,
  `razon` float(13,2) NOT NULL,
  `formula` char(150) NOT NULL,
  `abrevia` char(150) NOT NULL,
  `baseimpon` float(13,2) NOT NULL,
  PRIMARY KEY (`impuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `impuestos`
--

/*!40000 ALTER TABLE `impuestos` DISABLE KEYS */;
/*!40000 ALTER TABLE `impuestos` ENABLE KEYS */;


--
-- Definition of table `largadistancia`
--

DROP TABLE IF EXISTS `largadistancia`;
CREATE TABLE `largadistancia` (
  `idlargad` int(10) unsigned NOT NULL,
  `mes` int(10) unsigned NOT NULL,
  `anio` int(10) unsigned NOT NULL,
  `secuencia` int(10) unsigned NOT NULL,
  `bocanumero` char(50) NOT NULL,
  `fechllama` char(8) NOT NULL,
  `destino` char(50) NOT NULL,
  `tiempo` int(10) unsigned NOT NULL,
  `importe` float(13,3) NOT NULL,
  `facturado` char(1) NOT NULL,
  `facturar` char(1) NOT NULL,
  `codigocta` char(20) NOT NULL,
  `observa` char(254) NOT NULL,
  `idfactura` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idlargad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `largadistancia`
--

/*!40000 ALTER TABLE `largadistancia` DISABLE KEYS */;
/*!40000 ALTER TABLE `largadistancia` ENABLE KEYS */;


--
-- Definition of table `librosocios`
--

DROP TABLE IF EXISTS `librosocios`;
CREATE TABLE `librosocios` (
  `entidad` int(10) unsigned NOT NULL,
  `servicio` int(10) unsigned NOT NULL,
  `nombre` char(254) NOT NULL,
  `apellido` char(254) NOT NULL,
  `direccion` char(254) NOT NULL,
  `localidad` int(10) unsigned NOT NULL,
  `dnicuit` char(50) NOT NULL,
  `actanro` char(20) NOT NULL,
  `nrosolici` int(10) unsigned NOT NULL,
  `capsusc` float(13,4) NOT NULL,
  `capreint` float(13,4) NOT NULL,
  `bajatrans` float(13,4) NOT NULL,
  `capemiti` float(13,4) NOT NULL,
  `capinteg` float(13,4) NOT NULL,
  `fechabaja` char(8) NOT NULL,
  `causabaja` char(254) NOT NULL,
  `observa` char(254) NOT NULL,
  `idcomproba` int(10) unsigned NOT NULL,
  `actividad` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `idregicomp` int(10) unsigned NOT NULL,
  `idlibrosoc` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `librosocios`
--

/*!40000 ALTER TABLE `librosocios` DISABLE KEYS */;
/*!40000 ALTER TABLE `librosocios` ENABLE KEYS */;


--
-- Definition of table `librosociosdet`
--

DROP TABLE IF EXISTS `librosociosdet`;
CREATE TABLE `librosociosdet` (
  `idlibrosoc` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fecha` char(8) NOT NULL,
  `capemiti` float(13,4) NOT NULL,
  `capineg` float(13,4) NOT NULL,
  `compro` char(30) NOT NULL,
  PRIMARY KEY (`idlibrosoc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `librosociosdet`
--

/*!40000 ALTER TABLE `librosociosdet` DISABLE KEYS */;
/*!40000 ALTER TABLE `librosociosdet` ENABLE KEYS */;


--
-- Definition of table `lineas`
--

DROP TABLE IF EXISTS `lineas`;
CREATE TABLE `lineas` (
  `linea` char(20) NOT NULL,
  `detalle` char(254) NOT NULL,
  `codigoctac` char(20) NOT NULL,
  `codigoctav` char(20) NOT NULL,
  PRIMARY KEY (`linea`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lineas`
--

/*!40000 ALTER TABLE `lineas` DISABLE KEYS */;
/*!40000 ALTER TABLE `lineas` ENABLE KEYS */;


--
-- Definition of table `listaprecioh`
--

DROP TABLE IF EXISTS `listaprecioh`;
CREATE TABLE `listaprecioh` (
  `idlista` int(10) unsigned NOT NULL,
  `articulo` char(20) NOT NULL,
  `costo` float(13,4) NOT NULL,
  `margen` float(13,4) NOT NULL,
  `importe` float(13,3) NOT NULL,
  `fechaalta` char(8) NOT NULL,
  PRIMARY KEY (`idlista`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `listaprecioh`
--

/*!40000 ALTER TABLE `listaprecioh` DISABLE KEYS */;
/*!40000 ALTER TABLE `listaprecioh` ENABLE KEYS */;


--
-- Definition of table `listapreciop`
--

DROP TABLE IF EXISTS `listapreciop`;
CREATE TABLE `listapreciop` (
  `idlista` int(10) unsigned NOT NULL,
  `detalle` char(254) NOT NULL,
  `fechaalta` char(8) NOT NULL,
  `vigedesde` char(8) NOT NULL,
  `vigehasta` char(8) NOT NULL,
  `margen` float(13,4) NOT NULL,
  `condvta` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idlista`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `listapreciop`
--

/*!40000 ALTER TABLE `listapreciop` DISABLE KEYS */;
/*!40000 ALTER TABLE `listapreciop` ENABLE KEYS */;


--
-- Definition of table `localidades`
--

DROP TABLE IF EXISTS `localidades`;
CREATE TABLE `localidades` (
  `localidad` char(10) NOT NULL DEFAULT '0',
  `nombre` char(200) NOT NULL,
  `cp` char(50) NOT NULL,
  `provincia` char(10) NOT NULL,
  PRIMARY KEY (`localidad`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `localidades`
--

/*!40000 ALTER TABLE `localidades` DISABLE KEYS */;
INSERT INTO `localidades` (`localidad`,`nombre`,`cp`,`provincia`) VALUES 
 ('1','Margarita','3056','1'),
 ('3','Santa Fe','3033','1'),
 ('4','RECREO','6556','1'),
 ('5','GALLARETA','DDFD','1');
/*!40000 ALTER TABLE `localidades` ENABLE KEYS */;


--
-- Definition of table `medagua`
--

DROP TABLE IF EXISTS `medagua`;
CREATE TABLE `medagua` (
  `bocanumero` char(50) NOT NULL,
  `mes` int(10) unsigned NOT NULL,
  `anio` int(10) unsigned NOT NULL,
  `secuencia` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `vue_ante` int(10) unsigned NOT NULL,
  `med_ante` int(10) unsigned NOT NULL,
  `vue_actu` int(10) unsigned NOT NULL,
  `med_actu` int(10) unsigned NOT NULL,
  `consumo` float(13,2) NOT NULL,
  `ruta1` int(10) unsigned NOT NULL,
  `folio1` int(10) unsigned NOT NULL,
  `ruta2` int(10) unsigned NOT NULL,
  `folio2` int(10) unsigned NOT NULL,
  `facturado` char(1) NOT NULL,
  `facturar` char(1) NOT NULL,
  `idfactura` int(10) unsigned NOT NULL,
  PRIMARY KEY (`bocanumero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medagua`
--

/*!40000 ALTER TABLE `medagua` DISABLE KEYS */;
/*!40000 ALTER TABLE `medagua` ENABLE KEYS */;


--
-- Definition of table `medluz`
--

DROP TABLE IF EXISTS `medluz`;
CREATE TABLE `medluz` (
  `idmed` int(10) unsigned NOT NULL,
  `entidad` int(10) unsigned NOT NULL,
  `servicio` int(10) unsigned NOT NULL,
  `cuenta` int(10) unsigned NOT NULL,
  `medant` float(13,4) NOT NULL,
  `medact` float(13,4) NOT NULL,
  `medcal` float(13,4) NOT NULL,
  `consumo` float(13,4) NOT NULL,
  `mes` int(10) unsigned NOT NULL,
  `anio` int(10) unsigned NOT NULL,
  `zona` int(10) unsigned NOT NULL,
  `nroreg` int(10) unsigned NOT NULL,
  `medidor` int(10) unsigned NOT NULL,
  `categoria` int(10) unsigned NOT NULL,
  `fant` char(8) NOT NULL,
  `fact` char(8) NOT NULL,
  PRIMARY KEY (`idmed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medluz`
--

/*!40000 ALTER TABLE `medluz` DISABLE KEYS */;
/*!40000 ALTER TABLE `medluz` ENABLE KEYS */;


--
-- Definition of table `medtelefono`
--

DROP TABLE IF EXISTS `medtelefono`;
CREATE TABLE `medtelefono` (
  `bocanumero` char(50) NOT NULL DEFAULT '',
  `mes` int(10) unsigned NOT NULL,
  `anio` int(10) unsigned NOT NULL,
  `secuencia` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `consumo` int(10) unsigned NOT NULL,
  `pulddn1` int(10) unsigned NOT NULL,
  `pulddn2` int(10) unsigned NOT NULL,
  `pesos_n` float(13,2) NOT NULL,
  `pesos_r` float(13,2) NOT NULL,
  `pesos` float(13,2) NOT NULL,
  `canddn1` int(10) unsigned NOT NULL,
  `durddn1` int(10) unsigned NOT NULL,
  `pesosddn1` float(13,2) NOT NULL,
  `canddn2` int(10) unsigned NOT NULL,
  `durddn2` int(10) unsigned NOT NULL,
  `pesosddn2` float(13,2) NOT NULL,
  `canddi1` int(10) unsigned NOT NULL,
  `durddi1` int(10) unsigned NOT NULL,
  `pesosddi1` float(13,2) NOT NULL,
  `canddi2` int(10) unsigned NOT NULL,
  `durddi2` int(10) unsigned NOT NULL,
  `pesosddi2` float(13,2) NOT NULL,
  `canloc1` int(10) unsigned NOT NULL,
  `durloc1` int(10) unsigned NOT NULL,
  `pesosloc1` float(13,2) NOT NULL,
  `canloc2` int(10) unsigned NOT NULL,
  `durloc2` int(10) unsigned NOT NULL,
  `pesosloc2` float(13,2) NOT NULL,
  `facturado` char(1) NOT NULL,
  `idfactura` int(10) unsigned NOT NULL,
  PRIMARY KEY (`bocanumero`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medtelefono`
--

/*!40000 ALTER TABLE `medtelefono` DISABLE KEYS */;
/*!40000 ALTER TABLE `medtelefono` ENABLE KEYS */;


--
-- Definition of table `menusql`
--

DROP TABLE IF EXISTS `menusql`;
CREATE TABLE `menusql` (
  `idmenu` int(11) NOT NULL DEFAULT '0',
  `idmenup` int(11) NOT NULL DEFAULT '0',
  `nivel` char(2) NOT NULL DEFAULT '',
  `codigo` char(14) NOT NULL DEFAULT '',
  `descrip` char(50) NOT NULL DEFAULT '',
  `arranque` char(254) NOT NULL DEFAULT '',
  `comando` char(254) NOT NULL DEFAULT '',
  `opcion` char(2) NOT NULL DEFAULT '',
  `prun` char(1) NOT NULL DEFAULT 'S',
  `pusu` char(1) NOT NULL DEFAULT 'S',
  `habilitado` char(1) NOT NULL DEFAULT 'S',
  `orden` char(2) NOT NULL DEFAULT '00',
  `usuario` char(20) NOT NULL DEFAULT '',
  `fechahora` char(18) NOT NULL DEFAULT '',
  `idmodulo` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idmenu`),
  KEY `idmenu` (`idmenu`),
  KEY `nivel` (`nivel`),
  KEY `codigo` (`codigo`),
  KEY `habilitado` (`habilitado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menusql`
--

/*!40000 ALTER TABLE `menusql` DISABLE KEYS */;
INSERT INTO `menusql` (`idmenu`,`idmenup`,`nivel`,`codigo`,`descrip`,`arranque`,`comando`,`opcion`,`prun`,`pusu`,`habilitado`,`orden`,`usuario`,`fechahora`,`idmodulo`) VALUES 
 (1,0,'P','01000000000000','Archivos','','','','N','N','S','01','admin','2012092919:33:00',1),
 (2,1,'H','01010000000000','Cambiar Empresa','','DO FORM login','0','S','S','S','01','admin','2014052220:27:14',1),
 (4,0,'P','02000000000000','Otros','','','','N','N','S','03','admin','2016012712:50:15',1),
 (5,4,'H','02010000000000','Provincias','','DO FORM provinciasabm','1','S','S','S','03','admin','2016012712:57:52',1),
 (6,4,'H','02020000000000','Localidades','','DO FORM localidadesabm','2','S','S','S','03','admin','2016012713:05:41',1),
 (7,4,'H','02030000000000','Monedas','','DO FORM monedasabm','3','S','S','S','03','admin','2016012713:14:10',1),
 (8,4,'H','02040000000000','Zonas','','DO FORM zonasabm','4','S','S','S','03','admin','2016012718:14:42',1),
 (9,4,'H','02050000000000','Vendedores','','DO FORM vendedoresabm','5','S','S','S','03','admin','2016012916:07:22',1),
 (10,0,'P','03000000000000','Contabilidad','','','','N','N','S','04','admin','2016030610:36:53',0),
 (11,10,'H','03010000000000','Localidades','','DO FORM localidades','','N','S','S','04','admin','2016030610:37:55',0),
 (12,1,'H','01020000000000','\\-','','','','N','N','S','01','admin','2016030610:51:06',1),
 (13,1,'H','01030000000000','Salir                               Alt+F4','','SALIRMENU()','','S','S','S','01','admin','2016030610:57:03',1),
 (14,0,'P','04000000000000','Ayuda','','','','N','N','S','05','admin','2016030612:09:53',1),
 (15,14,'H','04010000000000','Info.Sistema...','','DO FORM infosistema','','S','S','S','05','admin','2016030612:10:47',1);
/*!40000 ALTER TABLE `menusql` ENABLE KEYS */;


--
-- Definition of table `monedas`
--

DROP TABLE IF EXISTS `monedas`;
CREATE TABLE `monedas` (
  `moneda` int(10) unsigned NOT NULL,
  `nombre` char(200) NOT NULL,
  `cotizacion` float(13,4) NOT NULL,
  `simbolo` char(10) NOT NULL,
  PRIMARY KEY (`moneda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `monedas`
--

/*!40000 ALTER TABLE `monedas` DISABLE KEYS */;
INSERT INTO `monedas` (`moneda`,`nombre`,`cotizacion`,`simbolo`) VALUES 
 (1,'PESO',1.0000,'$'),
 (2,'DOLAR',13.5000,'$$'),
 (3,'EURO',25.0000,'$e$');
/*!40000 ALTER TABLE `monedas` ENABLE KEYS */;


--
-- Definition of table `movidepo`
--

DROP TABLE IF EXISTS `movidepo`;
CREATE TABLE `movidepo` (
  `deposito` int(10) unsigned NOT NULL,
  `idajuste` int(10) unsigned NOT NULL,
  `operacion` int(10) unsigned NOT NULL,
  `idtipomov` int(10) unsigned NOT NULL,
  PRIMARY KEY (`deposito`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movidepo`
--

/*!40000 ALTER TABLE `movidepo` DISABLE KEYS */;
/*!40000 ALTER TABLE `movidepo` ENABLE KEYS */;


--
-- Definition of table `np`
--

DROP TABLE IF EXISTS `np`;
CREATE TABLE `np` (
  `idnp` int(10) unsigned NOT NULL,
  `actividad` int(10) unsigned NOT NULL,
  `numeronp` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `hora` char(8) NOT NULL,
  `usuario` char(20) NOT NULL,
  `vendedor` int(10) unsigned NOT NULL,
  `nombrevend` char(100) NOT NULL,
  `transporte` int(10) unsigned NOT NULL,
  `nombretran` char(100) NOT NULL,
  `estado` int(10) unsigned NOT NULL,
  `entidad` int(10) unsigned NOT NULL,
  `apellido` char(254) NOT NULL,
  `nombre` char(254) NOT NULL,
  `direccion` char(100) NOT NULL,
  `localidad` char(10) NOT NULL,
  `cp` char(20) NOT NULL,
  `provincia` char(10) NOT NULL,
  `pais` char(20) NOT NULL,
  `iva` int(10) unsigned NOT NULL,
  `cuit` char(13) NOT NULL,
  `dni` int(10) unsigned NOT NULL,
  `observa` char(254) NOT NULL,
  `sector` int(10) unsigned NOT NULL,
  `tipope` int(10) unsigned NOT NULL,
  `descpe` char(254) NOT NULL,
  PRIMARY KEY (`idnp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `np`
--

/*!40000 ALTER TABLE `np` DISABLE KEYS */;
/*!40000 ALTER TABLE `np` ENABLE KEYS */;


--
-- Definition of table `ot`
--

DROP TABLE IF EXISTS `ot`;
CREATE TABLE `ot` (
  `idnp` int(10) unsigned NOT NULL,
  `idot` int(10) unsigned NOT NULL,
  `actividad` int(10) unsigned NOT NULL,
  `numeronp` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `entidad` int(10) unsigned NOT NULL,
  `estado` int(10) unsigned NOT NULL,
  `tipoot` int(10) unsigned NOT NULL,
  `subtipo` int(10) unsigned NOT NULL,
  `articulo` char(20) NOT NULL,
  `detalle` char(254) NOT NULL,
  `cantidad` float(13,2) NOT NULL,
  `unidad` char(50) NOT NULL,
  `unitario` float(13,4) NOT NULL,
  `anulada` char(1) NOT NULL,
  `observa` char(254) NOT NULL,
  `fechaentr` char(8) NOT NULL,
  `ordencpra` char(50) NOT NULL,
  PRIMARY KEY (`idnp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ot`
--

/*!40000 ALTER TABLE `ot` DISABLE KEYS */;
/*!40000 ALTER TABLE `ot` ENABLE KEYS */;


--
-- Definition of table `otcumpleh`
--

DROP TABLE IF EXISTS `otcumpleh`;
CREATE TABLE `otcumpleh` (
  `idotcumple` int(10) unsigned NOT NULL,
  `idotcumpleh` int(10) unsigned NOT NULL,
  `idot` int(10) unsigned NOT NULL,
  `cantidad` float(13,4) NOT NULL,
  `cantidaduf` float(13,4) NOT NULL,
  `lote` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idotcumple`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otcumpleh`
--

/*!40000 ALTER TABLE `otcumpleh` DISABLE KEYS */;
/*!40000 ALTER TABLE `otcumpleh` ENABLE KEYS */;


--
-- Definition of table `otcumplep`
--

DROP TABLE IF EXISTS `otcumplep`;
CREATE TABLE `otcumplep` (
  `idotcumple` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `hora` char(8) NOT NULL,
  `lote` int(10) unsigned NOT NULL,
  `cantidad` float(13,4) NOT NULL,
  `cantidaduf` float(13,4) NOT NULL,
  PRIMARY KEY (`idotcumple`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otcumplep`
--

/*!40000 ALTER TABLE `otcumplep` DISABLE KEYS */;
/*!40000 ALTER TABLE `otcumplep` ENABLE KEYS */;


--
-- Definition of table `otint`
--

DROP TABLE IF EXISTS `otint`;
CREATE TABLE `otint` (
  `idotint` int(10) unsigned NOT NULL,
  `idot` int(10) unsigned NOT NULL,
  `destinooti` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `cantidad` float(13,3) NOT NULL,
  `cantidaduf` float(13,3) NOT NULL,
  `movotint` int(10) unsigned NOT NULL,
  `idpesadah` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idotint`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otint`
--

/*!40000 ALTER TABLE `otint` DISABLE KEYS */;
/*!40000 ALTER TABLE `otint` ENABLE KEYS */;


--
-- Definition of table `pagosprov`
--

DROP TABLE IF EXISTS `pagosprov`;
CREATE TABLE `pagosprov` (
  `idpago` int(10) unsigned NOT NULL,
  `puntovta` int(10) unsigned NOT NULL,
  `idcomproba` int(10) unsigned NOT NULL,
  `actividad` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `entidad` int(10) unsigned NOT NULL,
  `apellido` char(254) NOT NULL,
  `nombre` char(254) NOT NULL,
  `importe` float(13,4) NOT NULL,
  `concepto` char(254) NOT NULL,
  `contabilizado` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idpago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pagosprov`
--

/*!40000 ALTER TABLE `pagosprov` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagosprov` ENABLE KEYS */;


--
-- Definition of table `pagosprovfc`
--

DROP TABLE IF EXISTS `pagosprovfc`;
CREATE TABLE `pagosprovfc` (
  `idpago` int(10) unsigned NOT NULL,
  `idfactprove` int(10) unsigned NOT NULL,
  `idncprove` int(10) unsigned NOT NULL,
  `imputado` float(13,4) NOT NULL,
  `fecha` char(8) NOT NULL,
  PRIMARY KEY (`idpago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pagosprovfc`
--

/*!40000 ALTER TABLE `pagosprovfc` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagosprovfc` ENABLE KEYS */;


--
-- Definition of table `paises`
--

DROP TABLE IF EXISTS `paises`;
CREATE TABLE `paises` (
  `pais` char(10) NOT NULL DEFAULT '0',
  `nombre` char(60) NOT NULL,
  PRIMARY KEY (`pais`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paises`
--

/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` (`pais`,`nombre`) VALUES 
 ('1','ARGENTINA'),
 ('2','BRASIL');
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;


--
-- Definition of table `perfilmh`
--

DROP TABLE IF EXISTS `perfilmh`;
CREATE TABLE `perfilmh` (
  `idperfil` int(11) NOT NULL DEFAULT '0',
  `idmenu` int(11) NOT NULL DEFAULT '0',
  `habilitado` char(1) NOT NULL DEFAULT 'S',
  KEY `idmenu` (`idmenu`),
  KEY `idperfil` (`idperfil`),
  KEY `habilitado` (`habilitado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perfilmh`
--

/*!40000 ALTER TABLE `perfilmh` DISABLE KEYS */;
INSERT INTO `perfilmh` (`idperfil`,`idmenu`,`habilitado`) VALUES 
 (1,1,'S'),
 (1,2,'S'),
 (1,3,'S'),
 (1,4,'S'),
 (1,5,'S'),
 (1,6,'S'),
 (1,7,'S'),
 (1,8,'S'),
 (1,9,'S'),
 (1,10,'S'),
 (1,11,'S'),
 (1,12,'S'),
 (1,13,'S'),
 (1,14,'S'),
 (1,15,'S');
/*!40000 ALTER TABLE `perfilmh` ENABLE KEYS */;


--
-- Definition of table `perfilmp`
--

DROP TABLE IF EXISTS `perfilmp`;
CREATE TABLE `perfilmp` (
  `idperfil` int(11) NOT NULL DEFAULT '0',
  `perfil` char(20) NOT NULL DEFAULT '',
  `descrip` char(200) NOT NULL DEFAULT '',
  `habilitado` char(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`idperfil`),
  KEY `idperfil` (`idperfil`),
  KEY `habilitado` (`habilitado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perfilmp`
--

/*!40000 ALTER TABLE `perfilmp` DISABLE KEYS */;
INSERT INTO `perfilmp` (`idperfil`,`perfil`,`descrip`,`habilitado`) VALUES 
 (1,'Perfil Maestros','','S');
/*!40000 ALTER TABLE `perfilmp` ENABLE KEYS */;


--
-- Definition of table `perfilusu`
--

DROP TABLE IF EXISTS `perfilusu`;
CREATE TABLE `perfilusu` (
  `idperfil` int(11) NOT NULL DEFAULT '0',
  `usuario` char(20) NOT NULL DEFAULT '',
  `habilitado` char(1) NOT NULL DEFAULT 'S',
  `activo` int(11) NOT NULL DEFAULT '0',
  KEY `idperfil` (`idperfil`),
  KEY `usuario` (`usuario`),
  KEY `habilitado` (`habilitado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perfilusu`
--

/*!40000 ALTER TABLE `perfilusu` DISABLE KEYS */;
INSERT INTO `perfilusu` (`idperfil`,`usuario`,`habilitado`,`activo`) VALUES 
 (1,'GUSTAVO','S',1),
 (1,'TULIO','S',1),
 (1,'FEDE','S',1);
/*!40000 ALTER TABLE `perfilusu` ENABLE KEYS */;


--
-- Definition of table `plancuentas`
--

DROP TABLE IF EXISTS `plancuentas`;
CREATE TABLE `plancuentas` (
  `idplan` int(10) unsigned NOT NULL,
  `fechad` char(8) NOT NULL,
  `fechah` char(8) NOT NULL,
  `detalle` char(254) NOT NULL,
  PRIMARY KEY (`idplan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plancuentas`
--

/*!40000 ALTER TABLE `plancuentas` DISABLE KEYS */;
/*!40000 ALTER TABLE `plancuentas` ENABLE KEYS */;


--
-- Definition of table `plancuentasd`
--

DROP TABLE IF EXISTS `plancuentasd`;
CREATE TABLE `plancuentasd` (
  `idplan` int(10) unsigned NOT NULL,
  `codigocta` char(20) NOT NULL,
  `nombrecta` char(254) NOT NULL,
  `sumarizaen` char(20) NOT NULL,
  `imputable` char(1) NOT NULL,
  `activa` char(1) NOT NULL,
  `ejercicio` int(10) unsigned NOT NULL,
  `anio` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idplan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plancuentasd`
--

/*!40000 ALTER TABLE `plancuentasd` DISABLE KEYS */;
/*!40000 ALTER TABLE `plancuentasd` ENABLE KEYS */;


--
-- Definition of table `presupu`
--

DROP TABLE IF EXISTS `presupu`;
CREATE TABLE `presupu` (
  `idpresupu` int(10) unsigned NOT NULL,
  `idcomproba` int(10) unsigned NOT NULL,
  `puntovta` int(10) unsigned NOT NULL,
  `actividad` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `tipo` char(1) NOT NULL,
  `fecha` char(8) NOT NULL,
  `fechavenc` char(8) NOT NULL,
  `entidad` int(10) unsigned NOT NULL,
  `servicio` int(10) unsigned NOT NULL,
  `cuenta` int(10) unsigned NOT NULL,
  `apellido` char(254) NOT NULL,
  `nombre` char(254) NOT NULL,
  `direccion` char(254) NOT NULL,
  `localidad` int(10) unsigned NOT NULL,
  `iva` int(10) unsigned NOT NULL,
  `cuit` char(13) NOT NULL,
  `doctipo` char(3) NOT NULL,
  `dni` int(10) unsigned NOT NULL,
  `telefono` char(50) NOT NULL,
  `cp` char(50) NOT NULL,
  `fax` char(50) NOT NULL,
  `email` char(200) NOT NULL,
  `trasp` int(10) unsigned NOT NULL,
  `nomtransp` char(254) NOT NULL,
  `domentrega` char(254) NOT NULL,
  `stock` char(1) NOT NULL,
  `condvta` char(1) NOT NULL,
  `neto` float(13,4) NOT NULL,
  `subtotal` float(13,4) NOT NULL,
  `descuento` float(13,4) NOT NULL,
  `recargo` float(13,4) NOT NULL,
  `total` float(13,4) NOT NULL,
  `operexenta` char(1) NOT NULL,
  `anulado` char(1) NOT NULL,
  `observa1` char(254) NOT NULL,
  `observa2` char(254) NOT NULL,
  `observa3` char(254) NOT NULL,
  `observa4` char(254) NOT NULL,
  `ruta1` int(10) unsigned NOT NULL,
  `folio1` int(10) unsigned NOT NULL,
  `ruta2` int(10) unsigned NOT NULL,
  `folio2` int(10) unsigned NOT NULL,
  `confirmada` char(1) NOT NULL,
  `astoconta` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idpresupu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `presupu`
--

/*!40000 ALTER TABLE `presupu` DISABLE KEYS */;
/*!40000 ALTER TABLE `presupu` ENABLE KEYS */;


--
-- Definition of table `presupuanul`
--

DROP TABLE IF EXISTS `presupuanul`;
CREATE TABLE `presupuanul` (
  `idpresupu` int(10) unsigned NOT NULL,
  `idcomproba` int(10) unsigned NOT NULL,
  `puntovta` int(10) unsigned NOT NULL,
  `actividad` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `tipo` char(1) NOT NULL,
  `fecha` char(8) NOT NULL,
  PRIMARY KEY (`idpresupu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `presupuanul`
--

/*!40000 ALTER TABLE `presupuanul` DISABLE KEYS */;
/*!40000 ALTER TABLE `presupuanul` ENABLE KEYS */;


--
-- Definition of table `presupuh`
--

DROP TABLE IF EXISTS `presupuh`;
CREATE TABLE `presupuh` (
  `idpresupu` int(10) unsigned NOT NULL,
  `idcomproba` int(10) unsigned NOT NULL,
  `puntovta` int(10) unsigned NOT NULL,
  `actividad` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `tipo` char(1) NOT NULL,
  `idpresupuh` int(10) unsigned NOT NULL,
  `articulo` char(20) NOT NULL,
  `idconcepto` int(10) unsigned NOT NULL,
  `servicio` int(10) unsigned NOT NULL,
  `cantidad` int(10) unsigned NOT NULL,
  `unidad` char(10) NOT NULL,
  `cantidadfc` int(10) unsigned NOT NULL,
  `unidadfc` char(10) NOT NULL,
  `detalle` char(254) NOT NULL,
  `unitario` float(13,4) NOT NULL,
  `impuesto` float(13,4) NOT NULL,
  `total` float(13,4) NOT NULL,
  `codigocta` char(20) NOT NULL,
  `nombrecta` char(100) NOT NULL,
  `cuota` int(10) unsigned NOT NULL,
  `cantcuotas` int(10) unsigned NOT NULL,
  `padron` int(10) unsigned NOT NULL,
  `idimpuesto` int(10) unsigned NOT NULL,
  `razonimp` float(13,4) NOT NULL,
  PRIMARY KEY (`idpresupu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `presupuh`
--

/*!40000 ALTER TABLE `presupuh` DISABLE KEYS */;
/*!40000 ALTER TABLE `presupuh` ENABLE KEYS */;


--
-- Definition of table `presupuimp`
--

DROP TABLE IF EXISTS `presupuimp`;
CREATE TABLE `presupuimp` (
  `idpresupu` int(10) unsigned NOT NULL,
  `idcomproba` int(10) unsigned NOT NULL,
  `puntovta` int(10) unsigned NOT NULL,
  `actividad` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `tipo` char(8) NOT NULL,
  `idimpuesto` int(10) unsigned NOT NULL,
  `detalle` char(254) NOT NULL,
  `neto` float(13,4) NOT NULL,
  `razon` float(13,4) NOT NULL,
  `importe` float(13,4) NOT NULL,
  PRIMARY KEY (`idpresupu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `presupuimp`
--

/*!40000 ALTER TABLE `presupuimp` DISABLE KEYS */;
/*!40000 ALTER TABLE `presupuimp` ENABLE KEYS */;


--
-- Definition of table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
CREATE TABLE `provincias` (
  `provincia` char(10) NOT NULL DEFAULT '',
  `nombre` char(60) NOT NULL,
  `pais` char(10) NOT NULL,
  PRIMARY KEY (`provincia`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provincias`
--

/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` (`provincia`,`nombre`,`pais`) VALUES 
 ('1','SANTA FE','1'),
 ('2','CHACO','1'),
 ('3','ENTRE RIOS','1'),
 ('4','CATAMARCA','1'),
 ('5','TIERRA DEL FUEGO','1'),
 ('6','FLORIANOPOLIS','2'),
 ('7','CAMBORIU','2'),
 ('8','SAN PABLO','2'),
 ('9','BUENOS AIRES','1');
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;


--
-- Definition of table `puntosventa`
--

DROP TABLE IF EXISTS `puntosventa`;
CREATE TABLE `puntosventa` (
  `pventa` int(10) unsigned NOT NULL,
  `detalle` char(200) NOT NULL,
  `puntov` char(4) NOT NULL,
  `habilitado` char(1) NOT NULL,
  `fechaini` char(8) NOT NULL,
  `fechabaja` char(8) NOT NULL,
  PRIMARY KEY (`pventa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `puntosventa`
--

/*!40000 ALTER TABLE `puntosventa` DISABLE KEYS */;
/*!40000 ALTER TABLE `puntosventa` ENABLE KEYS */;


--
-- Definition of table `recibos`
--

DROP TABLE IF EXISTS `recibos`;
CREATE TABLE `recibos` (
  `idrecibo` int(10) unsigned NOT NULL,
  `puntovta` int(10) unsigned NOT NULL,
  `idcomproba` int(10) unsigned NOT NULL,
  `actividad` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `entidad` int(10) unsigned NOT NULL,
  `apellido` char(254) NOT NULL,
  `nombre` char(254) NOT NULL,
  `importe` float(13,4) NOT NULL,
  `concepto` char(254) NOT NULL,
  `contabilizado` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idrecibo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recibos`
--

/*!40000 ALTER TABLE `recibos` DISABLE KEYS */;
/*!40000 ALTER TABLE `recibos` ENABLE KEYS */;


--
-- Definition of table `relotcompro`
--

DROP TABLE IF EXISTS `relotcompro`;
CREATE TABLE `relotcompro` (
  `idot` int(10) unsigned NOT NULL,
  `idotint` int(10) unsigned NOT NULL,
  `idremitoh` int(10) unsigned NOT NULL,
  `idfacturas` int(10) unsigned NOT NULL,
  `idpresupuh` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idot`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `relotcompro`
--

/*!40000 ALTER TABLE `relotcompro` DISABLE KEYS */;
/*!40000 ALTER TABLE `relotcompro` ENABLE KEYS */;


--
-- Definition of table `remitos`
--

DROP TABLE IF EXISTS `remitos`;
CREATE TABLE `remitos` (
  `idremito` int(10) unsigned NOT NULL,
  `idcomproba` int(10) unsigned NOT NULL,
  `puntovta` int(10) unsigned NOT NULL,
  `actividad` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `tipo` char(1) NOT NULL,
  `fecha` char(8) NOT NULL,
  `entidad` int(10) unsigned NOT NULL,
  `servicio` int(10) unsigned NOT NULL,
  `cuenta` int(10) unsigned NOT NULL,
  `apellido` char(254) NOT NULL,
  `nombre` char(254) NOT NULL,
  `direccion` char(254) NOT NULL,
  `localidad` int(10) unsigned NOT NULL,
  `iva` int(10) unsigned NOT NULL,
  `cuit` char(13) NOT NULL,
  `doctipo` char(3) NOT NULL,
  `dni` int(10) unsigned NOT NULL,
  `telefono` char(50) NOT NULL,
  `cp` char(50) NOT NULL,
  `fax` char(50) NOT NULL,
  `email` char(200) NOT NULL,
  `transp` int(10) unsigned NOT NULL,
  `nomtransp` char(254) NOT NULL,
  `domentrega` char(254) NOT NULL,
  `stock` char(1) NOT NULL,
  `condvta` char(1) NOT NULL,
  `neto` float(13,4) NOT NULL,
  `subtotal` float(13,4) NOT NULL,
  `descuento` float(13,4) NOT NULL,
  `recargo` float(13,4) NOT NULL,
  `total` float(13,4) NOT NULL,
  `operexenta` char(1) NOT NULL,
  `anulado` char(1) NOT NULL,
  `observa1` char(254) NOT NULL,
  `observa2` char(254) NOT NULL,
  `observa3` char(254) NOT NULL,
  `observa4` char(254) NOT NULL,
  `ruta1` int(10) unsigned NOT NULL,
  `folio1` int(10) unsigned NOT NULL,
  `ruta2` int(10) unsigned NOT NULL,
  `folio2` int(10) unsigned NOT NULL,
  `confirmada` char(1) NOT NULL,
  `astoconta` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idremito`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `remitos`
--

/*!40000 ALTER TABLE `remitos` DISABLE KEYS */;
/*!40000 ALTER TABLE `remitos` ENABLE KEYS */;


--
-- Definition of table `remitosh`
--

DROP TABLE IF EXISTS `remitosh`;
CREATE TABLE `remitosh` (
  `idremito` int(10) unsigned NOT NULL,
  `idcomproba` int(10) unsigned NOT NULL,
  `puntovta` int(10) unsigned NOT NULL,
  `actividad` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `tipo` char(1) NOT NULL,
  `idremitoh` int(10) unsigned NOT NULL,
  `articulo` char(20) NOT NULL,
  `idconcepto` int(10) unsigned NOT NULL,
  `servicio` int(10) unsigned NOT NULL,
  `cantidad` int(10) unsigned NOT NULL,
  `unidad` char(10) NOT NULL,
  `cantidadfc` int(10) unsigned NOT NULL,
  `unidadfc` char(10) NOT NULL,
  `detalle` char(254) NOT NULL,
  `unitario` float(13,4) NOT NULL,
  `impuesto` float(13,4) NOT NULL,
  `total` float(13,4) NOT NULL,
  `codigocta` char(20) NOT NULL,
  `nombrecta` char(100) NOT NULL,
  `cuota` int(10) unsigned NOT NULL,
  `cancuotas` int(10) unsigned NOT NULL,
  `padron` int(10) unsigned NOT NULL,
  `idimpuesto` int(10) unsigned NOT NULL,
  `razonimp` float(13,4) NOT NULL,
  PRIMARY KEY (`idremito`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `remitosh`
--

/*!40000 ALTER TABLE `remitosh` DISABLE KEYS */;
/*!40000 ALTER TABLE `remitosh` ENABLE KEYS */;


--
-- Definition of table `remitosprovh`
--

DROP TABLE IF EXISTS `remitosprovh`;
CREATE TABLE `remitosprovh` (
  `idremitop` int(10) unsigned NOT NULL,
  `actividad` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `idremitoh` int(10) unsigned NOT NULL,
  `renglon` int(10) unsigned NOT NULL,
  `articulo` char(20) NOT NULL,
  `codartprov` char(20) NOT NULL,
  `detalle` char(254) NOT NULL,
  `cantidad` float(13,2) NOT NULL,
  `unitario` float(13,2) NOT NULL,
  `unidad` char(20) NOT NULL,
  PRIMARY KEY (`idremitop`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `remitosprovh`
--

/*!40000 ALTER TABLE `remitosprovh` DISABLE KEYS */;
/*!40000 ALTER TABLE `remitosprovh` ENABLE KEYS */;


--
-- Definition of table `remitosprovp`
--

DROP TABLE IF EXISTS `remitosprovp`;
CREATE TABLE `remitosprovp` (
  `idremitop` int(10) unsigned NOT NULL,
  `actividad` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `entidad` int(10) unsigned NOT NULL,
  `apellido` char(200) NOT NULL,
  `nombre` char(200) NOT NULL,
  `direccion` char(100) NOT NULL,
  `localidad` char(10) NOT NULL,
  `iva` int(10) unsigned NOT NULL,
  `cuit` char(13) NOT NULL,
  `fecha` char(8) NOT NULL,
  `obs1` char(254) NOT NULL,
  `obs2` char(254) NOT NULL,
  `obs3` char(254) NOT NULL,
  `obs4` char(254) NOT NULL,
  `fecharp` char(8) NOT NULL,
  `activrp` int(10) unsigned NOT NULL,
  `numerorp` int(10) unsigned NOT NULL,
  `deposito` int(10) unsigned NOT NULL,
  `descdepo` char(200) NOT NULL,
  PRIMARY KEY (`idremitop`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `remitosprovp`
--

/*!40000 ALTER TABLE `remitosprovp` DISABLE KEYS */;
/*!40000 ALTER TABLE `remitosprovp` ENABLE KEYS */;


--
-- Definition of table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
CREATE TABLE `servicios` (
  `servicio` int(10) unsigned NOT NULL,
  `detalle` char(100) NOT NULL,
  `fechaalta` char(8) NOT NULL,
  `diasvenc2` int(10) unsigned NOT NULL,
  `diasvenc3` int(10) unsigned NOT NULL,
  `diasdescon` int(10) unsigned NOT NULL,
  PRIMARY KEY (`servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `servicios`
--

/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;


--
-- Definition of table `serviciosimpu`
--

DROP TABLE IF EXISTS `serviciosimpu`;
CREATE TABLE `serviciosimpu` (
  `impuesto` int(10) unsigned NOT NULL,
  `servicio` int(10) unsigned NOT NULL,
  PRIMARY KEY (`impuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `serviciosimpu`
--

/*!40000 ALTER TABLE `serviciosimpu` DISABLE KEYS */;
/*!40000 ALTER TABLE `serviciosimpu` ENABLE KEYS */;


--
-- Definition of table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `deposito` int(10) unsigned NOT NULL,
  `articulo` char(50) NOT NULL,
  `stock` float(13,2) NOT NULL,
  PRIMARY KEY (`deposito`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock`
--

/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;


--
-- Definition of table `sucursales`
--

DROP TABLE IF EXISTS `sucursales`;
CREATE TABLE `sucursales` (
  `sucursal` int(10) unsigned NOT NULL,
  `detalle` char(200) NOT NULL,
  PRIMARY KEY (`sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sucursales`
--

/*!40000 ALTER TABLE `sucursales` DISABLE KEYS */;
/*!40000 ALTER TABLE `sucursales` ENABLE KEYS */;


--
-- Definition of table `sucursalpventa`
--

DROP TABLE IF EXISTS `sucursalpventa`;
CREATE TABLE `sucursalpventa` (
  `sucursal` int(10) unsigned NOT NULL,
  `pventa` int(10) unsigned NOT NULL,
  `fechaini` char(8) NOT NULL,
  `fechabaja` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sucursalpventa`
--

/*!40000 ALTER TABLE `sucursalpventa` DISABLE KEYS */;
/*!40000 ALTER TABLE `sucursalpventa` ENABLE KEYS */;


--
-- Definition of table `tablasidx`
--

DROP TABLE IF EXISTS `tablasidx`;
CREATE TABLE `tablasidx` (
  `idindex` int(10) unsigned NOT NULL,
  `tabla` char(50) NOT NULL,
  `campo` char(50) NOT NULL,
  `tipocampo` char(10) NOT NULL,
  `maxvalorc` char(50) NOT NULL,
  `maxvalori` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idindex`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tablasidx`
--

/*!40000 ALTER TABLE `tablasidx` DISABLE KEYS */;
/*!40000 ALTER TABLE `tablasidx` ENABLE KEYS */;


--
-- Definition of table `tipocobrosdeta`
--

DROP TABLE IF EXISTS `tipocobrosdeta`;
CREATE TABLE `tipocobrosdeta` (
  `puntovta` int(10) unsigned NOT NULL,
  `idcomproba` int(10) unsigned zerofill NOT NULL,
  `actividad` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `idregicomp` int(10) unsigned NOT NULL,
  `tipopago` int(10) unsigned NOT NULL,
  `serie` char(10) NOT NULL,
  `cheque` int(10) unsigned NOT NULL,
  `banco` int(10) unsigned NOT NULL,
  `filial` int(10) unsigned NOT NULL,
  `cp` char(50) NOT NULL,
  `detercero` char(1) NOT NULL,
  `importe` float(13,4) NOT NULL,
  `codigocta` char(20) NOT NULL,
  `nombrecta` char(100) NOT NULL,
  `fechaentre` char(8) NOT NULL,
  `entregadoa` char(254) NOT NULL,
  `fechaemisi` char(8) NOT NULL,
  `fechavence` char(8) NOT NULL,
  `alaordende` char(254) NOT NULL,
  `librador` char(254) NOT NULL,
  `loentrega` char(254) NOT NULL,
  `cuenta` char(50) NOT NULL,
  `idtipocomp` int(10) unsigned NOT NULL,
  `idcartera` int(10) unsigned NOT NULL,
  PRIMARY KEY (`puntovta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipocobrosdeta`
--

/*!40000 ALTER TABLE `tipocobrosdeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipocobrosdeta` ENABLE KEYS */;


--
-- Definition of table `tipocompro`
--

DROP TABLE IF EXISTS `tipocompro`;
CREATE TABLE `tipocompro` (
  `idtipocom` int(10) unsigned NOT NULL,
  `detalle` char(100) NOT NULL,
  `opera` int(10) unsigned NOT NULL,
  `abrevia` char(50) NOT NULL,
  `destino` char(1) NOT NULL,
  PRIMARY KEY (`idtipocom`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipocompro`
--

/*!40000 ALTER TABLE `tipocompro` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipocompro` ENABLE KEYS */;


--
-- Definition of table `tipocuenta`
--

DROP TABLE IF EXISTS `tipocuenta`;
CREATE TABLE `tipocuenta` (
  `idtipo` int(10) unsigned NOT NULL,
  `detalle` char(100) NOT NULL,
  `abrevia` char(50) NOT NULL,
  PRIMARY KEY (`idtipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipocuenta`
--

/*!40000 ALTER TABLE `tipocuenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipocuenta` ENABLE KEYS */;


--
-- Definition of table `tipomovctap`
--

DROP TABLE IF EXISTS `tipomovctap`;
CREATE TABLE `tipomovctap` (
  `idtipomovi` int(10) unsigned NOT NULL,
  `detalle` char(254) NOT NULL,
  `abrevia` char(50) NOT NULL,
  `opera` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idtipomovi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipomovctap`
--

/*!40000 ALTER TABLE `tipomovctap` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipomovctap` ENABLE KEYS */;


--
-- Definition of table `tipomovotint`
--

DROP TABLE IF EXISTS `tipomovotint`;
CREATE TABLE `tipomovotint` (
  `movotint` int(10) unsigned NOT NULL,
  `detalle` int(10) unsigned NOT NULL,
  `operacion` int(10) unsigned NOT NULL,
  PRIMARY KEY (`movotint`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipomovotint`
--

/*!40000 ALTER TABLE `tipomovotint` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipomovotint` ENABLE KEYS */;


--
-- Definition of table `tipomstock`
--

DROP TABLE IF EXISTS `tipomstock`;
CREATE TABLE `tipomstock` (
  `idtipomov` int(10) unsigned NOT NULL,
  `descmov` char(200) NOT NULL,
  `ie` char(1) NOT NULL,
  `reporte` char(100) NOT NULL,
  `generaeti` char(1) NOT NULL,
  PRIMARY KEY (`idtipomov`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipomstock`
--

/*!40000 ALTER TABLE `tipomstock` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipomstock` ENABLE KEYS */;


--
-- Definition of table `tiponp`
--

DROP TABLE IF EXISTS `tiponp`;
CREATE TABLE `tiponp` (
  `tipope` int(10) unsigned NOT NULL,
  `descpe` char(254) NOT NULL,
  `stock` char(1) NOT NULL,
  PRIMARY KEY (`tipope`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tiponp`
--

/*!40000 ALTER TABLE `tiponp` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiponp` ENABLE KEYS */;


--
-- Definition of table `tranintercta`
--

DROP TABLE IF EXISTS `tranintercta`;
CREATE TABLE `tranintercta` (
  `idmovicta` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `importe` float(13,4) NOT NULL,
  `comprobante` char(254) NOT NULL,
  `idtipomovi` int(10) unsigned NOT NULL,
  `idcuentao` int(10) unsigned NOT NULL,
  `idcuentad` int(10) unsigned NOT NULL,
  `contabiliza` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idmovicta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tranintercta`
--

/*!40000 ALTER TABLE `tranintercta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tranintercta` ENABLE KEYS */;


--
-- Definition of table `traninterctah`
--

DROP TABLE IF EXISTS `traninterctah`;
CREATE TABLE `traninterctah` (
  `idmovicta` int(10) unsigned NOT NULL,
  `puntovta` int(10) unsigned NOT NULL,
  `tipopago` int(10) unsigned NOT NULL,
  `idcheque` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `importe` float(13,4) NOT NULL,
  PRIMARY KEY (`idmovicta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `traninterctah`
--

/*!40000 ALTER TABLE `traninterctah` DISABLE KEYS */;
/*!40000 ALTER TABLE `traninterctah` ENABLE KEYS */;


--
-- Definition of table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `usuario` char(15) NOT NULL DEFAULT '',
  `nombre` char(100) NOT NULL DEFAULT '',
  `clave` char(15) NOT NULL DEFAULT '',
  `jerarquia` char(60) NOT NULL DEFAULT '',
  `seccion` char(20) NOT NULL DEFAULT '',
  `email` char(80) NOT NULL,
  `habilitado` char(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`usuario`),
  KEY `usuario` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuarios`
--

/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`usuario`,`nombre`,`clave`,`jerarquia`,`seccion`,`email`,`habilitado`) VALUES 
 ('FEDE','FEDERICO CARRION','F','Supervisor','INGENIERIA','','S'),
 ('TULIO','Tulio Rossi','A','Supervisor','INGENIERIA','trossi@cosemar.com.ar','S');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;


--
-- Definition of table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
CREATE TABLE `vendedores` (
  `vendedor` int(10) unsigned NOT NULL DEFAULT '0',
  `nombre` char(200) NOT NULL,
  `domicilio` char(254) NOT NULL,
  `localidad` char(10) NOT NULL,
  `dni` char(20) NOT NULL,
  `telefono` char(100) NOT NULL,
  `email` char(254) NOT NULL,
  `tipodoc` char(3) NOT NULL,
  PRIMARY KEY (`vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendedores`
--

/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` (`vendedor`,`nombre`,`domicilio`,`localidad`,`dni`,`telefono`,`email`,`tipodoc`) VALUES 
 (1,'Federico Carrion','Ricardo Gutierrez 1962','1','38374141','3483485750','fedecarrion137@gmail.com',''),
 (2,'Tulio Rossi','Avellaneda 6963','3','25826321','3424376983','tulior@cosemar.com',''),
 (3,'Javier','Pampa 232','1','35555666','3483485751','javi@gmail.com',''),
 (4,'FGDF','GDGDF','5','4564','5527','SDFDD','');
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;


--
-- Definition of table `zonas`
--

DROP TABLE IF EXISTS `zonas`;
CREATE TABLE `zonas` (
  `zona` int(10) unsigned NOT NULL,
  `detalle` char(254) NOT NULL,
  PRIMARY KEY (`zona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zonas`
--

/*!40000 ALTER TABLE `zonas` DISABLE KEYS */;
INSERT INTO `zonas` (`zona`,`detalle`) VALUES 
 (1,'MARGARITA - SAN JUSTO'),
 (2,'SANTA FE - ROSARIO');
/*!40000 ALTER TABLE `zonas` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
