-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.6.30-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


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
  `ie` char(1) NOT NULL,
  `cantidad` float(13,4) NOT NULL,
  `idajusteh` int(10) unsigned NOT NULL,
  `renglon` int(10) unsigned NOT NULL,
  `neto` float(13,4) NOT NULL,
  `impuesto` float(13,4) NOT NULL,
  `total` float(13,4) NOT NULL,
  PRIMARY KEY (`idajusteh`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ajustestockh`
--

/*!40000 ALTER TABLE `ajustestockh` DISABLE KEYS */;
INSERT INTO `ajustestockh` (`idajuste`,`articulo`,`detalle`,`idtipomov`,`descmov`,`ie`,`cantidad`,`idajusteh`,`renglon`,`neto`,`impuesto`,`total`) VALUES 
 (1,'0101001','Alambre de bajada c/autop.2 x 0.61',1,'ENTREGA MATERIALES POR PEDIDO DE CLIENTE','E',2.0000,1,1,101.0000,42.4200,244.4200),
 (2,'0101002','Alambre de bajada PVC 2 x 0.81',1,'ENTREGA MATERIALES POR PEDIDO DE CLIENTE','E',32.0000,2,1,102.0000,685.4400,3949.4399),
 (1,'0101001','Alambre de bajada c/autop.2 x 0.61',1,'ENTREGA MATERIALES POR PEDIDO DE CLIENTE','E',35.0000,3,1,101.0000,749.7000,4284.7002),
 (1,'0101002','Alambre de bajada PVC 2 x 0.81',1,'ENTREGA MATERIALES POR PEDIDO DE CLIENTE','E',46.0000,4,1,102.0000,985.3200,5677.3198),
 (2,'0101001','Alambre de bajada c/autop.2 x 0.61',1,'ENTREGA MATERIALES POR PEDIDO DE CLIENTE','E',2.0000,5,1,101.0000,42.8400,244.8400),
 (2,'0101002','Alambre de bajada PVC 2 x 0.81',1,'ENTREGA MATERIALES POR PEDIDO DE CLIENTE','E',3.0000,6,1,102.0000,64.2600,370.2600),
 (3,'0101001','Alambre de bajada c/autop.2 x 0.61',1,'ENTREGA MATERIALES POR PEDIDO DE CLIENTE','E',35.0000,7,1,101.0000,742.3500,4277.3501),
 (1,'0101001','Alambre de bajada c/autop.2 x 0.61',1,'ENTREGA MATERIALES POR PEDIDO DE CLIENTE','E',35.0000,8,1,101.0000,742.3500,4277.3501),
 (2,'0101002','Alambre de bajada PVC 2 x 0.81',1,'ENTREGA MATERIALES POR PEDIDO DE CLIENTE','E',55.0000,9,1,102.0000,1178.1000,6788.1001);
/*!40000 ALTER TABLE `ajustestockh` ENABLE KEYS */;


--
-- Definition of table `ajustestockimp`
--

DROP TABLE IF EXISTS `ajustestockimp`;
CREATE TABLE `ajustestockimp` (
  `idajuste` int(10) unsigned NOT NULL,
  `idcomproba` int(10) unsigned NOT NULL,
  `puntov` char(4) NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `tipo` char(1) NOT NULL,
  `impuesto` int(10) unsigned NOT NULL,
  `detalle` char(200) NOT NULL,
  `neto` float(13,4) NOT NULL,
  `razon` float(13,4) NOT NULL,
  `importe` float(13,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ajustestockimp`
--

/*!40000 ALTER TABLE `ajustestockimp` DISABLE KEYS */;
/*!40000 ALTER TABLE `ajustestockimp` ENABLE KEYS */;


--
-- Definition of table `ajustestockp`
--

DROP TABLE IF EXISTS `ajustestockp`;
CREATE TABLE `ajustestockp` (
  `idajuste` int(10) unsigned NOT NULL,
  `puntov` char(4) NOT NULL,
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
INSERT INTO `ajustestockp` (`idajuste`,`puntov`,`numero`,`fecha`,`entidad`,`nombre`,`responsable`,`observa1`,`observa2`,`observa3`,`observa4`,`anulado`,`idtipomov`,`descmov`,`deposito`,`descdepo`) VALUES 
 (1,'0001',1,'20170304',1,'ROSSI TULIO','FEDE','','','','','N',1,'ENTREGA MATERIALES POR PEDIDO DE CLIENTE',1,'DEPOSITO 1'),
 (2,'0001',2,'20170304',2,'ALSAFEX S.A. - Racca Gaston Ramon Alberto','FEDE','','','','','N',1,'ENTREGA MATERIALES POR PEDIDO DE CLIENTE',1,'DEPOSITO 1'),
 (3,'0001',3,'20170304',2,'ALSAFEX S.A. - Racca Gaston Ramon Alberto','FEDE','','','','','N',1,'ENTREGA MATERIALES POR PEDIDO DE CLIENTE',1,'DEPOSITO 1');
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
INSERT INTO `articulos` (`articulo`,`detalle`,`unidad`,`abrevia`,`codbarra`,`costo`,`linea`) VALUES 
 ('0101001','Alambre de bajada c/autop.2 x 0.61','unidades','alambre de bajada','12312321123',101.0000,'0101'),
 ('0101002','Alambre de bajada PVC 2 x 0.81','unidades','alambre','122222',102.0000,'0101'),
 ('0101003','Alambre de cruzada bicolor 2 x 0.51','','','',0.0000,'0101'),
 ('0101004','Alambre p/rienda 4,8 c/PVC','','','',0.0000,'0101'),
 ('0101005','Alambre p/rienda de  6 mm','','','',0.0000,'0101'),
 ('0101006','Alambre p/rienda de 3  y 4 mm','','','',0.0000,'0101'),
 ('0101007','Alambre p/rienda de 8 mm','','','',0.0000,'0101'),
 ('0101008','Alambre p/rienda de 9 mm','','','',0.0000,'0101'),
 ('0101009','Cable Autop. Liv. (4,8) 30ps. 0,40','','','',0.0000,'0101'),
 ('0101010','Cable Autop. Liv. (4,8) 50ps. 0,40','','','',0.0000,'0101'),
 ('0101011','Cable Autop. Liviano 0.50/10 ps','','','',0.0000,'0101'),
 ('0101012','Cable autop. liviano PAL 0.50/20 ps','','','',0.0000,'0101'),
 ('0101013','Cable autop. liviano PAL 0.50/30 ps','','','',0.0000,'0101'),
 ('0101014','Cable autop. pesado PAL 0.40/100 ps','','','',0.0000,'0101'),
 ('0101015','Cable autop. pesado PAL 0.40/150 ps','','','',0.0000,'0101'),
 ('0101016','Cable autop. pesado PAL 0.40/20 ps','','','',0.0000,'0101'),
 ('0101017','Cable autop. pesado PAL 0.40/200 ps','','','',0.0000,'0101'),
 ('0101018','Cable autop. pesado PAL 0.40/30 ps','','','',0.0000,'0101'),
 ('0101019','Cable autop. pesado PAL 0.40/300 ps','','','',0.0000,'0101'),
 ('0101020','Cable autop. pesado PAL 0.40/50 ps','','','',0.0000,'0101'),
 ('0101021','Cable autop. pesado PAL 0.50/100 ps','','','',0.0000,'0101'),
 ('0101022','Cable autop. pesado PAL 0.50/150 ps','','','',0.0000,'0101'),
 ('0101023','Cable autop. pesado PAL 0.50/20 ps','','','',0.0000,'0101'),
 ('0101024','Cable autop. pesado PAL 0.50/200 ps','','','',0.0000,'0101'),
 ('0101025','Cable autop. pesado PAL 0.50/30 ps','','','',0.0000,'0101'),
 ('0101026','Cable autop. pesado PAL 0.50/50 ps','','','',0.0000,'0101'),
 ('0101027','Cable bajada XDSL 1 par c/portante','','','',0.0000,'0101'),
 ('0101028','Cable cilind. subt. PAL 0.50/100 ps','','','',0.0000,'0101'),
 ('0101029','Cable cilind. subt. PAL 0.50/150 ps','','','',0.0000,'0101'),
 ('0101030','Cable cilind. subt. PAL 0.50/20 ps','','','',0.0000,'0101'),
 ('0101031','Cable cilind. subt. PAL 0.50/200 ps','','','',0.0000,'0101'),
 ('0101032','Cable cilind. subt. PAL 0.50/30 ps','','','',0.0000,'0101'),
 ('0101033','Cable cilind. subt. PAL 0.50/300 ps','','','',0.0000,'0101'),
 ('0101034','Cable cilind. subt. PAL 0.50/400 ps','','','',0.0000,'0101'),
 ('0101035','Cable cilind. Subt. PAL 0.50/50 ps','','','',0.0000,'0101'),
 ('0101036','Cable cilind. subt. PAL 0.50/500 ps','','','',0.0000,'0101'),
 ('0101037','Cable cilind. subt. PAL 0.50/600 ps','','','',0.0000,'0101'),
 ('0101038','Cable de bajada c/suspensor 0.50 x 2 ps','','','',0.0000,'0101'),
 ('0101039','Cable de bajada c/suspensor 0.50 x 4 ps','','','',0.0000,'0101'),
 ('0101040','Cable de bajada c/suspensor 0.50 x 6 ps','','','',0.0000,'0101'),
 ('0101041','Cable de bajada c/suspensor 0.50 x 8 ps','','','',0.0000,'0101'),
 ('0101042','Cable p/inst. interior 2 x 0.51','','','',0.0000,'0101'),
 ('0101043','Cable p/instalacion de fachada 2 x 0.61','','','',0.0000,'0101'),
 ('0101044','Cable p/microfono balanceado','','','',0.0000,'0101'),
 ('0101045','Cable subterraneo 2 ps 0,50','','','',0.0000,'0101'),
 ('0101046','Cable telefonico p/interior 0.50 x 1 ps','','','',0.0000,'0101'),
 ('0101047','Cable telefonico p/interior 0.50 x 10 ps','','','',0.0000,'0101'),
 ('0101048','Cable telefonico p/interior 0.50 x 100 ps','','','',0.0000,'0101'),
 ('0101049','Cable telefonico p/interior 0.50 x 16 ps','','','',0.0000,'0101'),
 ('0101050','Cable telefonico p/interior 0.50 x 2 ps','','','',0.0000,'0101'),
 ('0101051','Cable telefonico p/interior 0.50 x 20 ps','','','',0.0000,'0101'),
 ('0101052','Cable telefonico p/interior 0.50 x 25 ps','','','',0.0000,'0101'),
 ('0101053','Cable telefonico p/interior 0.50 x 4 ps','','','',0.0000,'0101'),
 ('0101054','Cable telefonico p/interior 0.50 x 50 ps','','','',0.0000,'0101'),
 ('0101055','Cable telefonico p/interior 0.50 x 6 ps','','','',0.0000,'0101'),
 ('0101056','Cable telefonico p/interior 0.50 x 8 ps','','','',0.0000,'0101'),
 ('0101057','Cable UTP cat 5 c/portante','','','',0.0000,'0101'),
 ('0101058','Cable UTP Cat. 5 de 4 ps','','','',0.0000,'0101'),
 ('0101059','Cable UTP cat.5 p/exterior','','','',0.0000,'0101'),
 ('0102001','Arandela cuadrada curva 83/18','','','',0.0000,'0102'),
 ('0102002','Arandela cuadrada curva 89/22','','','',0.0000,'0102'),
 ('0102003','Arandela cuadrada curva 89/29','','','',0.0000,'0102'),
 ('0102004','Arandela cuadrada plana 102/29','','','',0.0000,'0102'),
 ('0102005','Arandela cuadrada plana 57/18','','','',0.0000,'0102'),
 ('0102006','Arandela cuadrada plana 76/18','','','',0.0000,'0102'),
 ('0102007','Arandela cuadrada plana 89/22','','','',0.0000,'0102'),
 ('0102008','Arandela de seguridad 21/13','','','',0.0000,'0102'),
 ('0102009','Arandela de seguridad 26/16','','','',0.0000,'0102'),
 ('0102010','Arandela redonda plana 26/11.5','','','',0.0000,'0102'),
 ('0102011','Arandela redonda plana 41/18','','','',0.0000,'0102'),
 ('0102012','Bulon cabeza cuadrada 16 x 140','','','',0.0000,'0102'),
 ('0102013','Bulon cabeza cuadrada 16 x 160','','','',0.0000,'0102'),
 ('0102014','Bulon cabeza cuadrada 16 x 180','','','',0.0000,'0102'),
 ('0102015','Bulon cabeza cuadrada 16 x 200','','','',0.0000,'0102'),
 ('0102016','Bulon cabeza cuadrada 16 x 260','','','',0.0000,'0102'),
 ('0102017','Bulon cabeza cuadrada 16 x 300','','','',0.0000,'0102'),
 ('0102018','Bulon cabeza cuadrada 16 x 350','','','',0.0000,'0102'),
 ('0102019','Bulon cabeza cuadrada 16 x 400','','','',0.0000,'0102'),
 ('0102020','Bulon cabeza cuadrada 16 x 630','','','',0.0000,'0102'),
 ('0102021','Bulon cabeza cuadrada 19 x 260','','','',0.0000,'0102'),
 ('0102022','Bulon cabeza cuadrada 9.5 x 80','','','',0.0000,'0102'),
 ('0102023','Bulon cabeza cuadrada 9.5 x 125','','','',0.0000,'0102'),
 ('0102024','Bulon cabeza redonda 9.5 x 100','','','',0.0000,'0102'),
 ('0102025','Bulon cabeza redonda 9.5 x 125','','','',0.0000,'0102'),
 ('0102026','Bulon de ojo curvo c/tuerca 16 x 180','','','',0.0000,'0102'),
 ('0102027','Bulon de ojo curvo c/tuerca 16 x 205','','','',0.0000,'0102'),
 ('0102028','Bulon de ojo curvo c/tuerca 16 x 230','','','',0.0000,'0102'),
 ('0102029','Bulon de ojo curvo c/tuerca 16 x 255','','','',0.0000,'0102'),
 ('0102030','Bulon de ojo curvo c/tuerca 19 x 180','','','',0.0000,'0102'),
 ('0102031','Bulon de ojo curvo c/tuerca 19 x 210','','','',0.0000,'0102'),
 ('0102032','Bulon de ojo curvo c/tuerca 19 x 240','','','',0.0000,'0102'),
 ('0102033','Bulon de ojo curvo c/tuerca 19 x 270','','','',0.0000,'0102'),
 ('0102034','Bulon de ojo curvo c/tuerca 25 x 180','','','',0.0000,'0102'),
 ('0102035','Bulon de ojo curvo c/tuerca 25 x 210','','','',0.0000,'0102'),
 ('0102036','Bulon de ojo curvo c/tuerca 25 x 240','','','',0.0000,'0102'),
 ('0102037','Bulon de ojo curvo c/tuerca 25 x 270','','','',0.0000,'0102'),
 ('0102038','Bulon de ojo recto c/tuerca 16 x 180','','','',0.0000,'0102'),
 ('0102039','Bulon de ojo recto c/tuerca 16 x 205','','','',0.0000,'0102'),
 ('0102040','Bulon de ojo recto c/tuerca 16 x 230','','','',0.0000,'0102'),
 ('0102041','Bulon de ojo recto c/tuerca 16 x 255','','','',0.0000,'0102'),
 ('0102042','Bulon de ojo recto c/tuerca 16 x 270','','','',0.0000,'0102'),
 ('0102043','Bulon de ojo recto c/tuerca 19 x 180','','','',0.0000,'0102'),
 ('0102044','Bulon de ojo recto c/tuerca 19 x 210','','','',0.0000,'0102'),
 ('0102045','Bulon de ojo recto c/tuerca 19 x 240','','','',0.0000,'0102'),
 ('0102046','Bulon de ojo recto c/tuerca 19 x 270','','','',0.0000,'0102'),
 ('0102047','Bulon de ojo recto c/tuerca 25 x 210','','','',0.0000,'0102'),
 ('0102048','Bulon de ojo recto c/tuerca 25 x 240','','','',0.0000,'0102'),
 ('0102049','Esparragos c/4 tuercas 16 x 350','','','',0.0000,'0102'),
 ('0102050','Esparragos c/4 tuercas 16 x 400','','','',0.0000,'0102'),
 ('0102051','Esparragos c/4 tuercas 16 x 450','','','',0.0000,'0102'),
 ('0102052','Esparragos c/4 tuercas 16 x 500','','','',0.0000,'0102'),
 ('0102053','Tuerca de ojo p/bulon 16','','','',0.0000,'0102'),
 ('0102054','Tuerca de ojo p/bulon 19','','','',0.0000,'0102'),
 ('0103001','Caja 10 ps. c/prot. s/cola 3M','','','',0.0000,'0103'),
 ('0103002','Caja 10 ps. c/prot.. c/cola 3M','','','',0.0000,'0103'),
 ('0103003','Caja 20 ps. c/prot. s/cola 3M','','','',0.0000,'0103'),
 ('0103004','Caja 20 ps. c/prot. c/cola 3M','','','',0.0000,'0103'),
 ('0103005','Caja distrib.ab.10 ps.  s/cola Pouyet','','','',0.0000,'0103'),
 ('0103006','Caja distrib.ab.10 ps.  c/cola Pouyet','','','',0.0000,'0103'),
 ('0103007','Caja p/empalme reentrable 100 ps','','','',0.0000,'0103'),
 ('0103008','Caja p/empalme reentrable 200 ps','','','',0.0000,'0103'),
 ('0103009','Caja p/empalme reentrable 300 ps','','','',0.0000,'0103'),
 ('0103010','Caja p/empalme vertical 200 ps','','','',0.0000,'0103'),
 ('0103011','Caja p/empalme vertical 300 ps','','','',0.0000,'0103'),
 ('0103012','Caja p/empalme vertical 50 ps.','','','',0.0000,'0103'),
 ('0103013','Caja p/conexion RJ11 x 4','','','',0.0000,'0103'),
 ('0103014','Caja p/conexion RJ11 x 8','','','',0.0000,'0103'),
 ('0103015','Caja estanca 10 pares','','','',0.0000,'0103'),
 ('0103016','Caja p/ fachada 1pr. c/proteccion','','','',0.0000,'0103'),
 ('0103017','Caja p/fachada 2pr. c/proteccion','','','',0.0000,'0103'),
 ('0103018','Ca¤o  de PVC 87/90 - 6 m','','','',0.0000,'0103'),
 ('0103019','Curva de PVC 87/90 - 45 grados','','','',0.0000,'0103'),
 ('0103020','Curva de PVC 87/90 - 90 grados','','','',0.0000,'0103'),
 ('0103021','Cierre Slic 100 ps. 3M','','','',0.0000,'0103'),
 ('0103022','Cierre Slic 200 ps. 3M','','','',0.0000,'0103'),
 ('0103023','Cierre Slic 50 ps. 3M','','','',0.0000,'0103'),
 ('0103024','Tira abrazadera de aluminio 250 mm','','','',0.0000,'0103'),
 ('0103025','Tira abrazadera de aluminio 300 mm','','','',0.0000,'0103'),
 ('0103026','Tira abrazadera de aluminio 350 mm','','','',0.0000,'0103'),
 ('0103027','Tira abrazadera de aluminio 520 mm','','','',0.0000,'0103'),
 ('0103028','Tira abrazadera de aluminio 650 mm','','','',0.0000,'0103'),
 ('0103029','Tira abrazadera de aluminio 700 mm','','','',0.0000,'0103'),
 ('0103030','Juego continuidad a tierra','','','',0.0000,'0103'),
 ('0103031','Descargado Trip. 3M p/c/Pouyet','','','',0.0000,'0103'),
 ('0103032','Modulo de conexion p/ cajas 3M','','','',0.0000,'0103'),
 ('0103033','Manguito de union de PVC 87/90','','','',0.0000,'0103'),
 ('0103034','Sellador p/ducto 90mm Raychem','','','',0.0000,'0103'),
 ('0103035','Tapon 90mm Ultraflex','','','',0.0000,'0103'),
 ('0103036','Tubo corrugado 90 mm Ultraflex','','','',0.0000,'0103'),
 ('0104001','Adaptador Amer. doble','','','',0.0000,'0104'),
 ('0104002','Adaptador Americano Triple','','','',0.0000,'0104'),
 ('0104003','Conector BNC macho acodado 90ø','','','',0.0000,'0104'),
 ('0104004','Conector hembra 4 cables RJ11','','','',0.0000,'0104'),
 ('0104005','Conector hembra 4 cables RJ9','','','',0.0000,'0104'),
 ('0104006','Conector hembra RJ 45 cat.5','','','',0.0000,'0104'),
 ('0104007','Conector hembra RJ11 p/crimpear','','','',0.0000,'0104'),
 ('0104008','Conector hembra RJ45 cat.5 p/crimpear','','','',0.0000,'0104'),
 ('0104009','Conector plug c/capuchon RJ45','','','',0.0000,'0104'),
 ('0104010','Conectores antienrosque TP 801','','','',0.0000,'0104'),
 ('0104011','Conectores plug RJ45  flexibles AMP','','','',0.0000,'0104'),
 ('0104012','Conector Telesplise 2 vias c/derv.','','','',0.0000,'0104'),
 ('0104013','Conectores Telesplice 2 vias','','','',0.0000,'0104'),
 ('0104014','Conectores Telesplice de 3 vias','','','',0.0000,'0104'),
 ('0104015','Cupla alargue Americana RJ11','','','',0.0000,'0104'),
 ('0104016','Cupla Alargue Americana RJ45','','','',0.0000,'0104'),
 ('0104017','Cupla prolongacion RJ45 H-H','','','',0.0000,'0104'),
 ('0104018','Grampas Kalop N§  5','','','',0.0000,'0104'),
 ('0104019','Grampas Kalop N§  8','','','',0.0000,'0104'),
 ('0104020','Grampas Kalop N§  10','','','',0.0000,'0104'),
 ('0104021','Jack Americano  exterior c/gel','','','',0.0000,'0104'),
 ('0104022','Jack Americano exterior simple','','','',0.0000,'0104'),
 ('0104023','Jack Americano  exterior doble','','','',0.0000,'0104'),
 ('0104024','Jack Americano  embutido doble c/filtro','','','',0.0000,'0104'),
 ('0104025','Jack Americano  embutido simple c/filtro','','','',0.0000,'0104'),
 ('0104026','Jack Americano  exterior  c/filtro','','','',0.0000,'0104'),
 ('0104027','Plug 6,5 mono metal','','','',0.0000,'0104'),
 ('0104028','Plug 6.5 Stereo metal','','','',0.0000,'0104'),
 ('0104029','Plug p/cordon Americano RJ9','','','',0.0000,'0104'),
 ('0104030','Plug p/linea Americano RJ 11 - 6C','','','',0.0000,'0104'),
 ('0104031','Plug p/linea Americano  RJ11 - 4C','','','',0.0000,'0104'),
 ('0104032','Roseta 2 bocas ext. p/con. hem. RJ11 y 45','','','',0.0000,'0104'),
 ('0105001','Anillas de distribucion  32 mm','','','',0.0000,'0105'),
 ('0105002','Anillas de distribucion 41 mm','','','',0.0000,'0105'),
 ('0105003','Anillas de distribucion 76 mm','','','',0.0000,'0105'),
 ('0105004','Anillas de retencion 115 mm','','','',0.0000,'0105'),
 ('0105005','Anillas de retencion 155 mm','','','',0.0000,'0105'),
 ('0105006','Anillas de retencion 80 mm','','','',0.0000,'0105'),
 ('0105007','Anillas p/instalacion de bajada 10 mm','','','',0.0000,'0105'),
 ('0105008','Anillas p/instalacion de bajada 15 mm','','','',0.0000,'0105'),
 ('0105009','Anillas p/retencion de bajada 115 mm','','','',0.0000,'0105'),
 ('0105010','Anillas p/retencion de bajada 80 mm','','','',0.0000,'0105'),
 ('0105011','Brazo de extension 1.220 mm','','','',0.0000,'0105'),
 ('0105012','Brazo de extension 750 mm','','','',0.0000,'0105'),
 ('0105013','Clavo de acero cincado 127 mm','','','',0.0000,'0105'),
 ('0105014','Clavo de acero cincado 152 mm','','','',0.0000,'0105'),
 ('0105015','Clavo de acero cincado 38 mm','','','',0.0000,'0105'),
 ('0105016','Clavo de acero cincado 51 mm','','','',0.0000,'0105'),
 ('0105017','Gancho de suspension tipo','J','','',0.0000,''),
 ('0105018','Grampa de 1 oreja D 10 L 32.5','','','',0.0000,'0105'),
 ('0105019','Grampa de 1 oreja D 13 L 36.5','','','',0.0000,'0105'),
 ('0105020','Grampa de 1 oreja D 16 L 39.5','','','',0.0000,'0105'),
 ('0105021','Grampa de 1 oreja D 18 L 57','','','',0.0000,'0105'),
 ('0105022','Grampa de 1 oreja D 23 L 62','','','',0.0000,'0105'),
 ('0105023','Grampa de 1 oreja D 25 L 66','','','',0.0000,'0105'),
 ('0105024','Grampa de 1 oreja D 29 L 72.5','','','',0.0000,'0105'),
 ('0105025','Grampa de 1 oreja D 35 L 79','','','',0.0000,'0105'),
 ('0105026','Grampa de 1 oreja D 8 L 29','','','',0.0000,'0105'),
 ('0105027','Grampa de 2 orejas D 116 L 171.4','','','',0.0000,'0105'),
 ('0105028','Grampa de 2 orejas D 16 L 65.2','','','',0.0000,'0105'),
 ('0105029','Grampa de 2 orejas D 23 L 72.2','','','',0.0000,'0105'),
 ('0105030','Grampa de 2 orejas D 25 L 77.2','','','',0.0000,'0105'),
 ('0105031','Grampa de 2 orejas D 28 L 80.2','','','',0.0000,'0105'),
 ('0105032','Grampa de 2 orejas D 35 L 87.2','','','',0.0000,'0105'),
 ('0105033','Grampa de 2 orejas D 42 L 94.2','','','',0.0000,'0105'),
 ('0105034','Grampa de 2 orejas D 51 L 103.2','','','',0.0000,'0105'),
 ('0105035','Grampa de 2 orejas D 60 L 112.2','','','',0.0000,'0105'),
 ('0105036','Grampa de 2 orejas D 77 L 129.2','','','',0.0000,'0105'),
 ('0105037','Grampa de 2 orejas D 91 L 146.4','','','',0.0000,'0105'),
 ('0105038','Grampa prensacable tipo U p/alam.3mm','','','',0.0000,'0105'),
 ('0105039','Grampa prensacable tipo U p/alam.5mm','','','',0.0000,'0105'),
 ('0105040','Grampa prensacable tipo U p/alam.6mm','','','',0.0000,'0105'),
 ('0105041','Grampa prensacable tipo U p/alam.8mm','','','',0.0000,'0105'),
 ('0105042','Kit de continuidad  a tierra p/empalmes','','','',0.0000,'0105'),
 ('0105043','Modulo de conexion 10 ps Krone','','','',0.0000,'0105'),
 ('0105044','Modulo de corte 10 ps Krone','','','',0.0000,'0105'),
 ('0105045','Modulo de proteccion electronico MPE','','','',0.0000,'0105'),
 ('0105046','Modulo MPG p/cajas Tecsel','','','',0.0000,'0105'),
 ('0105047','Modulo p/puesta a tierra MT','','','',0.0000,'0105'),
 ('0105048','Mordaza galvanizada p/bajada','','','',0.0000,'0105'),
 ('0105049','Mordaza p/cable XDSL','','','',0.0000,'0105'),
 ('0105050','Mordaza reforzada de PVC p/bajada','','','',0.0000,'0105'),
 ('0105051','Morseto de susp. 3 agujeros 2 bulones','','','',0.0000,'0105'),
 ('0105052','Morseto p/alam.de susp. 3 bulones','','','',0.0000,'0105'),
 ('0105053','Morseto p/alam.de susp. chica 2 bulones','','','',0.0000,'0105'),
 ('0105054','Morseto p/conexion a tierra','','','',0.0000,'0105'),
 ('0105055','Prec.metal.c/recub.plas.PMPCH40','','','',0.0000,'0105'),
 ('0105056','Proteccion forma U de chapa 2.440x36x32','','','',0.0000,'0105'),
 ('0105057','Proteccion forma U de chapa 2.440x59x55','','','',0.0000,'0105'),
 ('0105058','Proteccion forma U de chapa 2.440x84x80','','','',0.0000,'0105'),
 ('0105059','Soporte cadena','','','',0.0000,'0105'),
 ('0105060','Tirafondo cabaza cuadrada 9.5 x 100 mm','','','',0.0000,'0105'),
 ('0105061','Tirafondo cabeza cuadrada 12.7 x 110 mm','','','',0.0000,'0105'),
 ('0105062','Tirafondo cabeza cuadrada 8 x 63 mm','','','',0.0000,'0105'),
 ('0105063','Tirafondo cabeza cuadrada 8 x 80 mm','','','',0.0000,'0105'),
 ('0105064','Tirafondo cabeza redonda 25 mm','','','',0.0000,'0105'),
 ('0105065','Tirafondo cabeza redonda 35 mm','','','',0.0000,'0105'),
 ('0106001','Barra P/Ancla de Madera de 16 x 1.50','','','',0.0000,'0106'),
 ('0106002','Barra P/ ancla de Madera 19 x 1.80','','','',0.0000,'0106'),
 ('0106003','Barra p/Ancla de Madera de 16 x 1.80','','','',0.0000,'0106'),
 ('0106004','Barra p/ancla de madera de 19 x 2.25','','','',0.0000,'0106'),
 ('0106005','Barra  p/anclaje doble elice  de 16 x 1.50','','','',0.0000,'0106'),
 ('0106006','Barra p/anclaje doble elice de 19 x 1.90','','','',0.0000,'0106'),
 ('0106007','Barra p/puesta a tierra de Cu  1.50 m','','','',0.0000,'0106'),
 ('0106008','Barra p/puesta a tierra de Cu 2.00 m','','','',0.0000,'0106'),
 ('0106009','Barra p/puesta a tierra de Cu 2.50 m','','','',0.0000,'0106'),
 ('0106010','Barra p/puesta a tierra de Cu 3.00 m','','','',0.0000,'0106'),
 ('0106011','Bulones p/guardarriendas','','','',0.0000,'0106'),
 ('0106012','Guardarriendas','','','',0.0000,'0106'),
 ('0106013','Poste de eucalipto tratado c/CCA de 6 m','','','',0.0000,'0106'),
 ('0106014','Poste de eucalipto tratado c/CCa de 7 m','','','',0.0000,'0106'),
 ('0106015','Poste de eucalipto tratado c/CCA de 7.50 m','','','',0.0000,'0106'),
 ('0106016','Poste de eucalipto tratado c/CCA de 8 m','','','',0.0000,'0106'),
 ('0106017','Poste de eucalipto tratado c/CCA de 8.50 m','','','',0.0000,'0106'),
 ('0106018','Poste de eucalipto tratado c/CCA de 9 m','','','',0.0000,'0106'),
 ('0106019','Poste de eucalipto tratado c/CCA de 9.50 m','','','',0.0000,'0106'),
 ('0106020','Poste de eucalipto tratado c/CCA de 10 m','','','',0.0000,'0106'),
 ('0106021','Poste de eucalipto tratado c/CCA de 11 m','','','',0.0000,'0106'),
 ('0109001','Antena omni 4 dipolos (pol.Vert.) Fr. 165.400 - 172.100 MHZ','','','',0.0000,'0109'),
 ('0109002','Bateria SN358 Ion-Li 1030mA','','','',0.0000,'0109'),
 ('0109003','Booster 160MHz (equipo TRASA)','','','',0.0000,'0109'),
 ('0109004','Cabezal Plantronics 142 p/TE 901','','','',0.0000,'0109'),
 ('0109005','Capsula Rx Panasonic inalam.','','','',0.0000,'0109'),
 ('0109006','Capsula Tx electronica','','','',0.0000,'0109'),
 ('0109007','Casula Rx electronica','','','',0.0000,'0109'),
 ('0109008','Cinta aisladora','','','',0.0000,'0109'),
 ('0109009','Cinta TZ231, 12mm blanco','','','',0.0000,'0109'),
 ('0109010','Cordon de linea Amer.','','','',0.0000,'0109'),
 ('0109011','Cordon de linea Amer. p/metro','','','',0.0000,'0109'),
 ('0109012','Cordon de Pacheo 0.90 m','','','',0.0000,'0109'),
 ('0109013','Cordon de pacheo 1.80 m','','','',0.0000,'0109'),
 ('0109014','Cordon de pacheo 2.10 m','','','',0.0000,'0109'),
 ('0109015','Cordon de pacheo 3.00 m','','','',0.0000,'0109'),
 ('0109016','Cordon de pacheo 5.00 m','','','',0.0000,'0109'),
 ('0109017','Cordon micro Amer.','','','',0.0000,'0109'),
 ('0109018','Kit aliment. TRASA','','','',0.0000,'0109'),
 ('0109019','Molex H y M  15C.062','TRASA','','',0.0000,''),
 ('0109020','Piezo electronico p/telefonos','','','',0.0000,'0109'),
 ('0109021','Pin p/molex H y M  .062','TRASA','','',0.0000,''),
 ('0109022','Resitencia 50 Ohm 40 W (TASA)','','','',0.0000,'0109'),
 ('0109023','Turbina 12V 4','s/rod','','',0.0000,''),
 ('0109024','Turbina 220V 4','','','',0.0000,''),
 ('0109025','Varistor 235V 18mm','','','',0.0000,'0109'),
 ('0110001','Adpt. VoIP p/telef. anal¢gico GKM 2210T','','','',0.0000,'0110'),
 ('0110002','Airgrid Ubiquiti M5','','','',0.0000,'0110'),
 ('0110003','Ampliacion 2 inter. central 284','','','',0.0000,'0110'),
 ('0110004','Ampliacion 4 inter. central 412','','','',0.0000,'0110'),
 ('0110005','Ampliacion de linea central 412','','','',0.0000,'0110'),
 ('0110006','Antena grillada NRD 29Db','','','',0.0000,'0110'),
 ('0110007','Antena Omni Ubiquiti 2.4 - 10 dB','','','',0.0000,'0110'),
 ('0110008','Antena p/TRAM 11 elementos','','','',0.0000,'0110'),
 ('0110009','Antena p/TRAM 13 o 14 elementos','','','',0.0000,'0110'),
 ('0110010','Antena p/TRAM 4 elementos','','','',0.0000,'0110'),
 ('0110011','Antena p/TRAM 5 elementos','','','',0.0000,'0110'),
 ('0110012','Antena p/TRAM 7 elementos','','','',0.0000,'0110'),
 ('0110013','Antena p/TRAM 9 elementos','','','',0.0000,'0110'),
 ('0110014','Antena parab. Hyperlink 5Ghz - 27dBi','','','',0.0000,'0110'),
 ('0110015','Antena pasiva p/telef. celular','','','',0.0000,'0110'),
 ('0110016','Antena Ubiquiti 5 Ghz s¢lida 21 dB','','','',0.0000,'0110'),
 ('0110017','Antena Ubiquiti 5Ghz s¢lida 30 dBi','','','',0.0000,'0110'),
 ('0110018','ATA Audiocodes MP202B/2Fxs','','','',0.0000,'0110'),
 ('0110019','ATA Planet Vip-156 / 156PE','','','',0.0000,'0110'),
 ('0110020','Bateria 12 V - 7 Amp.','','','',0.0000,'0110'),
 ('0110021','Bateria 6 V - 4 Amp.','','','',0.0000,'0110'),
 ('0110022','Bateria Gel 12 V x 2,3A','','','',0.0000,'0110'),
 ('0110023','Bateria nø31 tipo Panasonic','','','',0.0000,'0110'),
 ('0110024','Bateria Ni-Mh panasonic nø 14','','','',0.0000,'0110'),
 ('0110025','Bateria Ni-Mh Panasonic nø 31','','','',0.0000,'0110'),
 ('0110026','Bateria p/telef. celular Nokia','','','',0.0000,'0110'),
 ('0110027','Bateria p/telef. inalam. 280 x 3.6 trebol','','','',0.0000,'0110'),
 ('0110028','Bateria p/telef. inalam. 300 x 2.4','','','',0.0000,'0110'),
 ('0110029','Baterias 3.6 V x 700mA','','','',0.0000,'0110'),
 ('0110030','Baterias Ni-Cd 3.6V - 300mA','','','',0.0000,'0110'),
 ('0110031','Baterias p/telef. inalam. AA270','','','',0.0000,'0110'),
 ('0110032','Enlace  Bullet Ubiquiti 5Ghz  Mimo Airmax','','','',0.0000,'0110'),
 ('0110033','Cabezal Panasonic 110','','','',0.0000,'0110'),
 ('0110034','Cable coaxil RG213','','','',0.0000,'0110'),
 ('0110035','Cable coaxil RG58','','','',0.0000,'0110'),
 ('0110036','Cable coaxil UHF26/73','','','',0.0000,'0110'),
 ('0110037','Caller Id Siemens ID199','','','',0.0000,'0110'),
 ('0110038','Campanilla auxiliar 220/75 - 10 cm','','','',0.0000,'0110'),
 ('0110039','Campanilla auxiliar 220/75 - 15 cm','','','',0.0000,'0110'),
 ('0110040','Campanilla auxiliar 220/75 - 20 cm','','','',0.0000,'0110'),
 ('0110041','Campanilla auxiliar 75 Vcc','','','',0.0000,'0110'),
 ('0110042','Cargador p/Gigaset 3000','','','',0.0000,'0110'),
 ('0110043','Cargador p/pilas 4xAA, 4xAAA','','','',0.0000,'0110'),
 ('0110044','Cargador para Gigaset 3000','','','',0.0000,'0110'),
 ('0110045','Cartucho  Ng. Fax Brother','','','',0.0000,'0110'),
 ('0110046','Cartucho color Fax Brother','','','',0.0000,'0110'),
 ('0110047','Central Avatec Nova 206','','','',0.0000,'0110'),
 ('0110048','Central Intelbras Corp6000 -2 x 12','','','',0.0000,'0110'),
 ('0110049','Central Nexo Tekna 1248','','','',0.0000,'0110'),
 ('0110050','Central Panasonic KX-TES824','','','',0.0000,'0110'),
 ('0110051','Central Starligh MC104','','','',0.0000,'0110'),
 ('0110052','Central telef. Nexo Facil 1 x 4','','','',0.0000,'0110'),
 ('0110053','Central Telef. Nexo Facil 3x8 eq. 2x8','','','',0.0000,'0110'),
 ('0110054','Central telef. Nor-K 1 x 4','','','',0.0000,'0110'),
 ('0110055','Central telef. Nor-K 2 x 8','','','',0.0000,'0110'),
 ('0110056','Central telef. Nor-K 284 sub.2 x 6','','','',0.0000,'0110'),
 ('0110057','Central telef. Nor-K 412','','','',0.0000,'0110'),
 ('0110058','Central Telef.Digitek 1 x 2','','','',0.0000,'0110'),
 ('0110059','Conector adaptador N a UHF','','','',0.0000,'0110'),
 ('0110060','Conector BNC p/cable  RG58','','','',0.0000,'0110'),
 ('0110061','Conector N p/coaxil RG213','','','',0.0000,'0110'),
 ('0110062','Conector N p/UHF26/73 Cod.240','','','',0.0000,'0110'),
 ('0110063','Conector UHF p/cable RG213','','','',0.0000,'0110'),
 ('0110064','Conector UHF p/cable RG58','','','',0.0000,'0110'),
 ('0110065','Contestador digital GE 2-9875','','','',0.0000,'0110'),
 ('0110066','Contestador telef. G.E. 2-9802','','','',0.0000,'0110'),
 ('0110067','Conversor AP 485 p/sistema Delsat','','','',0.0000,'0110'),
 ('0110068','Conversor celular (interfase)','','','',0.0000,'0110'),
 ('0110069','Desoldador a piston','','','',0.0000,'0110'),
 ('0110070','Detector de llamas','','','',0.0000,'0110'),
 ('0110071','Enlace Ubiquiti Bullet 5 c/poe','','','',0.0000,'0110'),
 ('0110072','Enlace Ubiquiti Nano 2 c/poe y fuente','','','',0.0000,'0110'),
 ('0110073','Equipo terminal de ab. TRASA 10W','','','',0.0000,'0110'),
 ('0110074','Equpo terminal abonado TRASA UP','','','',0.0000,'0110'),
 ('0110075','Fax Brother 275','','','',0.0000,'0110'),
 ('0110076','Fax color Brother MFC210C','','','',0.0000,'0110'),
 ('0110077','Fax Panasonic KX-FT908AG','','','',0.0000,'0110'),
 ('0110078','Fax Panasonic KX-FT932AG','','','',0.0000,'0110'),
 ('0110079','Fax Panasonic KX-FT982AG-B','','','',0.0000,'0110'),
 ('0110080','Fax Panasonic KX-FT988AG c/cont.dig','','','',0.0000,'0110'),
 ('0110081','Fax Samsumg SF100','','','',0.0000,'0110'),
 ('0110082','Fax Sarp FO-165 / 175','','','',0.0000,'0110'),
 ('0110083','Fax Sharp UX-45 papel termico','','','',0.0000,'0110'),
 ('0110084','Fax Siemens','','','',0.0000,'0110'),
 ('0110085','Filtro p/alta frecuencia HF-1','','','',0.0000,'0110'),
 ('0110086','Frente Port. Elect. Nor-K','','','',0.0000,'0110'),
 ('0110087','Frente Port.Electr.Starligh DR10','','','',0.0000,'0110'),
 ('0110088','Fuente 6 V 500 mA','','','',0.0000,'0110'),
 ('0110089','Fuente 7,5 V 500mA','','','',0.0000,'0110'),
 ('0110090','Fuente 9 Vcc / 500mA','','','',0.0000,'0110'),
 ('0110091','Fuente F9 para TRAM','','','',0.0000,'0110'),
 ('0110092','Fuente p/comunic 13,8 V x 10 A','','','',0.0000,'0110'),
 ('0110093','Fuente POE Ubiquiti 24 V - 0,5A','','','',0.0000,'0110'),
 ('0110094','Fuente switching 5v - 25w','','','',0.0000,'0110'),
 ('0110095','Fuente switching 5v - 5w','','','',0.0000,'0110'),
 ('0110096','Fuente universal 1,5 a 12VCC 800mA','','','',0.0000,'0110'),
 ('0110097','Gategway AudioCode MP202B/2S/SIP','','','',0.0000,'0110'),
 ('0110098','Gateway Grandstream HT286','','','',0.0000,'0110'),
 ('0110099','Gateway Grandstream HT502','','','',0.0000,'0110'),
 ('0110100','Handy Gigaset 3000','','','',0.0000,'0110'),
 ('0110101','Identificador de llamadas','','','',0.0000,'0110'),
 ('0110102','Impactadora Noga T/814 c/filo','','','',0.0000,'0110'),
 ('0110103','Kit Handy Ucom 3500 UHF','','','',0.0000,'0110'),
 ('0110104','Kit TRAM: PTL1,F9,Ant.5,Coax.30m,2 con,tabl.','','','',0.0000,'0110'),
 ('0110105','Mikrotik AAB RB 750','','','',0.0000,'0110'),
 ('0110106','Mini Gbic 40 km 1 pelo','','','',0.0000,'0110'),
 ('0110107','Modem ADSL','','','',0.0000,'0110'),
 ('0110108','Modem interno p/sistema Delsat','','','',0.0000,'0110'),
 ('0110109','Modem-Fax externo','','','',0.0000,'0110'),
 ('0110110','Modem-Fax interno','','','',0.0000,'0110'),
 ('0110111','Modulo Port. Elect. Nor-K','','','',0.0000,'0110'),
 ('0110112','Modulo portero elect. Nexo Facil','','','',0.0000,'0110'),
 ('0110113','Enlace Nano Bridge M5','','','',0.0000,'0110'),
 ('0110114','Enlace  Nanostation Ubiquiti 5Ghz','','','',0.0000,'0110'),
 ('0110115','Patchcord 0,60 cm Gen‚rico','','','',0.0000,'0110'),
 ('0110116','Patchera 24 P Gen‚rica','','','',0.0000,'0110'),
 ('0110117','Pilas Niquel-Metal 900 mA','','','',0.0000,'0110'),
 ('0110118','Pilas Nique-Matal 1200 mA','','','',0.0000,'0110'),
 ('0110119','Pinz.metal p/con.Amer.RJ45','','','',0.0000,'0110'),
 ('0110120','Placa ampli. 1 linea  central Modulare','','','',0.0000,'0110'),
 ('0110121','Placa Ubiquitti XR2','','','',0.0000,'0110'),
 ('0110122','Protector base Tecsel 10 ps','','','',0.0000,'0110'),
 ('0110123','Protector base Tecsel 2 ps','','','',0.0000,'0110'),
 ('0110124','Protector guardafax dual','','','',0.0000,'0110'),
 ('0110125','Protector modolo MPG','','','',0.0000,'0110'),
 ('0110126','Enlace Rocket Ubiquiti 5Ghz mimo Airmax','','','',0.0000,'0110'),
 ('0110127','Router inalam. TP-LINK  TL-WR743ND','','','',0.0000,'0110'),
 ('0110128','Router Mikrotik RB 450','','','',0.0000,'0110'),
 ('0110129','Router TP-Link 740','','','',0.0000,'0110'),
 ('0110130','Router TP-Link WR741N','','','',0.0000,'0110'),
 ('0110131','Router WiFi Senao ESR 1221','','','',0.0000,'0110'),
 ('0110132','Soldador punta ceramica 60W','','','',0.0000,'0110'),
 ('0110133','Soldador ZR-400 de 40W','','','',0.0000,'0110'),
 ('0110134','Soporte soldador HS-88','','','',0.0000,'0110'),
 ('0110135','Spliter PoE TP-LINK TL-POE10R','','','',0.0000,'0110'),
 ('0110136','Swicht TP-Link 5p','','','',0.0000,'0110'),
 ('0110137','Switch Micronet SP 608K','','','',0.0000,'0110'),
 ('0110138','Switch micronet SP 616B','','','',0.0000,'0110'),
 ('0110139','Switch TP-Link 24 P','','','',0.0000,'0110'),
 ('0110140','TE inal.Panasonic KX-TG1311AG-2','','','',0.0000,'0110'),
 ('0110141','TE inalam. Panasonic KX-TG1712 AGB','','','',0.0000,'0110'),
 ('0110142','TE inalambrico Gigaset 4000','','','',0.0000,'0110'),
 ('0110143','TE inalm. Gigaset A390','','','',0.0000,'0110'),
 ('0110144','TE inalm. Panasaonic KX-TG1711','','','',0.0000,'0110'),
 ('0110145','TE IP Grandstream GXP-1405 Poe','','','',0.0000,'0110'),
 ('0110146','TE IP Grandstream GXP-280 1 l¡nea','','','',0.0000,'0110'),
 ('0110147','TE IP Yealink SIP-T20','','','',0.0000,'0110'),
 ('0110148','TE Nexo NP-315','','','',0.0000,'0110'),
 ('0110149','TE Nexo NP-80 Gondola','','','',0.0000,'0110'),
 ('0110150','TE Panasonic KX-T7703x c/ident.','','','',0.0000,'0110'),
 ('0110151','TE Panasonic KX-T7730 inteligente','','','',0.0000,'0110'),
 ('0110152','TE Panasonic KX-TG4011','','','',0.0000,'0110'),
 ('0110153','TE Panasonic KX-TG6421 c/contestador','','','',0.0000,'0110'),
 ('0110154','TE Panasonic KX-TG7521 c/cont.','','','',0.0000,'0110'),
 ('0110155','TE Stromberg BG-51 Gondola','','','',0.0000,'0110'),
 ('0110156','TE. inal. Panasonic KX-TG3510 2.4 Mhz','','','',0.0000,'0110'),
 ('0110157','TE. inalam.Siemens Gigaset 3000 clasico','','','',0.0000,'0110'),
 ('0110158','TE. inalam.Siemens Gigaset 3010 m/lib.','','','',0.0000,'0110'),
 ('0110159','TE. Nexo NP-1919 C/ID M/Libre','','','',0.0000,'0110'),
 ('0110160','TE. Nexo Sigma','','','',0.0000,'0110'),
 ('0110161','TE. Panasonic Auto-Logic KX-T2390','','','',0.0000,'0110'),
 ('0110162','TE. Panasonic KX-TS 11C/ID','','','',0.0000,'0110'),
 ('0110163','TE. Panasonic KX-TS500','','','',0.0000,'0110'),
 ('0110164','TE.GE 2-9480 2 lineas','','','',0.0000,'0110'),
 ('0110165','TE.Inal. Panasonic KX-TG1311AG','','','',0.0000,'0110'),
 ('0110166','TE.Panacom PA7272 C/ID','','','',0.0000,'0110'),
 ('0110167','Enlace TP-Link 2.4 TL-W5210G','','','',0.0000,'0110'),
 ('0110168','UPS APC Back 650 watt - 230vca','','','',0.0000,'0110'),
 ('0110169','UPS Excel 500','','','',0.0000,'0110'),
 ('0110170','UPS Lyonn 1000VA Online','','','',0.0000,'0110'),
 ('0110171','UPS Lyonn 800','','','',0.0000,'0110'),
 ('0110172','UPS M.G.E. Modelo Pulsar  EL4','','','',0.0000,'0110'),
 ('0110173','UPS M.G.E. Pulsar Elipse 500','','','',0.0000,'0110'),
 ('0110174','UPS TRV Pro500F','','','',0.0000,'0110'),
 ('0110175','Visor p/telecabina sistema Delsat','','','',0.0000,'0110'),
 ('0110176','VOIP Grandstream GXW 4008 - 8 FXS','','','',0.0000,'0110'),
 ('0110177','VOIP Grandstream GXW4104 - 4 Fxo','','','',0.0000,'0110'),
 ('0201001','Abrazadera › 50 -PVC- 1/2','- Con Cu¤a','','',0.0000,''),
 ('0201002','Abrazadera › 63 -PVC- 1/2','- Con Cu¤a','','',0.0000,''),
 ('0201003','Abrazadera › 75 -PVC- 1/2','- Con Cu¤a','','',0.0000,''),
 ('0201004','Abrazadera › 90 -PVC- 1/2','- Con Cu¤a','','',0.0000,''),
 ('0201005','Abrazadera › 110 -PVC- 1/2','- Con Cu¤a','','',0.0000,''),
 ('0201006','Abrazadera › 140 -PVC- 1/2','- Con Cu¤a','','',0.0000,''),
 ('0201007','Abrazadera › 160 -PVC- 1/2','- Con Cu¤a','','',0.0000,''),
 ('0201008','Abrazadera › 50 -PVC- 3/4','- Con Cu¤a','','',0.0000,''),
 ('0201009','Abrazadera › 63 -PVC- 3/4','- Con Cu¤a','','',0.0000,''),
 ('0201010','Abrazadera › 75 -PVC- 3/4','- Con Cu¤a','','',0.0000,''),
 ('0201011','Abrazadera › 90 -PVC- 3/4','- Con Cu¤a','','',0.0000,''),
 ('0201012','Abrazadera › 110 -PVC- 3/4','- Con Cu¤a','','',0.0000,''),
 ('0201013','Abrazadera › 140 -PVC- 3/4','- Con Cu¤a','','',0.0000,''),
 ('0201014','Abrazadera › 160 -PVC- 3/4','- Con Cu¤a','','',0.0000,''),
 ('0201015','Abrazadera › 50 -PVC- 1','- Con Cu¤a','','',0.0000,''),
 ('0201016','Abrazadera › 63 -PVC- 1','- Con Cu¤a','','',0.0000,''),
 ('0201017','Abrazadera › 75 -PVC- 1','- Con Cu¤a','','',0.0000,''),
 ('0201018','Abrazadera › 90 -PVC- 1','- Con Cu¤a','','',0.0000,''),
 ('0201019','Abrazadera › 110 -PVC- 1','- Con Cu¤a','','',0.0000,''),
 ('0201020','Abrazadera › 140 -PVC- 1','- Con Cu¤a','','',0.0000,''),
 ('0201021','Abrazadera › 160 -PVC- 1','- Con Cu¤a','','',0.0000,''),
 ('0201022','Abrazadera › 50 -PVC- 1/2','- Doble Bulon','','',0.0000,''),
 ('0201023','Abrazadera › 63 -PVC- 1/2','- Doble Bulon','','',0.0000,''),
 ('0201024','Abrazadera › 75 -PVC- 1/2','- Doble Bulon','','',0.0000,''),
 ('0201025','Abrazadera › 90 -PVC- 1/2','- Doble Bulon','','',0.0000,''),
 ('0201026','Abrazadera › 110 -PVC- 1/2','- Doble Bulon','','',0.0000,''),
 ('0201027','Abrazadera › 140 -PVC- 1/2','- Doble Bulon','','',0.0000,''),
 ('0201028','Abrazadera › 160 -PVC- 1/2','- Doble Bulon','','',0.0000,''),
 ('0201029','Abrazadera › 50 -PVC- 3/4','- Doble Bulon','','',0.0000,''),
 ('0201030','Abrazadera › 63 -PVC- 3/4','- Doble Bulon','','',0.0000,''),
 ('0201031','Abrazadera › 75 -PVC- 3/4','- Doble Bulon','','',0.0000,''),
 ('0201032','Abrazadera › 90 -PVC- 3/4','- Doble Bulon','','',0.0000,''),
 ('0201033','Abrazadera › 110 -PVC- 3/4','- Doble Bulon','','',0.0000,''),
 ('0201034','Abrazadera › 140 -PVC- 3/4','- Doble Bulon','','',0.0000,''),
 ('0201035','Abrazadera › 160 -PVC- 3/4','- Doble Bulon','','',0.0000,''),
 ('0201036','Abrazadera › 50 -PVC- 1','- Doble Bulon','','',0.0000,''),
 ('0201037','Abrazadera › 63 -PVC- 1','- Doble Bulon','','',0.0000,''),
 ('0201038','Abrazadera › 75 -PVC- 1','- Doble Bulon','','',0.0000,''),
 ('0201039','Abrazadera › 90 -PVC- 1','- Doble Bulon','','',0.0000,''),
 ('0201040','Abrazadera › 110 -PVC- 1','- Doble Bulon','','',0.0000,''),
 ('0201041','Abrazadera › 140 -PVC- 1','- Doble Bulon','','',0.0000,''),
 ('0201042','Abrazadera › 160 -PVC- 1','- Doble Bulon','','',0.0000,''),
 ('0202001','Adaptador con Registro - PVC - 20 x 3/4','','','',0.0000,''),
 ('0203001','Brida para tubo 63 mm.','','','',0.0000,'0203'),
 ('0203002','Brida H§F§ c/aro de goma p/ca¤o 110mm','','','',0.0000,'0203'),
 ('0203003','Brida c/aro goma 160x140','','','',0.0000,'0203'),
 ('0203004','Bul¢n de acero  p/brida 1/2','x 2 1/2','','',0.0000,''),
 ('0203005','Tuerca de acero  p/bulon 1/2','','','',0.0000,''),
 ('0203006','Arandela  Plana   p/bulon','','','',0.0000,'0203'),
 ('0203007','Junta de Goma p/brida de 110mm','','','',0.0000,'0203'),
 ('0204001','Buje Reduccion   PVC  1','a 1/2','','',0.0000,''),
 ('0204002','Buje Reduccion - PVC -1 x 3/4','','','',0.0000,''),
 ('0204003','Buje Reduccion - PPN -3/4','a 1/2','','',0.0000,''),
 ('0204004','Buje Reduccion - Bronce - 1 x 3/4','','','',0.0000,''),
 ('0204005','Buje reducci¢n galvanizado   1 1/4','a  3/4','','',0.0000,''),
 ('0204006','Buje reduccion galvanizado  1 1/4','a  1','','',0.0000,''),
 ('0204007','Buje reduccion galvanizado   2 1/2','a   2','','',0.0000,''),
 ('0204008','Buje reduccion galvanizado   2 1/2','a   1 1/2','','',0.0000,''),
 ('0204009','Buje reduccion galvanizado   2 1/2','a   1  1/4','','',0.0000,''),
 ('0204010','Buje reducci¢n galvanizado 3','a   1','','',0.0000,''),
 ('0204011','Buje reducci¢n galvanizado 3','a   1 1/2','','',0.0000,''),
 ('0204012','Buje reduccion galvanizado 3','a   1 1/4','','',0.0000,''),
 ('0204013','Buje  reducci¢n galvanizado  3','a   2','','',0.0000,''),
 ('0204014','Niple   galvanizado  de  2','x 10 cm','','',0.0000,''),
 ('0204015','Buje  Niple  entre rosca   de 1/2','PPM','','',0.0000,''),
 ('0204016','Buje entrerosca   de 3/4  PPM','','','',0.0000,'0204'),
 ('0204017','Buje entrerosca   galvanizada de  2','','','',0.0000,''),
 ('0204018','Buje entrerosca  galvanizada  de   2 1/2','','','',0.0000,''),
 ('0204019','Buje entrerosca  galvanizada  de   3','','','',0.0000,''),
 ('0204020','Espiga Conica - PVC','','','',0.0000,'0204'),
 ('0204021','Espiga Plana - PVC','','','',0.0000,'0204'),
 ('0204022','Espiga/Espiga - Bronce','','','',0.0000,'0204'),
 ('0204023','Espiga con Rosca Macho 3/4','','','',0.0000,'0204'),
 ('0204024','Racord RM - 1/2','x 17mm - K6','','',0.0000,''),
 ('0204025','Racord RM - 1/2','x 20mm - K10','','',0.0000,''),
 ('0204026','Racord con tuerca loca 1','x 17mm','','',0.0000,''),
 ('0204027','Racord con tuerca loca 1','x 20mm','','',0.0000,''),
 ('0205001','Ca¤o PVC - › 50 - J/D','','','',0.0000,'0205'),
 ('0205002','Ca¤o PVC - › 63 - J/D','','','',0.0000,'0205'),
 ('0205003','Ca¤o PVC - › 75 - J/D','','','',0.0000,'0205'),
 ('0205004','Ca¤o PVC - › 90 - J/D','','','',0.0000,'0205'),
 ('0205005','Ca¤o PVC - › 110 - J/D','','','',0.0000,'0205'),
 ('0205006','Ca¤o PVC - › 140 - J/D','','','',0.0000,'0205'),
 ('0205007','Ca¤o PVC - › 160 - J/D','','','',0.0000,'0205'),
 ('0205008','Ca¤o PVC - › 200 - J/D','','','',0.0000,'0205'),
 ('0205009','Ca¤o PVC - › 250 - J/D','','','',0.0000,'0205'),
 ('0205010','Ca¤o PVC - ›  300 - J/D','','','',0.0000,'0205'),
 ('0205011','Ca¤o PVC - › 50 - J/P','','','',0.0000,'0205'),
 ('0205012','Ca¤o PVC - › 63 - J/P','','','',0.0000,'0205'),
 ('0205013','Ca¤o PVC - › 75 - J/P','','','',0.0000,'0205'),
 ('0205014','Ca¤o PVC - › 90 - J/P','','','',0.0000,'0205'),
 ('0205015','Ca¤o PVC - › 110 - J/P','','','',0.0000,'0205'),
 ('0205016','Ca¤o PVC - › 140 - J/P','','','',0.0000,'0205'),
 ('0205017','Ca¤o PVC - › 160 - J/P','','','',0.0000,'0205'),
 ('0205018','Ca¤o PeBD 1/2','x 20 mm.','','',0.0000,''),
 ('0205019','Ca¤o PeBD 1/2','x 20 mm.','','',0.0000,''),
 ('0205020','Ca¤o PPM  1/2','','','',0.0000,''),
 ('0205021','Ca¤o PeBD 3/4','','','',0.0000,''),
 ('0205022','Ca¤o Bicapa 3/4 PPM','','','',0.0000,'0205'),
 ('0205023','Ca¤o galvanizado de  2 1/2','','','',0.0000,''),
 ('0205024','Ramal','Y','a 45§ de 100 x 100 c/bridas H§F§','',0.0000,''),
 ('0205025','Ramal','Y','doble de 160 X 160 X 110','',0.0000,''),
 ('0206001','Cupla PVC - › 50 - J/P','','','',0.0000,'0206'),
 ('0206002','Cupla PVC - › 63 - J/P','','','',0.0000,'0206'),
 ('0206003','Cupla PVC - › 75 - J/P','','','',0.0000,'0206'),
 ('0206004','Cupla PVC - › 90 - J/P','','','',0.0000,'0206'),
 ('0206005','Cupla PVC - › 110 - J/P','','','',0.0000,'0206'),
 ('0206006','Cupla PVC - › 140 - J/P','','','',0.0000,'0206'),
 ('0206007','Cupla PVC - › 160 - J/P','','','',0.0000,'0206'),
 ('0206008','Cupla PVC - › 50 - J/D','','','',0.0000,'0206'),
 ('0206009','Cupla PVC - › 63 - J/D','','','',0.0000,'0206'),
 ('0206010','Cupla PVC - › 75 - J/D','','','',0.0000,'0206'),
 ('0206011','Cupla PVC - › 90 - J/D','','','',0.0000,'0206'),
 ('0206012','Cupla PVC - › 110 - J/D','','','',0.0000,'0206'),
 ('0206013','Cupla PVC - › 140 - J/D','','','',0.0000,'0206'),
 ('0206014','Cupla PVC - › 160 - J/D','','','',0.0000,'0206'),
 ('0206015','Cupla PPN - H H - 1/2','','','',0.0000,''),
 ('0206016','Cupla PPN - H H - 3/4','','','',0.0000,''),
 ('0206017','Cupla PPN - H H - 1','','','',0.0000,''),
 ('0206018','Cupla PPN - H H - 1 1/4','','','',0.0000,''),
 ('0206019','Cupla PPN - H H - 1 1/2','','','',0.0000,''),
 ('0206020','Cupla PPN - H H - 1 3/4','','','',0.0000,''),
 ('0206021','Cupla PPN - H H - 2','','','',0.0000,''),
 ('0206022','Cupla PPN - H H - 2 1/4','','','',0.0000,''),
 ('0206023','Cupla PPN - H H - 2 1/2','','','',0.0000,''),
 ('0206024','Cupla PPN - H H - 2 3/4','','','',0.0000,''),
 ('0206025','Cupla PPN - H H - 3','','','',0.0000,''),
 ('0206026','Cupla Galvanizada H H - 1/2','','','',0.0000,''),
 ('0206027','Cupla Galvanizada - H H - 3/4','','','',0.0000,''),
 ('0206028','Cupla Galvanizada - H H - 1','','','',0.0000,''),
 ('0206029','Cupla Galvanizada - H H - 1 1/4','','','',0.0000,''),
 ('0206030','Cupla Galvanizada - H H - 1 1/2','','','',0.0000,''),
 ('0206031','Cupla Galvanizada - H H - 1 3/4','','','',0.0000,''),
 ('0206032','Cupla Galvanizada - H H - 2','','','',0.0000,''),
 ('0206033','Cupla Galvanizada - H H - 2 1/4','','','',0.0000,''),
 ('0206034','Cupla Galvanizada - H H - 2 1/2','','','',0.0000,''),
 ('0206035','Cupla Galvanizada - H H - 2 3/4','','','',0.0000,''),
 ('0206036','Cupla Galvanizada - H H - 3','','','',0.0000,''),
 ('0207001','Curva 45› - PVC - › 50 - J/D','','','',0.0000,'0207'),
 ('0207002','Curva 45› - PVC - › 63 - J/D','','','',0.0000,'0207'),
 ('0207003','Curva 45› - PVC - › 75 - J/D','','','',0.0000,'0207'),
 ('0207004','Curva 45› - PVC - › 90 - J/D','','','',0.0000,'0207'),
 ('0207005','Curva 45› - PVC - › 110 - J/D','','','',0.0000,'0207'),
 ('0207006','Curva 45› - PVC - › 140 - J/D','','','',0.0000,'0207'),
 ('0207007','Curva 45› - PVC - › 160 - J/D','','','',0.0000,'0207'),
 ('0207008','Curva 45› - PVC - › 50 - J/P','','','',0.0000,'0207'),
 ('0207009','Curva 45› - PVC - › 63 - J/P','','','',0.0000,'0207'),
 ('0207010','Curva 45› - PVC - › 75 - J/P','','','',0.0000,'0207'),
 ('0207011','Curva 45› - PVC - › 90 - J/P','','','',0.0000,'0207'),
 ('0207012','Curva 45› - PVC - › 110 - J/P','','','',0.0000,'0207'),
 ('0207013','Curva 45› - PVC - › 140 - J/P','','','',0.0000,'0207'),
 ('0207014','Curva 45› - PVC - › 160 - J/P','','','',0.0000,'0207'),
 ('0207015','Curva 90› - PVC - › 50 - J/D','','','',0.0000,'0207'),
 ('0207016','Curva 90› - PVC - › 63 - J/D','','','',0.0000,'0207'),
 ('0207017','Curva 90› - PVC - › 75 - J/D','','','',0.0000,'0207'),
 ('0207018','Curva 90› - PVC - › 90 - J/D','','','',0.0000,'0207'),
 ('0207019','Curva 90› - PVC - › 110 - J/D','','','',0.0000,'0207'),
 ('0207020','Curva 90› - PVC - › 140 - J/D','','','',0.0000,'0207'),
 ('0207021','Curva 90› - PVC - › 160 - J/D','','','',0.0000,'0207'),
 ('0207022','Curva 90› - PVC - › 50 - J/P','','','',0.0000,'0207'),
 ('0207023','Curva 90› - PVC - › 63 - J/P','','','',0.0000,'0207'),
 ('0207024','Curva 90› - PVC - › 75 - J/P','','','',0.0000,'0207'),
 ('0207025','Curva 90› - PVC - › 90 - J/P','','','',0.0000,'0207'),
 ('0207026','Curva 90› - PVC - › 110 - J/P','','','',0.0000,'0207'),
 ('0207027','Curva 90› - PVC - › 140 - J/P','','','',0.0000,'0207'),
 ('0207028','Curva 90› - PVC - › 160 - J/P','','','',0.0000,'0207'),
 ('0207029','Curva a 45§ 1/2','ppm','','',0.0000,''),
 ('0207030','Curva  galvanizada  HH  2 1/2','','','',0.0000,''),
 ('0207031','Codo de 1/2','PPM','','',0.0000,''),
 ('0207032','Codo 3/4 PPM','','','',0.0000,'0207'),
 ('0207033','Codo de 1','PPM','','',0.0000,''),
 ('0208001','Llave Esferica -PVC - 1/2','- HH','','',0.0000,''),
 ('0208002','Llave Esferica - PVC - 3/4','- HH','','',0.0000,''),
 ('0208003','Llave Esferica - PVC - 1','- HH','','',0.0000,''),
 ('0208004','Llave Esferica - PVC - 1 1/4','- HH','','',0.0000,''),
 ('0208005','Llave Esferica - PVC - 1 1/2','- HH','','',0.0000,''),
 ('0208006','Llave Esferica - PVC - 1 3/4','- HH','','',0.0000,''),
 ('0208007','Llave Esferica - PVC -   2','- HH','','',0.0000,''),
 ('0208008','Llave Esferica - PVC -   2 1/4','- HH','','',0.0000,''),
 ('0208009','Llave Esferica - PVC -   2 1/2','- HH','','',0.0000,''),
 ('0208010','Llave Esferica - PVC - 2  3/4','- HH','','',0.0000,''),
 ('0208011','Llave Esferica - PVC -  3','- HH','','',0.0000,''),
 ('0208012','Llave Esferica - Racord 17 - T/L 1','','','',0.0000,''),
 ('0208013','Llave Esferica - Racord 20 - T/L 1','','','',0.0000,''),
 ('0208014','Llave esf‚rica  1/2','HH de Bronce','','',0.0000,''),
 ('0208015','V lvula Esclusa - Bronce - 2','- HH','','',0.0000,''),
 ('0208016','V lvula Esclusa - Bronce - 2 1/2','- HH','','',0.0000,''),
 ('0208017','V lvula Esclusa - Bronce - 4','- HH','','',0.0000,''),
 ('0208018','V lvula esf‚rica Polietileno  2 1/2','','','',0.0000,''),
 ('0208019','V lvula de Retenci¢n de Bronce de 3','','','',0.0000,''),
 ('0208020','V lvula  EURO   de 63 mm.','','','',0.0000,'0208'),
 ('0208021','V lvula  EURO   de 110 mm.  J/D.','','','',0.0000,'0208'),
 ('0208022','V lvula  Mariposa  100 - 4','','','',0.0000,''),
 ('0208023','V lvula  Mariposa  150 - 6','','','',0.0000,''),
 ('0209001','Mango Deslizante - PVC - 50','','','',0.0000,'0209'),
 ('0209002','Mango Deslizante - PVC - 63','','','',0.0000,'0209'),
 ('0209003','Mango Deslizante - PVC - 75','','','',0.0000,'0209'),
 ('0209004','Mango Deslizante - PVC - 90','','','',0.0000,'0209'),
 ('0209005','Mango Deslizante - PVC - 110','','','',0.0000,'0209'),
 ('0209006','Mango Deslizante - PVC - 140','','','',0.0000,'0209'),
 ('0209007','Mango Deslizante - PVC - 160','','','',0.0000,'0209'),
 ('0209008','Manguito Roscado - PVC - 50 - J/D','','','',0.0000,'0209'),
 ('0209009','Manguito Roscado - PVC - 63 - J/D','','','',0.0000,'0209'),
 ('0209010','Manguito Roscado - PVC - 75 - J/D','','','',0.0000,'0209'),
 ('0209011','Manguito Roscado - PVC - 90 - J/D','','','',0.0000,'0209'),
 ('0209012','Manguito Roscado - PVC - 110 - J/D','','','',0.0000,'0209'),
 ('0209013','Manguito Roscado - PVC - 140 - J/D','','','',0.0000,'0209'),
 ('0209014','Manguito Roscado - PVC - 160 - J/D','','','',0.0000,'0209'),
 ('0209015','Manguito Roscado J/P 50x2','','','',0.0000,''),
 ('0209016','Manguito Roscado JP 63x 2 1/2','','','',0.0000,''),
 ('0209017','Manguito Roscado J/P 160 x 6','','','',0.0000,''),
 ('0209018','Aro de Goma Diam. 50mm','','','',0.0000,'0209'),
 ('0209019','Aro de Goma para Union de Rep.','','','',0.0000,'0209'),
 ('0210001','Medidor','Clase C','PVC  marca','',0.0000,''),
 ('0210002','Medidor','Clase C','PVC  marca','',0.0000,''),
 ('0210003','Medidor','Clase C','PVC  marca','',0.0000,''),
 ('0210004','Medidor','Clase C','Bronce marca','',0.0000,''),
 ('0210005','Medidor','Clase C','Bronce marca','',0.0000,''),
 ('0210006','Medidor','Clase C','Bronce marca','',0.0000,''),
 ('0210007','Macromedidor','','','',0.0000,'0210'),
 ('0210008','Prolongacion para medidores','','','',0.0000,'0210'),
 ('0210009','Prolongacion para medidores (pl stico)','','','',0.0000,'0210'),
 ('0210010','Tuerca de Bronce x 1','','','',0.0000,''),
 ('0210011','Caja Unificada PVC - P/Medidores','','','',0.0000,'0210'),
 ('0210012','Caja vereda p/ llave Gde.PVC 200x200x180mm','','','',0.0000,'0210'),
 ('0210013','Caja p/ Macromedidor PVC','','','',0.0000,'0210'),
 ('0210014','Tapa Inspeccion Limpieza','','','',0.0000,'0210'),
 ('0210015','Tapa y Marco - F› Gris - 500mm x 600mm','','','',0.0000,'0210'),
 ('0210016','Tapa con Marcos - F› Gris - P/Medidores','','','',0.0000,'0210'),
 ('0211001','Reduccion - PVC - 63x50 - J/D','','','',0.0000,'0211'),
 ('0211002','Reduccion - PVC - 75x63 - J/D','','','',0.0000,'0211'),
 ('0211003','Reduccion - PVC - 90x75 - J/D','','','',0.0000,'0211'),
 ('0211004','Reduccion - PVC - 110x90 - J/D','','','',0.0000,'0211'),
 ('0211005','Reduccion - PVC - 140x110 - J/D','','','',0.0000,'0211'),
 ('0211006','Reduccion - PVC - 160x140 - J/D','','','',0.0000,'0211'),
 ('0211007','Reduccion - PVC - 63x50 - J/P','','','',0.0000,'0211'),
 ('0211008','Reduccion - PVC - 75x63 - J/P','','','',0.0000,'0211'),
 ('0211009','Reduccion - PVC - 90x75 - J/P','','','',0.0000,'0211'),
 ('0211010','Reduccion - PVC - 110x90 - J/P','','','',0.0000,'0211'),
 ('0211011','Reduccion - PVC - 140x110 - J/P','','','',0.0000,'0211'),
 ('0211012','Reduccion - PVC - 160x140 - J/P','','','',0.0000,'0211'),
 ('0211013','Reducci¢n (especial) 75 x 50mm','','','',0.0000,'0211'),
 ('0211014','Reducci¢n (especial) 110   x  75','','','',0.0000,'0211'),
 ('0211015','Reducci¢n (especial) 160 x 110','','','',0.0000,'0211'),
 ('0212001','Tapon Terminal - PVC - › 50','','','',0.0000,'0212'),
 ('0212002','Tapon Terminal - PVC - › 63','','','',0.0000,'0212'),
 ('0212003','Tapon Terminal - PVC - › 75','','','',0.0000,'0212'),
 ('0212004','Tapon Terminal - PVC - › 90','','','',0.0000,'0212'),
 ('0212005','Tapon Terminal - PVC - › 110','','','',0.0000,'0212'),
 ('0212006','Tapon Terminal - PVC - › 140','','','',0.0000,'0212'),
 ('0212007','Tapon Terminal - PVC - › 160','','','',0.0000,'0212'),
 ('0212008','Tap¢n Terminal 1/2','RM PPM','','',0.0000,''),
 ('0212009','TEE 1/2','PPM','','',0.0000,''),
 ('0212010','TEE - PVC - 50 - J/D','','','',0.0000,'0212'),
 ('0212011','TEE - PVC - 63 - J/D','','','',0.0000,'0212'),
 ('0212012','TEE - PVC - 75 - J/D','','','',0.0000,'0212'),
 ('0212013','TEE - PVC - 90 - J/D','','','',0.0000,'0212'),
 ('0212014','TEE - PVC - 110 - J/D','','','',0.0000,'0212'),
 ('0212015','TEE - PVC - 140 - J/D','','','',0.0000,'0212'),
 ('0212016','TEE - PVC - 160 - J/D','','','',0.0000,'0212'),
 ('0212017','TEE - PVC - 50 - J/P','','','',0.0000,'0212'),
 ('0212018','TEE - PVC - 63 - J/P','','','',0.0000,'0212'),
 ('0212019','TEE - PVC - 75 - J/P','','','',0.0000,'0212'),
 ('0212020','TEE - PVC - 90 - J/P','','','',0.0000,'0212'),
 ('0212021','TEE - PVC - 110 - J/P','','','',0.0000,'0212'),
 ('0212022','TEE - PVC - 140 - J/P','','','',0.0000,'0212'),
 ('0212023','TEE - PVC - 160 - J/P','','','',0.0000,'0212'),
 ('0212024','TEE Galvanizada de 3','','','',0.0000,''),
 ('0213001','Union de Reparacion - 1/2 - K 6','','','',0.0000,'0213'),
 ('0213002','Union de Reparacion - 1/2 - K 10','','','',0.0000,'0213'),
 ('0213003','Union de Reparacion - 1/2 - Conica - K6','','','',0.0000,'0213'),
 ('0213004','Union de Reparacion - 1/2 - Conica - K10','','','',0.0000,'0213'),
 ('0213005','Uni¢n de Reparaci¢n 3/4 (Junta Dressel)','','','',0.0000,'0213'),
 ('0213006','Union de Reparacion › 50 x 20','','','',0.0000,'0213'),
 ('0213007','Union de Reparacion › 50 x 30','','','',0.0000,'0213'),
 ('0213008','Union de Reparacion › 50 x 40','','','',0.0000,'0213'),
 ('0213009','Union de Reparacion › 50 x 50','','','',0.0000,'0213'),
 ('0213010','Union de Reparacion › 50 x 60','','','',0.0000,'0213'),
 ('0213011','Union de Reparacion › 50 x 70','','','',0.0000,'0213'),
 ('0213012','Union de Reparacion › 50 x 80','','','',0.0000,'0213'),
 ('0213013','Union de Reparacion › 50 x 90','','','',0.0000,'0213'),
 ('0213014','Union de Reparacion › 50 x 1 mt.','','','',0.0000,'0213'),
 ('0213015','Union de Reparacion › 63 x 20','','','',0.0000,'0213'),
 ('0213016','Union de Reparacion › 63 x 30','','','',0.0000,'0213'),
 ('0213017','Union de Reparacion › 63 x 40','','','',0.0000,'0213'),
 ('0213018','Union de Reparacion › 63 x 50','','','',0.0000,'0213'),
 ('0213019','Union de Reparacion › 63 x 60','','','',0.0000,'0213'),
 ('0213020','Union de Reparacion › 63 x 70','','','',0.0000,'0213'),
 ('0213021','Union de Reparacion › 63 x 80','','','',0.0000,'0213'),
 ('0213022','Union de Reparacion › 63 x 90','','','',0.0000,'0213'),
 ('0213023','Union de Reparacion › 63 x 1 mt.','','','',0.0000,'0213'),
 ('0213024','Union de Reparacion › 75 x 20','','','',0.0000,'0213'),
 ('0213025','Union de Reparacion › 75 x 30','','','',0.0000,'0213'),
 ('0213026','Union de Reparacion › 75 x 40','','','',0.0000,'0213'),
 ('0213027','Union de Reparacion › 75 x 50','','','',0.0000,'0213'),
 ('0213028','Union de Reparacion › 75 x 60','','','',0.0000,'0213'),
 ('0213029','Union de Reparacion › 75 x 70','','','',0.0000,'0213'),
 ('0213030','Union de Reparacion › 75 x 80','','','',0.0000,'0213'),
 ('0213031','Union de Reparacion › 75 x 90','','','',0.0000,'0213'),
 ('0213032','Union de Reparacion › 75 x 1 mt.','','','',0.0000,'0213'),
 ('0213033','Union de Reparacion › 90 x 20','','','',0.0000,'0213'),
 ('0213034','Union de Reparacion › 90 x 30','','','',0.0000,'0213'),
 ('0213035','Union de Reparacion › 90 x 40','','','',0.0000,'0213'),
 ('0213036','Union de Reparacion › 90 x 50','','','',0.0000,'0213'),
 ('0213037','Union de Reparacion › 90 x 60','','','',0.0000,'0213'),
 ('0213038','Union de Reparacion › 90 x 70','','','',0.0000,'0213'),
 ('0213039','Union de Reparacion › 90 x 80','','','',0.0000,'0213'),
 ('0213040','Union de Reparacion › 90 x 90','','','',0.0000,'0213'),
 ('0213041','Union de Reparacion › 90 x 1 mt.','','','',0.0000,'0213'),
 ('0213042','Union de Reparacion ›  110 x 20','','','',0.0000,'0213'),
 ('0213043','Union de Reparacion › 110 x 30','','','',0.0000,'0213'),
 ('0213044','Union de Reparacion › 110 x 40','','','',0.0000,'0213'),
 ('0213045','Union de Reparacion ›  110 c/tensores','','','',0.0000,'0213'),
 ('0213046','Uni¢n de reparaci¢n 140 x 40 cm con tensores','','','',0.0000,'0213'),
 ('0213047','Union Desmontable de 1/2','PPM','','',0.0000,''),
 ('0213048','Union Desmontable 3/4','PPM','','',0.0000,''),
 ('0213049','Union Desmontable 1','PPM','','',0.0000,''),
 ('0213050','Union Desmontable 1 1/4','PPM','','',0.0000,''),
 ('0213051','Union Desmontable 1 1/2','PPM','','',0.0000,''),
 ('0213052','Uni¢n  Desmontable  2','PPM','','',0.0000,''),
 ('0213053','Uni¢n Doble x 2 1/2','PPM','','',0.0000,''),
 ('0214001','Cuerpo de Bomba Rotor Pump  2.5','-4','','',0.0000,''),
 ('0214002','Motor Sumergible Franklin Rotor PUMP','','','',0.0000,'0214'),
 ('0214003','Cable Chato Alimentaci¢n B. 4x2.5mm','','','',0.0000,'0214'),
 ('0214004','Empalme para Cable','','','',0.0000,'0214'),
 ('0214005','Clorinador Mod 015 Milenio (1.45 l/h)','','','',0.0000,'0214'),
 ('0214006','Kit  Cabezal  p/Clorinador','','','',0.0000,'0214'),
 ('0214007','V lvula  de  pi‚   (Filtro Clorinador)','','','',0.0000,'0214'),
 ('0214008','Cinta Peligro  de   8  cm','','','',0.0000,'0214'),
 ('0214009','Hidro Faja - 50','','','',0.0000,'0214'),
 ('0214010','Hidro Faja - 63','','','',0.0000,'0214'),
 ('0214011','Hidro Faja 135 - 145 Ajustable','','','',0.0000,'0214'),
 ('0214012','Adhesivo PVC - 500 grs.','','','',0.0000,'0214'),
 ('0214013','Adhesivo  PVC -  250g','','','',0.0000,'0214'),
 ('0214014','Guarniciones','','','',0.0000,'0214'),
 ('0214015','Guarnici¢n de Nylon','','','',0.0000,'0214'),
 ('0214016','Pasta Lubricante','','','',0.0000,'0214'),
 ('0214017','Teflon - 19 x 50','','','',0.0000,'0214'),
 ('0215001','Monturas  (abrazaderas)  160 a 110  a  45§','','','',0.0000,'0215'),
 ('0215002','Monturas  (abrazaderas)  160 a 110  a  90§','','','',0.0000,'0215'),
 ('0215003','Monturas  (abrazaderas)  200 a 110  a  45§','','','',0.0000,'0215'),
 ('0215004','Monturas  (abrazaderas)  250 a 110  a  45§','','','',0.0000,'0215'),
 ('0215005','Ca¤os  PVC  110 - J/P','','','',0.0000,'0215'),
 ('0215006','Ca¤os  PVC  110 - J/D','','','',0.0000,'0215'),
 ('0215007','Ca¤os  PVC  160 - J/D','','','',0.0000,'0215'),
 ('0215008','Ca¤os  PVC 200 - J/D','','','',0.0000,'0215'),
 ('0215009','Ca¤os  PVC  250 - J/D','','','',0.0000,'0215'),
 ('0215010','Ca¤os  PVC  300 - J/D','','','',0.0000,'0215'),
 ('0215011','Curvas  a  45 § de 110 - J/P','','','',0.0000,'0215'),
 ('0215012','Curvas  a  90 § de 110 - J/P','','','',0.0000,'0215'),
 ('0215013','Curvas  a 45§ de 110 - J/D','','','',0.0000,'0215'),
 ('0215014','Curvas  a 90§ de 110 - J/D','','','',0.0000,'0215'),
 ('0215015','Curvas  a 45§ de 160 - J/D','','','',0.0000,'0215'),
 ('0215016','Curvas  a 90§ de 160 - J/D','','','',0.0000,'0215'),
 ('0215017','Ramal','Y','de  110','',0.0000,''),
 ('0215018','Ramal','Y','de  160','',0.0000,''),
 ('0215019','Cuplas de 110  J/P','','','',0.0000,'0215'),
 ('0215020','Cuplas de 110  J/D','','','',0.0000,'0215'),
 ('0215021','Tapa Terminal  de  110  J/P','','','',0.0000,'0215'),
 ('0215022','Tapa Terminal  de  160  J/P','','','',0.0000,'0215'),
 ('0215023','Tapa con marco H§ F§ para calle','','','',0.0000,'0215'),
 ('0215024','Tapa con marco H§ F§ para vereda','','','',0.0000,'0215'),
 ('0901001','KC 3301 para columna de alumbrado','','','',0.0000,'0901'),
 ('0901002','chica KC 3302  de 80 A 120 mm..','','','',0.0000,'0901'),
 ('0901003','mediana KC  3303  de 120 a 160 mm.','','','',0.0000,'0901'),
 ('0901004','grande  KC 3304  de 160   a  200  mm.','','','',0.0000,'0901'),
 ('0901005','soporte montaje p/fleje Kc3571','','','',0.0000,'0901'),
 ('0901006','fleje acero inoxidable 3/4','','','',0.0000,'0901'),
 ('0901007','hebilla 3/4','','','',0.0000,'0901'),
 ('0902001','extensi¢n para punto 500','','','',0.0000,'0902'),
 ('0902002','extensi¢n recto con pin para punto 500','','','',0.0000,'0902'),
 ('0902003','extensi¢n  sin pin para punto 500','','','',0.0000,'0902'),
 ('0902004','extensi¢n 90ø  largo para punto 500','','','',0.0000,'0902'),
 ('0902005','extensi¢n 90ø mediano para punto 500','','','',0.0000,'0902'),
 ('0902006','extensi¢n 90ø  corto para punto 500','','','',0.0000,'0902'),
 ('0902007','180ø  con pin para punto 500','','','',0.0000,'0902'),
 ('0902008','90ø  con pin para punto 500','','','',0.0000,'0902'),
 ('0903001','domiciliario AD 42114','','','',0.0000,'0903'),
 ('0903002','domiciliario con retorno 30dB','','','',0.0000,'0903'),
 ('0903003','line extender con retorno','','','',0.0000,'0903'),
 ('0903004','Mintroncal  MB','','','',0.0000,'0903'),
 ('0903005','Nodos','','','',0.0000,'0903'),
 ('0903006','Atenuador para Nodo LE/MB','','','',0.0000,'0903'),
 ('0903007','Ecualizador para Nodo LE/MB','','','',0.0000,'0903'),
 ('0903008','Spliter para amplificadores','','','',0.0000,'0903'),
 ('0903009','Duplexores','','','',0.0000,'0903'),
 ('0904001','ojo recto con tuerca 5/8 x 180 KC  6421','','','',0.0000,'0904'),
 ('0904002','ojo recto con tuerca 5/8 x  205KC 6422','','','',0.0000,'0904'),
 ('0904003','ojo recto con tuerca 3/4 x 180 KC 6425','','','',0.0000,'0904'),
 ('0904004','CR CC  5/16 x 1,1/4','','','',0.0000,''),
 ('0904005','CR CC 3/8 x  2','','','',0.0000,''),
 ('0904006','CR  CC 3/8 x 3','','','',0.0000,''),
 ('0904007','CR  CC 3/8 x 3,1/2','','','',0.0000,''),
 ('0904008','CR  CC 3/8 x 2,1/2','','','',0.0000,''),
 ('0904009','CR CC 3/8  x  1,1/4','','','',0.0000,''),
 ('0904010','3 bulones liviano  KC 3560','','','',0.0000,'0904'),
 ('0904011','3 bulones  pesado  KC 3520','','','',0.0000,'0904'),
 ('0904012','3 buolnes reforz. Para rienda 10 a 12 KC 3567','','','',0.0000,'0904'),
 ('0904013','curvo aluminio KC  3568','','','',0.0000,'0904'),
 ('0904014','de suspensi¢n para FO KC  3563','','','',0.0000,'0904'),
 ('0905001','RG 6 con portante','','','',0.0000,'0905'),
 ('0905002','RG 6 sin portante','','','',0.0000,'0905'),
 ('0905003','RG 59 con portante','','','',0.0000,'0905'),
 ('0905004','RG 59 sin portante','','','',0.0000,'0905'),
 ('0905005','Punto 500 con suspensor','','','',0.0000,'0905'),
 ('0905006','UTP  con portante','','','',0.0000,'0905'),
 ('0905007','UTP  sin portante','','','',0.0000,'0905'),
 ('0905008','RG  11 con suspensor','','','',0.0000,'0905'),
 ('0905009','Fibra optica  48 pelos','','','',0.0000,'0905'),
 ('0906001','F a com RG   6','','','',0.0000,'0906'),
 ('0906002','F a com RG  59','','','',0.0000,'0906'),
 ('0906003','F.H  a  F  r pido','','','',0.0000,'0906'),
 ('0906004','F.H.  A  Din','','','',0.0000,'0906'),
 ('0906005','F-M   a  Din-H','','','',0.0000,'0906'),
 ('0906006','F con pollera RG  11','','','',0.0000,'0906'),
 ('0906007','F r pido a  Din H','','','',0.0000,'0906'),
 ('0906008','Codo - Rosca 90ø F M-H','','','',0.0000,'0906'),
 ('0906009','Para punto 500','','','',0.0000,'0906'),
 ('0906010','Para punto 500 con pin','','','',0.0000,'0906'),
 ('0906011','para punto 500  a  F.M.','','','',0.0000,'0906'),
 ('0906012','Ks para punto 500 a F.H','','','',0.0000,'0906'),
 ('0906013','con  pin a FH','','','',0.0000,'0906'),
 ('0906014','para  RG 11 Ks','','','',0.0000,'0906'),
 ('0906015','Ks-Ks para punto 500','','','',0.0000,'0906'),
 ('0906016','Adaptador de punto 500 H a FM','','','',0.0000,'0906'),
 ('0906017','Adaptador de punto 500 H a FH','','','',0.0000,'0906'),
 ('0906018','Adaptador RG 11 cripmear a FM','','','',0.0000,'0906'),
 ('0906019','KS 75 Ohm','','','',0.0000,'0906'),
 ('0906020','F 75 Ohm','','','',0.0000,'0906'),
 ('0906021','F Tramas 75 Ohm','','','',0.0000,'0906'),
 ('0907001','domiciliario  x  2','','','',0.0000,'0907'),
 ('0907002','domiciliario  x  3','','','',0.0000,'0907'),
 ('0907003','domiciliario x  4','','','',0.0000,'0907'),
 ('0907004','domiciliario  x  2','','','',0.0000,'0907'),
 ('0907005','de red x  2 vias   troncales','','','',0.0000,'0907'),
 ('0907006','de red x 3 vias  troncales','','','',0.0000,'0907'),
 ('0907007','de red acoplador 8 dB','','','',0.0000,'0907'),
 ('0907008','de red acoplador 12 dB','','','',0.0000,'0907'),
 ('0907009','de red acoplador 16 dB','','','',0.0000,'0907'),
 ('0907010','power insert','','','',0.0000,'0907'),
 ('0907011','filtros pasa bajos','','','',0.0000,'0907'),
 ('0907012','filtros pasa altos','','','',0.0000,'0907'),
 ('0908001','F H-H','','','',0.0000,'0908'),
 ('0908002','F M-M','','','',0.0000,'0908'),
 ('0908003','Splice . 500','','','',0.0000,'0908'),
 ('0908004','Cierre empalme  FO','','','',0.0000,'0908'),
 ('0909001','clavos  para  RG 6','','','',0.0000,'0909'),
 ('0909002','clavos  para  RG 59','','','',0.0000,'0909'),
 ('0909003','de sujecci¢n simple para  FO KC 3700 pared','','','',0.0000,'0909'),
 ('0909004','de sujecci¢n simple para  FO KC 3701 techo','','','',0.0000,'0909'),
 ('0909005','de sujecci¢n simple para  FO KC 3702 pared','','','',0.0000,'0909'),
 ('0909006','cerco forma U 38 x 6,5 mm.','','','',0.0000,'0909'),
 ('0909007','Omega  de 1/2','','','',0.0000,''),
 ('0909008','prensacable 3/16 KC 5105','','','',0.0000,'0909'),
 ('0909009','prensacable  1/4  KC  5106','','','',0.0000,'0909'),
 ('0909010','prensacable   5/16 KC  5108','','','',0.0000,'0909'),
 ('0910001','cobreada 3/8 x 1000  KC 7110','','','',0.0000,'0910'),
 ('0910002','cobreada 3/8 x 1500  KC 7111','','','',0.0000,'0910'),
 ('0910003','cobreada  1/2  x 1500  KC 7121','','','',0.0000,'0910'),
 ('0910004','cobreada 1/2 x 2000  KC 7122','','','',0.0000,'0910'),
 ('0910005','cobreada 5/8 x 2500  KC 7133','','','',0.0000,'0910'),
 ('0910006','cobreada 5/8 x 3000  KC 7134','','','',0.0000,'0910'),
 ('0910007','para jabalina 3/8 KC 7150','','','',0.0000,'0910'),
 ('0910008','para jabalina 1/2 KC 7151','','','',0.0000,'0910'),
 ('0910009','para jabalina 5/8 KC  7152','','','',0.0000,'0910'),
 ('0910010','para jabalina  3/4  KC 7153','','','',0.0000,'0910'),
 ('0910011','cobreado  3 mm. KC 7160','','','',0.0000,'0910'),
 ('0911001','EOC','','','',0.0000,'0911'),
 ('0911002','Cablemodem','','','',0.0000,'0911');
INSERT INTO `articulos` (`articulo`,`detalle`,`unidad`,`abrevia`,`codbarra`,`costo`,`linea`) VALUES 
 ('0912001','Rienda de acero 3 mm KC 3410','','','',0.0000,'0912'),
 ('0912002','Rienda de acero 3 mm KC 3411','','','',0.0000,'0912'),
 ('0912003','Rienda de acero 4,8 mm KC 3412','','','',0.0000,'0912'),
 ('0912004','Rienda de acero  6mm KC 3413','','','',0.0000,'0912'),
 ('0912005','Rienda de acero 8  mm KC 3414','','','',0.0000,'0912'),
 ('0912006','Rienda de acero forrada en PVC 3 mm. KC 3450','','','',0.0000,'0912'),
 ('0912007','Rienda de acero forrada en PVC 4 mm. KC 3451','','','',0.0000,'0912'),
 ('0912008','Rienda de acero forrada en PVC 6 mm. KC 3453','','','',0.0000,'0912'),
 ('0912009','Rienda de acero forrada en PVC 8 mm. KC 3454','','','',0.0000,'0912'),
 ('0912010','Torniquete N§ 5  KC 3401','','','',0.0000,'0912'),
 ('0912011','Torniquete N§ 7  KC 3403','','','',0.0000,'0912'),
 ('0912012','Torniquete doble  KC 3405','','','',0.0000,'0912'),
 ('0912013','Proteccion para cable tipo U KC 3319','','','',0.0000,'0912'),
 ('0912014','Proteccion para cable tipo U KC 3320','','','',0.0000,'0912'),
 ('0913001','32  dB x 4 vias','','','',0.0000,'0913'),
 ('0913002','29  dB x 4 vias','','','',0.0000,'0913'),
 ('0913003','26  dB x 4 vias','','','',0.0000,'0913'),
 ('0913004','23  dB x 4 vias','','','',0.0000,'0913'),
 ('0913005','20  dB x 4 vias','','','',0.0000,'0913'),
 ('0913006','17  dB x 4 vias','','','',0.0000,'0913'),
 ('0913007','14  dB x 4 vias','','','',0.0000,'0913'),
 ('0913008','11  dB x 4 vias','','','',0.0000,'0913'),
 ('0913009','8  dB x 4 vias','','','',0.0000,'0913'),
 ('0913010','32  dB x 8 vias','','','',0.0000,'0913'),
 ('0913011','29  dB x8 vias','','','',0.0000,'0913'),
 ('0913012','26  dB x 8 vias','','','',0.0000,'0913'),
 ('0913013','23  dB x 8 vias','','','',0.0000,'0913'),
 ('0913014','20  dB x 8 vias','','','',0.0000,'0913'),
 ('0913015','17  dB x 8 vias','','','',0.0000,'0913'),
 ('0913016','14  dB x 8 vias','','','',0.0000,'0913'),
 ('0913017','11  dB x 8 vias','','','',0.0000,'0913'),
 ('0913018','Brackett KC 3556','','','',0.0000,'0913');
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;


--
-- Definition of table `articulosf`
--

DROP TABLE IF EXISTS `articulosf`;
CREATE TABLE `articulosf` (
  `articulo` char(50) NOT NULL,
  `base` float(13,2) NOT NULL,
  `unidadf` char(50) NOT NULL,
  `idartf` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idartf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `articulosf`
--

/*!40000 ALTER TABLE `articulosf` DISABLE KEYS */;
INSERT INTO `articulosf` (`articulo`,`base`,`unidadf`,`idartf`) VALUES 
 ('0000000001',12.00,'PACK',1),
 ('0000000002',10.00,'CAJA',2),
 ('0000000003',6.00,'PACK',3),
 ('0101001',2.50,'UNIDADES',4),
 ('0215017',0.00,'',5),
 ('0101002',1.00,'metros',101002),
 ('0203004',0.00,'',203004),
 ('0207031',0.00,'',207031),
 ('0215018',0.00,'',207032),
 ('0102011',6.00,'unidades',207033);
/*!40000 ALTER TABLE `articulosf` ENABLE KEYS */;


--
-- Definition of table `articulosimg`
--

DROP TABLE IF EXISTS `articulosimg`;
CREATE TABLE `articulosimg` (
  `idartimg` int(10) unsigned NOT NULL,
  `articulo` char(50) NOT NULL,
  `archivoimg` char(150) NOT NULL,
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
  `idartimp` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idartimp`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `articulosimp`
--

/*!40000 ALTER TABLE `articulosimp` DISABLE KEYS */;
INSERT INTO `articulosimp` (`articulo`,`impuesto`,`idartimp`) VALUES 
 ('0101001',1,1),
 ('0101002',1,2);
/*!40000 ALTER TABLE `articulosimp` ENABLE KEYS */;


--
-- Definition of table `articulospro`
--

DROP TABLE IF EXISTS `articulospro`;
CREATE TABLE `articulospro` (
  `idartpro` int(10) unsigned NOT NULL,
  `articulo` char(50) NOT NULL,
  `entidad` int(10) unsigned NOT NULL,
  `codigop` char(50) NOT NULL,
  PRIMARY KEY (`idartpro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `articulospro`
--

/*!40000 ALTER TABLE `articulospro` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulospro` ENABLE KEYS */;


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
  `puntov` char(4) NOT NULL,
  `maxnumero` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `compactiv`
--

/*!40000 ALTER TABLE `compactiv` DISABLE KEYS */;
INSERT INTO `compactiv` (`idnumera`,`puntov`,`maxnumero`) VALUES 
 (1,'0',3),
 (1,'0001',3),
 (2,'0',2),
 (2,'0002',2),
 (3,'0001',2),
 (3,'0',2);
/*!40000 ALTER TABLE `compactiv` ENABLE KEYS */;


--
-- Definition of table `compiservi`
--

DROP TABLE IF EXISTS `compiservi`;
CREATE TABLE `compiservi` (
  `idcomproba` int(10) unsigned NOT NULL,
  `servicio` int(10) unsigned NOT NULL
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
INSERT INTO `comprobantes` (`idcomproba`,`comprobante`,`idnumera`,`idtipocom`,`tipo`,`ctacte`) VALUES 
 (1,'FACTURA',1,1,'A','S'),
 (2,'NOTA DE PEDIDO',2,2,'X','N'),
 (3,'AJUSTE DE STOCK',3,4,'X','N');
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
  `idconcepto` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `conceptoimpu`
--

/*!40000 ALTER TABLE `conceptoimpu` DISABLE KEYS */;
INSERT INTO `conceptoimpu` (`impuesto`,`idconcepto`) VALUES 
 (1,1);
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
INSERT INTO `conceptoser` (`idconcepto`,`servicio`,`concepto`,`detalle`,`abrevia`,`cantidad`,`importe`,`unidad`,`facturar`,`cuotasfact`,`cantcuotas`,`funcion`,`vigedesde`,`vigehasta`,`vigencia`,`padron`,`compuesto`) VALUES 
 (1,2,'FM','FM','FMX',1.0000,100.0000,'unidades','S',0,0,'','20160903','20160903','1',9,'N');
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
INSERT INTO `condfiscal` (`idcondfis`,`detalle`) VALUES 
 (1,'RESPONSABLE INSCRIPTO'),
 (2,'RESPONSABLE MONOTRIBUTISTA');
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
INSERT INTO `depositos` (`deposito`,`detalle`,`direccion`) VALUES 
 (1,'DEPOSITO 1','1° DE MAYO 2642'),
 (2,'DEPOSITO 2','SAN JERONIMO 6535');
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
  `localidad` char(10) NOT NULL,
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
 ('TRSoftIT Tulio Rossi','Tulio Rossi','20-22141497-8','IVA Responsable Inscripto','EXENTO','Avellaneda 6737','3','20160101','342-4693586 - Cel 342-15-5456398','trossi@cosemar.com.ar','www.cosemar.com.ar','ASDA');
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
  `localidad` char(10) NOT NULL,
  `iva` int(10) unsigned NOT NULL,
  `fechaalta` char(8) NOT NULL,
  `telefono` char(50) NOT NULL,
  `cp` char(50) NOT NULL,
  `fax` char(50) NOT NULL,
  `email` char(254) NOT NULL,
  `web` char(254) NOT NULL,
  `dni` int(10) unsigned NOT NULL,
  `tipodoc` char(3) NOT NULL DEFAULT '0',
  `fechanac` char(8) NOT NULL,
  PRIMARY KEY (`entidad`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entidades`
--

/*!40000 ALTER TABLE `entidades` DISABLE KEYS */;
INSERT INTO `entidades` (`entidad`,`apellido`,`nombre`,`cargo`,`compania`,`cuit`,`direccion`,`localidad`,`iva`,`fechaalta`,`telefono`,`cp`,`fax`,`email`,`web`,`dni`,`tipodoc`,`fechanac`) VALUES 
 (1,'ROSSI','TULIO','Sistemas','','20221414978','Avellaneda 6737','3',2,'20150110','4693586','3000','4693586','trossi@cosemar.com.ar','www.cosemar.com.ar',22141497,'1','19711110'),
 (2,'Racca','Gaston Ramon Alberto','Encargado de Produccion','ALSAFEX S.A.','30712443347','Ruta 11 Km 486','4',1,'','342-4191679','6556','','gracca@alsafex.com.ar','www.alsafex.com.ar',0,'1',''),
 (3,'OLIVIERO','GERMAN','','','22232','PEDRO CENTENO','3',1,'','AAAAAD','3000','DSF','','',2121,'1','');
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
  `sector` char(100) NOT NULL,
  `direccion` char(100) NOT NULL,
  `localidad` char(50) NOT NULL,
  `fechaalta` char(8) NOT NULL,
  `telefono` char(50) NOT NULL,
  `cp` char(50) NOT NULL,
  `fax` char(50) NOT NULL,
  `email` char(254) NOT NULL,
  `dni` int(10) unsigned NOT NULL,
  `tipodoc` char(3) NOT NULL,
  `fechanac` char(8) NOT NULL,
  `cuit` char(13) NOT NULL,
  PRIMARY KEY (`idcontacto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entidadesc`
--

/*!40000 ALTER TABLE `entidadesc` DISABLE KEYS */;
INSERT INTO `entidadesc` (`idcontacto`,`entidad`,`apellido`,`nombre`,`cargo`,`sector`,`direccion`,`localidad`,`fechaalta`,`telefono`,`cp`,`fax`,`email`,`dni`,`tipodoc`,`fechanac`,`cuit`) VALUES 
 (1,1,'DDDDDDDDD','BBBBB','HHHHHHHHH','KKKKKKKK','Avellaneda 6737','1','20150110','66666666','3056','7777777','trossi@cosemar.com.ar',525,'1','20160101','CCCCCCC'),
 (2,1,'Freddy','Rossi','Profesor','Escolar','Alvear','3','20160705','34343445545','3000','','freddyrossi@yahoo.com.ar',0,'1','19730215','33333333');
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
  `identidacr` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`identidacr`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entidadescr`
--

/*!40000 ALTER TABLE `entidadescr` DISABLE KEYS */;
INSERT INTO `entidadescr` (`entidad`,`fecha`,`importe`,`autorizo`,`identidacr`) VALUES 
 (1,'20160703',10000.0000,'TULIO',1),
 (2,'20160703',5000.0000,'TULIO',3),
 (1,'20160705',-100.0000,'TULIO',4),
 (3,'20160705',10000.0000,'TULIO',5),
 (3,'20160705',-5000.0000,'TULIO',6),
 (1,'20160705',-8000.0000,'TULIO',7);
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
  `funcion` char(100) DEFAULT NULL,
  `identidadh` int(10) unsigned NOT NULL,
  `identidadd` int(10) unsigned NOT NULL,
  `mensual` char(1) NOT NULL,
  `facturar` char(1) NOT NULL,
  `codigocta` char(20) NOT NULL,
  `padron` int(10) unsigned NOT NULL,
  `cantidad` float(13,2) NOT NULL,
  PRIMARY KEY (`identidadd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entidadesd`
--

/*!40000 ALTER TABLE `entidadesd` DISABLE KEYS */;
INSERT INTO `entidadesd` (`entidad`,`servicio`,`cuenta`,`idconcepto`,`cuotasfact`,`nrocuotas`,`articulo`,`detalle`,`abreviado`,`unitario`,`neto`,`impuesto`,`total`,`unidad`,`funcion`,`identidadh`,`identidadd`,`mensual`,`facturar`,`codigocta`,`padron`,`cantidad`) VALUES 
 (1,3,1,0,0,3,'0101001','Alambre de bajada c/autop.2 x 0.61','alambre de bajada',101.00,101.00,31.82,132.82,'unidades','',3,1,'N','S','0',0,1.00);
/*!40000 ALTER TABLE `entidadesd` ENABLE KEYS */;


--
-- Definition of table `entidadesdc`
--

DROP TABLE IF EXISTS `entidadesdc`;
CREATE TABLE `entidadesdc` (
  `idcuotasd` int(10) unsigned NOT NULL,
  `identidadd` int(10) unsigned NOT NULL,
  `nrocuota` int(10) unsigned NOT NULL,
  `fechavenc` char(8) NOT NULL,
  `neto` float(13,4) NOT NULL,
  `iva` float(13,4) NOT NULL,
  `cantcuotas` int(10) unsigned NOT NULL,
  `mes` int(10) unsigned NOT NULL,
  `anio` int(10) unsigned NOT NULL,
  `idfactura` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entidadesdc`
--

/*!40000 ALTER TABLE `entidadesdc` DISABLE KEYS */;
INSERT INTO `entidadesdc` (`idcuotasd`,`identidadd`,`nrocuota`,`fechavenc`,`neto`,`iva`,`cantcuotas`,`mes`,`anio`,`idfactura`) VALUES 
 (1,1,1,'20170201',44.2700,9.3000,3,2,2017,0),
 (2,1,2,'20170301',44.2700,9.3000,3,3,2017,0),
 (3,1,3,'20170401',44.2700,9.3000,3,4,2017,0),
 (4,2,1,'20170310',24.4400,5.1300,5,3,2017,0),
 (5,2,2,'20170410',24.4400,5.1300,5,4,2017,0),
 (6,2,3,'20170510',24.4400,5.1300,5,5,2017,0),
 (7,2,4,'20170610',24.4400,5.1300,5,6,2017,0),
 (8,2,5,'20170710',24.4400,5.1300,5,7,2017,0);
/*!40000 ALTER TABLE `entidadesdc` ENABLE KEYS */;


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
  `localidad` char(10) NOT NULL,
  `iva` int(10) unsigned NOT NULL,
  `fechaalta` char(8) NOT NULL,
  `telefono` char(100) NOT NULL,
  `cp` char(50) NOT NULL,
  `fax` char(50) NOT NULL,
  `email` char(254) NOT NULL,
  `dni` int(10) unsigned NOT NULL,
  `tipodoc` char(3) NOT NULL,
  `fechanac` char(8) NOT NULL,
  `ruta1` int(10) unsigned NOT NULL,
  `folio1` int(10) unsigned NOT NULL,
  `ruta2` int(10) unsigned NOT NULL,
  `folio2` int(10) unsigned NOT NULL,
  `identidadh` int(10) unsigned NOT NULL,
  PRIMARY KEY (`identidadh`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entidadesh`
--

/*!40000 ALTER TABLE `entidadesh` DISABLE KEYS */;
INSERT INTO `entidadesh` (`entidad`,`servicio`,`cuenta`,`apellido`,`nombre`,`cargo`,`compania`,`cuit`,`direccion`,`localidad`,`iva`,`fechaalta`,`telefono`,`cp`,`fax`,`email`,`dni`,`tipodoc`,`fechanac`,`ruta1`,`folio1`,`ruta2`,`folio2`,`identidadh`) VALUES 
 (2,2,1,'Racca','Gaston Ramon Alberto','Encargado de Produccion','ALSAFEX S.A.','30712443347','Ruta 11 Km 486','4',1,'20160707','342-4191679','6556','','gracca@alsafex.com.ar',451515,'1','20160707',0,0,0,0,1),
 (1,2,1,'ROSSI','TULIO','Sistemas','TRSOFT IT','20221414978','Avellaneda 6737','3',2,'20160707','4693586','3000','4693586','trossi@cosemar.com.ar',22141497,'1','20160707',0,0,0,0,2),
 (1,3,1,'ROSSI','TULIO','Sistemas','','20221414978','Avellaneda 6737','3',2,'20160707','4693586','3000','4693586','trossi@cosemar.com.ar',22141497,'1','20160707',0,0,0,0,3),
 (1,3,2,'OLIVIERO','GERMAN','Sistemas','','20221414978','Avellaneda 6737','3',2,'20160707','4693586','3000','4693586','trossi@cosemar.com.ar',22141497,'1','20160707',0,0,0,0,4);
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
  `puntov` char(4) NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `tipo` char(1) NOT NULL,
  `impuesto` int(10) unsigned NOT NULL,
  `detalle` char(254) NOT NULL,
  `neto` float(13,4) NOT NULL,
  `razon` float(13,4) NOT NULL,
  `importe` float(13,4) NOT NULL
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
-- Definition of table `formicompro`
--

DROP TABLE IF EXISTS `formicompro`;
CREATE TABLE `formicompro` (
  `idform` int(10) unsigned NOT NULL,
  `detalle` char(254) NOT NULL,
  `idcomproba` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `formicompro`
--

/*!40000 ALTER TABLE `formicompro` DISABLE KEYS */;
/*!40000 ALTER TABLE `formicompro` ENABLE KEYS */;


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
  `entidad` int(10) unsigned NOT NULL,
  `servicio` int(10) unsigned NOT NULL,
  `cuenta` int(10) unsigned NOT NULL,
  `dni` int(10) unsigned NOT NULL,
  `tipodoc` char(3) NOT NULL,
  `apellido` char(100) NOT NULL,
  `nombre` char(100) NOT NULL,
  `fechanac` char(8) NOT NULL,
  `parentesco` char(100) NOT NULL,
  `fechaalta` char(8) NOT NULL,
  `fechabaja` char(8) NOT NULL,
  `diasvigen` int(10) unsigned NOT NULL DEFAULT '0',
  `sexo` char(1) NOT NULL,
  `identidadh` int(10) unsigned NOT NULL,
  `idgruposep` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`idgruposep`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gruposepelio`
--

/*!40000 ALTER TABLE `gruposepelio` DISABLE KEYS */;
INSERT INTO `gruposepelio` (`entidad`,`servicio`,`cuenta`,`dni`,`tipodoc`,`apellido`,`nombre`,`fechanac`,`parentesco`,`fechaalta`,`fechabaja`,`diasvigen`,`sexo`,`identidadh`,`idgruposep`) VALUES 
 (1,3,1,38374141,'1','CARRION','FEDERICO','19940713','AMIGO','20170125','20170125',0,'M',3,1);
/*!40000 ALTER TABLE `gruposepelio` ENABLE KEYS */;


--
-- Definition of table `impuestos`
--

DROP TABLE IF EXISTS `impuestos`;
CREATE TABLE `impuestos` (
  `impuesto` int(10) unsigned NOT NULL,
  `detalle` char(254) NOT NULL,
  `razon` float(13,2) NOT NULL,
  `formula` char(150) DEFAULT NULL,
  `abrevia` char(150) NOT NULL,
  `baseimpon` float(13,2) NOT NULL,
  `cantidad` float(13,2) NOT NULL,
  PRIMARY KEY (`impuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `impuestos`
--

/*!40000 ALTER TABLE `impuestos` DISABLE KEYS */;
INSERT INTO `impuestos` (`impuesto`,`detalle`,`razon`,`formula`,`abrevia`,`baseimpon`,`cantidad`) VALUES 
 (1,'IVA 21%',21.00,'','IVA',500.00,1.00),
 (2,'IVA 10.5%',10.50,'','IVA',1000.00,1.00),
 (3,'DESCUENTO POR PAGO EN TERMINO',10.00,'TOTAL * 10%','DESCUENTO',0.00,1.00);
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
INSERT INTO `lineas` (`linea`,`detalle`,`codigoctac`,`codigoctav`) VALUES 
 ('0101','ALAMBRE Y CABLES','',''),
 ('0102','BULONES','',''),
 ('0103','CAJA Y CAÑOS','',''),
 ('0104','FICHAS','',''),
 ('0105','MORSETERIA','',''),
 ('0106','POSTES Y ANCLAJES','',''),
 ('0109','REPUESTOS','',''),
 ('0110','MATERIALES PARA VENTAS','',''),
 ('0201','ABRAZADERAS','',''),
 ('0202','ADAPTADORES','',''),
 ('0203','BRIDAS','',''),
 ('0204','BUJES','',''),
 ('0205','CAÑOS','',''),
 ('0206','CUPLAS','',''),
 ('0207','CURVAS','',''),
 ('0208','LLAVES','',''),
 ('0209','MANGOS','',''),
 ('0210','MEDIDORES, ACCESORIOS Y CAJAS','',''),
 ('0211','REDUCCIONES','',''),
 ('0212','TAPONES Y TEE','',''),
 ('0213','UNIONES DE REPARACION','',''),
 ('0214','VARIOS','',''),
 ('0215','MATERIALES PARA CLOACAS','',''),
 ('0901','ABRAZADERAS','',''),
 ('0902','ADAPTADORES','',''),
 ('0903','AMPLIFICADORES','',''),
 ('0904','BULONES - MORSETOS -','',''),
 ('0905','CABLES','',''),
 ('0906','CONECTORES','',''),
 ('0907','DIVISORES','',''),
 ('0908','EMPALMES','',''),
 ('0909','GRAMPAS','',''),
 ('0910','JABALINAS','',''),
 ('0911','MODEMS','',''),
 ('0912','RIENDAS, TORNIQUETES Y ANCLAS','',''),
 ('0913','TAPS','','');
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
 ('3','Santa Fe','3000','1'),
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
  `imagen` char(50) NOT NULL DEFAULT '""',
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
INSERT INTO `menusql` (`idmenu`,`idmenup`,`nivel`,`codigo`,`descrip`,`arranque`,`comando`,`opcion`,`prun`,`pusu`,`habilitado`,`orden`,`usuario`,`fechahora`,`idmodulo`,`imagen`) VALUES 
 (1,0,'P','01000000000000','Archivos','','','','N','N','S','01','admin','2012092919:33:00',1,''),
 (2,1,'H','01010000000000','Cambiar Empresa','','DO FORM login','0','S','S','S','01','admin','2016062509:55:42',1,'GANANCIAS SOCIEDADES.ICO'),
 (4,0,'P','02000000000000','Otros','','','','N','N','S','03','admin','2016012712:50:15',1,''),
 (6,1,'H','01090000000000','Localidades','','DO FORM localidadesabm','2','S','S','S','01','admin','2016062510:46:30',1,''),
 (7,1,'H','01120000000000','Monedas','','DO FORM monedasabm','3','S','S','S','01','admin','2016062510:02:38',1,'ORDERS.ICO'),
 (8,1,'H','01080000000000','Zonas','','DO FORM zonasabm','4','S','S','S','01','admin','2016012718:14:42',1,''),
 (9,1,'H','01070000000000','Vendedores','','DO FORM vendedoresabm','5','S','S','S','01','admin','2016062510:00:14',1,'EMPLY.ICO'),
 (10,0,'P','03000000000000','Contabilidad','','','','N','N','S','04','admin','2016030610:36:53',1,''),
 (12,1,'H','01310000000000','\\-','','','','N','N','S','05','admin','2016030610:51:06',1,''),
 (13,1,'H','01320000000000','Salir                               Alt+F4','','SALIRMENU()','','S','S','S','01','admin','2016062420:45:28',1,'CERRAR.PNG'),
 (14,0,'P','04000000000000','Ayuda','','','','N','N','S','05','admin','2016030612:09:53',1,''),
 (15,14,'H','04010000000000','Info.Sistema...','','DO FORM infosistema','','S','S','S','05','admin','2016030612:10:47',1,''),
 (16,1,'H','01110000000000','Paises','','DO FORM paisesabm','6','S','S','S','01','admin','2016012713:14:18',1,''),
 (17,1,'H','01290000000000','Iconos','','DO FORM iconosabm','7','S','S','S','01','admin','2016062510:05:54',1,'FACE03.ICO'),
 (18,1,'H','01270000000000','Biblioteca de Función','','DO FORM bibliotecafabm','8','S','S','S','01','admin','2016052021:15:00',1,''),
 (19,1,'H','01040000000000','Sucursales','','DO FORM sucursalesabm','9','S','S','S','01','admin','2016052115:24:00',1,''),
 (20,1,'H','01280000000000','Modulos del Sistema','','DO FORM modulossysabm','10','S','S','S','01','admin','2016052116:38:00',1,''),
 (21,1,'H','01030000000000','Empresas','','DO FORM empresasabm','11','S','S','S','01','admin','2016052721:55:00',1,''),
 (22,1,'H','01150000000000','Condiciones Fiscales','','DO FORM condfiscalabm','12','S','S','S','01','admin','2016052809:43:00',1,''),
 (23,1,'H','01140000000000','Impuestos','','DO FORM impuestosabm','13','S','S','S','01','admin','2016052811:52:00',1,''),
 (24,1,'H','01130000000000','Servicios','','DO FORM serviciosabm2','14','S','S','S','01','admin','2016052817:17:00',1,''),
 (25,1,'H','01220000000000','Lineas','','DO FORM lineasabm','15','S','S','S','01','admin','2016061117:14:00',1,''),
 (26,1,'H','01100000000000','Provincias','','DO FORM provinciasabm','','S','S','S','01','admin','2016062510:51:36',1,''),
 (27,1,'H','01050000000000','\\-','','','','S','S','S','01','admin','2016062510:58:52',1,''),
 (28,1,'H','01260000000000','\\-','','','','S','S','S','01','admin','2016062511:00:16',1,''),
 (29,1,'H','01300000000000','Seteo ToolBar Sys','','DO FORM toolbarsysabm','','S','S','S','01','admin','2016062601:40:20',1,''),
 (30,1,'H','01060000000000','Clientes-Proveedores','','DO FORM entidades','','S','S','S','01','admin','2016062900:05:11',1,'EMPLY.ICO'),
 (31,1,'H','01200000000000','Artículos','','DO FORM articulos','','S','S','S','01','admin','2016070212:00:11',1,'WZPRINT.BMP'),
 (32,1,'H','01160000000000','\\-','','','','S','S','S','01','admin','2016070212:01:40',1,''),
 (33,10,'H','03010000000000','Freddy Rossi','','DO FORM entidades','','S','S','S','04','admin','2016070219:09:22',1,'FACE03.ICO'),
 (34,1,'H','01180000000000','Depositos','','DO FORM depositos','','S','S','S','01','admin','2016071614:21:33',1,''),
 (35,1,'H','01170000000000','Conceptos','','DO FORM conceptoser','','S','S','S','01','admin','2016071816:17:25',1,''),
 (36,1,'H','01240000000000','Tipos de Movimientos de Stock','','DO FORM tipomstock','','S','S','S','01','admin','2016072021:19:29',1,''),
 (37,1,'H','01190000000000','Puntos de Venta','','DO FORM puntosventa','','S','S','S','01','admin','2016110509:59:05',1,''),
 (38,1,'H','01250000000000','Tipos de Comprobantes','','DO FORM tipocompro','','S','S','S','01','admin','2016122113:56:00',1,''),
 (39,1,'H','01210000000000','Comprobantes','','DO FORM comprobantes','','S','S','S','01','admin','2017010910:29:43',1,''),
 (40,1,'H','01230000000000','Ajuste de Stock','','DO FORM ajustestockp WITH \"0\"','','S','S','S','01','admin','2017020221:53:08',1,'');
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
  `puntov` char(4) NOT NULL,
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
  `nombre` char(254) NOT NULL,
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
  `puntov` char(4) NOT NULL,
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
  PRIMARY KEY (`idot`)
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
  `otintori` int(10) unsigned NOT NULL,
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
 ('2','BRASIL'),
 ('3','URUGUAY'),
 ('4','PARAGUAY');
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
 (1,15,'S'),
 (1,16,'S'),
 (1,17,'S'),
 (1,18,'S'),
 (1,19,'S'),
 (1,20,'S'),
 (1,21,'S'),
 (1,22,'S'),
 (1,23,'S'),
 (1,24,'S'),
 (1,25,'S'),
 (1,26,'S'),
 (1,27,'S'),
 (1,28,'S'),
 (1,29,'S'),
 (1,30,'S'),
 (1,31,'S'),
 (1,32,'S'),
 (1,33,'S'),
 (1,34,'S'),
 (1,35,'S'),
 (1,36,'S'),
 (1,37,'S'),
 (1,38,'S'),
 (1,39,'S'),
 (1,40,'S');
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
INSERT INTO `puntosventa` (`pventa`,`detalle`,`puntov`,`habilitado`,`fechaini`,`fechabaja`) VALUES 
 (1,'CASA CENTRAL','0001','1','20170202',''),
 (2,'SUCURSAL CALCHAQUI','0002','1','20170202',''),
 (3,'PUNTO DE VENTA PARA ID','0','1','','');
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
INSERT INTO `servicios` (`servicio`,`detalle`,`fechaalta`,`diasvenc2`,`diasvenc3`,`diasdescon`) VALUES 
 (2,'RADIO FM 93.5','20160511',10,2,13),
 (3,'SEPELIO','20161112',10,15,20);
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
INSERT INTO `serviciosimpu` (`impuesto`,`servicio`) VALUES 
 (2,2);
/*!40000 ALTER TABLE `serviciosimpu` ENABLE KEYS */;


--
-- Definition of table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `deposito` int(10) unsigned NOT NULL,
  `articulo` char(50) NOT NULL,
  `stock` float(13,2) NOT NULL
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
INSERT INTO `sucursales` (`sucursal`,`detalle`) VALUES 
 (1,'SUCURSAL 1'),
 (2,'SUCURSAL 2'),
 (3,'SUCURSAL 3');
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
  `opera` int(11) NOT NULL,
  `abrevia` char(50) NOT NULL,
  `destino` char(1) NOT NULL,
  `editable` char(1) NOT NULL,
  PRIMARY KEY (`idtipocom`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipocompro`
--

/*!40000 ALTER TABLE `tipocompro` DISABLE KEYS */;
INSERT INTO `tipocompro` (`idtipocom`,`detalle`,`opera`,`abrevia`,`destino`,`editable`) VALUES 
 (1,'FACTURA',1,'FACTURA','S','N'),
 (2,'NOTA DE PEDIDO',-1,'NOTA DE PEDIDO','F','S'),
 (3,'ID AJUSTE DE STOCK',0,'AJUSTE DE STOCK','S','N'),
 (4,'AJUSTE DE STOCK',0,'STOCK','S','N');
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
-- Definition of table `tipodocumento`
--

DROP TABLE IF EXISTS `tipodocumento`;
CREATE TABLE `tipodocumento` (
  `tipodoc` char(3) NOT NULL,
  `tipo` char(3) NOT NULL,
  PRIMARY KEY (`tipodoc`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipodocumento`
--

/*!40000 ALTER TABLE `tipodocumento` DISABLE KEYS */;
INSERT INTO `tipodocumento` (`tipodoc`,`tipo`) VALUES 
 ('1','DNI'),
 ('2','CN');
/*!40000 ALTER TABLE `tipodocumento` ENABLE KEYS */;


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
INSERT INTO `tipomstock` (`idtipomov`,`descmov`,`ie`,`reporte`,`generaeti`) VALUES 
 (1,'ENTREGA MATERIALES POR PEDIDO DE CLIENTE','E','NOTA DE ENTREGA','N'),
 (2,'INGRESO DE ARTICULOS AL STOCK POR COMPRA DE MERCADERIA','I','REMITO PROVEEDORES','S');
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
-- Definition of table `tipoot`
--

DROP TABLE IF EXISTS `tipoot`;
CREATE TABLE `tipoot` (
  `idtipoot` int(10) unsigned NOT NULL,
  `descot` char(254) NOT NULL,
  PRIMARY KEY (`idtipoot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipoot`
--

/*!40000 ALTER TABLE `tipoot` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoot` ENABLE KEYS */;


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
 (1,'Federico Carrion','Ricardo Gutierrez 1962','1','38374141','3483485750','fedecarrion137@gmail.com','2'),
 (2,'Tulio Rossi','Avellaneda 6963','3','25826321','3424376983','tulior@cosemar.com','1'),
 (3,'Javier','Pampa 232','1','35555666','3483485751','javi@gmail.com','2'),
 (4,'ROXANA','1 DE MAYO','4','3692815','498389','roxy@gmail.com','1'),
 (7,'CLAUDIO','25 DE MAYO','5','1231333','12312','ASDA','1'),
 (8,'AAAAAAA','AAAAAAAAAA','1','22141491','ASSSA','DSD','1');
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
 (8,'localhost','trsoftdb','{MySQL ODBC 3.51 Driver}','localhost','3306','root','Wfq27fede38374141','','8454016','S',0,0,' ');
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
 (5,'nuevo','nuevo.png','Nuevo','F3'),
 (6,'cancelar','cancelar.png','Cancelar',''),
 (7,'actualizar','actualizar.png','Actualizar',''),
 (8,'credito','peso.png','Crédito',''),
 (9,'empleado','empleado.png','Empleados / Contactos',''),
 (10,'servicios','perfil.png','Servicios - Sub Cuentas',''),
 (11,'importar','subir.png','Importar desde archivo',''),
 (12,'nuevo1','nuevo1.png','Nuevo',''),
 (13,'editar1','editar1.png','Editar','');
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

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
 (39,'iconosabm','14','cerrar1.png','cerrar()','1','1','Cerrar','1');
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
 ('_SYSCOLORFONDO','C','RGB(192,192,192)','Color del Fondo de Sistema','1','S'),
 ('_SYSDESCRIP','C','Administración Principal','Descripcion de la Base de Datos conectada','1','S'),
 ('_SYSESTACION','C','C:\\TRSofttmp','Carpeta de destino de los archivos borrados','1','S'),
 ('_SYSLONGCART','N','10','Longitud de codificacion de Articulos','1','S'),
 ('_SYSPAPELERA','C','RECYCLE','Indica si los delete van a parar a la papelera','1','S'),
 ('_SYSPASSADMIN','C','1','Password para usuario administrador de Menues y seteos','1','S'),
 ('_SYSTITULO','C','TRSoft V0','Titulo para arranque del sistema en la barra superior','1','S');
/*!40000 ALTER TABLE `varpublicas` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
