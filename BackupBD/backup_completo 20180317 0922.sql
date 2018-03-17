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
-- Create schema trsoftdb
--

CREATE DATABASE IF NOT EXISTS trsoftdb;
USE trsoftdb;

--
-- Definition of table `afipcompro`
--

DROP TABLE IF EXISTS `afipcompro`;
CREATE TABLE `afipcompro` (
  `idafipcom` int(10) unsigned NOT NULL,
  `codigo` char(10) NOT NULL,
  `detalle` char(100) NOT NULL,
  PRIMARY KEY (`idafipcom`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `afipcompro`
--

/*!40000 ALTER TABLE `afipcompro` DISABLE KEYS */;
INSERT INTO `afipcompro` (`idafipcom`,`codigo`,`detalle`) VALUES 
 (1,'001','FACTURA A');
/*!40000 ALTER TABLE `afipcompro` ENABLE KEYS */;


--
-- Definition of table `afipimpuestos`
--

DROP TABLE IF EXISTS `afipimpuestos`;
CREATE TABLE `afipimpuestos` (
  `idafipimp` int(10) unsigned NOT NULL,
  `codigo` char(10) NOT NULL,
  `tipo` char(10) NOT NULL,
  `detalle` char(100) NOT NULL,
  PRIMARY KEY (`idafipimp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `afipimpuestos`
--

/*!40000 ALTER TABLE `afipimpuestos` DISABLE KEYS */;
INSERT INTO `afipimpuestos` (`idafipimp`,`codigo`,`tipo`,`detalle`) VALUES 
 (2,'4','IVA','IVA 10.5'),
 (5,'5','IVA','IVA 21');
/*!40000 ALTER TABLE `afipimpuestos` ENABLE KEYS */;


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
  `articulo` char(50) NOT NULL,
  `detalle` char(254) NOT NULL,
  `idtipomov` int(10) unsigned NOT NULL,
  `descmov` char(254) NOT NULL,
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
 (2,'0101002','Alambre de bajada PVC 2 x 0.81',1,'ENTREGA MATERIALES POR PEDIDO DE CLIENTE','E',55.0000,9,1,102.0000,1178.1000,6788.1001),
 (3,'0101001','Alambre de bajada c/autop.2 x 0.61',1,'EGRESO POR AJUSTE DE STOCK','E',35.0000,10,1,101.0000,749.7000,4284.7002),
 (4,'0101001','Alambre de bajada c/autop.2 x 0.61',1,'EGRESO POR AJUSTE DE STOCK','E',35.0000,11,1,101.0000,742.3500,4277.3501),
 (4,'0101001','Alambre de bajada c/autop.2 x 0.61',1,'EGRESO POR AJUSTE DE STOCK','E',35.0000,12,1,101.0000,742.3500,4277.3501),
 (5,'0101001','Alambre de bajada c/autop.2 x 0.61',1,'EGRESO POR AJUSTE DE STOCK','E',35.0000,13,1,101.0000,749.7000,4284.7002),
 (5,'0101002','Alambre de bajada PVC 2 x 0.81',1,'EGRESO POR AJUSTE DE STOCK','E',54.0000,14,1,102.0000,1156.6801,6664.6802),
 (6,'0101001','Alambre de bajada c/autop.2 x 0.61',1,'EGRESO POR AJUSTE DE STOCK','E',65.0000,15,1,101.0000,1378.6500,7943.6499),
 (5,'0101001','Alambre de bajada c/autop.2 x 0.61',1,'EGRESO POR AJUSTE DE STOCK','E',35.0000,16,1,101.0000,742.3500,4277.3501),
 (7,'0101001','Alambre de bajada c/autop.2 x 0.61',1,'EGRESO POR AJUSTE DE STOCK','E',8.0000,17,1,101.0000,171.3600,979.3600),
 (7,'0101002','Alambre de bajada PVC 2 x 0.81',1,'EGRESO POR AJUSTE DE STOCK','E',58.0000,18,1,102.0000,1242.3600,7158.3599),
 (8,'0101001','Alambre de bajada c/autop.2 x 0.61',1,'EGRESO POR AJUSTE DE STOCK','E',3.0000,19,1,101.0000,63.6300,366.6300),
 (6,'0101001','Alambre de bajada c/autop.2 x 0.61',2,'INGRESO POR AJUSTE DE STOCK','I',25.0000,20,1,101.0000,530.2500,3055.2500),
 (7,'0101002','Alambre de bajada PVC 2 x 0.81',1,'EGRESO POR AJUSTE DE STOCK','E',30.0000,21,1,102.0000,642.6000,3702.6001),
 (8,'0101001','Alambre de bajada c/autop.2 x 0.61',1,'EGRESO POR AJUSTE DE STOCK','E',5.0000,22,1,101.0000,107.1000,612.1000),
 (8,'0101002','Alambre de bajada PVC 2 x 0.81',1,'EGRESO POR AJUSTE DE STOCK','E',3.0000,23,1,102.0000,64.2600,370.2600),
 (9,'0101001','Alambre de bajada c/autop.2 x 0.61',1,'EGRESO POR AJUSTE DE STOCK','E',5.0000,24,1,505.0000,107.1000,612.1000),
 (9,'0101002','Alambre de bajada PVC 2 x 0.81',1,'EGRESO POR AJUSTE DE STOCK','E',6.0000,25,1,612.0000,128.5200,740.5200),
 (10,'0101001','Alambre de bajada c/autop.2 x 0.61',1,'EGRESO POR AJUSTE DE STOCK','E',2.0000,27,1,202.0000,42.4200,244.4200),
 (11,'0101001','Alambre de bajada c/autop.2 x 0.61',1,'EGRESO POR AJUSTE DE STOCK','E',2.0000,28,1,202.0000,42.4200,244.4200),
 (13,'0101002','Alambre de bajada PVC 2 x 0.81',1,'EGRESO POR AJUSTE DE STOCK','E',3.0000,29,1,306.0000,64.2600,370.2600),
 (14,'0101001','Alambre de bajada c/autop.2 x 0.61',1,'EGRESO POR AJUSTE DE STOCK','E',3.0000,30,1,303.0000,63.6300,366.6300),
 (15,'0101001','Alambre de bajada c/autop.2 x 0.61',1,'EGRESO POR AJUSTE DE STOCK','E',2.0000,31,1,202.0000,42.4200,244.4200),
 (17,'0101001','Alambre de bajada c/autop.2 x 0.61',1,'EGRESO POR AJUSTE DE STOCK','E',5.0000,32,1,505.0000,106.0500,611.0500),
 (25,'0101002','Alambre de bajada PVC 2 x 0.81',1,'EGRESO POR AJUSTE DE STOCK','E',1.0000,40,1,102.0000,21.4200,123.4200),
 (18,'0101001','Alambre de bajada c/autop.2 x 0.61',1,'EGRESO POR AJUSTE DE STOCK','E',111.0000,41,1,11211.0000,2354.3101,13565.3096),
 (19,'0101002','Alambre de bajada PVC 2 x 0.81',1,'EGRESO POR AJUSTE DE STOCK','E',2.0000,42,1,204.0000,42.8400,246.8400),
 (20,'0101002','Alambre de bajada PVC 2 x 0.81',1,'EGRESO POR AJUSTE DE STOCK','E',10.0000,43,1,1020.0000,214.2000,1234.2000),
 (21,'0101002','Alambre de bajada PVC 2 x 0.81',1,'EGRESO POR AJUSTE DE STOCK','E',5.0000,44,1,510.0000,107.1000,617.1000),
 (22,'0101002','Alambre de bajada PVC 2 x 0.81',1,'EGRESO POR AJUSTE DE STOCK','E',6.0000,45,1,612.0000,128.5200,740.5200),
 (23,'0101001','Alambre de bajada c/autop.2 x 0.61',2,'INGRESO POR AJUSTE DE STOCK','I',1.0000,46,1,101.0000,21.2100,122.2100),
 (24,'0101001','Alambre de bajada c/autop.2 x 0.61',2,'INGRESO POR AJUSTE DE STOCK','I',1.0000,47,1,101.0000,21.2100,122.2100);
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
 (3,'0001',3,'20170306',1,'ROSSI TULIO','FEDE','','','','','N',1,'EGRESO POR AJUSTE DE STOCK',1,'Deposito Belgrano 1602'),
 (4,'0001',4,'20170306',2,'ALSAFEX S.A. - Racca Gaston Ramon Alberto','FEDE','','','','','N',1,'EGRESO POR AJUSTE DE STOCK',1,'Deposito Belgrano 1602'),
 (5,'0001',5,'20170306',2,'ALSAFEX S.A. - Racca Gaston Ramon Alberto','FEDE','','','','','N',1,'EGRESO POR AJUSTE DE STOCK',1,'Deposito Belgrano 1602'),
 (6,'0001',6,'20170724',1,'ROSSI TULIO','FEDE','','','','','S',2,'INGRESO POR AJUSTE DE STOCK',0,''),
 (7,'0001',7,'20170731',2,'ALSAFEX S.A. - Racca Gaston Ramon Alberto','FEDE','1','2','3','','N',1,'EGRESO POR AJUSTE DE STOCK',1,'Deposito Belgrano 1602'),
 (8,'0001',8,'20170804',2,'ALSAFEX S.A. - Racca Gaston Ramon Alberto','FEDE','PRUEBA','','','','N',1,'EGRESO POR AJUSTE DE STOCK',1,'Deposito Belgrano 1602'),
 (9,'0001',9,'20170804',2,'ALSAFEX S.A. - Racca Gaston Ramon Alberto','FEDE','PRUEBA','','','','N',1,'EGRESO POR AJUSTE DE STOCK',1,'Deposito Belgrano 1602'),
 (10,'0001',10,'20171009',1,'ROSSI TULIO','FEDE','','','','','N',1,'EGRESO POR AJUSTE DE STOCK',1,'Deposito Belgrano 1602'),
 (11,'0001',11,'20171009',1,'ROSSI TULIO','FEDE','','','','','N',1,'EGRESO POR AJUSTE DE STOCK',1,'Deposito Belgrano 1602'),
 (12,'0001',12,'20170804',2,'ALSAFEX S.A. - Racca Gaston Ramon Alberto','FEDE','PRUEBA','','','','N',1,'EGRESO POR AJUSTE DE STOCK',1,'Deposito Belgrano 1602'),
 (13,'0001',13,'20171009',1,'ROSSI TULIO','FEDE','','','','','N',1,'EGRESO POR AJUSTE DE STOCK',1,'Deposito Belgrano 1602'),
 (14,'0001',14,'20171009',1,'ROSSI TULIO','FEDE','','','','','N',1,'EGRESO POR AJUSTE DE STOCK',1,'Deposito Belgrano 1602'),
 (15,'0001',15,'20171009',1,'ROSSI TULIO','FEDE','','','','','N',1,'EGRESO POR AJUSTE DE STOCK',1,'Deposito Belgrano 1602'),
 (16,'0001',16,'20170804',2,'ALSAFEX S.A. - Racca Gaston Ramon Alberto','FEDE','PRUEBA','','','','N',1,'EGRESO POR AJUSTE DE STOCK',1,'Deposito Belgrano 1602'),
 (18,'0001',18,'20171010',1,'ROSSI TULIO','FEDE','','','','','N',1,'EGRESO POR AJUSTE DE STOCK',1,'Deposito Belgrano 1602'),
 (19,'0001',19,'20171010',1,'ROSSI TULIO','FEDE','','','','','N',1,'EGRESO POR AJUSTE DE STOCK',1,'Deposito Belgrano 1602'),
 (20,'0001',20,'20171010',1,'ROSSI TULIO','FEDE','','','','','N',1,'EGRESO POR AJUSTE DE STOCK',1,'Deposito Belgrano 1602'),
 (21,'0001',21,'20171010',1,'ROSSI TULIO','FEDE','','','','','N',1,'EGRESO POR AJUSTE DE STOCK',1,'Deposito Belgrano 1602'),
 (22,'0001',22,'20171010',1,'ROSSI TULIO','FEDE','','','','','N',1,'EGRESO POR AJUSTE DE STOCK',1,'Deposito Belgrano 1602'),
 (23,'0001',23,'20180131',1,'ROSSI TULIO','TULIO','','','','','N',2,'INGRESO POR AJUSTE DE STOCK',1,'Deposito Belgrano 1602'),
 (24,'0001',24,'20180131',2,'ALSAFEX S.A. - Racca Gaston Ramon Alberto','TULIO','','','','','N',2,'INGRESO POR AJUSTE DE STOCK',1,'Deposito Belgrano 1602'),
 (25,'0001',25,'20171010',1,'ROSSI TULIO','FEDE','','','','','N',1,'EGRESO POR AJUSTE DE STOCK',1,'Deposito Belgrano 1602');
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
  PRIMARY KEY (`articulo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `articulos`
--

/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` (`articulo`,`detalle`,`unidad`,`abrevia`,`codbarra`,`costo`,`linea`) VALUES 
 ('0101001','Alambre de bajada c/autop.2 x 0.61','unidades','alambre de bajada','999999',101.0000,'0101'),
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
 ('0103018','Caño  de PVC 87/90 - 6 m','','','',0.0000,'0103'),
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
 ('0105017','Gancho de suspension tipo J','','','',0.0000,'0101'),
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
 ('0109019','Molex H y M  15C.062 TRASA','','','',0.0000,'0109'),
 ('0109020','Piezo electronico p/telefonos','','','',0.0000,'0109'),
 ('0109021','Pin p/molex H y M  .062 TRASA','','','',0.0000,'0109'),
 ('0109022','Resitencia 50 Ohm 40 W (TASA)','','','',0.0000,'0109'),
 ('0109023','Turbina 12V 4 s/rod','','','',0.0000,'0109'),
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
 ('0110023','Bateria n° 31 tipo Panasonic','','','',0.0000,'0110'),
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
 ('0201001','Abrazadera 50 -PVC- 1/2 - Con Cuña','','','',0.0000,'0101'),
 ('0201002','Abrazadera 63 -PVC- 1/2 - Con Cuña','','','',0.0000,'0110'),
 ('0201003','Abrazadera 75 -PVC- 1/2 - Con Cuña','','','',0.0000,'0201'),
 ('0201004','Abrazadera 90 -PVC- 1/2 - Con Cuña','','','',0.0000,''),
 ('0201005','Abrazadera 110 -PVC- 1/2 - Con Cuña','','','',0.0000,''),
 ('0201006','Abrazadera 140 -PVC- 1/2 - Con Cuña','','','',0.0000,''),
 ('0201007','Abrazadera 160 -PVC- 1/2 - Con Cuña','','','',0.0000,''),
 ('0201008','Abrazadera 50 -PVC- 3/4 - Con Cuña','','','',0.0000,''),
 ('0201009','Abrazadera 63 -PVC- 3/4 - Con Cuña','','','',0.0000,''),
 ('0201010','Abrazadera 75 -PVC- 3/4 - Con Cuña','','','',0.0000,''),
 ('0201011','Abrazadera 90 -PVC- 3/4 - Con Cuña','','','',0.0000,''),
 ('0201012','Abrazadera 110 -PVC- 3/4 - Con Cuña','','','',0.0000,''),
 ('0201013','Abrazadera 140 -PVC- 3/4 - Con Cuña','','','',0.0000,''),
 ('0201014','Abrazadera 160 -PVC- 3/4 - Con Cuña','','','',0.0000,''),
 ('0201015','Abrazadera 50 -PVC- 1 - Con Cuña','','','',0.0000,''),
 ('0201016','Abrazadera 63 -PVC- 1 - Con Cuña','','','',0.0000,''),
 ('0201017','Abrazadera 75 -PVC- 1 - Con Cuña','','','',0.0000,''),
 ('0201018','Abrazadera 90 -PVC- 1 - Con Cuña','','','',0.0000,''),
 ('0201019','Abrazadera 110 -PVC- 1 - Con Cuña','','','',0.0000,''),
 ('0201020','Abrazadera 140 -PVC- 1 - Con Cuña','','','',0.0000,''),
 ('0201021','Abrazadera 160 -PVC- 1 - Con Cuña','','','',0.0000,''),
 ('0201022','Abrazadera 50 -PVC- 1/2 - Doble Bulon','','','',0.0000,''),
 ('0201023','Abrazadera 63 -PVC- 1/2 - Doble Bulon','','','',0.0000,''),
 ('0201024','Abrazadera 75 -PVC- 1/2 - Doble Bulon','','','',0.0000,''),
 ('0201025','Abrazadera 90 -PVC- 1/2 - Doble Bulon','','','',0.0000,''),
 ('0201026','Abrazadera 110 -PVC- 1/2 - Doble Bulon','','','',0.0000,''),
 ('0201027','Abrazadera 140 -PVC- 1/2 - Doble Bulon','','','',0.0000,''),
 ('0201028','Abrazadera 160 -PVC- 1/2 - Doble Bulon','','','',0.0000,''),
 ('0201029','Abrazadera 50 -PVC- 3/4 - Doble Bulon','','','',0.0000,''),
 ('0201030','Abrazadera 63 -PVC- 3/4 - Doble Bulon','','','',0.0000,''),
 ('0201031','Abrazadera 75 -PVC- 3/4 - Doble Bulon','','','',0.0000,''),
 ('0201032','Abrazadera 90 -PVC- 3/4 - Doble Bulon','','','',0.0000,''),
 ('0201033','Abrazadera 110 -PVC- 3/4 - Doble Bulon','','','',0.0000,''),
 ('0201034','Abrazadera 140 -PVC- 3/4 - Doble Bulon','','','',0.0000,''),
 ('0201035','Abrazadera 160 -PVC- 3/4 - Doble Bulon','','','',0.0000,''),
 ('0201036','Abrazadera 50 -PVC- 1 - Doble Bulon','','','',0.0000,''),
 ('0201037','Abrazadera 63 -PVC- 1 - Doble Bulon','','','',0.0000,''),
 ('0201038','Abrazadera 75 -PVC- 1 - Doble Bulon','','','',0.0000,''),
 ('0201039','Abrazadera 90 -PVC- 1 - Doble Bulon','','','',0.0000,''),
 ('0201040','Abrazadera 110 -PVC- 1 - Doble Bulon','','','',0.0000,''),
 ('0201041','Abrazadera 140 -PVC- 1 - Doble Bulon','','','',0.0000,''),
 ('0201042','Abrazadera 160 -PVC- 1 - Doble Bulon','','','',0.0000,''),
 ('0202001','Adaptador con Registro - PVC - 20 x 3/4','','','',0.0000,''),
 ('0203001','Brida para tubo 63 mm.','','','',0.0000,'0203'),
 ('0203002','Brida H§F§ c/aro de goma p/ca¤o 110mm','','','',0.0000,'0203'),
 ('0203003','Brida c/aro goma 160x140','','','',0.0000,'0203'),
 ('0203004','Bulón de acero p/brida 1/2 x 2 1/2','','','',0.0000,''),
 ('0203005','Tuerca de acero  p/bulon 1/2','','','',0.0000,''),
 ('0203006','Arandela  Plana   p/bulon','','','',0.0000,'0203'),
 ('0203007','Junta de Goma p/brida de 110mm','','','',0.0000,'0203'),
 ('0204001','Buje Reduccion   PVC  1 a 1/2','','','',0.0000,''),
 ('0204002','Buje Reduccion - PVC -1 x 3/4','','','',0.0000,''),
 ('0204003','Buje Reduccion - PPN -3/4 a 1/2','','','',0.0000,''),
 ('0204004','Buje Reduccion - Bronce - 1 x 3/4','','','',0.0000,''),
 ('0204005','Buje reduccion galvanizado  1 1/4 a 3/4','','','',0.0000,''),
 ('0204006','Buje reduccion galvanizado  1 1/4 a 1','','','',0.0000,''),
 ('0204007','Buje reduccion galvanizado  2 1/2 a 2','','','',0.0000,''),
 ('0204008','Buje reduccion galvanizado  2 1/2 a 1 1/2','','','',0.0000,''),
 ('0204009','Buje reduccion galvanizado  2 1/2 a 1 1/4','','','',0.0000,''),
 ('0204010','Buje reduccion galvanizado 3 a 1','','','',0.0000,''),
 ('0204011','Buje reduccion galvanizado 3 a 1 1/2','','','',0.0000,''),
 ('0204012','Buje reduccion galvanizado 3 a 1 1/4','','','',0.0000,''),
 ('0204013','Buje reduccion galvanizado 3 a 2','','','',0.0000,''),
 ('0204014','Niple galvanizado de 2 x 10 cm','','','',0.0000,''),
 ('0204015','Buje Niple entre rosca de 1/2 PPM','','','',0.0000,''),
 ('0204016','Buje entrerosca de 3/4 PPM','','','',0.0000,'0204'),
 ('0204017','Buje entrerosca galvanizada de 2','','','',0.0000,''),
 ('0204018','Buje entrerosca galvanizada de 2 1/2','','','',0.0000,''),
 ('0204019','Buje entrerosca galvanizada de 3','','','',0.0000,''),
 ('0204020','Espiga Conica - PVC','','','',0.0000,'0204'),
 ('0204021','Espiga Plana - PVC','','','',0.0000,'0204'),
 ('0204022','Espiga/Espiga - Bronce','','','',0.0000,'0204'),
 ('0204023','Espiga con Rosca Macho 3/4','','','',0.0000,'0204'),
 ('0204024','Racord RM - 1/2 x 17mm - K6','','','',0.0000,'0101'),
 ('0204025','Racord RM - 1/2 x 20mm - K10','','','',0.0000,''),
 ('0204026','Racord con tuerca loca 1 x 17mm','','','',0.0000,''),
 ('0204027','Racord con tuerca loca 1 x 20mm','','','',0.0000,''),
 ('0205001','Caño PVC - 50 - J/D','','','',0.0000,'0205'),
 ('0205002','Caño PVC - 63 - J/D','','','',0.0000,'0205'),
 ('0205003','Caño PVC - 75 - J/D','','','',0.0000,'0205'),
 ('0205004','Caño PVC - 90 - J/D','','','',0.0000,'0205'),
 ('0205005','Caño PVC - 110 - J/D','','','',0.0000,'0205'),
 ('0205006','Caño PVC - 140 - J/D','','','',0.0000,'0205'),
 ('0205007','Caño PVC - 160 - J/D','','','',0.0000,'0205'),
 ('0205008','Caño PVC - 200 - J/D','','','',0.0000,'0205'),
 ('0205009','Caño PVC - 250 - J/D','','','',0.0000,'0205'),
 ('0205010','Caño PVC - 300 - J/D','','','',0.0000,'0205'),
 ('0205011','Caño PVC - 50 - J/P','','','',0.0000,'0205'),
 ('0205012','Caño PVC - 63 - J/P','','','',0.0000,'0205'),
 ('0205013','Caño PVC - 75 - J/P','','','',0.0000,'0205'),
 ('0205014','Caño PVC - 90 - J/P','','','',0.0000,'0205'),
 ('0205015','Caño PVC - 110 - J/P','','','',0.0000,'0205'),
 ('0205016','Caño PVC - 140 - J/P','','','',0.0000,'0205'),
 ('0205017','Caño PVC - 160 - J/P','','','',0.0000,'0205'),
 ('0205018','Caño PeBD 1/2 x 20 mm.','','','',0.0000,''),
 ('0205019','Caño PeBD 1/2 x 20 mm.','','','',0.0000,''),
 ('0205020','Caño PPM  1/2','','','',0.0000,''),
 ('0205021','Caño PeBD 3/4','','','',0.0000,''),
 ('0205022','Caño Bicapa 3/4 PPM','','','',0.0000,'0205'),
 ('0205023','Caño galvanizado de  2 1/2','','','',0.0000,''),
 ('0205024','Ramal Y a 45° de 100 x 100 c/bridas H°F°','','','',0.0000,''),
 ('0205025','Ramal Y doble de 160 X 160 X 110','','','',0.0000,''),
 ('0206001','Cupla PVC - 50 - J/P','','','',0.0000,'0206'),
 ('0206002','Cupla PVC - 63 - J/P','','','',0.0000,'0206'),
 ('0206003','Cupla PVC - 75 - J/P','','','',0.0000,'0206'),
 ('0206004','Cupla PVC - 90 - J/P','','','',0.0000,'0206'),
 ('0206005','Cupla PVC - 110 - J/P','','','',0.0000,'0206'),
 ('0206006','Cupla PVC - 140 - J/P','','','',0.0000,'0206'),
 ('0206007','Cupla PVC - 160 - J/P','','','',0.0000,'0206'),
 ('0206008','Cupla PVC - 50 - J/D','','','',0.0000,'0206'),
 ('0206009','Cupla PVC - 63 - J/D','','','',0.0000,'0206'),
 ('0206010','Cupla PVC - 75 - J/D','','','',0.0000,'0206'),
 ('0206011','Cupla PVC - 90 - J/D','','','',0.0000,'0206'),
 ('0206012','Cupla PVC - 110 - J/D','','','',0.0000,'0206'),
 ('0206013','Cupla PVC - 140 - J/D','','','',0.0000,'0206'),
 ('0206014','Cupla PVC - 160 - J/D','','','',0.0000,'0206'),
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
 ('0207001','Curva 45° - PVC - 50 - J/D','','','',0.0000,'0207'),
 ('0207002','Curva 45° - PVC - 63 - J/D','','','',0.0000,'0207'),
 ('0207003','Curva 45° - PVC - 75 - J/D','','','',0.0000,'0207'),
 ('0207004','Curva 45° - PVC - 90 - J/D','','','',0.0000,'0207'),
 ('0207005','Curva 45° - PVC - 110 - J/D','','','',0.0000,'0207'),
 ('0207006','Curva 45° - PVC - 140 - J/D','','','',0.0000,'0207'),
 ('0207007','Curva 45° - PVC - 160 - J/D','','','',0.0000,'0207'),
 ('0207008','Curva 45° - PVC - 50 - J/P','','','',0.0000,'0207'),
 ('0207009','Curva 45° - PVC - 63 - J/P','','','',0.0000,'0207'),
 ('0207010','Curva 45° - PVC - 75 - J/P','','','',0.0000,'0207'),
 ('0207011','Curva 45° - PVC - 90 - J/P','','','',0.0000,'0207'),
 ('0207012','Curva 45° - PVC - 110 - J/P','','','',0.0000,'0207'),
 ('0207013','Curva 45° - PVC - 140 - J/P','','','',0.0000,'0207'),
 ('0207014','Curva 45° - PVC - 160 - J/P','','','',0.0000,'0207'),
 ('0207015','Curva 90° - PVC - 50 - J/D','','','',0.0000,'0207'),
 ('0207016','Curva 90° - PVC - 63 - J/D','','','',0.0000,'0207'),
 ('0207017','Curva 90° - PVC - 75 - J/D','','','',0.0000,'0207'),
 ('0207018','Curva 90° - PVC - 90 - J/D','','','',0.0000,'0207'),
 ('0207019','Curva 90° - PVC - 110 - J/D','','','',0.0000,'0207'),
 ('0207020','Curva 90° - PVC - 140 - J/D','','','',0.0000,'0207'),
 ('0207021','Curva 90° - PVC - 160 - J/D','','','',0.0000,'0207'),
 ('0207022','Curva 90° - PVC - 50 - J/P','','','',0.0000,'0207'),
 ('0207023','Curva 90° - PVC - 63 - J/P','','','',0.0000,'0207'),
 ('0207024','Curva 90° - PVC - 75 - J/P','','','',0.0000,'0207'),
 ('0207025','Curva 90° - PVC - 90 - J/P','','','',0.0000,'0207'),
 ('0207026','Curva 90° - PVC - 110 - J/P','','','',0.0000,'0207'),
 ('0207027','Curva 90° - PVC - 140 - J/P','','','',0.0000,'0207'),
 ('0207028','Curva 90° - PVC - 160 - J/P','','','',0.0000,'0207'),
 ('0207029','Curva a 45° 1/2 ppm','','','',0.0000,''),
 ('0207030','Curva  galvanizada  HH  2 1/2','','','',0.0000,''),
 ('0207031','Codo de 1/2 PPM','','','',0.0000,''),
 ('0207032','Codo 3/4 PPM','','','',0.0000,'0207'),
 ('0207033','Codo de 1 PPM','','','',0.0000,''),
 ('0208001','Llave Esferica -PVC - 1/2 - HH','','','',0.0000,''),
 ('0208002','Llave Esferica - PVC - 3/4 - HH','','','',0.0000,''),
 ('0208003','Llave Esferica - PVC - 1 - HH','','','',0.0000,''),
 ('0208004','Llave Esferica - PVC - 1 1/4 - HH','','','',0.0000,''),
 ('0208005','Llave Esferica - PVC - 1 1/2 - HH','','','',0.0000,''),
 ('0208006','Llave Esferica - PVC - 1 3/4 - HH','','','',0.0000,''),
 ('0208007','Llave Esferica - PVC - 2 - HH','','','',0.0000,''),
 ('0208008','Llave Esferica - PVC - 2 1/4 - HH','','','',0.0000,''),
 ('0208009','Llave Esferica - PVC - 2 1/2 - HH','','','',0.0000,''),
 ('0208010','Llave Esferica - PVC - 2  3/4 - HH','','','',0.0000,''),
 ('0208011','Llave Esferica - PVC -  3 - HH','','','',0.0000,''),
 ('0208012','Llave Esferica - Racord 17 - T/L 1','','','',0.0000,''),
 ('0208013','Llave Esferica - Racord 20 - T/L 1','','','',0.0000,''),
 ('0208014','Llave esferica  1/2 HH de Bronce','','','',0.0000,'0208'),
 ('0208015','Valvula Esclusa - Bronce - 2 - HH','','','',0.0000,''),
 ('0208016','Valvula Esclusa - Bronce - 2 1/2 - HH','','','',0.0000,''),
 ('0208017','Valvula Esclusa - Bronce - 4 - HH','','','',0.0000,''),
 ('0208018','Valvula esferica Polietileno  2 1/2','','','',0.0000,''),
 ('0208019','Valvula de Retencion de Bronce de 3','','','',0.0000,''),
 ('0208020','Valvula EURO de 63 mm.','','','',0.0000,'0208'),
 ('0208021','Valvula EURO de 110 mm.  J/D.','','','',0.0000,'0208'),
 ('0208022','Valvula Mariposa 100 - 4','','','',0.0000,''),
 ('0208023','Valvula Mariposa 150 - 6','','','',0.0000,''),
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
 ('0210001','Medidor Clase C PVC  marca','','','',0.0000,''),
 ('0210002','Medidor Clase C PVC  marca','','','',0.0000,''),
 ('0210003','Medidor Clase C PVC  marca','','','',0.0000,''),
 ('0210004','Medidor Clase C Bronce marca','','','',0.0000,''),
 ('0210005','Medidor Clase C Bronce marca','','','',0.0000,''),
 ('0210006','Medidor Clase C Bronce marca','','','',0.0000,''),
 ('0210007','Macromedidor','','','',0.0000,'0210'),
 ('0210008','Prolongacion para medidores','','','',0.0000,'0210'),
 ('0210009','Prolongacion para medidores (pl stico)','','','',0.0000,'0210'),
 ('0210010','Tuerca de Bronce x 1','','','',0.0000,''),
 ('0210011','Caja Unificada PVC - P/Medidores','','','',0.0000,'0210'),
 ('0210012','Caja vereda p/ llave Gde.PVC 200x200x180mm','','','',0.0000,'0210'),
 ('0210013','Caja p/ Macromedidor PVC','','','',0.0000,'0210'),
 ('0210014','Tapa Inspeccion Limpieza','','','',0.0000,'0210'),
 ('0210015','Tapa y Marco - F Gris - 500mm x 600mm','','','',0.0000,'0210'),
 ('0210016','Tapa con Marcos - F Gris - P/Medidores','','','',0.0000,'0210'),
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
 ('0211013','Reduccion (especial) 75 x 50mm','','','',0.0000,'0211'),
 ('0211014','Reduccion (especial) 110   x  75','','','',0.0000,'0211'),
 ('0211015','Reduccion (especial) 160 x 110','','','',0.0000,'0211'),
 ('0212001','Tapon Terminal - PVC - 50','','','',0.0000,'0212'),
 ('0212002','Tapon Terminal - PVC - 63','','','',0.0000,'0212'),
 ('0212003','Tapon Terminal - PVC - 75','','','',0.0000,'0212'),
 ('0212004','Tapon Terminal - PVC - 90','','','',0.0000,'0212'),
 ('0212005','Tapon Terminal - PVC - 110','','','',0.0000,'0212'),
 ('0212006','Tapon Terminal - PVC - 140','','','',0.0000,'0212'),
 ('0212007','Tapon Terminal - PVC - 160','','','',0.0000,'0212'),
 ('0212008','Tapon Terminal 1/2 RM PPM','','','',0.0000,''),
 ('0212009','TEE 1/2 PPM','','','',0.0000,''),
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
 ('0213005','Union de Reparaci¢n 3/4 (Junta Dressel)','','','',0.0000,'0213'),
 ('0213006','Union de Reparacion 50 x 20','','','',0.0000,'0213'),
 ('0213007','Union de Reparacion 50 x 30','','','',0.0000,'0213'),
 ('0213008','Union de Reparacion 50 x 40','','','',0.0000,'0213'),
 ('0213009','Union de Reparacion 50 x 50','','','',0.0000,'0213'),
 ('0213010','Union de Reparacion 50 x 60','','','',0.0000,'0213'),
 ('0213011','Union de Reparacion 50 x 70','','','',0.0000,'0213'),
 ('0213012','Union de Reparacion 50 x 80','','','',0.0000,'0213'),
 ('0213013','Union de Reparacion 50 x 90','','','',0.0000,'0213'),
 ('0213014','Union de Reparacion 50 x 1 mt.','','','',0.0000,'0213'),
 ('0213015','Union de Reparacion 63 x 20','','','',0.0000,'0213'),
 ('0213016','Union de Reparacion 63 x 30','','','',0.0000,'0213'),
 ('0213017','Union de Reparacion 63 x 40','','','',0.0000,'0213'),
 ('0213018','Union de Reparacion 63 x 50','','','',0.0000,'0213'),
 ('0213019','Union de Reparacion 63 x 60','','','',0.0000,'0213'),
 ('0213020','Union de Reparacion 63 x 70','','','',0.0000,'0213'),
 ('0213021','Union de Reparacion 63 x 80','','','',0.0000,'0213'),
 ('0213022','Union de Reparacion 63 x 90','','','',0.0000,'0213'),
 ('0213023','Union de Reparacion 63 x 1 mt.','','','',0.0000,'0213'),
 ('0213024','Union de Reparacion 75 x 20','','','',0.0000,'0213'),
 ('0213025','Union de Reparacion 75 x 30','','','',0.0000,'0213'),
 ('0213026','Union de Reparacion 75 x 40','','','',0.0000,'0213'),
 ('0213027','Union de Reparacion 75 x 50','','','',0.0000,'0213'),
 ('0213028','Union de Reparacion 75 x 60','','','',0.0000,'0213'),
 ('0213029','Union de Reparacion 75 x 70','','','',0.0000,'0213'),
 ('0213030','Union de Reparacion 75 x 80','','','',0.0000,'0213'),
 ('0213031','Union de Reparacion 75 x 90','','','',0.0000,'0213'),
 ('0213032','Union de Reparacion 75 x 1 mt.','','','',0.0000,'0213'),
 ('0213033','Union de Reparacion 90 x 20','','','',0.0000,'0213'),
 ('0213034','Union de Reparacion 90 x 30','','','',0.0000,'0213'),
 ('0213035','Union de Reparacion 90 x 40','','','',0.0000,'0213'),
 ('0213036','Union de Reparacion 90 x 50','','','',0.0000,'0213'),
 ('0213037','Union de Reparacion 90 x 60','','','',0.0000,'0213'),
 ('0213038','Union de Reparacion 90 x 70','','','',0.0000,'0213'),
 ('0213039','Union de Reparacion 90 x 80','','','',0.0000,'0213'),
 ('0213040','Union de Reparacion 90 x 90','','','',0.0000,'0213'),
 ('0213041','Union de Reparacion 90 x 1 mt.','','','',0.0000,'0213'),
 ('0213042','Union de Reparacion 110 x 20','','','',0.0000,'0213'),
 ('0213043','Union de Reparacion 110 x 30','','','',0.0000,'0213'),
 ('0213044','Union de Reparacion 110 x 40','','','',0.0000,'0213'),
 ('0213045','Union de Reparacion 110 c/tensores','','','',0.0000,'0213'),
 ('0213046','Union de reparaci¢n 140 x 40 cm con tensores','','','',0.0000,'0213'),
 ('0213047','Union Desmontable de 1/2 PPM','','','',0.0000,''),
 ('0213048','Union Desmontable 3/4 PPM','','','',0.0000,''),
 ('0213049','Union Desmontable 1 PPM','','','',0.0000,''),
 ('0213050','Union Desmontable 1 1/4 PPM','','','',0.0000,''),
 ('0213051','Union Desmontable 1 1/2 PPM','','','',0.0000,''),
 ('0213052','Union Desmontable 2 PPM','','','',0.0000,''),
 ('0213053','Union Doble x 2 1/2 PPM','','','',0.0000,''),
 ('0214001','Cuerpo de Bomba Rotor Pump 2.5 -4','','','',0.0000,''),
 ('0214002','Motor Sumergible Franklin Rotor PUMP','','','',0.0000,'0214'),
 ('0214003','Cable Chato Alimentacion B. 4x2.5mm','','','',0.0000,'0214'),
 ('0214004','Empalme para Cable','','','',0.0000,'0214'),
 ('0214005','Clorinador Mod 015 Milenio (1.45 l/h)','','','',0.0000,'0214'),
 ('0214006','Kit Cabezal p/Clorinador','','','',0.0000,'0214'),
 ('0214007','Valvula de pie (Filtro Clorinador)','','','',0.0000,'0214'),
 ('0214008','Cinta Peligro de 8 cm','','','',0.0000,'0214'),
 ('0214009','Hidro Faja - 50','','','',0.0000,'0214'),
 ('0214010','Hidro Faja - 63','','','',0.0000,'0214'),
 ('0214011','Hidro Faja 135 - 145 Ajustable','','','',0.0000,'0214'),
 ('0214012','Adhesivo PVC - 500 grs.','','','',0.0000,'0214'),
 ('0214013','Adhesivo  PVC -  250g','','','',0.0000,'0214'),
 ('0214014','Guarniciones','','','',0.0000,'0214'),
 ('0214015','Guarnicion de Nylon','','','',0.0000,'0214'),
 ('0214016','Pasta Lubricante','','','',0.0000,'0214'),
 ('0214017','Teflon - 19 x 50','','','',0.0000,'0214'),
 ('0215001','Monturas  (abrazaderas)  160 a 110  a  45°','','','',0.0000,'0215'),
 ('0215002','Monturas  (abrazaderas)  160 a 110  a  90°','','','',0.0000,'0215'),
 ('0215003','Monturas  (abrazaderas)  200 a 110  a  45°','','','',0.0000,'0215'),
 ('0215004','Monturas  (abrazaderas)  250 a 110  a  45°','','','',0.0000,'0215'),
 ('0215005','Caños  PVC  110 - J/P','','','',0.0000,'0215'),
 ('0215006','Caños PVC  110 - J/D','','','',0.0000,'0215'),
 ('0215007','Caños PVC  160 - J/D','','','',0.0000,'0215'),
 ('0215008','Caños PVC 200 - J/D','','','',0.0000,'0215'),
 ('0215009','Caños PVC  250 - J/D','','','',0.0000,'0215'),
 ('0215010','Caños PVC  300 - J/D','','','',0.0000,'0215'),
 ('0215011','Curvas a  45° de 110 - J/P','','','',0.0000,'0215'),
 ('0215012','Curvas a  90° de 110 - J/P','','','',0.0000,'0215'),
 ('0215013','Curvas a  45° de 110 - J/D','','','',0.0000,'0215'),
 ('0215014','Curvas a 90° de 110 - J/D','','','',0.0000,'0215'),
 ('0215015','Curvas a 45° de 160 - J/D','','','',0.0000,'0215'),
 ('0215016','Curvas a 90° de 160 - J/D','','','',0.0000,'0215'),
 ('0215017','Ramal Y de 110','','','',0.0000,''),
 ('0215018','Ramal Y de 160','','','',0.0000,''),
 ('0215019','Cuplas de 110  J/P','','','',0.0000,'0215'),
 ('0215020','Cuplas de 110  J/D','','','',0.0000,'0215'),
 ('0215021','Tapa Terminal  de  110  J/P','','','',0.0000,'0215'),
 ('0215022','Tapa Terminal  de  160  J/P','','','',0.0000,'0215'),
 ('0215023','Tapa con marco H° F° para calle','','','',0.0000,'0215'),
 ('0215024','Tapa con marco H° F° para vereda','','','',0.0000,'0215'),
 ('0901001','KC 3301 para columna de alumbrado','','','',0.0000,'0901'),
 ('0901002','chica KC 3302  de 80 A 120 mm.','','','',0.0000,'0201'),
 ('0901003','mediana KC  3303  de 120 a 160 mm.','','','',0.0000,'0901'),
 ('0901004','grande  KC 3304  de 160   a  200  mm.','','','',0.0000,'0901'),
 ('0901005','soporte montaje p/fleje Kc3571','','','',0.0000,'0901'),
 ('0901006','fleje acero inoxidable 3/4','','','',0.0000,'0901'),
 ('0901007','hebilla 3/4','','','',0.0000,'0901'),
 ('0902001','extension para punto 500','','','',0.0000,'0902'),
 ('0902002','extension recto con pin para punto 500','','','',0.0000,'0902'),
 ('0902003','extension sin pin para punto 500','','','',0.0000,'0902'),
 ('0902004','extension 90° largo para punto 500','','','',0.0000,'0902'),
 ('0902005','extension 90° mediano para punto 500','','','',0.0000,'0902'),
 ('0902006','extension 90° corto para punto 500','','','',0.0000,'0902'),
 ('0902007','180° con pin para punto 500','','','',0.0000,'0902'),
 ('0902008','90° con pin para punto 500','','','',0.0000,'0902'),
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
 ('0904014','de suspension para FO KC  3563','','','',0.0000,'0904'),
 ('0905001','RG 6 con portante','','','',0.0000,'0905'),
 ('0905002','RG 6 sin portante','','','',0.0000,'0905'),
 ('0905003','RG 59 con portante','','','',0.0000,'0905'),
 ('0905004','RG 59 sin portante','','','',0.0000,'0905'),
 ('0905005','Punto 500 con suspensor','','','',0.0000,'0905'),
 ('0905006','UTP  con portante','','','',0.0000,'0905'),
 ('0905007','UTP  sin portante','','','',0.0000,'0905'),
 ('0905008','RG  11 con suspensor','','','',0.0000,'0905'),
 ('0905009','Fibra optica  48 pelos','','','',0.0000,'0905'),
 ('0906001','F a com RG 6','','','',0.0000,'0906'),
 ('0906002','F a com RG 59','','','',0.0000,'0906'),
 ('0906003','F.H a F rapido','','','',0.0000,'0906'),
 ('0906004','F.H. A Din','','','',0.0000,'0906'),
 ('0906005','F-M a Din-H','','','',0.0000,'0906'),
 ('0906006','F con pollera RG 11','','','',0.0000,'0906'),
 ('0906007','F r pido a Din H','','','',0.0000,'0906'),
 ('0906008','Codo - Rosca 90° F M-H','','','',0.0000,'0906'),
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
 ('0907005','de red x  2 vias troncales','','','',0.0000,'0907'),
 ('0907006','de red x 3 vias troncales','','','',0.0000,'0907'),
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
 ('0909003','de sujección simple para  FO KC 3700 pared','','','',0.0000,'0909'),
 ('0909004','de sujección simple para  FO KC 3701 techo','','','',0.0000,'0909'),
 ('0909005','de sujección simple para  FO KC 3702 pared','','','',0.0000,'0909'),
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
 ('0911002','Cablemodem','','','',0.0000,'0911'),
 ('0912001','Rienda de acero 3 mm KC 3410','','','',0.0000,'0912'),
 ('0912002','Rienda de acero 3 mm KC 3411','','','',0.0000,'0912'),
 ('0912003','Rienda de acero 4,8 mm KC 3412','','','',0.0000,'0912'),
 ('0912004','Rienda de acero  6mm KC 3413','','','',0.0000,'0912'),
 ('0912005','Rienda de acero 8  mm KC 3414','','','',0.0000,'0912'),
 ('0912006','Rienda de acero forrada en PVC 3 mm. KC 3450','','','',0.0000,'0912'),
 ('0912007','Rienda de acero forrada en PVC 4 mm. KC 3451','','','',0.0000,'0912'),
 ('0912008','Rienda de acero forrada en PVC 6 mm. KC 3453','','','',0.0000,'0912'),
 ('0912009','Rienda de acero forrada en PVC 8 mm. KC 3454','','','',0.0000,'0912');
INSERT INTO `articulos` (`articulo`,`detalle`,`unidad`,`abrevia`,`codbarra`,`costo`,`linea`) VALUES 
 ('0912010','Torniquete N° 5  KC 3401','','','',0.0000,'0912'),
 ('0912011','Torniquete N° 7  KC 3403','','','',0.0000,'0912'),
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
  `base` float(13,4) NOT NULL,
  `unidadf` char(50) NOT NULL,
  `idartf` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idartf`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `articulosf`
--

/*!40000 ALTER TABLE `articulosf` DISABLE KEYS */;
INSERT INTO `articulosf` (`articulo`,`base`,`unidadf`,`idartf`) VALUES 
 ('0201002',0.0000,'',1),
 ('0201001',0.0000,'',2),
 ('0215001',0.0000,'',3),
 ('0215002',0.0000,'',4),
 ('0215003',0.0000,'',5),
 ('0215004',0.0000,'',6),
 ('0901002',0.0000,'',7),
 ('0109021',0.0000,'',8),
 ('0109023',0.0000,'',9),
 ('0201003',0.0000,'',10),
 ('0208014',0.0000,'',11),
 ('0101001',0.0000,'',13),
 ('0101003',0.0000,'',14);
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
  PRIMARY KEY (`idartimg`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `articulosimg`
--

/*!40000 ALTER TABLE `articulosimg` DISABLE KEYS */;
INSERT INTO `articulosimg` (`idartimg`,`articulo`,`archivoimg`,`fechaalta`) VALUES 
 (1,'0102013','img0102013','20171108'),
 (2,'0102013','img01012013','20171108'),
 (3,'0101001','img0101001','20180113');
/*!40000 ALTER TABLE `articulosimg` ENABLE KEYS */;


--
-- Definition of table `articulosimp`
--

DROP TABLE IF EXISTS `articulosimp`;
CREATE TABLE `articulosimp` (
  `articulo` char(50) NOT NULL,
  `impuesto` int(10) unsigned NOT NULL,
  `idartimp` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idartimp`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `articulosimp`
--

/*!40000 ALTER TABLE `articulosimp` DISABLE KEYS */;
INSERT INTO `articulosimp` (`articulo`,`impuesto`,`idartimp`) VALUES 
 ('0101001',1,1),
 ('0101002',1,2),
 ('0101004',1,3);
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
  PRIMARY KEY (`idartpro`) USING BTREE
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
  `idasientod` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `idplan` int(10) unsigned NOT NULL,
  `codigocta` char(20) NOT NULL,
  `nombrecta` char(254) NOT NULL,
  `debe` float(13,4) NOT NULL,
  `haber` float(13,4) NOT NULL,
  `detalle` char(254) NOT NULL,
  `ejercicio` int(10) unsigned NOT NULL,
  `idpland` int(10) unsigned NOT NULL,
  `detaasiento` char(254) NOT NULL,
  `idasiento` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idasientod`) USING BTREE
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
-- Definition of table `bancos`
--

DROP TABLE IF EXISTS `bancos`;
CREATE TABLE `bancos` (
  `idbanco` int(10) unsigned NOT NULL,
  `banco` int(10) unsigned NOT NULL,
  `nombre` char(254) NOT NULL,
  `filial` int(10) unsigned NOT NULL,
  `cp` char(50) NOT NULL,
  PRIMARY KEY (`idbanco`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bancos`
--

/*!40000 ALTER TABLE `bancos` DISABLE KEYS */;
INSERT INTO `bancos` (`idbanco`,`banco`,`nombre`,`filial`,`cp`) VALUES 
 (1,0,'CAJA_SUCURSAL',1,'');
/*!40000 ALTER TABLE `bancos` ENABLE KEYS */;


--
-- Definition of table `bocaservicios`
--

DROP TABLE IF EXISTS `bocaservicios`;
CREATE TABLE `bocaservicios` (
  `identidadh` int(10) unsigned NOT NULL,
  `bocanumero` char(50) NOT NULL,
  `ruta1` int(10) unsigned NOT NULL,
  `folio1` int(10) unsigned NOT NULL,
  `ruta2` int(10) unsigned NOT NULL,
  `folio2` int(10) unsigned NOT NULL,
  `facturar` char(1) NOT NULL,
  `habilitado` char(1) NOT NULL,
  PRIMARY KEY (`identidadh`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bocaservicios`
--

/*!40000 ALTER TABLE `bocaservicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `bocaservicios` ENABLE KEYS */;


--
-- Definition of table `cajabancos`
--

DROP TABLE IF EXISTS `cajabancos`;
CREATE TABLE `cajabancos` (
  `idcuenta` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `codcuenta` char(100) NOT NULL,
  `detalle` char(254) NOT NULL,
  `idtipocta` int(10) unsigned NOT NULL,
  `idbanco` int(10) unsigned NOT NULL,
  `cuentabco` char(100) NOT NULL,
  `cbu` char(100) NOT NULL,
  PRIMARY KEY (`idcuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cajabancos`
--

/*!40000 ALTER TABLE `cajabancos` DISABLE KEYS */;
INSERT INTO `cajabancos` (`idcuenta`,`fecha`,`codcuenta`,`detalle`,`idtipocta`,`idbanco`,`cuentabco`,`cbu`) VALUES 
 (1,'20180315','CAJA1','CAJA1',1,1,'','');
/*!40000 ALTER TABLE `cajabancos` ENABLE KEYS */;


--
-- Definition of table `cajaie`
--

DROP TABLE IF EXISTS `cajaie`;
CREATE TABLE `cajaie` (
  `idcajaie` int(10) unsigned NOT NULL,
  `pventa` int(10) unsigned NOT NULL,
  `idcomproba` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `entidad` int(10) unsigned NOT NULL,
  `apellido` char(254) NOT NULL,
  `direccion` char(254) NOT NULL,
  `cuit` char(13) NOT NULL,
  `concepto` char(254) NOT NULL,
  `contabilizado` int(10) unsigned NOT NULL,
  `importe` float(13,4) NOT NULL,
  PRIMARY KEY (`idcajaie`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cajaie`
--

/*!40000 ALTER TABLE `cajaie` DISABLE KEYS */;
/*!40000 ALTER TABLE `cajaie` ENABLE KEYS */;


--
-- Definition of table `carteracheque`
--

DROP TABLE IF EXISTS `carteracheque`;
CREATE TABLE `carteracheque` (
  `idcartera` int(10) unsigned NOT NULL,
  `detalle` char(254) NOT NULL,
  `fechaalta` char(8) NOT NULL,
  `idpland` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idcartera`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `carteracheque`
--

/*!40000 ALTER TABLE `carteracheque` DISABLE KEYS */;
/*!40000 ALTER TABLE `carteracheque` ENABLE KEYS */;


--
-- Definition of table `carterachequed`
--

DROP TABLE IF EXISTS `carterachequed`;
CREATE TABLE `carterachequed` (
  `idcartera` int(10) unsigned NOT NULL,
  `idcheque` int(10) unsigned NOT NULL,
  `serie` char(10) NOT NULL,
  `numero` char(50) NOT NULL,
  `banco` char(50) NOT NULL,
  `filial` char(50) NOT NULL,
  `cp` char(50) NOT NULL,
  `detercero` char(1) NOT NULL,
  `importe` float(13,4) NOT NULL,
  `cuenta` char(50) NOT NULL,
  `fechaemisi` char(8) NOT NULL,
  `fechavence` char(8) NOT NULL,
  `alaorden` char(254) NOT NULL,
  `librador` char(254) NOT NULL,
  `loentrega` char(254) NOT NULL,
  `iddetacobro` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idcheque`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `carterachequed`
--

/*!40000 ALTER TABLE `carterachequed` DISABLE KEYS */;
/*!40000 ALTER TABLE `carterachequed` ENABLE KEYS */;


--
-- Definition of table `cobrocomproba`
--

DROP TABLE IF EXISTS `cobrocomproba`;
CREATE TABLE `cobrocomproba` (
  `idcomprobafact` int(10) unsigned NOT NULL,
  `idcomprobarec` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cobrocomproba`
--

/*!40000 ALTER TABLE `cobrocomproba` DISABLE KEYS */;
INSERT INTO `cobrocomproba` (`idcomprobafact`,`idcomprobarec`) VALUES 
 (1,5);
/*!40000 ALTER TABLE `cobrocomproba` ENABLE KEYS */;


--
-- Definition of table `cobros`
--

DROP TABLE IF EXISTS `cobros`;
CREATE TABLE `cobros` (
  `idcobro` int(10) unsigned NOT NULL,
  `idcomproba` int(10) unsigned NOT NULL,
  `idfactura` int(10) unsigned NOT NULL,
  `recargo` float(13,4) NOT NULL,
  `idregipago` int(10) unsigned NOT NULL,
  `idcuotafc` int(10) unsigned NOT NULL,
  `imputado` float(13,4) NOT NULL,
  PRIMARY KEY (`idcobro`) USING BTREE
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
  `idcomproba` int(10) unsigned NOT NULL,
  `pventa` int(10) unsigned NOT NULL,
  `maxnumero` int(10) unsigned NOT NULL,
  `puntov` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `compactiv`
--

/*!40000 ALTER TABLE `compactiv` DISABLE KEYS */;
INSERT INTO `compactiv` (`idcomproba`,`pventa`,`maxnumero`,`puntov`) VALUES 
 (1,0,0,'0'),
 (1,1,0,'0001'),
 (3,1,24,'0001'),
 (3,0,24,'0'),
 (4,4,0,'0003'),
 (1,4,8,'0003'),
 (5,4,8,'0003');
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
  `tabla` char(50) NOT NULL,
  `idafipcom` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idcomproba`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comprobantes`
--

/*!40000 ALTER TABLE `comprobantes` DISABLE KEYS */;
INSERT INTO `comprobantes` (`idcomproba`,`comprobante`,`idnumera`,`idtipocom`,`tipo`,`ctacte`,`tabla`,`idafipcom`) VALUES 
 (1,'FACTURA',1,1,'A','S','',1),
 (3,'AJUSTE DE STOCK',3,4,'X','N','',0),
 (4,'FACTURAE',4,1,'A','S','',0),
 (5,'RECIBO',5,5,'A','N','recibos',4);
/*!40000 ALTER TABLE `comprobantes` ENABLE KEYS */;


--
-- Definition of table `comprorepo`
--

DROP TABLE IF EXISTS `comprorepo`;
CREATE TABLE `comprorepo` (
  `idcomproba` int(10) unsigned NOT NULL,
  `codigoimpre` char(100) NOT NULL,
  `idreporte` int(10) unsigned NOT NULL,
  `predeterminado` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comprorepo`
--

/*!40000 ALTER TABLE `comprorepo` DISABLE KEYS */;
INSERT INTO `comprorepo` (`idcomproba`,`codigoimpre`,`idreporte`,`predeterminado`) VALUES 
 (1,'',1,'S'),
 (5,'',2,'S');
/*!40000 ALTER TABLE `comprorepo` ENABLE KEYS */;


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
  `importe` float(13,4) NOT NULL
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
  `iva` int(10) unsigned NOT NULL,
  `detalle` char(200) NOT NULL,
  PRIMARY KEY (`iva`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `condfiscal`
--

/*!40000 ALTER TABLE `condfiscal` DISABLE KEYS */;
INSERT INTO `condfiscal` (`iva`,`detalle`) VALUES 
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
  `valorllama` float(13,4) NOT NULL,
  `tipollama` int(10) unsigned NOT NULL,
  `fechgene` char(8) NOT NULL,
  `horagene` char(8) NOT NULL,
  `secuencia2` int(10) unsigned NOT NULL,
  `facturado` char(1) NOT NULL,
  `facturar` char(1) NOT NULL,
  `idfactura` int(10) unsigned NOT NULL,
  `identidadh` int(10) unsigned NOT NULL,
  PRIMARY KEY (`bocanumero`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cpptelefono`
--

/*!40000 ALTER TABLE `cpptelefono` DISABLE KEYS */;
/*!40000 ALTER TABLE `cpptelefono` ENABLE KEYS */;


--
-- Definition of table `cupones`
--

DROP TABLE IF EXISTS `cupones`;
CREATE TABLE `cupones` (
  `idcupon` int(10) unsigned NOT NULL,
  `idtarjeta` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `tarjeta` char(50) NOT NULL,
  `fecha` char(8) NOT NULL,
  `importe` float(13,4) NOT NULL,
  `vencimiento` char(10) NOT NULL,
  `titular` char(100) NOT NULL,
  `codautoriz` char(10) NOT NULL,
  `iddetacobro` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idcupon`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cupones`
--

/*!40000 ALTER TABLE `cupones` DISABLE KEYS */;
/*!40000 ALTER TABLE `cupones` ENABLE KEYS */;


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
 (1,'Deposito Belgrano 1602','Belgrano 1602');
/*!40000 ALTER TABLE `depositos` ENABLE KEYS */;


--
-- Definition of table `destinooti`
--

DROP TABLE IF EXISTS `destinooti`;
CREATE TABLE `destinooti` (
  `destinooti` int(10) unsigned NOT NULL,
  `detalle` char(254) NOT NULL,
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
  `idfacturah` int(10) unsigned NOT NULL,
  `articulo` char(50) NOT NULL,
  `idconcepto` int(10) unsigned NOT NULL,
  `servicio` int(10) unsigned NOT NULL,
  `cantidad` float(13,4) NOT NULL,
  `unidad` char(10) NOT NULL,
  `cantidadfc` float(13,4) NOT NULL,
  `unidadfc` char(10) NOT NULL,
  `detalle` char(254) NOT NULL,
  `unitario` float(13,4) NOT NULL,
  `impuestos` float(13,4) NOT NULL,
  `total` float(13,4) NOT NULL,
  `codigocta` char(20) NOT NULL,
  `nombrecta` char(100) NOT NULL,
  `cuota` int(10) unsigned NOT NULL,
  `cantcuotas` int(10) unsigned NOT NULL,
  `padron` int(10) unsigned NOT NULL,
  `impuesto` int(10) unsigned NOT NULL,
  `razonimp` float(13,4) NOT NULL,
  `neto` float(13,4) NOT NULL,
  PRIMARY KEY (`idfacturah`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detafactu`
--

/*!40000 ALTER TABLE `detafactu` DISABLE KEYS */;
INSERT INTO `detafactu` (`idfactura`,`idfacturah`,`articulo`,`idconcepto`,`servicio`,`cantidad`,`unidad`,`cantidadfc`,`unidadfc`,`detalle`,`unitario`,`impuestos`,`total`,`codigocta`,`nombrecta`,`cuota`,`cantcuotas`,`padron`,`impuesto`,`razonimp`,`neto`) VALUES 
 (1,1,'0101001',0,0,5.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,106.0500,611.0500,'','',0,0,0,1,21.0000,505.0000),
 (2,2,'0101001',0,0,5.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,106.0500,611.0500,'','',0,0,0,1,21.0000,505.0000),
 (3,3,'0101001',0,0,5.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,106.0500,611.0500,'','',0,0,0,1,21.0000,505.0000),
 (4,4,'0101001',0,0,5.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,106.0500,611.0500,'','',0,0,0,1,21.0000,505.0000),
 (5,5,'0101001',0,0,5.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,106.0500,611.0500,'','',0,0,0,1,21.0000,505.0000),
 (6,6,'0101001',0,0,5.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,106.0500,611.0500,'','',0,0,0,1,21.0000,505.0000),
 (7,7,'0101001',0,0,5.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,106.0500,611.0500,'','',0,0,0,1,21.0000,505.0000),
 (8,8,'0101001',0,0,6.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,127.2600,733.2600,'','',0,0,0,1,21.0000,606.0000),
 (9,9,'0101001',0,0,6.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,127.2600,733.2600,'','',0,0,0,1,21.0000,606.0000),
 (10,10,'0101001',0,0,6.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,127.2600,733.2600,'','',0,0,0,1,21.0000,606.0000),
 (11,11,'0101001',0,0,6.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,127.2600,733.2600,'','',0,0,0,1,21.0000,606.0000),
 (12,12,'0101001',0,0,4.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,3.3600,407.3600,'','',0,0,0,1,21.0000,404.0000),
 (13,13,'0101001',0,0,4.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,84.8400,488.8400,'','',0,0,0,1,21.0000,404.0000),
 (14,14,'0101001',0,0,4.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,84.8400,488.8400,'','',0,0,0,1,21.0000,404.0000),
 (15,15,'0101001',0,0,6.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,127.2600,733.2600,'','',0,0,0,1,21.0000,606.0000),
 (16,16,'0101001',0,0,6.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,127.2600,733.2600,'','',0,0,0,1,21.0000,606.0000),
 (17,17,'0101001',0,0,6.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,127.2600,733.2600,'','',0,0,0,1,21.0000,606.0000),
 (18,18,'0101001',0,0,4.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,84.8400,488.8400,'','',0,0,0,1,21.0000,404.0000),
 (19,19,'0101001',0,0,5.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,106.0500,611.0500,'','',0,0,0,1,21.0000,505.0000),
 (20,20,'0101001',0,0,6.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,127.2600,733.2600,'','',0,0,0,1,21.0000,606.0000),
 (21,21,'0101001',0,0,4.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,84.8400,488.8400,'','',0,0,0,1,21.0000,404.0000),
 (22,22,'0101001',0,0,4.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,84.8400,488.8400,'','',0,0,0,1,21.0000,404.0000),
 (23,23,'0101001',0,0,4.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,84.8400,488.8400,'','',0,0,0,1,21.0000,404.0000),
 (24,24,'0101001',0,0,4.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,84.8400,488.8400,'','',0,0,0,1,21.0000,404.0000),
 (25,25,'0101001',0,0,4.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,84.8400,488.8400,'','',0,0,0,1,21.0000,404.0000),
 (26,26,'0101001',0,0,4.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,84.8400,488.8400,'','',0,0,0,1,21.0000,404.0000),
 (27,27,'0101002',0,0,5.0000,'UNIDADES',0.0000,'','Alambre de bajada PVC 2 x 0.81',102.0000,107.1000,617.1000,'','',0,0,0,1,21.0000,510.0000),
 (28,28,'0101001',0,0,5.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,106.0500,611.0500,'','',0,0,0,1,21.0000,505.0000),
 (29,29,'0101001',0,0,5.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,106.0500,611.0500,'','',0,0,0,1,21.0000,505.0000),
 (30,30,'0101001',0,0,5.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,106.0500,611.0500,'','',0,0,0,1,21.0000,505.0000),
 (31,31,'0101001',0,0,4.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,84.8400,488.8400,'','',0,0,0,1,21.0000,404.0000),
 (32,32,'0101001',0,0,2.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,42.4200,244.4200,'','',0,0,0,1,21.0000,202.0000),
 (33,33,'0101001',0,0,1.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,21.2100,122.2100,'','',0,0,0,1,21.0000,101.0000),
 (34,34,'0101001',0,0,3.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,63.6300,366.6300,'','',0,0,0,1,21.0000,303.0000),
 (35,35,'0101001',0,0,3.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,63.6300,366.6300,'','',0,0,0,1,21.0000,303.0000),
 (36,36,'0101001',0,0,2.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,42.4200,244.4200,'','',0,0,0,1,21.0000,202.0000),
 (37,37,'0101001',0,0,3.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,63.6300,366.6300,'','',0,0,0,1,21.0000,303.0000),
 (38,38,'0101001',0,0,2.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,42.4200,244.4200,'','',0,0,0,1,21.0000,202.0000),
 (39,39,'0101001',0,0,3.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,63.6300,366.6300,'','',0,0,0,1,21.0000,303.0000),
 (40,40,'0101001',0,0,3.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,63.6300,366.6300,'','',0,0,0,1,21.0000,303.0000),
 (41,41,'0101001',0,0,3.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,63.6300,366.6300,'','',0,0,0,1,21.0000,303.0000),
 (42,42,'0101001',0,0,3.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,63.6300,366.6300,'','',0,0,0,1,21.0000,303.0000),
 (43,43,'0101001',0,0,4.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,84.8400,488.8400,'','',0,0,0,1,21.0000,404.0000),
 (44,44,'0101002',0,0,3.0000,'UNIDADES',0.0000,'','Alambre de bajada PVC 2 x 0.81',102.0000,64.2600,370.2600,'','',0,0,0,1,21.0000,306.0000),
 (45,45,'0101001',0,0,3.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,63.6300,366.6300,'','',0,0,0,1,21.0000,303.0000),
 (46,46,'0101001',0,0,3.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,63.6300,366.6300,'','',0,0,0,1,21.0000,303.0000),
 (47,47,'0101001',0,0,2.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,42.4200,244.4200,'','',0,0,0,1,21.0000,202.0000),
 (48,48,'0101002',0,0,3.0000,'UNIDADES',0.0000,'','Alambre de bajada PVC 2 x 0.81',102.0000,64.2600,370.2600,'','',0,0,0,1,21.0000,306.0000),
 (48,49,'',0,0,0.0000,'',0.0000,'','',0.0000,0.0000,0.0000,'','',0,0,0,0,0.0000,0.0000),
 (49,50,'0101001',0,0,2.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,42.4200,244.4200,'','',0,0,0,1,21.0000,202.0000),
 (50,51,'0101001',0,0,2.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,42.4200,244.4200,'','',0,0,0,1,21.0000,202.0000),
 (51,52,'0101001',0,0,3.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,63.6300,366.6300,'','',0,0,0,1,21.0000,303.0000),
 (52,53,'0101001',0,0,2.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,42.4200,244.4200,'','',0,0,0,1,21.0000,202.0000),
 (53,54,'0101002',0,0,1.0000,'UNIDADES',0.0000,'','Alambre de bajada PVC 2 x 0.81',102.0000,21.4200,123.4200,'','',0,0,0,1,21.0000,102.0000),
 (54,55,'0101001',0,0,2.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,42.4200,244.4200,'','',0,0,0,1,21.0000,202.0000),
 (55,56,'0101001',0,0,3.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,63.6300,366.6300,'','',0,0,0,1,21.0000,303.0000),
 (56,57,'0101001',0,0,3.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,63.6300,366.6300,'','',0,0,0,1,21.0000,303.0000),
 (57,58,'0101001',0,0,2.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,42.4200,244.4200,'','',0,0,0,1,21.0000,202.0000),
 (58,59,'0101001',0,0,3.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,63.6300,366.6300,'','',0,0,0,1,21.0000,303.0000),
 (59,60,'0101002',0,0,2.0000,'UNIDADES',0.0000,'','Alambre de bajada PVC 2 x 0.81',102.0000,42.8400,246.8400,'','',0,0,0,1,21.0000,204.0000),
 (60,61,'0101002',0,0,2.0000,'UNIDADES',0.0000,'','Alambre de bajada PVC 2 x 0.81',102.0000,42.8400,246.8400,'','',0,0,0,1,21.0000,204.0000),
 (61,62,'0101001',0,0,2.0000,'UNIDADES',0.0000,'','Alambre de bajada c/autop.2 x 0.61',101.0000,42.4200,244.4200,'','',0,0,0,1,21.0000,202.0000);
/*!40000 ALTER TABLE `detafactu` ENABLE KEYS */;


--
-- Definition of table `detallecobros`
--

DROP TABLE IF EXISTS `detallecobros`;
CREATE TABLE `detallecobros` (
  `iddetacobro` int(10) unsigned NOT NULL,
  `idcomproba` int(10) unsigned NOT NULL,
  `idregistro` int(10) unsigned NOT NULL,
  `idtipopago` int(10) unsigned NOT NULL,
  `importe` float(13,4) NOT NULL,
  `idcuenta` int(10) unsigned NOT NULL,
  PRIMARY KEY (`iddetacobro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detallecobros`
--

/*!40000 ALTER TABLE `detallecobros` DISABLE KEYS */;
INSERT INTO `detallecobros` (`iddetacobro`,`idcomproba`,`idregistro`,`idtipopago`,`importe`,`idcuenta`) VALUES 
 (1,1,1,3,611.0500,0),
 (2,1,2,3,611.0500,0),
 (3,1,3,3,611.0500,0),
 (4,1,4,3,611.0500,0),
 (5,1,5,3,611.0500,0),
 (6,1,7,3,611.0500,0),
 (7,1,8,3,733.2600,0),
 (8,1,9,3,733.2600,0),
 (9,1,10,3,733.2600,0),
 (10,1,12,3,407.3600,0),
 (11,1,13,3,488.8400,0),
 (12,1,14,3,488.8400,0),
 (13,1,15,3,733.2600,0),
 (14,1,16,3,733.2600,0),
 (15,1,17,3,733.2600,0),
 (16,1,18,3,488.8400,0),
 (17,1,19,3,611.0500,0),
 (18,1,20,3,733.2600,0),
 (19,1,21,3,488.8400,0),
 (20,1,22,3,488.8400,0),
 (21,1,23,3,488.8400,0),
 (22,1,24,3,488.8400,0),
 (23,1,25,3,488.8400,0),
 (24,1,26,3,488.8400,0),
 (25,1,27,3,617.1000,0),
 (26,1,28,3,611.0500,0),
 (27,1,29,3,611.0500,0),
 (28,1,30,3,611.0500,0),
 (29,1,31,3,488.8400,0),
 (30,1,32,3,244.4200,0),
 (31,1,33,3,122.2100,0),
 (32,1,34,3,366.6300,0),
 (33,1,35,3,366.6300,0),
 (34,1,36,3,244.4200,0),
 (35,1,37,3,366.6300,0),
 (36,1,38,3,244.4200,0),
 (37,1,39,3,366.6300,0),
 (38,1,40,3,366.6300,0),
 (39,1,41,3,366.6300,0),
 (40,1,42,3,366.6300,0),
 (41,1,43,3,488.8400,0);
/*!40000 ALTER TABLE `detallecobros` ENABLE KEYS */;


--
-- Definition of table `detallepagos`
--

DROP TABLE IF EXISTS `detallepagos`;
CREATE TABLE `detallepagos` (
  `iddetapago` int(10) unsigned NOT NULL,
  `idcomproba` int(10) unsigned NOT NULL,
  `idregistro` int(10) unsigned NOT NULL,
  `idtipopago` int(10) unsigned NOT NULL,
  `importe` float(13,4) NOT NULL,
  `idcuenta` int(10) unsigned NOT NULL,
  PRIMARY KEY (`iddetapago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detallepagos`
--

/*!40000 ALTER TABLE `detallepagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallepagos` ENABLE KEYS */;


--
-- Definition of table `ejercicioecon`
--

DROP TABLE IF EXISTS `ejercicioecon`;
CREATE TABLE `ejercicioecon` (
  `ejercicio` int(10) unsigned NOT NULL,
  `anio` int(10) unsigned NOT NULL,
  `fechaini` char(8) NOT NULL,
  `fechafin` char(8) NOT NULL,
  `detalle` char(254) NOT NULL,
  `idplan` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ejercicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ejercicioecon`
--

/*!40000 ALTER TABLE `ejercicioecon` DISABLE KEYS */;
/*!40000 ALTER TABLE `ejercicioecon` ENABLE KEYS */;


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
 ('CoSeMar Coop. Ltda.','CoSeMar','20-22141497-8','IVA Responsable Inscripto','EXENTO','Belgrano 1602','1','19870331','03483 - 498200 / 498511','cosemar@cosemar.com.ar','www.cosemar.com.ar','imgcosemar.png');
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
 (1,'ROSSI','TULIO','Sistemas','','20221414978','Avellaneda 6737','3',2,'20150110','4693586','3000','4693586','trossi@cosemar.com.ar','www.cosemar.com.ar',22141497,'80','19711110'),
 (2,'Racca','Gaston Ramon Alberto','Encargado de Produccion','ALSAFEX S.A.','30712443347','Ruta 11 Km 486','4',1,'','342-4191679','6556','','gracca@alsafex.com.ar','www.alsafex.com.ar',0,'80',''),
 (3,'OLIVIERO','GERMAN','','','22232','PEDRO CENTENO','3',1,'','AAAAAD','3000','DSF','','',2121,'80',''),
 (4,'Bonet','Pablo','20334684734','','','Mitre','4',2,'20180216','','3018','','','',33468473,'80','19880409');
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
  `localidad` char(10) NOT NULL,
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
  `idconcepto` int(10) unsigned NOT NULL,
  `cuotasfact` int(10) unsigned NOT NULL,
  `nrocuotas` int(10) unsigned NOT NULL,
  `articulo` char(50) NOT NULL,
  `detalle` char(254) NOT NULL,
  `abreviado` char(50) NOT NULL,
  `unitario` float(13,4) NOT NULL,
  `neto` float(13,4) NOT NULL,
  `impuesto` float(13,4) NOT NULL,
  `total` float(13,4) NOT NULL,
  `unidad` char(50) NOT NULL,
  `funcion` char(100) DEFAULT NULL,
  `identidadh` int(10) unsigned NOT NULL,
  `identidadd` int(10) unsigned NOT NULL,
  `mensual` char(1) NOT NULL,
  `facturar` char(1) NOT NULL,
  `codigocta` char(20) NOT NULL,
  `padron` int(10) unsigned NOT NULL,
  `cantidad` float(13,4) NOT NULL,
  PRIMARY KEY (`identidadd`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entidadesd`
--

/*!40000 ALTER TABLE `entidadesd` DISABLE KEYS */;
INSERT INTO `entidadesd` (`idconcepto`,`cuotasfact`,`nrocuotas`,`articulo`,`detalle`,`abreviado`,`unitario`,`neto`,`impuesto`,`total`,`unidad`,`funcion`,`identidadh`,`identidadd`,`mensual`,`facturar`,`codigocta`,`padron`,`cantidad`) VALUES 
 (0,0,3,'0101001','Alambre de bajada c/autop.2 x 0.61','alambre de bajada',101.0000,101.0000,31.8200,132.8200,'unidades','',3,1,'N','S','0',0,1.0000);
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
  `idfactura` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idcuotasd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entidadesdc`
--

/*!40000 ALTER TABLE `entidadesdc` DISABLE KEYS */;
INSERT INTO `entidadesdc` (`idcuotasd`,`identidadd`,`nrocuota`,`fechavenc`,`neto`,`iva`,`cantcuotas`,`idfactura`) VALUES 
 (1,1,1,'20170201',44.2700,9.3000,3,0),
 (2,1,2,'20170301',44.2700,9.3000,3,0),
 (3,1,3,'20170401',44.2700,9.3000,3,0),
 (4,2,1,'20170310',24.4400,5.1300,5,0),
 (5,2,2,'20170410',24.4400,5.1300,5,0),
 (6,2,3,'20170510',24.4400,5.1300,5,0),
 (7,2,4,'20170610',24.4400,5.1300,5,0),
 (8,2,5,'20170710',24.4400,5.1300,5,0);
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
  PRIMARY KEY (`identidadh`) USING BTREE
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
  `idgrupoe` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `identidadh` int(10) unsigned NOT NULL,
  PRIMARY KEY (`identidadh`) USING BTREE
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
  PRIMARY KEY (`etiqueta`) USING BTREE
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
  `bocanumero` char(50) NOT NULL,
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
  `minarieex` float(13,4) NOT NULL,
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
  `idfactclaro` int(10) unsigned NOT NULL,
  `secuenciaf` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idfactclaro`) USING BTREE
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
  `idperiodo` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idperiodo`) USING BTREE
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
  `idfactprove` int(10) unsigned NOT NULL,
  `idtipocomp` int(10) unsigned NOT NULL,
  `tipo` char(3) NOT NULL,
  `actividad` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `entidad` int(10) unsigned NOT NULL,
  `apellido` char(254) NOT NULL,
  `nombre` char(254) NOT NULL,
  `cuit` char(13) NOT NULL,
  `dni` int(10) unsigned NOT NULL,
  `tipodoc` char(3) NOT NULL,
  `iva` int(10) unsigned NOT NULL,
  `condvta` int(10) unsigned NOT NULL,
  `nroremito` int(10) unsigned NOT NULL,
  `nropedido` int(10) unsigned NOT NULL,
  `neto` float(13,4) NOT NULL,
  `impuesto` float(13,4) NOT NULL,
  `exento` float(13,4) NOT NULL,
  `nograbado` float(13,4) NOT NULL,
  `total` float(13,4) NOT NULL,
  `fechacarga` char(8) NOT NULL,
  `fechaingreso` char(8) NOT NULL,
  PRIMARY KEY (`idfactprove`) USING BTREE
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
  `idfactprove` int(10) unsigned NOT NULL,
  `idfactproveh` int(10) unsigned NOT NULL,
  `articulo` char(50) NOT NULL,
  `codigoprov` char(50) NOT NULL,
  `cantidad` int(10) unsigned NOT NULL,
  `unidad` char(50) NOT NULL,
  `detalle` char(254) NOT NULL,
  `unitario` float(13,4) NOT NULL,
  `impuestos` float(13,4) NOT NULL,
  `total` float(13,4) NOT NULL,
  `impuesto` int(10) unsigned NOT NULL,
  `razon` float(13,4) NOT NULL,
  PRIMARY KEY (`idfactproveh`) USING BTREE
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
  `idfactprove` int(10) unsigned NOT NULL,
  `impuesto` int(10) unsigned NOT NULL,
  `detalle` char(254) NOT NULL,
  `neto` float(13,4) NOT NULL,
  `razon` float(13,4) NOT NULL,
  `importe` float(13,4) NOT NULL,
  PRIMARY KEY (`idfactprove`) USING BTREE
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
  `pventa` int(10) unsigned NOT NULL,
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
  `tipodoc` char(3) NOT NULL,
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
  `idperiodo` int(10) unsigned NOT NULL,
  `ruta1` int(10) unsigned NOT NULL,
  `folio1` int(10) unsigned NOT NULL,
  `ruta2` int(10) unsigned NOT NULL,
  `folio2` int(10) unsigned NOT NULL,
  `fechavenc1` char(8) NOT NULL,
  `fechavenc2` char(8) NOT NULL,
  `fechavenc3` char(8) NOT NULL,
  `proxvenc` char(8) NOT NULL,
  `confirmada` char(1) NOT NULL,
  `astoconta` int(10) unsigned NOT NULL,
  `deudacta` float(13,4) NOT NULL,
  `cespcae` char(100) NOT NULL,
  `caecespven` char(8) NOT NULL,
  `vendedor` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idfactura`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facturas`
--

/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` (`idfactura`,`idcomproba`,`pventa`,`numero`,`tipo`,`fecha`,`entidad`,`servicio`,`cuenta`,`apellido`,`nombre`,`direccion`,`localidad`,`iva`,`cuit`,`tipodoc`,`dni`,`telefono`,`cp`,`fax`,`email`,`transporte`,`nomtransp`,`direntrega`,`stock`,`condvta`,`neto`,`subtotal`,`descuento`,`recargo`,`total`,`totalimpu`,`operexenta`,`anulado`,`observa1`,`observa2`,`observa3`,`observa4`,`idperiodo`,`ruta1`,`folio1`,`ruta2`,`folio2`,`fechavenc1`,`fechavenc2`,`fechavenc3`,`proxvenc`,`confirmada`,`astoconta`,`deudacta`,`cespcae`,`caecespven`,`vendedor`) VALUES 
 (1,1,3,1,'A','20180308',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',505.0000,505.0000,0.0000,0.0000,611.0500,106.0500,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (2,1,3,1,'A','20180308',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',505.0000,505.0000,0.0000,0.0000,611.0500,106.0500,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (3,1,3,1,'A','20180308',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',505.0000,505.0000,0.0000,0.0000,611.0500,106.0500,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (4,1,3,1,'A','20180308',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',505.0000,505.0000,0.0000,0.0000,611.0500,106.0500,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (5,1,4,16,'A','20180308',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',505.0000,505.0000,0.0000,0.0000,611.0500,106.0500,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (6,1,4,17,'A','20180308',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',505.0000,505.0000,0.0000,0.0000,611.0500,106.0500,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (7,1,3,1,'A','20180309',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',505.0000,505.0000,0.0000,0.0000,611.0500,106.0500,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (8,1,3,1,'A','20180309',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',606.0000,606.0000,0.0000,0.0000,733.2600,127.2600,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (9,1,3,1,'A','20180309',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',606.0000,606.0000,0.0000,0.0000,733.2600,127.2600,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (10,1,4,19,'A','20180309',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',606.0000,606.0000,0.0000,0.0000,733.2600,127.2600,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (11,1,4,20,'A','20180309',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',606.0000,606.0000,0.0000,0.0000,733.2600,127.2600,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (12,1,4,1,'A','20180309',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',404.0000,404.0000,0.0000,0.0000,407.3600,3.3600,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (13,1,4,21,'A','20180309',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',404.0000,404.0000,0.0000,0.0000,488.8400,84.8400,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (14,1,4,22,'A','20180309',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',404.0000,404.0000,0.0000,0.0000,488.8400,84.8400,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (15,1,4,23,'A','20180309',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',606.0000,606.0000,0.0000,0.0000,733.2600,127.2600,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (16,1,4,24,'A','20180309',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',606.0000,606.0000,0.0000,0.0000,733.2600,127.2600,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (17,1,4,25,'A','20180309',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',606.0000,606.0000,0.0000,0.0000,733.2600,127.2600,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (18,1,4,26,'A','20180309',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',404.0000,404.0000,0.0000,0.0000,488.8400,84.8400,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (19,1,4,27,'A','20180309',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',505.0000,505.0000,0.0000,0.0000,611.0500,106.0500,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (20,1,4,28,'A','20180309',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',606.0000,606.0000,0.0000,0.0000,733.2600,127.2600,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (21,1,4,29,'A','20180309',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',404.0000,404.0000,0.0000,0.0000,488.8400,84.8400,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (22,1,4,30,'A','20180309',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',404.0000,404.0000,0.0000,0.0000,488.8400,84.8400,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (23,1,4,31,'A','20180309',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',404.0000,404.0000,0.0000,0.0000,488.8400,84.8400,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (24,1,4,32,'A','20180309',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',404.0000,404.0000,0.0000,0.0000,488.8400,84.8400,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (25,1,4,1,'A','20180310',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',404.0000,404.0000,0.0000,0.0000,488.8400,84.8400,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (26,1,4,1,'A','20180310',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',404.0000,404.0000,0.0000,0.0000,488.8400,84.8400,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (27,1,4,33,'A','20180310',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',510.0000,510.0000,0.0000,0.0000,617.1000,107.1000,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (28,1,4,34,'A','20180310',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',505.0000,505.0000,0.0000,0.0000,611.0500,106.0500,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (29,1,4,35,'A','20180312',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',505.0000,505.0000,0.0000,0.0000,611.0500,106.0500,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (30,1,4,36,'A','20180312',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',505.0000,505.0000,0.0000,0.0000,611.0500,106.0500,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (31,1,4,37,'A','20180312',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',404.0000,404.0000,0.0000,0.0000,488.8400,84.8400,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (32,1,4,38,'A','20180312',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',202.0000,202.0000,0.0000,0.0000,244.4200,42.4200,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (33,1,4,39,'A','20180313',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',101.0000,101.0000,0.0000,0.0000,122.2100,21.2100,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (34,1,4,40,'A','20180313',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',303.0000,303.0000,0.0000,0.0000,366.6300,63.6300,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (35,1,4,41,'A','20180313',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',303.0000,303.0000,0.0000,0.0000,366.6300,63.6300,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (36,1,4,42,'A','20180313',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',202.0000,202.0000,0.0000,0.0000,244.4200,42.4200,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (37,1,4,43,'A','20180313',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',303.0000,303.0000,0.0000,0.0000,366.6300,63.6300,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (38,1,4,44,'A','20180313',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',202.0000,202.0000,0.0000,0.0000,244.4200,42.4200,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (39,1,4,45,'A','20180313',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',303.0000,303.0000,0.0000,0.0000,366.6300,63.6300,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (40,1,4,46,'A','20180313',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',303.0000,303.0000,0.0000,0.0000,366.6300,63.6300,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (41,1,4,47,'A','20180313',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',303.0000,303.0000,0.0000,0.0000,366.6300,63.6300,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (42,1,4,48,'A','20180313',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',303.0000,303.0000,0.0000,0.0000,366.6300,63.6300,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (43,1,4,49,'A','20180313',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',404.0000,404.0000,0.0000,0.0000,488.8400,84.8400,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (44,1,4,1,'A','20180315',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',306.0000,306.0000,0.0000,0.0000,370.2600,64.2600,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (45,1,4,1,'A','20180315',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',303.0000,303.0000,0.0000,0.0000,366.6300,63.6300,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (46,1,4,1,'A','20180315',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',303.0000,303.0000,0.0000,0.0000,366.6300,63.6300,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (47,1,4,1,'A','20180315',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',202.0000,202.0000,0.0000,0.0000,244.4200,42.4200,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (48,4,4,44,'A','20180316',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',306.0000,306.0000,0.0000,0.0000,370.2600,64.2600,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (49,4,4,44,'A','20180316',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',202.0000,202.0000,0.0000,0.0000,244.4200,42.4200,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (50,4,4,44,'A','20180316',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',202.0000,202.0000,0.0000,0.0000,244.4200,42.4200,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (51,4,4,44,'A','20180316',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',303.0000,303.0000,0.0000,0.0000,366.6300,63.6300,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (52,4,4,44,'A','20180316',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',202.0000,202.0000,0.0000,0.0000,244.4200,42.4200,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (53,4,4,44,'A','20180316',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',102.0000,102.0000,0.0000,0.0000,123.4200,21.4200,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (54,1,4,1,'A','20180316',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',202.0000,202.0000,0.0000,0.0000,244.4200,42.4200,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (55,1,4,2,'A','20180316',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',303.0000,303.0000,0.0000,0.0000,366.6300,63.6300,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (56,1,4,3,'A','20180316',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',303.0000,303.0000,0.0000,0.0000,366.6300,63.6300,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (57,1,4,4,'A','20180316',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',202.0000,202.0000,0.0000,0.0000,244.4200,42.4200,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (58,1,4,5,'A','20180316',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',303.0000,303.0000,0.0000,0.0000,366.6300,63.6300,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (59,1,4,6,'A','20180316',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',204.0000,204.0000,0.0000,0.0000,246.8400,42.8400,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (60,1,4,7,'A','20180316',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',204.0000,204.0000,0.0000,0.0000,246.8400,42.8400,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1),
 (61,1,4,8,'A','20180316',1,0,0,'ROSSI','TULIO','Avellaneda 6737','3',2,'20221414978','80',22141497,'4693586','3000','4693586','trossi@cosemar.com.ar',4,'Bonet Pablo','Avellaneda 6737','','',202.0000,202.0000,0.0000,0.0000,244.4200,42.4200,'','N','','','','',0,0,0,0,0,'','','','','',0,0.0000,'','',1);
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;


--
-- Definition of table `facturasanul`
--

DROP TABLE IF EXISTS `facturasanul`;
CREATE TABLE `facturasanul` (
  `idfactura` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `cuota` int(10) unsigned NOT NULL,
  `cancuotas` int(10) unsigned NOT NULL,
  `totalfc` float(13,4) NOT NULL,
  `importe` float(13,4) NOT NULL,
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
  `numerofe` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idfe`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facturasfe`
--

/*!40000 ALTER TABLE `facturasfe` DISABLE KEYS */;
INSERT INTO `facturasfe` (`idfe`,`idfactura`,`fecha`,`resultado`,`caecesp`,`caecespven`,`caecespfec`,`pathpdffe`,`idtipofe`,`idtranafip`,`observa`,`coderror`,`numerofe`) VALUES 
 (1,5,'20180308','A','68107639037495','20180318','','',0,0,'','',16),
 (2,6,'20180308','A','68107639037877','20180318','','',0,0,'','',17),
 (3,10,'20180309','A','68107639198933','20180319','','',0,0,'','',19),
 (4,11,'20180309','A','68107639201091','20180319','','',0,0,'','',20),
 (6,13,'20180309','A','68107639202709','20180319','','',0,0,'','',21),
 (7,14,'20180309','A','68107639202990','20180319','','',0,0,'','',22),
 (8,15,'20180309','A','68107639203475','20180319','','',0,0,'','',23),
 (9,16,'20180309','A','68107639203755','20180319','','',0,0,'','',24),
 (10,17,'20180309','A','68107639203988','20180319','','',0,0,'','',25),
 (11,18,'20180309','A','68107639204387','20180319','','',0,0,'','',26),
 (12,19,'20180309','A','68107639205008','20180319','','',0,0,'','',27),
 (13,20,'20180309','A','68107639205257','20180319','','',0,0,'','',28),
 (14,21,'20180309','A','68107639205508','20180319','','',0,0,'','',29),
 (15,22,'20180309','A','68107639207393','20180319','','',0,0,'','',30),
 (16,23,'20180309','A','68107639207893','20180319','','',0,0,'','',31),
 (17,24,'20180309','A','68107639208085','20180319','','',0,0,'','',32),
 (18,27,'20180310','A','68107639224469','20180320','','',0,0,'','',33),
 (19,28,'20180310','A','68107639224689','20180320','','',0,0,'','',34),
 (20,29,'20180312','A','68117639499506','20180322','','',0,0,'','',35),
 (21,30,'20180312','A','68117639500324','20180322','','',0,0,'','',36),
 (22,31,'20180312','A','68117639500882','20180322','','',0,0,'','',37),
 (23,32,'20180312','A','68117639501090','20180322','','',0,0,'','',38),
 (24,33,'20180313','A','68117639658552','20180323','','',0,0,'','',39),
 (25,34,'20180313','A','68117639658934','20180323','','',0,0,'','',40),
 (26,35,'20180313','A','68117639659113','20180323','','',0,0,'','',41),
 (27,36,'20180313','A','68117639659286','20180323','','',0,0,'','',42),
 (28,37,'20180313','A','68117639660329','20180323','','',0,0,'','',43),
 (29,38,'20180313','A','68117639661993','20180323','','',0,0,'','',44),
 (30,39,'20180313','A','68117639662245','20180323','','',0,0,'','',45),
 (31,40,'20180313','A','68117639664776','20180323','','',0,0,'','',46),
 (32,41,'20180313','A','68117639665984','20180323','','',0,0,'','',47),
 (33,42,'20180313','A','68117639666516','20180323','','',0,0,'','',48),
 (34,43,'20180313','A','68117639667606','20180323','','',0,0,'','',49),
 (35,54,'20180316','A','68117640042706','20180326','','',0,0,'','',1),
 (36,55,'20180316','A','68117640042748','20180326','','',0,0,'','',2),
 (37,56,'20180316','A','68117640042777','20180326','','',0,0,'','',3),
 (38,57,'20180316','A','68117640042866','20180326','','',0,0,'','',4),
 (39,58,'20180316','A','68117640042882','20180326','','',0,0,'','',5),
 (40,59,'20180316','A','68117640042895','20180326','','',0,0,'','',6),
 (41,60,'20180316','A','68117640042926','20180326','','',0,0,'','',7),
 (42,61,'20180316','A','68117640042942','20180326','','',0,0,'','',8);
/*!40000 ALTER TABLE `facturasfe` ENABLE KEYS */;


--
-- Definition of table `facturasimp`
--

DROP TABLE IF EXISTS `facturasimp`;
CREATE TABLE `facturasimp` (
  `idfactura` int(10) unsigned NOT NULL,
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
INSERT INTO `facturasimp` (`idfactura`,`impuesto`,`detalle`,`neto`,`razon`,`importe`) VALUES 
 (1,1,'IVA 21%',505.0000,21.0000,106.0500),
 (2,1,'IVA 21%',505.0000,21.0000,106.0500),
 (3,1,'IVA 21%',505.0000,21.0000,106.0500),
 (4,1,'IVA 21%',505.0000,21.0000,106.0500),
 (5,1,'IVA 21%',505.0000,21.0000,106.0500),
 (6,1,'IVA 21%',505.0000,21.0000,106.0500),
 (7,1,'IVA 21%',505.0000,21.0000,106.0500),
 (8,1,'IVA 21%',606.0000,21.0000,127.2600),
 (9,1,'IVA 21%',606.0000,21.0000,127.2600),
 (10,1,'IVA 21%',606.0000,21.0000,127.2600),
 (11,1,'IVA 21%',606.0000,21.0000,127.2600),
 (12,1,'IVA 21%',404.0000,21.0000,3.3600),
 (13,1,'IVA 21%',404.0000,21.0000,84.8400),
 (14,1,'IVA 21%',404.0000,21.0000,84.8400),
 (15,1,'IVA 21%',606.0000,21.0000,127.2600),
 (16,1,'IVA 21%',606.0000,21.0000,127.2600),
 (17,1,'IVA 21%',606.0000,21.0000,127.2600),
 (18,1,'IVA 21%',404.0000,21.0000,84.8400),
 (19,1,'IVA 21%',505.0000,21.0000,106.0500),
 (20,1,'IVA 21%',606.0000,21.0000,127.2600),
 (21,1,'IVA 21%',404.0000,21.0000,84.8400),
 (22,1,'IVA 21%',404.0000,21.0000,84.8400),
 (23,1,'IVA 21%',404.0000,21.0000,84.8400),
 (24,1,'IVA 21%',404.0000,21.0000,84.8400),
 (25,1,'IVA 21%',404.0000,21.0000,84.8400),
 (26,1,'IVA 21%',404.0000,21.0000,84.8400),
 (27,1,'IVA 21%',510.0000,21.0000,107.1000),
 (28,1,'IVA 21%',505.0000,21.0000,106.0500),
 (29,1,'IVA 21%',505.0000,21.0000,106.0500),
 (30,1,'IVA 21%',505.0000,21.0000,106.0500),
 (31,1,'IVA 21%',404.0000,21.0000,84.8400),
 (32,1,'IVA 21%',202.0000,21.0000,42.4200),
 (33,1,'IVA 21%',101.0000,21.0000,21.2100),
 (34,1,'IVA 21%',303.0000,21.0000,63.6300),
 (35,1,'IVA 21%',303.0000,21.0000,63.6300),
 (36,1,'IVA 21%',202.0000,21.0000,42.4200),
 (37,1,'IVA 21%',303.0000,21.0000,63.6300),
 (38,1,'IVA 21%',202.0000,21.0000,42.4200),
 (39,1,'IVA 21%',303.0000,21.0000,63.6300),
 (40,1,'IVA 21%',303.0000,21.0000,63.6300),
 (41,1,'IVA 21%',303.0000,21.0000,63.6300),
 (42,1,'IVA 21%',303.0000,21.0000,63.6300),
 (43,1,'IVA 21%',404.0000,21.0000,84.8400),
 (44,1,'IVA 21%',306.0000,21.0000,64.2600),
 (45,1,'IVA 21%',303.0000,21.0000,63.6300),
 (46,1,'IVA 21%',303.0000,21.0000,63.6300),
 (47,1,'IVA 21%',202.0000,21.0000,42.4200),
 (48,1,'IVA 21%',306.0000,21.0000,64.2600),
 (49,1,'IVA 21%',202.0000,21.0000,42.4200),
 (50,1,'IVA 21%',202.0000,21.0000,42.4200),
 (51,1,'IVA 21%',303.0000,21.0000,63.6300),
 (52,1,'IVA 21%',202.0000,21.0000,42.4200),
 (53,1,'IVA 21%',102.0000,21.0000,21.4200),
 (54,1,'IVA 21%',202.0000,21.0000,42.4200),
 (55,1,'IVA 21%',303.0000,21.0000,63.6300),
 (56,1,'IVA 21%',303.0000,21.0000,63.6300),
 (57,1,'IVA 21%',202.0000,21.0000,42.4200),
 (58,1,'IVA 21%',303.0000,21.0000,63.6300),
 (59,1,'IVA 21%',204.0000,21.0000,42.8400),
 (60,1,'IVA 21%',204.0000,21.0000,42.8400),
 (61,1,'IVA 21%',202.0000,21.0000,42.4200);
/*!40000 ALTER TABLE `facturasimp` ENABLE KEYS */;


--
-- Definition of table `facturasrec`
--

DROP TABLE IF EXISTS `facturasrec`;
CREATE TABLE `facturasrec` (
  `idfactura` int(10) unsigned NOT NULL,
  `recneto` float(13,4) NOT NULL,
  `impuesto` float(13,4) NOT NULL,
  `total` float(13,4) NOT NULL,
  `razon` float(13,4) NOT NULL
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
INSERT INTO `gruposepelio` (`dni`,`tipodoc`,`apellido`,`nombre`,`fechanac`,`parentesco`,`fechaalta`,`fechabaja`,`diasvigen`,`sexo`,`identidadh`,`idgruposep`) VALUES 
 (38374141,'1','CARRION','FEDERICO','19940713','AMIGO','20170125','20170125',0,'M',3,1);
/*!40000 ALTER TABLE `gruposepelio` ENABLE KEYS */;


--
-- Definition of table `impuestos`
--

DROP TABLE IF EXISTS `impuestos`;
CREATE TABLE `impuestos` (
  `impuesto` int(10) unsigned NOT NULL,
  `detalle` char(254) NOT NULL,
  `razon` float(13,4) NOT NULL,
  `formula` char(150) DEFAULT NULL,
  `abrevia` char(150) NOT NULL,
  `baseimpon` float(13,4) NOT NULL,
  `cantidad` float(13,4) NOT NULL,
  `idafipimp` int(10) unsigned NOT NULL,
  PRIMARY KEY (`impuesto`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `impuestos`
--

/*!40000 ALTER TABLE `impuestos` DISABLE KEYS */;
INSERT INTO `impuestos` (`impuesto`,`detalle`,`razon`,`formula`,`abrevia`,`baseimpon`,`cantidad`,`idafipimp`) VALUES 
 (1,'IVA 21%',21.0000,'','IVA',500.0000,1.0000,5),
 (2,'IVA 10.5%',10.5000,'','IVA',1000.0000,1.0000,4),
 (3,'DESCUENTO POR PAGO EN TERMINO',10.0000,'TOTAL * 10%','DESCUENTO',0.0000,1.0000,0);
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
  `importe` float(13,4) NOT NULL,
  `facturado` char(1) NOT NULL,
  `facturar` char(1) NOT NULL,
  `codigocta` char(20) NOT NULL,
  `observa` char(254) NOT NULL,
  `idfactura` int(10) unsigned NOT NULL,
  `identidadh` int(10) unsigned NOT NULL,
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
  `dni` int(10) unsigned NOT NULL,
  `actanro` char(20) NOT NULL,
  `nrosolicitud` char(20) NOT NULL,
  `capsusc` float(13,4) NOT NULL,
  `capemiti` float(13,4) NOT NULL,
  `capinteg` float(13,4) NOT NULL,
  `fechabaja` char(8) NOT NULL,
  `causabaja` char(8) NOT NULL,
  `observa` char(254) NOT NULL,
  `idlibrosoc` int(10) unsigned NOT NULL,
  `identidadh` int(10) unsigned NOT NULL,
  `cuit` char(13) NOT NULL,
  `tipodoc` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idlibrosoc`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `librosocios`
--

/*!40000 ALTER TABLE `librosocios` DISABLE KEYS */;
/*!40000 ALTER TABLE `librosocios` ENABLE KEYS */;


--
-- Definition of table `librosociosdeta`
--

DROP TABLE IF EXISTS `librosociosdeta`;
CREATE TABLE `librosociosdeta` (
  `idlibrosoc` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `capemiti` float(13,4) NOT NULL,
  `capinteg` float(13,4) NOT NULL,
  `idcomproba` int(10) unsigned NOT NULL,
  `idregicomp` int(10) unsigned NOT NULL,
  `detalle` char(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `librosociosdeta`
--

/*!40000 ALTER TABLE `librosociosdeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `librosociosdeta` ENABLE KEYS */;


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
  `articulo` char(50) NOT NULL,
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
INSERT INTO `listapreciop` (`idlista`,`detalle`,`fechaalta`,`vigedesde`,`vigehasta`,`margen`,`condvta`) VALUES 
 (1,'LISTA 0','20180220','20180220','21000101',0.0000,0);
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
  `consumo` int(10) unsigned NOT NULL,
  `ruta1` int(10) unsigned NOT NULL,
  `folio1` int(10) unsigned NOT NULL,
  `ruta2` int(10) unsigned NOT NULL,
  `folio2` int(10) unsigned NOT NULL,
  `facturado` char(1) NOT NULL,
  `facturar` char(1) NOT NULL,
  `idfactura` int(10) unsigned NOT NULL,
  `idmedagua` int(10) unsigned NOT NULL,
  `identidadh` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idmedagua`) USING BTREE
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
  `idmedluz` int(10) unsigned NOT NULL,
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
  `identidadh` int(10) unsigned NOT NULL,
  `bocanumero` char(50) NOT NULL,
  `secuencia` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idmedluz`) USING BTREE
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
  `consumo` float(13,4) NOT NULL,
  `pulddn1` int(10) unsigned NOT NULL,
  `pulddn2` int(10) unsigned NOT NULL,
  `pesos_n` float(13,4) NOT NULL,
  `pesos_r` float(13,4) NOT NULL,
  `pesos` float(13,4) NOT NULL,
  `canddn1` int(10) unsigned NOT NULL,
  `durddn1` int(10) unsigned NOT NULL,
  `pesosddn1` float(13,4) NOT NULL,
  `canddn2` int(10) unsigned NOT NULL,
  `durddn2` int(10) unsigned NOT NULL,
  `pesosddn2` float(13,4) NOT NULL,
  `canddi1` int(10) unsigned NOT NULL,
  `durddi1` int(10) unsigned NOT NULL,
  `pesosddi1` float(13,4) NOT NULL,
  `canddi2` int(10) unsigned NOT NULL,
  `durddi2` int(10) unsigned NOT NULL,
  `pesosddi2` float(13,4) NOT NULL,
  `canloc1` int(10) unsigned NOT NULL,
  `durloc1` int(10) unsigned NOT NULL,
  `pesosloc1` float(13,4) NOT NULL,
  `canloc2` int(10) unsigned NOT NULL,
  `durloc2` int(10) unsigned NOT NULL,
  `pesosloc2` float(13,4) NOT NULL,
  `facturado` char(1) NOT NULL,
  `idfactura` int(10) unsigned NOT NULL,
  `idmedtele` int(10) unsigned NOT NULL,
  `identidadh` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idmedtele`) USING BTREE
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
  PRIMARY KEY (`idmenu`,`codigo`) USING BTREE,
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
 (4,0,'P','03000000000000','Otros','','','','N','N','S','03','admin','2016012712:50:15',1,''),
 (6,1,'H','01090000000000','Localidades','','DO FORM localidadesabm','2','S','S','S','01','admin','2016062510:46:30',1,''),
 (7,1,'H','01120000000000','Monedas','','DO FORM monedasabm','3','S','S','S','01','admin','2016062510:02:38',1,'ORDERS.ICO'),
 (8,1,'H','01080000000000','Zonas','','DO FORM zonasabm','4','S','S','S','01','admin','2016012718:14:42',1,''),
 (9,1,'H','01070000000000','Vendedores','','DO FORM vendedoresabm','5','S','S','S','01','admin','2016062510:00:14',1,'EMPLY.ICO'),
 (10,0,'P','04000000000000','Contabilidad','','','','N','N','S','04','admin','2016030610:36:53',1,''),
 (12,1,'H','01370000000000','\\-','','','','N','N','S','05','admin','2016030610:51:06',1,''),
 (13,1,'H','01380000000000','Salir                               Alt+F4','','SALIRMENU()','','S','S','S','01','admin','2016062420:45:28',1,'CERRAR.PNG'),
 (14,0,'P','05000000000000','Ayuda','','','','N','N','S','05','admin','2016030612:09:53',1,''),
 (15,14,'H','05010000000000','Info.Sistema...','','DO FORM infosistema','','S','S','S','05','admin','2016030612:10:47',1,''),
 (16,1,'H','01110000000000','Paises','','DO FORM paisesabm','6','S','S','S','01','admin','2016012713:14:18',1,''),
 (17,1,'H','01340000000000','Iconos','','DO FORM iconosabm','7','S','S','S','01','admin','2016062510:05:54',1,'FACE03.ICO'),
 (18,1,'H','01320000000000','Biblioteca de Función','','DO FORM bibliotecafabm','8','S','S','S','01','admin','2016052021:15:00',1,''),
 (19,1,'H','01040000000000','Sucursales','','DO FORM sucursalesabm','9','S','S','S','01','admin','2016052115:24:00',1,''),
 (20,1,'H','01330000000000','Modulos del Sistema','','DO FORM modulossysabm','10','S','S','S','01','admin','2016052116:38:00',1,''),
 (21,1,'H','01030000000000','Empresas','','DO FORM empresasabm','11','S','S','S','01','admin','2016052721:55:00',1,''),
 (22,1,'H','01150000000000','Condiciones Fiscales','','DO FORM condfiscalabm','12','S','S','S','01','admin','2016052809:43:00',1,''),
 (23,1,'H','01140000000000','Impuestos','','DO FORM impuestosabm','13','S','S','S','01','admin','2016052811:52:00',1,''),
 (24,1,'H','01130000000000','Servicios','','DO FORM serviciosabm2','14','S','S','S','01','admin','2016052817:17:00',1,''),
 (25,1,'H','01220000000000','Lineas','','DO FORM lineasabm','15','S','S','S','01','admin','2016061117:14:00',1,''),
 (26,1,'H','01100000000000','Provincias','','DO FORM provinciasabm','','S','S','S','01','admin','2016062510:51:36',1,''),
 (27,1,'H','01050000000000','\\-','','','','S','S','S','01','admin','2016062510:58:52',1,''),
 (28,1,'H','01310000000000','\\-','','','','S','S','S','01','admin','2016062511:00:16',1,''),
 (29,1,'H','01350000000000','Seteo ToolBar Sys','','DO FORM toolbarsysabm','','S','S','S','01','admin','2016062601:40:20',1,''),
 (30,1,'H','01060000000000','Clientes-Proveedores','','DO FORM entidades','','S','S','S','01','admin','2016062900:05:11',1,'EMPLY.ICO'),
 (31,1,'H','01200000000000','Artículos','','DO FORM articulos','','S','S','S','01','admin','2016070212:00:11',1,'WZPRINT.BMP'),
 (32,1,'H','01160000000000','\\-','','','','S','S','S','01','admin','2016070212:01:40',1,''),
 (33,10,'H','04010000000000','Freddy Rossi','','DO FORM entidades','','S','S','S','04','admin','2016070219:09:22',1,'FACE03.ICO'),
 (34,1,'H','01180000000000','Depositos','','DO FORM depositos','','S','S','S','01','admin','2016071614:21:33',1,''),
 (35,1,'H','01170000000000','Conceptos','','DO FORM conceptoser','','S','S','S','01','admin','2016071816:17:25',1,''),
 (36,1,'H','01230000000000','Tipos de Movimientos de Stock','','DO FORM tipomstock','','S','S','S','01','admin','2016072021:19:29',1,''),
 (37,1,'H','01190000000000','Puntos de Venta','','DO FORM puntosventa','','S','S','S','01','admin','2016110509:59:05',1,''),
 (38,1,'H','01260000000000','Tipos de Comprobantes','','DO FORM tipocompro','','S','S','S','01','admin','2016122113:56:00',1,''),
 (39,1,'H','01210000000000','Comprobantes','','DO FORM comprobantes','','S','S','S','01','admin','2017010910:29:43',1,''),
 (40,1,'H','01240000000000','Ajuste de Stock','','DO FORM ajustestockp WITH \"0\"','','S','S','S','01','admin','2017020221:53:08',1,''),
 (41,1,'H','01250000000000','Consulta Movimientos de Stock','','DO FORM consultastock','','S','S','S','01','admin','2017072412:10:44',1,''),
 (42,1,'H','01280000000000','OT Monedas','','DO FORM otmonedas','','S','S','S','01','admin','2017101210:05:15',1,''),
 (43,1,'H','01270000000000','OT Lineas de Materiales','','DO FORM otlineasmat','','S','S','S','01','admin','2017101210:04:48',1,''),
 (44,1,'H','01290000000000','OT Tipos de Movimientos','','DO FORM ottiposmovi','','S','S','S','01','admin','2017101218:43:06',1,''),
 (45,1,'H','01300000000000','OT Etapas','','DO FORM otetapas','','S','S','S','01','admin','2017101311:49:58',1,''),
 (47,4,'H','03010000000000','Indices','','DO FORM tablasidx','','S','S','S','03','admin','2018022819:45:48',1,''),
 (48,0,'P','02000000000000','Facturación','','','','N','N','S','06','admin','2018031011:37:51',1,''),
 (49,48,'H','02010000000000','Facturar','','DO FORM facturas WITH \"0\"','','S','S','S','06','admin','2018031011:40:17',1,'');
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
  `operacion` int(10) unsigned NOT NULL,
  `idtipomov` int(10) unsigned NOT NULL
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
  `numero` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `hora` char(8) NOT NULL,
  `usuario` char(15) NOT NULL,
  `vendedor` int(10) unsigned NOT NULL,
  `transporte` int(10) unsigned NOT NULL,
  `nombretran` char(254) NOT NULL,
  `entidad` int(10) unsigned NOT NULL,
  `nombre` char(254) NOT NULL,
  `observa` char(254) NOT NULL,
  `sector` int(10) unsigned NOT NULL,
  `idtiponp` int(10) unsigned NOT NULL,
  `idcomproba` int(10) unsigned NOT NULL,
  `pventa` int(10) unsigned NOT NULL,
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
  `idtipoot` int(10) unsigned NOT NULL,
  `articulo` char(50) NOT NULL,
  `detalle` char(254) NOT NULL,
  `cantidad` float(13,4) NOT NULL,
  `unidad` char(50) NOT NULL,
  `unitario` float(13,4) NOT NULL,
  `anulada` char(1) NOT NULL,
  `observa` char(254) NOT NULL,
  `fechaentre` char(8) NOT NULL,
  `cantidadfc` float(13,4) NOT NULL,
  `unidadfc` char(50) NOT NULL,
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
  PRIMARY KEY (`idotcumpleh`) USING BTREE
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
  PRIMARY KEY (`idotcumple`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otcumplep`
--

/*!40000 ALTER TABLE `otcumplep` DISABLE KEYS */;
/*!40000 ALTER TABLE `otcumplep` ENABLE KEYS */;


--
-- Definition of table `otdepositos`
--

DROP TABLE IF EXISTS `otdepositos`;
CREATE TABLE `otdepositos` (
  `iddepo` int(10) unsigned NOT NULL,
  `detalle` char(50) NOT NULL,
  PRIMARY KEY (`iddepo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otdepositos`
--

/*!40000 ALTER TABLE `otdepositos` DISABLE KEYS */;
INSERT INTO `otdepositos` (`iddepo`,`detalle`) VALUES 
 (1,'DEPOSITO GENERAL ENTREPISO');
/*!40000 ALTER TABLE `otdepositos` ENABLE KEYS */;


--
-- Definition of table `otdetaot`
--

DROP TABLE IF EXISTS `otdetaot`;
CREATE TABLE `otdetaot` (
  `idpedido` int(10) unsigned NOT NULL,
  `idot` int(10) unsigned NOT NULL,
  `idotdet` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `codigomat` char(20) NOT NULL,
  `descrip` char(200) NOT NULL,
  `cantidad` float(13,2) NOT NULL,
  `impuni` float(13,2) NOT NULL,
  `imptotal` float(13,2) NOT NULL,
  `idmate` int(10) unsigned NOT NULL,
  `fechai` char(8) NOT NULL,
  `horai` char(8) NOT NULL,
  `fechaf` char(8) NOT NULL,
  `horaf` char(8) NOT NULL,
  `tiemest` char(20) NOT NULL DEFAULT '',
  `unidad` char(10) NOT NULL,
  `cantm2` float(13,2) NOT NULL,
  `observa` char(200) NOT NULL,
  `idmoneda` int(10) unsigned NOT NULL,
  `moneda` char(50) NOT NULL,
  `cotizacion` float(13,2) NOT NULL,
  `fechacot` char(8) NOT NULL,
  `idetapa` int(10) unsigned NOT NULL,
  `etapa` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otdetaot`
--

/*!40000 ALTER TABLE `otdetaot` DISABLE KEYS */;
INSERT INTO `otdetaot` (`idpedido`,`idot`,`idotdet`,`fecha`,`codigomat`,`descrip`,`cantidad`,`impuni`,`imptotal`,`idmate`,`fechai`,`horai`,`fechaf`,`horaf`,`tiemest`,`unidad`,`cantm2`,`observa`,`idmoneda`,`moneda`,`cotizacion`,`fechacot`,`idetapa`,`etapa`) VALUES 
 (1,1,1,'20170722','D1001','MELAMINA SOBRE MDF 18 MM BLANCO FAPLAC',4.00,453.69,1814.76,2,'20170723','103000','20170724','110000','1008','PLACA',0.00,'ESPERAR A QUE LLEGUE EL MATERIAL',1,'PESO',1.00,'20140101',3,'CORTE Y MECANIZADO'),
 (1,2,2,'20140826','D1002','MELAMINA SOBRE MDF 18 MM BLANCO FAPLAC 25%',20.00,200.00,4000.00,3,'','','','','','M2',0.00,'',1,'PESO',1.00,'20140101',0,''),
 (1,1,3,'20140826','D1001','MELAMINA SOBRE MDF 18 MM BLANCO FAPLAC',2.00,453.69,907.38,2,'','','','','','PLACA',0.00,'',1,'PESO',1.00,'20140101',0,''),
 (1,1,17,'20170721','21005','BISAGRA CIERRE SUAVE 35 MM CODO 9',10.00,13.10,131.00,196,'','','','','','UDS',0.00,'',1,'PESO',1.00,'20140101',0,'');
/*!40000 ALTER TABLE `otdetaot` ENABLE KEYS */;


--
-- Definition of table `otdocumento`
--

DROP TABLE IF EXISTS `otdocumento`;
CREATE TABLE `otdocumento` (
  `idregistro` int(10) unsigned NOT NULL,
  `tipodoc` char(2) NOT NULL,
  `iddocu` int(10) unsigned NOT NULL,
  `camino` char(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otdocumento`
--

/*!40000 ALTER TABLE `otdocumento` DISABLE KEYS */;
/*!40000 ALTER TABLE `otdocumento` ENABLE KEYS */;


--
-- Definition of table `otdocumentos`
--

DROP TABLE IF EXISTS `otdocumentos`;
CREATE TABLE `otdocumentos` (
  `idpedido` int(10) unsigned NOT NULL,
  `idot` int(10) unsigned NOT NULL,
  `iddocu` int(10) unsigned NOT NULL,
  `camino` char(200) NOT NULL,
  `archivo` char(100) NOT NULL,
  `original` char(100) NOT NULL,
  `tipodoc` char(10) NOT NULL,
  `fecha` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otdocumentos`
--

/*!40000 ALTER TABLE `otdocumentos` DISABLE KEYS */;
INSERT INTO `otdocumentos` (`idpedido`,`idot`,`iddocu`,`camino`,`archivo`,`original`,`tipodoc`,`fecha`) VALUES 
 (1,1,1,'/Documentos/ot/P1_O1_D1.pdf','P1_O1_D1.pdf','asientos2013.pdf','OT','20140826'),
 (1,1,2,'/Documentos/ot/P1_O1_D2.jpg','P1_O1_D2.jpg','pool 4.jpg','OT','20160830');
/*!40000 ALTER TABLE `otdocumentos` ENABLE KEYS */;


--
-- Definition of table `otejecu`
--

DROP TABLE IF EXISTS `otejecu`;
CREATE TABLE `otejecu` (
  `idpedido` int(10) unsigned NOT NULL DEFAULT '0',
  `idot` int(10) unsigned NOT NULL,
  `idoteje` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `codigomat` char(20) NOT NULL,
  `descrip` char(200) NOT NULL,
  `cantidad` float(13,3) NOT NULL,
  `impuni` float(13,3) NOT NULL,
  `imptotal` float(13,3) NOT NULL,
  `idmate` int(10) unsigned NOT NULL,
  `fechai` char(8) NOT NULL,
  `horai` char(8) NOT NULL,
  `fechaf` char(8) NOT NULL,
  `horaf` char(8) NOT NULL,
  `tiempo` char(8) NOT NULL,
  `unidad` char(20) NOT NULL,
  `cantm2` float(13,3) NOT NULL,
  `descustock` char(1) NOT NULL,
  `iddepo` int(10) unsigned NOT NULL DEFAULT '0',
  `idmoneda` int(10) unsigned NOT NULL DEFAULT '0',
  `moneda` char(50) NOT NULL DEFAULT '',
  `cotizacion` float(13,2) NOT NULL DEFAULT '0.00',
  `fechacot` char(8) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otejecu`
--

/*!40000 ALTER TABLE `otejecu` DISABLE KEYS */;
INSERT INTO `otejecu` (`idpedido`,`idot`,`idoteje`,`fecha`,`codigomat`,`descrip`,`cantidad`,`impuni`,`imptotal`,`idmate`,`fechai`,`horai`,`fechaf`,`horaf`,`tiempo`,`unidad`,`cantm2`,`descustock`,`iddepo`,`idmoneda`,`moneda`,`cotizacion`,`fechacot`) VALUES 
 (1,1,3,'20140827','D1001','MELAMINA SOBRE MDF 18 MM BLANCO FAPLAC',1.000,453.690,453.690,2,'','','','','','PLACA',0.000,'N',1,1,'PESO',1.00,'20140101');
/*!40000 ALTER TABLE `otejecu` ENABLE KEYS */;


--
-- Definition of table `otestados`
--

DROP TABLE IF EXISTS `otestados`;
CREATE TABLE `otestados` (
  `idestado` int(10) unsigned NOT NULL,
  `detalle` char(50) NOT NULL,
  PRIMARY KEY (`idestado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otestados`
--

/*!40000 ALTER TABLE `otestados` DISABLE KEYS */;
INSERT INTO `otestados` (`idestado`,`detalle`) VALUES 
 (1,'NORMAL'),
 (2,'AVANZADO'),
 (3,'PRIORITARIO'),
 (4,'EXCLUSIVO');
/*!40000 ALTER TABLE `otestados` ENABLE KEYS */;


--
-- Definition of table `otetapas`
--

DROP TABLE IF EXISTS `otetapas`;
CREATE TABLE `otetapas` (
  `idetapa` int(11) NOT NULL,
  `etapa` char(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otetapas`
--

/*!40000 ALTER TABLE `otetapas` DISABLE KEYS */;
INSERT INTO `otetapas` (`idetapa`,`etapa`) VALUES 
 (1,'VISITA'),
 (2,'DISEÑO Y PRESUPUESTO'),
 (3,'CORTE Y MECANIZADO'),
 (4,'PEGADO DE CANTOS'),
 (5,'ARMADO'),
 (6,'PROYECTO TERMINADO'),
 (7,'COLOCACION EN OBRA'),
 (8,'POSVENTA');
/*!40000 ALTER TABLE `otetapas` ENABLE KEYS */;


--
-- Definition of table `otinterna`
--

DROP TABLE IF EXISTS `otinterna`;
CREATE TABLE `otinterna` (
  `idotint` int(10) unsigned NOT NULL,
  `idot` int(10) unsigned NOT NULL,
  `destinooti` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `cantidad` float(13,4) NOT NULL,
  `cantidaduf` float(13,4) NOT NULL,
  `idmovotint` int(10) unsigned NOT NULL,
  `idotintori` int(10) unsigned NOT NULL,
  `idotcumpleh` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idotint`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otinterna`
--

/*!40000 ALTER TABLE `otinterna` DISABLE KEYS */;
/*!40000 ALTER TABLE `otinterna` ENABLE KEYS */;


--
-- Definition of table `otlineasmat`
--

DROP TABLE IF EXISTS `otlineasmat`;
CREATE TABLE `otlineasmat` (
  `linea` char(10) NOT NULL DEFAULT '',
  `detalle` char(50) NOT NULL,
  PRIMARY KEY (`linea`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otlineasmat`
--

/*!40000 ALTER TABLE `otlineasmat` DISABLE KEYS */;
INSERT INTO `otlineasmat` (`linea`,`detalle`) VALUES 
 ('1','PRUEBA'),
 ('2','HERRAJES Y ACCESORIOS'),
 ('3','BULONERIA'),
 ('4','SEGURIDAD'),
 ('5','HERRAMIENTAS'),
 ('6','BURLETES Y FELPAS'),
 ('7','PILETAS'),
 ('8','MESADAS'),
 ('9','VIDRIOS'),
 ('A','PERFILERIA ALUMINIO'),
 ('B','COMBUSTIBLES Y LUBRICANTES'),
 ('C','SELLADORES , PEGAMENTOS Y ADHESIVOS'),
 ('D','MELAMINA'),
 ('E','CONSUMIBLES'),
 ('F','PACKAGING');
/*!40000 ALTER TABLE `otlineasmat` ENABLE KEYS */;


--
-- Definition of table `otmateriales`
--

DROP TABLE IF EXISTS `otmateriales`;
CREATE TABLE `otmateriales` (
  `codigomat` char(20) NOT NULL,
  `detalle` char(200) NOT NULL,
  `unidad` char(10) NOT NULL,
  `impuni` float(13,3) NOT NULL,
  `ctrlstock` char(1) NOT NULL,
  `idmate` int(10) unsigned NOT NULL,
  `ctacontable` char(20) DEFAULT NULL,
  `codlinea` char(10) NOT NULL,
  `fbaja` char(8) NOT NULL,
  `observa` char(254) NOT NULL,
  `ocultar` char(1) NOT NULL,
  `idmoneda` int(10) unsigned NOT NULL,
  `moneda` char(50) NOT NULL,
  `stockmin` float(13,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otmateriales`
--

/*!40000 ALTER TABLE `otmateriales` DISABLE KEYS */;
INSERT INTO `otmateriales` (`codigomat`,`detalle`,`unidad`,`impuni`,`ctrlstock`,`idmate`,`ctacontable`,`codlinea`,`fbaja`,`observa`,`ocultar`,`idmoneda`,`moneda`,`stockmin`) VALUES 
 ('D1001','MELAMINA SOBRE MDF 18 MM BLANCO FAPLAC','PLACA',453.690,'S',2,'','D','','','N',1,'PESO',0.000),
 ('D1002','MELAMINA SOBRE MDF 18 MM BLANCO FAPLAC 25%','M2',200.000,'S',3,'','D','','','N',1,'PESO',0.000),
 ('11002','CANTO PVC PARA MAQUINA 22 MM HAYA','UDS',0.000,'S',4,'','1','','','N',1,'PESO',100.000),
 ('11003','CANTO PVC PARA MAQUINA 22 MM CEREZO','UDS',0.000,'S',5,'','1','','','N',1,'PESO',100.000),
 ('11004','CANTO PVC PARA MAQUINA 22 MM CEREZO NATURAL','UDS',0.000,'S',6,'','1','','','N',1,'PESO',100.000),
 ('11005','CANTO PVC PARA MAQUINA 22 MM CEREJEIRA','UDS',0.000,'S',7,'','1','','','N',1,'PESO',100.000),
 ('11006','CANTO PVC PARA MAQUINA 22 MM ROBLE MORO','UDS',0.000,'S',8,'','1','','','N',1,'PESO',100.000),
 ('11007','CANTO PVC PARA MAQUINA 22 MM GRIS HUMO','UDS',0.000,'S',9,'','1','','','N',1,'PESO',100.000),
 ('11008','CANTO PVC PARA MAQUINA 22 MM TECA ITALIA','UDS',207.740,'S',10,'','1','','','N',1,'PESO',100.000),
 ('11009','CANTO PVC PARA MAQUINA 22 MM ALMENDRA','UDS',0.000,'S',11,'','1','','','N',1,'PESO',100.000),
 ('11010','CANTO PVC PARA MAQUINA 22 MM ROBLE AMERICANO','UDS',0.000,'S',12,'','1','','','N',1,'PESO',100.000),
 ('11011','CANTO PVC PARA MAQUINA 22 MM CEDRO NATURAL','UDS',216.430,'S',13,'','1','','','N',1,'PESO',100.000),
 ('11012','CANTO PVC PARA MAQUINA 22 MM NEGRO LISO','UDS',0.000,'S',14,'','1','','','N',1,'PESO',100.000),
 ('11013','CANTO PVC PARA MAQUINA 22 MM GRIS GRAFITO','UDS',0.000,'S',15,'','1','','','N',1,'PESO',100.000),
 ('11014','CANTO PVC PARA MAQUINA 22 MM CENIZA','UDS',0.000,'S',16,'','1','','','N',1,'PESO',100.000),
 ('11015','CANTO PVC PARA MAQUINA 22 MM FRESNO NEGRO','UDS',158.220,'S',17,'','1','','','N',1,'PESO',100.000),
 ('11016','CANTO PVC PARA MAQUINA 22 MM CARBALHO MEZZO','UDS',227.010,'S',18,'','1','','','N',1,'PESO',100.000),
 ('11017','CANTO PVC PARA MAQUINA 22 MM LINOZA CINSA','UDS',0.000,'S',19,'','1','','','N',1,'PESO',100.000),
 ('11018','CANTO PVC PARA MAQUINA 22 MM WENGUE','UDS',0.000,'S',20,'','1','','','N',1,'PESO',100.000),
 ('11019','CANTO PVC PARA MAQUINA 22 MM GUINDO','UDS',203.700,'S',21,'','1','','','N',1,'PESO',100.000),
 ('11020','CANTO PVC PARA MAQUINA 22 MM TANGANICA','UDS',0.000,'S',22,'','1','','','N',1,'PESO',100.000),
 ('11021','CANTO PVC PARA MAQUINA 22 MM FRESNO ABEDUL','UDS',199.030,'S',23,'','1','','','N',1,'PESO',100.000),
 ('11022','CANTO PVC PARA MAQUINA 22 MM TECA ITALIA','UDS',0.000,'S',24,'','1','','','N',1,'PESO',100.000),
 ('11023','CANTO PVC PARA MAQUINA 22 MM VISON','UDS',0.000,'S',25,'','1','','','N',1,'PESO',100.000),
 ('11024','CANTO PVC PARA MAQUINA 22 MM ROBLE RUSTICO','UDS',0.000,'S',26,'','1','','','N',1,'PESO',100.000),
 ('11025','CANTO PVC PARA MAQUINA 22 MM ROBLE ESPAÑOL','UDS',0.000,'S',27,'','1','','','N',1,'PESO',100.000),
 ('11026','CANTO PVC PARA MAQUINA 22 MM ROBLE DAKAR','UDS',203.700,'S',28,'','1','','','N',1,'PESO',100.000),
 ('11027','CANTO PVC PARA MAQUINA 22 MM MAPLE','UDS',0.000,'S',29,'','1','','','N',1,'PESO',100.000),
 ('11028','CANTO PVC PARA MAQUINA 22 MM NOGAL HABANO','UDS',203.700,'S',30,'','1','','','N',1,'PESO',100.000),
 ('11029','CANTO PVC PARA MAQUINA 22 MM AZUL','UDS',0.000,'S',31,'','1','','','N',1,'PESO',100.000),
 ('11030','CANTO PVC PARA MAQUINA 22 MM ZEBRANO','UDS',0.000,'S',32,'','1','','','N',1,'PESO',100.000),
 ('11031','CANTO PVC PARA MAQUINA 22 MM ROJO','UDS',0.000,'S',33,'','1','','','N',1,'PESO',100.000),
 ('11032','CANTO PVC PRE-ENCOLADO 22 MM BLANCO','UDS',120.000,'S',34,'','1','','','N',1,'PESO',100.000),
 ('11033','CANTO PVC PRE-ENCOLADO 22 MM HAYA','UDS',0.000,'S',35,'','1','','','N',1,'PESO',100.000),
 ('11034','CANTO PVC PRE-ENCOLADO 22 MM CEREZO','UDS',0.000,'S',36,'','1','','','N',1,'PESO',100.000),
 ('11035','CANTO PVC PRE-ENCOLADO 22 MM CEREZO NATURAL','UDS',0.000,'S',37,'','1','','','N',1,'PESO',100.000),
 ('11036','CANTO PVC PRE-ENCOLADO 22 MM CEREJEIRA','UDS',0.000,'S',38,'','1','','','N',1,'PESO',100.000),
 ('11037','CANTO PVC PRE-ENCOLADO 22 MM ROBLE MORO','UDS',0.000,'S',39,'','1','','','N',1,'PESO',100.000),
 ('11038','CANTO PVC PRE-ENCOLADO 22 MM GRIS HUMO','UDS',0.000,'S',40,'','1','','','N',1,'PESO',100.000),
 ('11039','CANTO PVC PRE-ENCOLADO 22 MM TECA ITALIA','UDS',0.000,'S',41,'','1','','','N',1,'PESO',100.000),
 ('11040','CANTO PVC PRE-ENCOLADO 22 MM ALMENDRA','UDS',0.000,'S',42,'','1','','','N',1,'PESO',100.000),
 ('11041','CANTO PVC PRE-ENCOLADO 22 MM ROBLE AMERICANO','UDS',0.000,'S',43,'','1','','','N',1,'PESO',100.000),
 ('11042','CANTO PVC PRE-ENCOLADO 22 MM CEDRO NATURAL','UDS',220.000,'S',44,'','1','','','N',1,'PESO',100.000),
 ('11043','CANTO PVC PRE-ENCOLADO 22 MM NEGRO LISO','UDS',0.000,'S',45,'','1','','','N',1,'PESO',100.000),
 ('11044','CANTO PVC PRE-ENCOLADO 22 MM GRIS GRAFITO','UDS',0.000,'S',46,'','1','','','N',1,'PESO',100.000),
 ('11045','CANTO PVC PRE-ENCOLADO 22 MM CENIZA','UDS',0.000,'S',47,'','1','','','N',1,'PESO',100.000),
 ('11046','CANTO PVC PRE-ENCOLADO 22 MM FRESNO NEGRO','UDS',180.810,'S',48,'','1','','','N',1,'PESO',100.000),
 ('11047','CANTO PVC PRE-ENCOLADO 22 MM CARBALHO MEZZO','UDS',0.000,'S',49,'','1','','','N',1,'PESO',100.000),
 ('11048','CANTO PVC PRE-ENCOLADO 22 MM LINOZA CINSA','UDS',0.000,'S',50,'','1','','','N',1,'PESO',100.000),
 ('11049','CANTO PVC PRE-ENCOLADO 22 MM WENGUE','UDS',0.000,'S',51,'','1','','','N',1,'PESO',100.000),
 ('11050','CANTO PVC PRE-ENCOLADO 22 MM GUINDO','UDS',0.000,'S',52,'','1','','','N',1,'PESO',100.000),
 ('11051','CANTO PVC PRE-ENCOLADO 22 MM TANGANICA','UDS',0.000,'S',53,'','1','','','N',1,'PESO',100.000),
 ('11052','CANTO PVC PRE-ENCOLADO 22 MM FRESNO ABEDUL','UDS',0.000,'S',54,'','1','','','N',1,'PESO',100.000),
 ('11053','CANTO PVC PRE-ENCOLADO 22 MM TECA ITALIA','UDS',0.000,'S',55,'','1','','','N',1,'PESO',100.000),
 ('11054','CANTO PVC PRE-ENCOLADO 22 MM VISON','UDS',0.000,'S',56,'','1','','','N',1,'PESO',100.000),
 ('11055','CANTO PVC PRE-ENCOLADO 22 MM ROBLE RUSTICO','UDS',0.000,'S',57,'','1','','','N',1,'PESO',100.000),
 ('11056','CANTO PVC PRE-ENCOLADO 22 MM ROBLE ESPAÑOL','UDS',0.000,'S',58,'','1','','','N',1,'PESO',100.000),
 ('11057','CANTO PVC PRE-ENCOLADO 22 MM ROBLE DAKAR','UDS',0.000,'S',59,'','1','','','N',1,'PESO',100.000),
 ('11058','CANTO PVC PRE-ENCOLADO 22 MM MAPLE','UDS',0.000,'S',60,'','1','','','N',1,'PESO',100.000),
 ('11059','CANTO PVC PRE-ENCOLADO 22 MM NOGAL HABANO','UDS',0.000,'S',61,'','1','','','N',1,'PESO',100.000),
 ('11060','CANTO PVC PRE-ENCOLADO 22 MM AZUL','UDS',0.000,'S',62,'','1','','','N',1,'PESO',100.000),
 ('11061','CANTO PVC PRE-ENCOLADO 22 MM ZEBRANO','UDS',0.000,'S',63,'','1','','','N',1,'PESO',100.000),
 ('11062','CANTO PVC PRE-ENCOLADO 22 MM ROJO','UDS',0.000,'S',64,'','1','','','N',1,'PESO',100.000),
 ('11063','CANTO PVC PRE-ENCOLADO 50 MM BLANCO','UDS',0.000,'S',65,'','1','','','N',1,'PESO',100.000),
 ('11064','CANTO PVC PRE-ENCOLADO 50 MM HAYA','UDS',0.000,'S',66,'','1','','','N',1,'PESO',100.000),
 ('11065','CANTO PVC PRE-ENCOLADO 50 MM CEREZO','UDS',0.000,'S',67,'','1','','','N',1,'PESO',100.000),
 ('11066','CANTO PVC PRE-ENCOLADO 50 MM CEREZO NATURAL','UDS',0.000,'S',68,'','1','','','N',1,'PESO',100.000),
 ('11067','CANTO PVC PRE-ENCOLADO 50 MM CEREJEIRA','UDS',0.000,'S',69,'','1','','','N',1,'PESO',100.000),
 ('11068','CANTO PVC PRE-ENCOLADO 50 MM ROBLE MORO','UDS',0.000,'S',70,'','1','','','N',1,'PESO',100.000),
 ('11069','CANTO PVC PRE-ENCOLADO 50 MM GRIS HUMO','UDS',0.000,'S',71,'','1','','','N',1,'PESO',100.000),
 ('11070','CANTO PVC PRE-ENCOLADO 50 MM TECA ITALIA','UDS',0.000,'S',72,'','1','','','N',1,'PESO',100.000),
 ('11071','CANTO PVC PRE-ENCOLADO 50 MM ALMENDRA','UDS',0.000,'S',73,'','1','','','N',1,'PESO',100.000),
 ('11072','CANTO PVC PRE-ENCOLADO 50 MM ROBLE AMERICANO','UDS',0.000,'S',74,'','1','','','N',1,'PESO',100.000),
 ('11073','CANTO PVC PRE-ENCOLADO 50 MM CEDRO NATURAL','UDS',0.000,'S',75,'','1','','','N',1,'PESO',100.000),
 ('11074','CANTO PVC PRE-ENCOLADO 50 MM NEGRO LISO','UDS',0.000,'S',76,'','1','','','N',1,'PESO',100.000),
 ('11075','CANTO PVC PRE-ENCOLADO 50 MM GRIS GRAFITO','UDS',0.000,'S',77,'','1','','','N',1,'PESO',100.000),
 ('11076','CANTO PVC PRE-ENCOLADO 50 MM CENIZA','UDS',0.000,'S',78,'','1','','','N',1,'PESO',100.000),
 ('11077','CANTO PVC PRE-ENCOLADO 50 MM FRESNO NEGRO','UDS',0.000,'S',79,'','1','','','N',1,'PESO',100.000),
 ('11078','CANTO PVC PRE-ENCOLADO 50 MM CARBALHO MEZZO','UDS',0.000,'S',80,'','1','','','N',1,'PESO',100.000),
 ('11079','CANTO PVC PRE-ENCOLADO 50 MM LINOZA CINSA','UDS',0.000,'S',81,'','1','','','N',1,'PESO',100.000),
 ('11080','CANTO PVC PRE-ENCOLADO 50 MM WENGUE','UDS',0.000,'S',82,'','1','','','N',1,'PESO',100.000),
 ('11081','CANTO PVC PRE-ENCOLADO 50 MM GUINDO','UDS',0.000,'S',83,'','1','','','N',1,'PESO',100.000),
 ('11082','CANTO PVC PRE-ENCOLADO 50 MM TANGANICA','UDS',0.000,'S',84,'','1','','','N',1,'PESO',100.000),
 ('11083','CANTO PVC PRE-ENCOLADO 50 MM FRESNO ABEDUL','UDS',0.000,'S',85,'','1','','','N',1,'PESO',100.000),
 ('11084','CANTO PVC PRE-ENCOLADO 50 MM TECA ITALIA','UDS',0.000,'S',86,'','1','','','N',1,'PESO',100.000),
 ('11085','CANTO PVC PRE-ENCOLADO 50 MM VISON','UDS',0.000,'S',87,'','1','','','N',1,'PESO',100.000),
 ('11086','CANTO PVC PRE-ENCOLADO 50 MM ROBLE RUSTICO','UDS',0.000,'S',88,'','1','','','N',1,'PESO',100.000),
 ('11087','CANTO PVC PRE-ENCOLADO 50 MM ROBLE ESPAÑOL','UDS',0.000,'S',89,'','1','','','N',1,'PESO',100.000),
 ('11088','CANTO PVC PRE-ENCOLADO 50 MM ROBLE DAKAR','UDS',0.000,'S',90,'','1','','','N',1,'PESO',100.000),
 ('11089','CANTO PVC PRE-ENCOLADO 50 MM MAPLE','UDS',0.000,'S',91,'','1','','','N',1,'PESO',100.000),
 ('11090','CANTO PVC PRE-ENCOLADO 50 MM NOGAL HABANO','UDS',0.000,'S',92,'','1','','','N',1,'PESO',100.000),
 ('11091','CANTO PVC PRE-ENCOLADO 50 MM AZUL','UDS',0.000,'S',93,'','1','','','N',1,'PESO',100.000),
 ('11092','CANTO PVC PRE-ENCOLADO 50 MM ZEBRANO','UDS',0.000,'S',94,'','1','','','N',1,'PESO',100.000),
 ('11093','CANTO PVC PRE-ENCOLADO 50 MM ROJO','UDS',0.000,'S',95,'','1','','','N',1,'PESO',100.000),
 ('12001','CANTO MELAMINICO PARA MAQUINA 22 MM BLANCO','UDS',0.000,'S',96,'','1','','','N',1,'PESO',100.000),
 ('12002','CANTO MELAMINICO PARA MAQUINA 22 MM HAYA','UDS',0.000,'S',97,'','1','','','N',1,'PESO',100.000),
 ('12003','CANTO MELAMINICO PARA MAQUINA 22 MM CEREZO','UDS',0.000,'S',98,'','1','','','N',1,'PESO',100.000),
 ('12004','CANTO MELAMINICO PARA MAQUINA 22 MM CEREZO NATURAL','UDS',0.000,'S',99,'','1','','','N',1,'PESO',100.000),
 ('12005','CANTO MELAMINICO PARA MAQUINA 22 MM CEREJEIRA','UDS',0.000,'S',100,'','1','','','N',1,'PESO',100.000),
 ('12006','CANTO MELAMINICO PARA MAQUINA 22 MM ROBLE MORO','UDS',0.000,'S',101,'','1','','','N',1,'PESO',100.000),
 ('12007','CANTO MELAMINICO PARA MAQUINA 22 MM GRIS HUMO','UDS',0.000,'S',102,'','1','','','N',1,'PESO',100.000),
 ('12008','CANTO MELAMINICO PARA MAQUINA 22 MM TECA ITALIA','UDS',0.000,'S',103,'','1','','','N',1,'PESO',100.000),
 ('12009','CANTO MELAMINICO PARA MAQUINA 22 MM ALMENDRA','UDS',0.000,'S',104,'','1','','','N',1,'PESO',100.000),
 ('12010','CANTO MELAMINICO PARA MAQUINA 22 MM ROBLE AMERICANO','UDS',0.000,'S',105,'','1','','','N',1,'PESO',100.000),
 ('12011','CANTO MELAMINICO PARA MAQUINA 22 MM CEDRO NATURAL','UDS',103.320,'S',106,'','1','','','N',1,'PESO',100.000),
 ('12012','CANTO MELAMINICO PARA MAQUINA 22 MM NEGRO LISO','UDS',0.000,'S',107,'','1','','','N',1,'PESO',100.000),
 ('12013','CANTO MELAMINICO PARA MAQUINA 22 MM GRIS GRAFITO','UDS',0.000,'S',108,'','1','','','N',1,'PESO',100.000),
 ('12014','CANTO MELAMINICO PARA MAQUINA 22 MM CENIZA','UDS',0.000,'S',109,'','1','','','N',1,'PESO',100.000),
 ('12015','CANTO MELAMINICO PARA MAQUINA 22 MM FRESNO NEGRO','UDS',0.000,'S',110,'','1','','','N',1,'PESO',100.000),
 ('12016','CANTO MELAMINICO PARA MAQUINA 22 MM CARBALHO MEZZO','UDS',0.000,'S',111,'','1','','','N',1,'PESO',100.000),
 ('12017','CANTO MELAMINICO PARA MAQUINA 22 MM LINOZA CINSA','UDS',0.000,'S',112,'','1','','','N',1,'PESO',100.000),
 ('12018','CANTO MELAMINICO PARA MAQUINA 22 MM WENGUE','UDS',0.000,'S',113,'','1','','','N',1,'PESO',100.000),
 ('12019','CANTO MELAMINICO PARA MAQUINA 22 MM GUINDO','UDS',0.000,'S',114,'','1','','','N',1,'PESO',100.000),
 ('12020','CANTO MELAMINICO PARA MAQUINA 22 MM TANGANICA','UDS',0.000,'S',115,'','1','','','N',1,'PESO',100.000),
 ('12021','CANTO MELAMINICO PARA MAQUINA 22 MM FRESNO ABEDUL','UDS',0.000,'S',116,'','1','','','N',1,'PESO',100.000),
 ('12022','CANTO MELAMINICO PARA MAQUINA 22 MM TECA ITALIA','UDS',0.000,'S',117,'','1','','','N',1,'PESO',100.000),
 ('12023','CANTO MELAMINICO PARA MAQUINA 22 MM VISON','UDS',0.000,'S',118,'','1','','','N',1,'PESO',100.000),
 ('12024','CANTO MELAMINICO PARA MAQUINA 22 MM ROBLE RUSTICO','UDS',0.000,'S',119,'','1','','','N',1,'PESO',100.000),
 ('12025','CANTO MELAMINICO PARA MAQUINA 22 MM ROBLE ESPAÑOL','UDS',0.000,'S',120,'','1','','','N',1,'PESO',100.000),
 ('12026','CANTO MELAMINICO PARA MAQUINA 22 MM ROBLE DAKAR','UDS',0.000,'S',121,'','1','','','N',1,'PESO',100.000),
 ('12027','CANTO MELAMINICO PARA MAQUINA 22 MM MAPLE','UDS',0.000,'S',122,'','1','','','N',1,'PESO',100.000),
 ('12028','CANTO MELAMINICO PARA MAQUINA 22 MM NOGAL HABANO','UDS',0.000,'S',123,'','1','','','N',1,'PESO',100.000),
 ('12029','CANTO MELAMINICO PARA MAQUINA 22 MM AZUL','UDS',0.000,'S',124,'','1','','','N',1,'PESO',100.000),
 ('12030','CANTO MELAMINICO PARA MAQUINA 22 MM ZEBRANO','UDS',0.000,'S',125,'','1','','','N',1,'PESO',100.000),
 ('12031','CANTO MELAMINICO PARA MAQUINA 22 MM ROJO','UDS',0.000,'S',126,'','1','','','N',1,'PESO',100.000),
 ('12032','CANTO MELAMINICO PRE-ENCOLADO 22 MM BLANCO','UDS',0.000,'S',127,'','1','','','N',1,'PESO',100.000),
 ('12033','CANTO MELAMINICO PRE-ENCOLADO 22 MM HAYA','UDS',0.000,'S',128,'','1','','','N',1,'PESO',100.000),
 ('12034','CANTO MELAMINICO PRE-ENCOLADO 22 MM CEREZO','UDS',0.000,'S',129,'','1','','','N',1,'PESO',100.000),
 ('12035','CANTO MELAMINICO PRE-ENCOLADO 22 MM CEREZO NATURAL','UDS',0.000,'S',130,'','1','','','N',1,'PESO',100.000),
 ('12036','CANTO MELAMINICO PRE-ENCOLADO 22 MM CEREJEIRA','UDS',0.000,'S',131,'','1','','','N',1,'PESO',100.000),
 ('12037','CANTO MELAMINICO PRE-ENCOLADO 22 MM ROBLE MORO','UDS',0.000,'S',132,'','1','','','N',1,'PESO',100.000),
 ('12038','CANTO MELAMINICO PRE-ENCOLADO 22 MM GRIS HUMO','UDS',0.000,'S',133,'','1','','','N',1,'PESO',100.000),
 ('12039','CANTO MELAMINICO PRE-ENCOLADO 22 MM TECA ITALIA','UDS',0.000,'S',134,'','1','','','N',1,'PESO',100.000),
 ('12040','CANTO MELAMINICO PRE-ENCOLADO 22 MM ALMENDRA','UDS',0.000,'S',135,'','1','','','N',1,'PESO',100.000),
 ('12041','CANTO MELAMINICO PRE-ENCOLADO 22 MM ROBLE AMERICANO','UDS',0.000,'S',136,'','1','','','N',1,'PESO',100.000),
 ('12042','CANTO MELAMINICO PRE-ENCOLADO 22 MM CEDRO NATURAL','UDS',0.000,'S',137,'','1','','','N',1,'PESO',100.000),
 ('12043','CANTO MELAMINICO PRE-ENCOLADO 22 MM NEGRO LISO','UDS',0.000,'S',138,'','1','','','N',1,'PESO',100.000),
 ('12044','CANTO MELAMINICO PRE-ENCOLADO 22 MM GRIS GRAFITO X 100 MTS','UDS',145.330,'S',139,'','1','','','N',1,'PESO',100.000),
 ('12045','CANTO MELAMINICO PRE-ENCOLADO 22 MM CENIZA','UDS',0.000,'S',140,'','1','','','N',1,'PESO',100.000),
 ('12046','CANTO MELAMINICO PRE-ENCOLADO 22 MM FRESNO NEGRO','UDS',0.000,'S',141,'','1','','','N',1,'PESO',100.000),
 ('12047','CANTO MELAMINICO PRE-ENCOLADO 22 MM CARBALHO MEZZO','UDS',0.000,'S',142,'','1','','','N',1,'PESO',100.000),
 ('12048','CANTO MELAMINICO PRE-ENCOLADO 22 MM LINOZA CINSA','UDS',0.000,'S',143,'','1','','','N',1,'PESO',100.000),
 ('12049','CANTO MELAMINICO PRE-ENCOLADO 22 MM WENGUE','UDS',133.540,'S',144,'','1','','','N',1,'PESO',100.000),
 ('12050','CANTO MELAMINICO PRE-ENCOLADO 22 MM GUINDO','UDS',139.050,'S',145,'','1','','','N',1,'PESO',100.000),
 ('12051','CANTO MELAMINICO PRE-ENCOLADO 22 MM TANGANICA X 100 MTS','UDS',145.330,'S',146,'','1','','','N',1,'PESO',100.000),
 ('12052','CANTO MELAMINICO PRE-ENCOLADO 22 MM FRESNO ABEDUL','UDS',0.000,'S',147,'','1','','','N',1,'PESO',100.000),
 ('12053','CANTO MELAMINICO PRE-ENCOLADO 22 MM TECA ITALIA','UDS',0.000,'S',148,'','1','','','N',1,'PESO',100.000),
 ('12054','CANTO MELAMINICO PRE-ENCOLADO 22 MM VISON','UDS',0.000,'S',149,'','1','','','N',1,'PESO',100.000),
 ('12055','CANTO MELAMINICO PRE-ENCOLADO 22 MM ROBLE RUSTICO','UDS',0.000,'S',150,'','1','','','N',1,'PESO',100.000),
 ('12056','CANTO MELAMINICO PRE-ENCOLADO 22 MM ROBLE ESPAÑOL','UDS',0.000,'S',151,'','1','','','N',1,'PESO',100.000),
 ('12057','CANTO MELAMINICO PRE-ENCOLADO 22 MM ROBLE DAKAR','UDS',0.000,'S',152,'','1','','','N',1,'PESO',100.000),
 ('12058','CANTO MELAMINICO PRE-ENCOLADO 22 MM MAPLE','UDS',0.000,'S',153,'','1','','','N',1,'PESO',100.000),
 ('12059','CANTO MELAMINICO PRE-ENCOLADO 22 MM NOGAL HABANO','UDS',145.330,'S',154,'','1','','','N',1,'PESO',100.000),
 ('12060','CANTO MELAMINICO PRE-ENCOLADO 22 MM AZUL','UDS',0.000,'S',155,'','1','','','N',1,'PESO',100.000),
 ('12061','CANTO MELAMINICO PRE-ENCOLADO 22 MM ZEBRANO','UDS',0.000,'S',156,'','1','','','N',1,'PESO',100.000),
 ('12062','CANTO MELAMINICO PRE-ENCOLADO 22 MM ROJO','UDS',0.000,'S',157,'','1','','','N',1,'PESO',100.000),
 ('12063','CANTO MELAMINICO PRE-ENCOLADO 50 MM BLANCO','UDS',143.000,'S',158,'','1','','','N',1,'PESO',100.000),
 ('12064','CANTO MELAMINICO PRE-ENCOLADO 50 MM HAYA','UDS',0.000,'S',159,'','1','','','N',1,'PESO',100.000),
 ('12065','CANTO MELAMINICO PRE-ENCOLADO 50 MM CEREZO','UDS',0.000,'S',160,'','1','','','N',1,'PESO',100.000),
 ('12066','CANTO MELAMINICO PRE-ENCOLADO 50 MM CEREZO NATURAL','UDS',0.000,'S',161,'','1','','','N',1,'PESO',100.000),
 ('12067','CANTO MELAMINICO PRE-ENCOLADO 50 MM CEREJEIRA','UDS',0.000,'S',162,'','1','','','N',1,'PESO',100.000),
 ('12068','CANTO MELAMINICO PRE-ENCOLADO 50 MM ROBLE MORO','UDS',0.000,'S',163,'','1','','','N',1,'PESO',100.000),
 ('12069','CANTO MELAMINICO PRE-ENCOLADO 50 MM GRIS HUMO','UDS',0.000,'S',164,'','1','','','N',1,'PESO',100.000),
 ('12070','CANTO MELAMINICO PRE-ENCOLADO 50 MM TECA ITALIA','UDS',0.000,'S',165,'','1','','','N',1,'PESO',100.000),
 ('12071','CANTO MELAMINICO PRE-ENCOLADO 50 MM ALMENDRA','UDS',0.000,'S',166,'','1','','','N',1,'PESO',100.000),
 ('12072','CANTO MELAMINICO PRE-ENCOLADO 50 MM ROBLE AMERICANO','UDS',0.000,'S',167,'','1','','','N',1,'PESO',100.000),
 ('12073','CANTO MELAMINICO PRE-ENCOLADO 50 MM CEDRO NATURAL','UDS',386.890,'S',168,'','1','','','N',1,'PESO',100.000),
 ('12074','CANTO MELAMINICO PRE-ENCOLADO 50 MM NEGRO LISO','UDS',0.000,'S',169,'','1','','','N',1,'PESO',100.000),
 ('12075','CANTO MELAMINICO PRE-ENCOLADO 50 MM GRIS GRAFITO','UDS',0.000,'S',170,'','1','','','N',1,'PESO',100.000),
 ('12076','CANTO MELAMINICO PRE-ENCOLADO 50 MM CENIZA','UDS',0.000,'S',171,'','1','','','N',1,'PESO',100.000),
 ('12077','CANTO MELAMINICO PRE-ENCOLADO 50 MM FRESNO NEGRO','UDS',459.680,'S',172,'','1','','','N',1,'PESO',100.000),
 ('12078','CANTO MELAMINICO PRE-ENCOLADO 50 MM CARBALHO MEZZO','UDS',0.000,'S',173,'','1','','','N',1,'PESO',100.000),
 ('12079','CANTO MELAMINICO PRE-ENCOLADO 50 MM LINOZA CINSA','UDS',0.000,'S',174,'','1','','','N',1,'PESO',100.000),
 ('12080','CANTO MELAMINICO PRE-ENCOLADO 50 MM WENGUE','UDS',0.000,'S',175,'','1','','','N',1,'PESO',100.000),
 ('12081','CANTO MELAMINICO PRE-ENCOLADO 50 MM GUINDO','UDS',316.030,'S',176,'','1','','','N',1,'PESO',100.000),
 ('12082','CANTO MELAMINICO PRE-ENCOLADO 50 MM TANGANICA','UDS',316.030,'S',177,'','1','','','N',1,'PESO',100.000),
 ('12083','CANTO MELAMINICO PRE-ENCOLADO 50 MM FRESNO ABEDUL','UDS',319.360,'S',178,'','1','','','N',1,'PESO',100.000),
 ('12084','CANTO MELAMINICO PRE-ENCOLADO 50 MM TECA ITALIA','UDS',0.000,'S',179,'','1','','','N',1,'PESO',100.000),
 ('12085','CANTO MELAMINICO PRE-ENCOLADO 50 MM VISON','UDS',0.000,'S',180,'','1','','','N',1,'PESO',100.000),
 ('12086','CANTO MELAMINICO PRE-ENCOLADO 50 MM ROBLE RUSTICO','UDS',0.000,'S',181,'','1','','','N',1,'PESO',100.000),
 ('12087','CANTO MELAMINICO PRE-ENCOLADO 50 MM ROBLE ESPAÑOL','UDS',347.260,'S',182,'','1','','','N',1,'PESO',100.000),
 ('12088','CANTO MELAMINICO PRE-ENCOLADO 50 MM ROBLE DAKAR','UDS',0.000,'S',183,'','1','','','N',1,'PESO',100.000),
 ('12089','CANTO MELAMINICO PRE-ENCOLADO 50 MM MAPLE','UDS',319.360,'S',184,'','1','','','N',1,'PESO',100.000),
 ('12090','CANTO MELAMINICO PRE-ENCOLADO 50 MM NOGAL HABANO','UDS',316.030,'S',185,'','1','','','N',1,'PESO',100.000),
 ('12091','CANTO MELAMINICO PRE-ENCOLADO 50 MM AZUL','UDS',0.000,'S',186,'','1','','','N',1,'PESO',100.000),
 ('12092','CANTO MELAMINICO PRE-ENCOLADO 50 MM ZEBRANO','UDS',0.000,'S',187,'','1','','','N',1,'PESO',100.000),
 ('12093','CANTO MELAMINICO PRE-ENCOLADO 50 MM ROJO','UDS',0.000,'S',188,'','1','','','N',1,'PESO',100.000),
 ('12094','CANTO PVC PARA MAQUINA 22 MM NOCCE MILANO','UDS',2.500,'S',189,'','1','','','N',1,'PESO',100.000),
 ('12095','CANTO PVC PRE-ENCOLADO 22 MM NOCCE MILANO','UDS',0.000,'S',190,'','1','','','N',1,'PESO',100.000),
 ('12096','CANTO PVC PRE-ENCOLADO 50 MM NOCCE MILANO','UDS',0.000,'S',191,'','1','','','N',1,'PESO',100.000),
 ('21001','BISAGRA COMUN 35 MM CODO 9','UDS',3.100,'S',192,'','2','','','N',1,'PESO',100.000),
 ('21002','BISAGRA COMUN 35 MM CODO 0','UDS',3.100,'S',193,'','2','','','N',1,'PESO',100.000),
 ('21003','BISAGRA COMUN 25 MM CODO 9','UDS',1.820,'S',194,'','2','','','N',1,'PESO',100.000),
 ('21004','BISAGRA COMUN 25 MM CODO 0','UDS',0.000,'S',195,'','2','','','N',1,'PESO',100.000),
 ('21005','BISAGRA CIERRE SUAVE 35 MM CODO 9','UDS',13.100,'S',196,'','2','','','N',1,'PESO',100.000),
 ('21006','BISAGRA CIERRE SUAVE 35 MM CODO 0','UDS',0.000,'S',197,'','2','','','N',1,'PESO',100.000),
 ('21007','BISAGRA 165 GRADOS','UDS',11.510,'S',198,'','2','','','N',1,'PESO',100.000),
 ('21008','BISAGRA INTERMEDIA  135 GRADOS','UDS',10.160,'S',199,'','2','','','N',1,'PESO',100.000),
 ('21009','BISAGRA DOBLE ACCION VAIVEN 3\"\"','UDS',144.000,'S',200,'','2','','','N',1,'PESO',100.000),
 ('21010','BISAGRA PARA PERFIL ALUMINIO 20 X 20','UDS',7.000,'S',201,'','2','','','N',1,'PESO',100.000),
 ('21011','BISAGRA PARA PUERTA DE VIDRIO','UDS',5.000,'S',202,'','2','','','N',1,'PESO',100.000),
 ('21012','BISAGRA PUSH-ON CODO 9','UDS',17.180,'S',203,'','2','','','N',1,'PESO',100.000),
 ('22001','MANIJA ABRUZZO 160 MM','UDS',37.800,'S',204,'','2','','','N',1,'PESO',100.000),
 ('22002','MANIJA CINTA 160 MM','UDS',27.800,'S',205,'','2','','','N',1,'PESO',100.000),
 ('22003','MANIJA BARRAL 96 MM','UDS',12.180,'S',206,'','2','','','N',1,'PESO',100.000),
 ('22004','MANIJA BARRAL 128 MM','UDS',14.280,'S',207,'','2','','','N',1,'PESO',100.000),
 ('22005','MANIJA BARRAL 192 MM','UDS',16.980,'S',208,'','2','','','N',1,'PESO',100.000),
 ('22006','MANIJA MEDIALUNA 96 MM','UDS',6.280,'S',209,'','2','','','N',1,'PESO',100.000),
 ('22007','MANIJA MEDIALUNA 128 MM','UDS',9.580,'S',210,'','2','','','N',1,'PESO',100.000),
 ('22008','MANIJA CUBETA 128 MM','UDS',0.000,'S',211,'','2','','','N',1,'PESO',100.000),
 ('22009','MANIJA PLASTICA 96 MM','UDS',1.780,'S',212,'','2','','','N',1,'PESO',100.000),
 ('22010','MANIJA PLASTICA BARRAL 96 MM','UDS',1.000,'S',213,'','2','','','N',1,'PESO',100.000),
 ('22011','MANIJA PLASTICA CINTA 128 MM','UDS',1.100,'S',214,'','2','','','N',1,'PESO',100.000),
 ('22012','MANIJA BARRAL 288 MM','UDS',58.000,'S',215,'','2','','','N',1,'PESO',100.000),
 ('22013','MANIJA CUBETA PLASTICO REDONDO','UDS',0.880,'S',216,'','2','','','N',1,'PESO',100.000),
 ('22014','MANIJA CUBETA METAL CHICA','UDS',1.500,'S',217,'','2','','','N',1,'PESO',100.000),
 ('22015','MANIJA PLASTICA BLANCA','UDS',0.000,'S',218,'','2','','','N',1,'PESO',100.000),
 ('22016','MANIJA PARA VIDRIO NEGRA','UDS',1.820,'S',219,'','2','','','N',1,'PESO',100.000),
 ('22017','MANIJA PARA VIDRIO CROMO','UDS',2.100,'S',220,'','2','','','N',1,'PESO',100.000),
 ('22018','RETEN EXPULSOR SIMPLE','UDS',5.910,'S',221,'','2','','','N',1,'PESO',100.000),
 ('22019','RETEN EXPULSOR DOBLE','UDS',7.450,'S',222,'','2','','','N',1,'PESO',100.000),
 ('23001','CORREDERA TELESCOPICA 500 MM CIERRE SUAVE','UDS',82.470,'S',223,'','2','','','N',1,'PESO',100.000),
 ('23002','CORREDERA TELESCOPICA 500 MM','UDS',55.400,'S',224,'','2','','','N',1,'PESO',100.000),
 ('23003','CORREDERA TELESCOPICA 450 MM','UDS',49.880,'S',225,'','2','','','N',1,'PESO',100.000),
 ('23004','CORREDERA TELESCOPICA 400 MM','UDS',39.420,'S',226,'','2','','','N',1,'PESO',100.000),
 ('23005','CORREDERA TELESCOPICA 350 MM','UDS',36.210,'S',227,'','2','','','N',1,'PESO',100.000),
 ('23006','CORREDERA TELESCOPICA 300 MM','UDS',29.580,'S',228,'','2','','','N',1,'PESO',100.000),
 ('23007','CORREDERA TELESCOPICA 250 MM','UDS',24.630,'S',229,'','2','','','N',1,'PESO',100.000),
 ('23008','CORREDERA COMUN 500 MM','UDS',15.550,'S',230,'','2','','','N',1,'PESO',100.000),
 ('23009','CORREDERA COMUN 450 MM','UDS',13.970,'S',231,'','2','','','N',1,'PESO',100.000),
 ('23010','CORREDERA COMUN 400 MM','UDS',12.410,'S',232,'','2','','','N',1,'PESO',100.000),
 ('23011','CORREDERA COMUN 350 MM','UDS',11.060,'S',233,'','2','','','N',1,'PESO',100.000),
 ('23012','CORREDERA COMUN 300 MM','UDS',9.840,'S',234,'','2','','','N',1,'PESO',100.000),
 ('23013','CORREDERA COMUN 250 MM','UDS',8.450,'S',235,'','2','','','N',1,'PESO',100.000),
 ('23014','CORREDERA OCULTA CON LATERAL 500 MM','UDS',108.420,'S',236,'','2','','','N',1,'PESO',100.000),
 ('23015','CORREDERA TELESCOPICA 350 MM PORTATECLADO','UDS',0.000,'S',237,'','2','','','N',1,'PESO',100.000),
 ('23016','CORREDERA LATERAL METALICO 400 MM','UDS',47.970,'S',238,'','2','','','N',1,'PESO',100.000),
 ('23017','CORREDERA AL PISO PARA MUEBLE DUCASSE','PAR',72.570,'S',239,'','2','','','N',1,'PESO',100.000),
 ('24001','TIRADOR INDIKO','UDS',6.580,'S',240,'','2','','','N',1,'PESO',100.000),
 ('24002','TIRADOR LUSS','UDS',3.980,'S',241,'','2','','','N',1,'PESO',100.000),
 ('24003','TIRADOR PLASTICO OSITO','UDS',2.500,'S',242,'','2','','','N',1,'PESO',100.000),
 ('24004','TIRADOR PLASTICO AUTITO','UDS',2.500,'S',243,'','2','','','N',1,'PESO',100.000),
 ('24005','TIRADOR PLASTICO RANA','UDS',2.500,'S',244,'','2','','','N',1,'PESO',100.000),
 ('25001','PISTON A GAS  120 N','UDS',14.210,'S',245,'','2','','','N',1,'PESO',100.000),
 ('25002','PISTON A GAS  100 N','UDS',14.210,'S',246,'','2','','','N',1,'PESO',100.000),
 ('25003','PISTON A GAS  80 N','UDS',14.210,'S',247,'','2','','','N',1,'PESO',100.000),
 ('26001','SOPORTE DE ESTANTE 5 MM ZINCADO','UDS',0.100,'S',248,'','2','','','N',1,'PESO',100.000),
 ('26002','SOPORTE DE ESTANTE 12MM ZINCADO PARA PARED','UDS',33.980,'S',249,'','2','','','N',1,'PESO',100.000),
 ('27001','RUEDA PARA PLACARD','UDS',19.800,'S',250,'','2','','','N',1,'PESO',100.000),
 ('27002','RUEDA CHINA DE GOMA GIRATORIA 51MM','UDS',7.160,'S',251,'','2','','','N',1,'PESO',100.000),
 ('27003','RUEDA NACIONAL GIRATORIA 50MM S/FRENO','UDS',23.660,'S',252,'','2','','','N',1,'PESO',100.000),
 ('27004','RUEDA NACIONAL GIRATORIA 50MM CON FRENO','UDS',32.320,'S',253,'','2','','','N',1,'PESO',100.000),
 ('27005','RUEDA DE NYLON PARA MESA DE COMPUTACION','UDS',2.530,'S',254,'','2','','','N',1,'PESO',100.000),
 ('27006','RUEDA PARA PUERTA CORREDIZA PLASTICA','UDS',1.670,'S',255,'','2','','','N',1,'PESO',100.000),
 ('27007','RUEDA PARA PLACARD','UDS',17.800,'S',256,'','2','','','N',1,'PESO',100.000),
 ('27008','RUEDA PARA PLACARD ROMA','UDS',0.000,'S',257,'','2','','','N',1,'PESO',100.000),
 ('27009','RUEDA PARA CAMA MARINERA','UDS',11.540,'S',258,'','2','','','N',1,'PESO',100.000),
 ('28001','BASE PLASTICA','UDS',0.300,'S',259,'','2','','','N',1,'PESO',100.000),
 ('29001','PASA CABLE 60 MM','UDS',1.480,'S',260,'','2','','','N',1,'PESO',100.000),
 ('31001','TORNILLO AUTOPERFORANTE 3.8 X16 MM','UDS',0.100,'S',261,'','3','','','N',1,'PESO',100.000),
 ('31002','TORNILLO AUTOPERFORANTE 3.8 X19 MM','UDS',0.120,'S',262,'','3','','','N',1,'PESO',100.000),
 ('31003','TORNILLO AUTOPERFORANTE 3.8 X25 MM','UDS',0.150,'S',263,'','3','','','N',1,'PESO',100.000),
 ('31004','TORNILLO AUTOPERFORANTE 3.8 X32 MM','UDS',0.150,'S',264,'','3','','','N',1,'PESO',100.000),
 ('31005','TORNILLO AUTOPERFORANTE 3.8 X41 MM','UDS',0.190,'S',265,'','3','','','N',1,'PESO',100.000),
 ('31006','TORNILLO AUTOPERFORANTE 3.8 X50 MM','UDS',0.240,'S',266,'','3','','','N',1,'PESO',100.000),
 ('31007','TORNILLO AUTOPERFORANTE 3.8 X57 MM','UDS',0.260,'S',267,'','3','','','N',1,'PESO',100.000),
 ('31008','TORNILLO AUTOPERFORANTE 3.8 X70 MM','UDS',0.460,'S',268,'','3','','','N',1,'PESO',100.000),
 ('31009','TORNILLO AUTOPERFORANTE 4.2 X63 MM','UDS',0.410,'S',269,'','3','','','N',1,'PESO',100.000),
 ('31010','TORNILLO AUTOPERFORANTE 4.5 X63 MM','UDS',0.420,'S',270,'','3','','','N',1,'PESO',100.000),
 ('31011','TORNILLO AUTOPERFORANTE 8.0 X 50 MM','UDS',0.400,'S',271,'','3','','','N',1,'PESO',100.000),
 ('31012','TORNILLO AUTOPERFORANTE PARA CHAPA 4X13 MM','UDS',0.200,'S',272,'','3','','','N',1,'PESO',100.000),
 ('31013','TORNILLO AUTOPERFORANTE 3.0 X10 MM','UDS',0.100,'S',273,'','3','','','N',1,'PESO',100.000),
 ('32001','TIRAFONDO CABEZA HEXAGONAL ZINC 5/16 X 2 3/4','UDS',1.320,'S',274,'','3','','','N',1,'PESO',100.000),
 ('32002','TIRAFONDO CABEZA HEXAGONAL ZINC 5/16 X 3 1/4','UDS',1.500,'S',275,'','3','','','N',1,'PESO',100.000),
 ('32003','TIRAFONDO CABEZA HEXAGONAL ZINC 5/16 X 4','UDS',0.000,'S',276,'','3','','','N',1,'PESO',100.000),
 ('32004','TIRAFONDO CABEZA HEXAGONAL ZINC 5/16 X 3','UDS',0.000,'S',277,'','3','','','N',1,'PESO',100.000),
 ('32005','TIRAFONDO CABEZA HEXAGONAL ZINC 5/16 X 2','UDS',1.500,'S',278,'','3','','','N',1,'PESO',100.000),
 ('32006','TIRAFONDO CABEZA HEXAGONAL ZINC 5/16 X 5','UDS',2.000,'S',279,'','3','','','N',1,'PESO',100.000),
 ('32007','TIRAFONDO CABEZA HEXAGONAL ZINC 5/16 X 3 1/2','UDS',0.000,'S',280,'','3','','','N',1,'PESO',100.000),
 ('32009','TIRAFONDO CABEZA HEXAGONAL ZINC 1/4 X 2','UDS',1.000,'S',281,'','3','','','N',1,'PESO',100.000),
 ('33001','TACO FISHER 12MM','UDS',0.310,'S',282,'','3','','','N',1,'PESO',100.000),
 ('33002','TACO FISHER 10MM','UDS',0.250,'S',283,'','3','','','N',1,'PESO',100.000),
 ('33003','TACO FISHER 8MM','UDS',0.200,'S',284,'','3','','','N',1,'PESO',100.000),
 ('33004','TACO FISHER 12MM LADRILLO HUECO','UDS',0.700,'S',285,'','3','','','N',1,'PESO',100.000),
 ('33005','TACO FISHER 10MM LADRILLO HUECO','UDS',0.600,'S',286,'','3','','','N',1,'PESO',100.000),
 ('33006','TACO FISHER 8MM LADRILLO HUECO','UDS',0.550,'S',287,'','3','','','N',1,'PESO',100.000),
 ('34001','BULON PARA CAMA 1/4 X 100 LLAVE ALLEN C/TUERCA','UDS',2.000,'S',288,'','3','','','N',1,'PESO',100.000),
 ('35001','ARANDELA PLANA 22 X 8.5 X 2 MM','UDS',0.000,'S',289,'','3','','','N',1,'PESO',100.000),
 ('35002','ARANDELA PLANA 14 X 5 X 1 MM','UDS',0.080,'S',290,'','3','','','N',1,'PESO',100.000),
 ('36001','GRAMPA 90/20','UDS',0.000,'S',291,'','3','','','N',1,'PESO',100.000),
 ('36002','GRAMPA 90/30','UDS',0.000,'S',292,'','3','','','N',1,'PESO',100.000),
 ('36003','GRAMPA 90/40','UDS',0.000,'S',293,'','3','','','N',1,'PESO',100.000),
 ('36004','GRAMPA 71/14 PARA FONDO','UDS',0.000,'S',294,'','3','','','N',1,'PESO',100.000),
 ('36005','GRAMPA 84/14 PARA FONDO','UDS',0.000,'S',295,'','3','','','N',1,'PESO',100.000),
 ('36006','GRAMPA S115 ESPINA','UDS',0.000,'S',296,'','3','','','N',1,'PESO',100.000),
 ('36007','GRAMPA S120 ESPINA','UDS',0.000,'S',297,'','3','','','N',1,'PESO',100.000),
 ('36008','GRAMPA W09 PARA MESA','UDS',0.000,'S',298,'','3','','','N',1,'PESO',100.000),
 ('37001','HIERRO LISO 6MM','METROS',0.000,'S',299,'','3','','','N',1,'PESO',100.000),
 ('61001','BURLETE DE GOMA','METROS',8.800,'S',300,'','6','','','N',1,'PESO',100.000),
 ('61002','BURLETE PARA PUERTA DE VIDRIO','METROS',2.800,'S',301,'','6','','','N',1,'PESO',100.000),
 ('62001','FELPA 5MM','METROS',1.780,'S',302,'','6','','','N',1,'PESO',100.000),
 ('62002','FELPA 7MM','METROS',1.980,'S',303,'','6','','','N',1,'PESO',100.000),
 ('2A001','REJILLA RESPIRATORIA PLASTICA 52 MM','UDS',0.690,'S',304,'','2','','','N',1,'PESO',100.000),
 ('2A002','REJILLA RESPIRATORIA PLASTICA 75 MM','UDS',1.410,'S',305,'','2','','','N',1,'PESO',100.000),
 ('2B001','COLGADOR DE ALACENA','UDS',6.000,'S',306,'','2','','','N',1,'PESO',100.000),
 ('2C001','CERRADURA DE CAJON CUADRADA CROMADA','UDS',9.670,'S',307,'','2','','','N',1,'PESO',100.000),
 ('2C002','CERRADURA DE BOTON CROMADA','UDS',8.640,'S',308,'','2','','','N',1,'PESO',100.000),
 ('2C003','CERRADURA PUERTA DE VIDRIO CORREDIZA CROMADA (SIERRITA)','UDS',9.670,'S',309,'','2','','','N',1,'PESO',100.000),
 ('2C004','CERRADURA PARA PUERTA DE ROPERO ECONOMICA','UDS',0.000,'S',310,'','2','','','N',1,'PESO',100.000),
 ('2C005','CERRADURA INDICADOR LIBRE/OCUPADO PARA BAÑO','UDS',0.000,'S',311,'','2','','','N',1,'PESO',100.000),
 ('2D001','ESCUADRA ESQUINERO 25 X 25 MM','UDS',0.500,'S',312,'','2','','','N',1,'PESO',100.000),
 ('2D002','ESCUADRA ESQUINERO 50 X 50 MM','UDS',0.880,'S',313,'','2','','','N',1,'PESO',100.000),
 ('2D003','ESCUADRA ESQUINERO 75 X 75 MM','UDS',1.100,'S',314,'','2','','','N',1,'PESO',100.000),
 ('2D004','ESCUADRA PLASTICA PARA PERFIL 20 X 20 MM ALUMINIO','UDS',0.000,'S',315,'','2','','','N',1,'PESO',100.000),
 ('2D005','ESCUADRA METAL PARA PERFIL ALUMINIO SCALE','UDS',4.500,'S',316,'','2','','','N',1,'PESO',100.000),
 ('2D006','ESCUADRA \"\"L\"\" PLANA','UDS',0.000,'S',317,'','2','','','N',1,'PESO',100.000),
 ('2EE001','PUNTERA MATE 18 MM','UDS',0.980,'S',318,'','2','','','N',1,'PESO',100.000),
 ('2EE002','PUNTERA BRILLOSA 18 MM','UDS',0.980,'S',319,'','2','','','N',1,'PESO',100.000),
 ('2EE003','PUNTERA MATE 36 MM','UDS',0.000,'S',320,'','2','','','N',1,'PESO',100.000),
 ('2EE004','PUNTERA BRILLOSA 36 MM PLASTICA','UDS',0.000,'S',321,'','2','','','N',1,'PESO',100.000),
 ('2EE005','PUNTERA U MATE 18 MM','UDS',1.500,'S',322,'','2','','','N',1,'PESO',100.000),
 ('2EE006','PUNTERA U BRILLOSA 18 MM','UDS',1.500,'S',323,'','2','','','N',1,'PESO',100.000),
 ('2F001','SOPORTE DE PERCHERO CROMADO','UDS',1.680,'S',324,'','2','','','N',1,'PESO',100.000),
 ('2F002','SOPORTE DE PERCHERO CENTRAL CROMADO','UDS',2.980,'S',325,'','2','','','N',1,'PESO',100.000),
 ('2F003','SOPORTE DE PERCHERO PLASTICO PARA CAÑO REDONDO','UDS',0.000,'S',326,'','2','','','N',1,'PESO',100.000),
 ('2G001','TIJERA COMPASS 150 MM IZQUIERDA','UDS',0.000,'S',327,'','2','','','N',1,'PESO',100.000),
 ('2G002','TIJERA COMPASS 150 MM DERECHA','UDS',0.000,'S',328,'','2','','','N',1,'PESO',100.000),
 ('2H001','TAPA TORNILLOS CREMA','UDS',0.000,'S',329,'','2','','','N',1,'PESO',100.000),
 ('2H002','TAPA TORNILLOS TOSTADO','UDS',0.000,'S',330,'','2','','','N',1,'PESO',100.000),
 ('2H003','TAPA TORNILLOS MARRON OSCURO','UDS',0.000,'S',331,'','2','','','N',1,'PESO',100.000),
 ('2H004','TAPA TORNILLAS HAYA','UDS',0.000,'S',332,'','2','','','N',1,'PESO',100.000),
 ('2H005','TAPA TORNILLOS BLANCO','UDS',0.000,'S',333,'','2','','','N',1,'PESO',100.000),
 ('2H006','TAPA TORNILLOS NEGRO','UDS',0.000,'S',334,'','2','','','N',1,'PESO',100.000),
 ('2H007','TAPA TRONILLOS GRIS','UDS',0.000,'S',335,'','2','','','N',1,'PESO',100.000),
 ('2H008','TAPA TORNILLOS TABACO','UDS',0.000,'S',336,'','2','','','N',1,'PESO',100.000),
 ('2H009','TAPA TORNILLOS AUTOADESHIVO GUINDO','UDS',0.330,'S',337,'','2','','','N',1,'PESO',100.000),
 ('2H010','TAPA TORNILLOS AUTOADESHIVO CEDRO','UDS',0.330,'S',338,'','2','','','N',1,'PESO',100.000),
 ('2H011','TAPA TORNILLOS AUTOADESHIVO CEREJEIRA','UDS',0.330,'S',339,'','2','','','N',1,'PESO',100.000),
 ('2H012','TAPA TORNILLOS AUTOADESHIVO ROBLE MORO','UDS',0.330,'S',340,'','2','','','N',1,'PESO',100.000),
 ('2H013','TAPA TORNILLOS AUTOADESHIVO NEGRO','UDS',0.330,'S',341,'','2','','','N',1,'PESO',100.000),
 ('2H014','TAPA TORNILLOS AUTOADESHIVO HAYA','UDS',0.330,'S',342,'','2','','','N',1,'PESO',100.000),
 ('2H015','TAPA TORNILLOS AUTOADESHIVO WENGUE','UDS',0.330,'S',343,'','2','','','N',1,'PESO',100.000),
 ('2I001','SPOT EMBUTIR CHATO CON MOVIMEINTO DORADO','UDS',0.000,'S',344,'','2','','','N',1,'PESO',100.000),
 ('2I002','SPOT EMBUTIR FIJO','UDS',19.840,'S',345,'','2','','','N',1,'PESO',100.000),
 ('2I003','LAMPARA DICROICA 50/75W 220V.','UDS',7.020,'S',346,'','2','','','N',1,'PESO',100.000),
 ('2I004','SPOT EMBUTIR CROMO BIPIN (CHATO 18MM)','UDS',31.820,'S',347,'','2','','','N',1,'PESO',100.000),
 ('2J001','MENSULA PARA PANEL RANURADO PARA ESTANTE 200MM','UDS',0.000,'S',348,'','2','','','N',1,'PESO',100.000),
 ('2J002','MENSULA RE 10 CM','UDS',0.000,'S',349,'','2','','','N',1,'PESO',100.000),
 ('2J003','MENSULA RE 17 CM','UDS',0.000,'S',350,'','2','','','N',1,'PESO',100.000),
 ('2J004','MENSULA RE 27 CM','UDS',0.000,'S',351,'','2','','','N',1,'PESO',100.000),
 ('2J005','MENSULA RE 37 CM','UDS',9.780,'S',352,'','2','','','N',1,'PESO',100.000),
 ('2J006','MENSULA RE 44 CM','UDS',0.000,'S',353,'','2','','','N',1,'PESO',100.000),
 ('2J007','MENSULA RE 54 CM','UDS',0.000,'S',354,'','2','','','N',1,'PESO',100.000),
 ('2K001','CHAPITA PARA FONDO','UDS',0.100,'S',355,'','2','','','N',1,'PESO',100.000),
 ('2L001','TARUGO DE MADERA 8 X 30 MM','UDS',0.000,'S',356,'','2','','','N',1,'PESO',100.000),
 ('2L002','TARUGO DE MADERA 10 X 30 MM','UDS',0.000,'S',357,'','2','','','N',1,'PESO',100.000),
 ('2M001','BOTINERO CROMADO 8 PARES','UDS',214.800,'S',358,'','2','','','N',1,'PESO',100.000),
 ('2M002','BOTINERO CROMADO 12 PARES','UDS',258.800,'S',359,'','2','','','N',1,'PESO',100.000),
 ('2N001','PANTALONERO CENTRAL CROMADO 10 PERCHAS','UDS',209.800,'S',360,'','2','','','N',1,'PESO',100.000),
 ('2N002','PANTALONERO CENTRAL CROMADO 12 PERCHAS','UDS',0.000,'S',361,'','2','','','N',1,'PESO',100.000),
 ('2N003','PANTALONERO DE ALAMBRE','UDS',0.000,'S',362,'','2','','','N',1,'PESO',100.000),
 ('2O001','CUBIERTERO 300 X 470 MM','UDS',59.220,'S',363,'','2','','','N',1,'PESO',100.000),
 ('2O002','CUBIERTERO 350 X 470 MM','UDS',66.640,'S',364,'','2','','','N',1,'PESO',100.000),
 ('2O003','CUBIERTERO 400 X 500 MM','UDS',76.020,'S',365,'','2','','','N',1,'PESO',100.000),
 ('2O004','CUBIERTERO 600 X 500 MM','UDS',107.380,'S',366,'','2','','','N',1,'PESO',100.000),
 ('2P001','RIEL RE 1.00 MTS','UDS',17.170,'S',367,'','2','','','N',1,'PESO',100.000),
 ('2P002','RIEL RE 1.50 MTS','UDS',0.000,'S',368,'','2','','','N',1,'PESO',100.000),
 ('2P003','RIEL RE 2.00 MTS','UDS',0.000,'S',369,'','2','','','N',1,'PESO',100.000),
 ('2P004','RIEL RE 2.50 MTS','UDS',0.000,'S',370,'','2','','','N',1,'PESO',100.000),
 ('2P005','RIEL RE 3.00 MTS','UDS',0.000,'S',371,'','2','','','N',1,'PESO',100.000),
 ('2Q001','PATA PLASTICO PARA BAJO MESADA','UDS',2.420,'S',372,'','2','','','N',1,'PESO',100.000),
 ('2Q002','PATA DE ALUMINIO','UDS',31.500,'S',373,'','2','','','N',1,'PESO',100.000),
 ('2Q003','PATA DESAYUNADOR 98CM','UDS',167.000,'S',374,'','2','','','N',1,'PESO',100.000),
 ('2Q004','PATA DESAYUNADOR 75CM','UDS',142.000,'S',375,'','2','','','N',1,'PESO',100.000),
 ('2Q005','PATA DESAYUNADOR 71CM CROMADA','UDS',79.000,'S',376,'','2','','','N',1,'PESO',100.000),
 ('2R001','PERCHERO REBATIBLE','UDS',318.800,'S',377,'','2','','','N',1,'PESO',100.000),
 ('2S001','CANASTO DE METAL VERDULERO CROMADO 430 X 460 MM','UDS',0.000,'S',378,'','2','','','N',1,'PESO',100.000),
 ('2T001','CAJA FUERTE CIERRE ELECTRONICO 200 X 200 X 310 MM','UDS',0.000,'S',379,'','2','','','N',1,'PESO',100.000),
 ('2U001','KIT FRENO PLACARD','UDS',268.800,'S',380,'','2','','','N',1,'PESO',100.000),
 ('2V001','GOTITA PARA PUERTA','UDS',0.000,'S',381,'','2','','','N',1,'PESO',100.000),
 ('2W001','PORTA CD PLASTICO','UDS',0.000,'S',382,'','2','','','N',1,'PESO',100.000),
 ('2X001','ESTABILIZADOR DERECHO','UDS',1.980,'S',383,'','2','','','N',1,'PESO',100.000),
 ('2X002','ESTABILIZADOR IZQUIERDO','UDS',1.980,'S',384,'','2','','','N',1,'PESO',100.000),
 ('2Y001','PORTA COPAS REDONDO','UDS',0.000,'S',385,'','2','','','N',1,'PESO',100.000),
 ('2Y002','PORTA COPAS MEDIALUNA','UDS',0.000,'S',386,'','2','','','N',1,'PESO',100.000),
 ('2Y003','PORTA COPAS RECTO LARGO','UDS',0.000,'S',387,'','2','','','N',1,'PESO',100.000),
 ('2Y004','PORTA COPAS RECTO CORTO','UDS',0.000,'S',388,'','2','','','N',1,'PESO',100.000),
 ('2Z001','TACHO DE RESIDUO ACERO INOX.','UDS',205.000,'S',389,'','2','','','N',1,'PESO',100.000),
 ('B5001','TINNER','LITROS',0.000,'S',390,'','B','','','N',1,'PESO',100.000),
 ('B6001','COLOR MERCLIN OSCURO','ML',29.000,'S',391,'','B','','','N',1,'PESO',100.000),
 ('B6002','COLOR MERCLIN MEDIO','ML',29.000,'S',392,'','B','','','N',1,'PESO',100.000),
 ('B6003','COLOR MERCLIN CLARO','ML',29.000,'S',393,'','B','','','N',1,'PESO',100.000),
 ('C1001','SILICONA NEUTRA TRANSPARENTE 300 ML','UDS',26.750,'S',394,'','C','','','N',1,'PESO',100.000),
 ('D1001','MELAMINA SOBRE MDF 18 MM BLANCO FAPLAC','UDS',453.690,'S',395,'','D','','','N',1,'PESO',100.000),
 ('D1002','MELAMINA SOBRE MDF 18 MM BLANCO FAPLAC 25%','UDS',0.000,'S',396,'','D','','','N',1,'PESO',100.000),
 ('D1003','MELAMINA SOBRE MDF 18 MM BLANCO FAPLAC 50%','UDS',0.000,'S',397,'','D','','','N',1,'PESO',100.000),
 ('D1004','MELAMINA SOBRE MDF 18 MM BLANCO FAPLAC 75%','UDS',0.000,'S',398,'','D','','','N',1,'PESO',100.000),
 ('D1005','MELAMINA SOBRE MDF 18 MM HAYA MASISA','UDS',446.360,'S',399,'','D','','','N',1,'PESO',100.000),
 ('D1006','MELAMINA SOBRE MDF 18 MM HAYA MASISA 25%','UDS',0.000,'S',400,'','D','','','N',1,'PESO',100.000),
 ('D1007','MELAMINA SOBRE MDF 18 MM HAYA MASISA 50%','UDS',0.000,'S',401,'','D','','','N',1,'PESO',100.000),
 ('D1008','MELAMINA SOBRE MDF 18 MM HAYA MASISA 75%','UDS',0.000,'S',402,'','D','','','N',1,'PESO',100.000),
 ('D1009','MELAMINA SOBRE MDF 18MM CEREZO MASISA','UDS',446.360,'S',403,'','D','','','N',1,'PESO',100.000),
 ('D1010','MELAMINA SOBRE MDF 18MM CEREZO MASISA 25%','UDS',0.000,'S',404,'','D','','','N',1,'PESO',100.000),
 ('D1011','MELAMINA SOBRE MDF 18MM CEREZO MASISA 50%','UDS',0.000,'S',405,'','D','','','N',1,'PESO',100.000),
 ('D1012','MELAMINA SOBRE MDF 18MM CEREZO MASISA 75%','UDS',0.000,'S',406,'','D','','','N',1,'PESO',100.000),
 ('D1013','MELAMINA SOBRE MDF 18MM CEREJEIRA MASISA','UDS',446.360,'S',407,'','D','','','N',1,'PESO',100.000),
 ('D1014','MELAMINA SOBRE MDF 18MM CEREJEIRA MASISA 25%','UDS',0.000,'S',408,'','D','','','N',1,'PESO',100.000),
 ('D1015','MELAMINA SOBRE MDF 18MM CEREJEIRA MASISA 50%','UDS',0.000,'S',409,'','D','','','N',1,'PESO',100.000),
 ('D1016','MELAMINA SOBRE MDF 18MM CEREJEIRA MASISA 75%','UDS',0.000,'S',410,'','D','','','N',1,'PESO',100.000),
 ('D1017','MELAMANA SOBRE MDF 18MM ROBLE MORO MASISA','UDS',446.360,'S',411,'','D','','','N',1,'PESO',100.000),
 ('D1018','MELAMANA SOBRE MDF 18MM ROBLE MORO MASISA 25%','UDS',0.000,'S',412,'','D','','','N',1,'PESO',100.000),
 ('D1019','MELAMANA SOBRE MDF 18MM ROBLE MORO MASISA 50%','UDS',0.000,'S',413,'','D','','','N',1,'PESO',100.000),
 ('D1020','MELAMANA SOBRE MDF 18MM ROBLE MORO MASISA 75%','UDS',0.000,'S',414,'','D','','','N',1,'PESO',100.000),
 ('D1021','MELAMINA SOBRE MDF 18MM GRIS HUMO FAPLAC','UDS',480.360,'S',415,'','D','','','N',1,'PESO',100.000),
 ('D1022','MELAMINA SOBRE MDF 18MM GRIS HUMO FAPLAC 25%','UDS',0.000,'S',416,'','D','','','N',1,'PESO',100.000),
 ('D1023','MELAMINA SOBRE MDF 18MM GRIS HUMO FAPLAC 50%','UDS',0.000,'S',417,'','D','','','N',1,'PESO',100.000),
 ('D1024','MELAMINA SOBRE MDF 18MM GRIS HUMO FAPLAC 75%','UDS',0.000,'S',418,'','D','','','N',1,'PESO',100.000),
 ('D1025','MELAMINA SOBRE MDF 18MM TEKA ITALIA TOUCH MASISA','UDS',442.000,'S',419,'','D','','','N',1,'PESO',100.000),
 ('D1026','MELAMINA SOBRE MDF 18MM TEKA ITALIA TOUCH MASISA 25%','UDS',0.000,'S',420,'','D','','','N',1,'PESO',100.000),
 ('D1027','MELAMINA SOBRE MDF 18MM TEKA ITALIA TOUCH MASISA 50 %','UDS',0.000,'S',421,'','D','','','N',1,'PESO',100.000),
 ('D1028','MELAMINA SOBRE MDF 18MM TEKA ITALIA TOUCH MASISA 75%','UDS',0.000,'S',422,'','D','','','N',1,'PESO',100.000),
 ('D1029','MELAMINA SOBRE MDF 18MM ALMENDRA FAPLAC','UDS',446.360,'S',423,'','D','','','N',1,'PESO',100.000),
 ('D1030','MELAMINA SOBRE MDF 18MM ALMENDRA FAPLAC 25%','UDS',0.000,'S',424,'','D','','','N',1,'PESO',100.000),
 ('D1031','MELAMINA SOBRE MDF 18MM ALMENDRA FAPLAC 50%','UDS',0.000,'S',425,'','D','','','N',1,'PESO',100.000),
 ('D1032','MELAMINA SOBRE MDF 18MM ALMENDRA FAPLAC 75%','UDS',0.000,'S',426,'','D','','','N',1,'PESO',100.000),
 ('D1033','MELAMINA SOBRE MDF 18MM ROBLE AMERICANO MASISA','UDS',446.360,'S',427,'','D','','','N',1,'PESO',100.000),
 ('D1034','MELAMINA SOBRE MDF 18MM ROBLE AMERICANO MASISA 25%','UDS',0.000,'S',428,'','D','','','N',1,'PESO',100.000),
 ('D1035','MELAMINA SOBRE MDF 18MM ROBLE AMERICANO MASISA 50%','UDS',0.000,'S',429,'','D','','','N',1,'PESO',100.000),
 ('D1036','MELAMINA SOBRE MDF 18MM ROBLE AMERICANO MASISA 75%','UDS',0.000,'S',430,'','D','','','N',1,'PESO',100.000),
 ('D1037','MELAMINA SOBRE MDF 18MM CEDRO NATURAL FAPLAC','UDS',446.360,'S',431,'','D','','','N',1,'PESO',100.000),
 ('D1038','MELAMINA SOBRE MDF 18MM CEDRO NATURAL FAPLAC 25%','UDS',0.000,'S',432,'','D','','','N',1,'PESO',100.000),
 ('D1039','MELAMINA SOBRE MDF 18MM CEDRO NATURAL FAPLAC 50%','UDS',0.000,'S',433,'','D','','','N',1,'PESO',100.000),
 ('D1040','MELAMINA SOBRE MDF 18MM CEDRO NATURAL FAPLAC 75%','UDS',0.000,'S',434,'','D','','','N',1,'PESO',100.000),
 ('D1041','MELAMINA SOBRE MDF 18MM NEGRO LISO FAPLAC','UDS',454.450,'S',435,'','D','','','N',1,'PESO',100.000),
 ('D1042','MELAMINA SOBRE MDF 18MM NEGRO LISO FAPLAC 25%','UDS',0.000,'S',436,'','D','','','N',1,'PESO',100.000),
 ('D1043','MELAMINA SOBRE MDF 18MM NEGRO LISO FAPLAC 50%','UDS',0.000,'S',437,'','D','','','N',1,'PESO',100.000),
 ('D1044','MELAMINA SOBRE MDF 18MM NEGRO LISO FAPLAC 75%','UDS',0.000,'S',438,'','D','','','N',1,'PESO',100.000),
 ('D1045','MELAMINA SOBRE MDF 18MM GRIS GRAFITO MASISA','UDS',408.640,'S',439,'','D','','','N',1,'PESO',100.000),
 ('D1046','MELAMINA SOBRE MDF 18MM GRIS GRAFITO MASISA 25%','UDS',0.000,'S',440,'','D','','','N',1,'PESO',100.000),
 ('D1047','MELAMINA SOBRE MDF 18MM GRIS GRAFITO MASISA 50%','UDS',0.000,'S',441,'','D','','','N',1,'PESO',100.000),
 ('D1048','MELAMINA SOBRE MDF 18MM GRIS GRAFITO MASISA 75%','UDS',0.000,'S',442,'','D','','','N',1,'PESO',100.000),
 ('D1049','MELAMINA SOBRE MDF 18MM GRIS GRAFITO FAPLAC','UDS',0.000,'S',443,'','D','','','N',1,'PESO',100.000),
 ('D1050','MELAMINA SOBRE MDF 18MM GRIS GRAFITO FAPLAC 25%','UDS',0.000,'S',444,'','D','','','N',1,'PESO',100.000),
 ('D1051','MELAMINA SOBRE MDF 18MM GRIS GRAFITO FAPLAC 50%','UDS',0.000,'S',445,'','D','','','N',1,'PESO',100.000),
 ('D1052','MELAMINA SOBRE MDF 18MM GRIS GRAFITO FAPLAC 75%','UDS',0.000,'S',446,'','D','','','N',1,'PESO',100.000),
 ('D1053','MELAMINA SOBRE MDF 18MM CENIZA FAPLAC','UDS',401.770,'S',447,'','D','','','N',1,'PESO',100.000),
 ('D1054','MELAMINA SOBRE MDF 18MM CENIZA FAPLAC 25%','UDS',0.000,'S',448,'','D','','','N',1,'PESO',100.000),
 ('D1055','MELAMINA SOBRE MDF 18MM CENIZA FAPLAC 50%','UDS',0.000,'S',449,'','D','','','N',1,'PESO',100.000),
 ('D1056','MELAMINA SOBRE MDF 18MM CENIZA FAPLAC 75%','UDS',0.000,'S',450,'','D','','','N',1,'PESO',100.000),
 ('D1057','MELAMINA SOBRE MDF 18MM FRESNO NEGRO MASISA','UDS',446.360,'S',451,'','D','','','N',1,'PESO',100.000),
 ('D1058','MELAMINA SOBRE MDF 18MM FRESNO NEGRO MASISA 25%','UDS',0.000,'S',452,'','D','','','N',1,'PESO',100.000),
 ('D1059','MELAMINA SOBRE MDF 18MM FRESNO NEGRO MASISA 50%','UDS',0.000,'S',453,'','D','','','N',1,'PESO',100.000),
 ('D1060','MELAMINA SOBRE MDF 18MM FRESNO NEGRO MASISA 75%','UDS',0.000,'S',454,'','D','','','N',1,'PESO',100.000),
 ('D1061','MELAMINA SOBRE MDF 18MM CARBALHO MEZZO FAPLAC','UDS',430.050,'S',455,'','D','','','N',1,'PESO',100.000),
 ('D1062','MELAMINA SOBRE MDF 18MM CARBALHO MEZZO FAPLAC 25%','UDS',0.000,'S',456,'','D','','','N',1,'PESO',100.000),
 ('D1063','MELAMINA SOBRE MDF 18MM CARBALHO MEZZO FAPLAC 50%','UDS',0.000,'S',457,'','D','','','N',1,'PESO',100.000),
 ('D1064','MELAMINA SOBRE MDF 18MM CARBALHO MEZZO FAPLAC 75%','UDS',0.000,'S',458,'','D','','','N',1,'PESO',100.000),
 ('D1065','MELAMINA SOBRE MDF 18MM LINOZA CINZA TOUCH FAPLAC','UDS',442.000,'S',459,'','D','','','N',1,'PESO',100.000),
 ('D1066','MELAMINA SOBRE MDF 18MM LINOZA CINZA TOUCH FAPLAC 25%','UDS',0.000,'S',460,'','D','','','N',1,'PESO',100.000),
 ('D1067','MELAMINA SOBRE MDF 18MM LINOZA CINZA TOUCH FAPLAC 50%','UDS',0.000,'S',461,'','D','','','N',1,'PESO',100.000),
 ('D1068','MELAMINA SOBRE MDF 18MM LINOZA CINZA TOUCH FAPLAC 75%','UDS',0.000,'S',462,'','D','','','N',1,'PESO',100.000),
 ('D1069','MELAMINA SOBRE MDF 18MM WENGUE MASISA','UDS',446.360,'S',463,'','D','','','N',1,'PESO',100.000),
 ('D1070','MELAMINA SOBRE MDF 18MM WENGUE MASISA 25%','UDS',0.000,'S',464,'','D','','','N',1,'PESO',100.000),
 ('D1071','MELAMINA SOBRE MDF 18MM WENGUE MASISA 50%','UDS',0.000,'S',465,'','D','','','N',1,'PESO',100.000),
 ('D1072','MELAMINA SOBRE MDF 18MM WENGUE MASISA 75%','UDS',0.000,'S',466,'','D','','','N',1,'PESO',100.000),
 ('D1073','MELAMINA SOBRE MDF 18MM GUINDO MASISA','UDS',446.360,'S',467,'','D','','','N',1,'PESO',100.000),
 ('D1074','MELAMINA SOBRE MDF 18MM GUINDO MASISA 25%','UDS',0.000,'S',468,'','D','','','N',1,'PESO',100.000),
 ('D1075','MELAMINA SOBRE MDF 18MM GUINDO MASISA 50%','UDS',0.000,'S',469,'','D','','','N',1,'PESO',100.000),
 ('D1076','MELAMINA SOBRE MDF 18MM GUINDO MASISA 75%','UDS',0.000,'S',470,'','D','','','N',1,'PESO',100.000),
 ('D1077','MELAMINA SOBRE MDF 18MM TANGANICA TABACO FAPLAC','UDS',446.360,'S',471,'','D','','','N',1,'PESO',100.000),
 ('D1078','MELAMINA SOBRE MDF 18MM TANGANICA TABACO FAPLAC 25%','UDS',0.000,'S',472,'','D','','','N',1,'PESO',100.000),
 ('D1079','MELAMINA SOBRE MDF 18MM TANGANICA TABACO FAPLAC 50%','UDS',0.000,'S',473,'','D','','','N',1,'PESO',100.000),
 ('D1080','MELAMINA SOBRE MDF 18MM TANGANICA TABACO FAPLAC 75%','UDS',0.000,'S',474,'','D','','','N',1,'PESO',100.000),
 ('D1081','MELAMINA SOBRE MDF 18MM FRESNO ABEDUL MASISA','UDS',446.360,'S',475,'','D','','','N',1,'PESO',100.000),
 ('D1082','MELAMINA SOBRE MDF 18MM FRESNO ABEDUL MASISA 25%','UDS',0.000,'S',476,'','D','','','N',1,'PESO',100.000),
 ('D1083','MELAMINA SOBRE MDF 18MM FRESNO ABEDUL MASISA 50%','UDS',0.000,'S',477,'','D','','','N',1,'PESO',100.000),
 ('D1084','MELAMINA SOBRE MDF 18MM FRESNO ABEDUL MASISA 75%','UDS',0.000,'S',478,'','D','','','N',1,'PESO',100.000),
 ('D1085','MELAMINA SOBRE MDF 18MM TECA MASISA','UDS',446.360,'S',479,'','D','','','N',1,'PESO',100.000),
 ('D1086','MELAMINA SOBRE MDF 18MM TECA MASISA 25%','UDS',0.000,'S',480,'','D','','','N',1,'PESO',100.000),
 ('D1087','MELAMINA SOBRE MDF 18MM TECA MASISA 50%','UDS',0.000,'S',481,'','D','','','N',1,'PESO',100.000),
 ('D1088','MELAMINA SOBRE MDF 18MM TECA MASISA 75%','UDS',0.000,'S',482,'','D','','','N',1,'PESO',100.000),
 ('D1089','MELAMINA SOBRE MDF 18MM VISON MASISA','UDS',446.360,'S',483,'','D','','','N',1,'PESO',100.000),
 ('D1090','MELAMINA SOBRE MDF 18MM VISON MASISA 25%','UDS',0.000,'S',484,'','D','','','N',1,'PESO',100.000),
 ('D1091','MELAMINA SOBRE MDF 18MM VISON MASISA 50%','UDS',0.000,'S',485,'','D','','','N',1,'PESO',100.000),
 ('D1092','MELAMINA SOBRE MDF 18MM VISON MASISA 75%','UDS',0.000,'S',486,'','D','','','N',1,'PESO',100.000),
 ('D1093','MELAMINA SOBRE MDF 18MM ROBLE RUSTICO MASISA','UDS',446.360,'S',487,'','D','','','N',1,'PESO',100.000),
 ('D1094','MELAMINA SOBRE MDF 18MM ROBLE RUSTICO MASISA 25%','UDS',0.000,'S',488,'','D','','','N',1,'PESO',100.000),
 ('D1095','MELAMINA SOBRE MDF 18MM ROBLE RUSTICO MASISA 50%','UDS',0.000,'S',489,'','D','','','N',1,'PESO',100.000),
 ('D1096','MELAMINA SOBRE MDF 18MM ROBLE RUSTICO MASISA 75%','UDS',0.000,'S',490,'','D','','','N',1,'PESO',100.000),
 ('D1097','MELAMINA SOBRE MDF 18MM ROBLE ESPAÑOL FAPLAC','UDS',446.360,'S',491,'','D','','','N',1,'PESO',100.000),
 ('D1098','MELAMINA SOBRE MDF 18MM ROBLE ESPAÑOL FAPLAC 25%','UDS',0.000,'S',492,'','D','','','N',1,'PESO',100.000),
 ('D1099','MELAMINA SOBRE MDF 18MM ROBLE ESPAÑOL FAPLAC 50%','UDS',0.000,'S',493,'','D','','','N',1,'PESO',100.000),
 ('D1100','MELAMINA SOBRE MDF 18MM ROBLE ESPAÑOL FAPLAC 75%','UDS',0.000,'S',494,'','D','','','N',1,'PESO',100.000),
 ('D1101','MELAMINA SOBRE MDF 18MM ROBLE DAKAR NATURE FAPLAC','UDS',480.360,'S',495,'','D','','','N',1,'PESO',100.000),
 ('D1102','MELAMINA SOBRE MDF 18MM ROBLE DAKAR NATURE FAPLAC 25%','UDS',0.000,'S',496,'','D','','','N',1,'PESO',100.000),
 ('D1103','MELAMINA SOBRE MDF 18MM ROBLE DAKAR NATURE FAPLAC 50%','UDS',0.000,'S',497,'','D','','','N',1,'PESO',100.000),
 ('D1104','MELAMINA SOBRE MDF 18MM ROBLE DAKAR NATURE FAPLAC 75%','UDS',0.000,'S',498,'','D','','','N',1,'PESO',100.000),
 ('D1105','MELAMINA SOBRE MDF 18MM CEREZO NATURAL FAPLAC','UDS',0.000,'S',499,'','D','','','N',1,'PESO',100.000),
 ('D1106','MELAMINA SOBRE MDF 18MM CEREZO NATURAL FAPLAC 25%','UDS',0.000,'S',500,'','D','','','N',1,'PESO',100.000),
 ('D1107','MELAMINA SOBRE MDF 18MM CEREZO NATURAL FAPLAC 50%','UDS',0.000,'S',501,'','D','','','N',1,'PESO',100.000),
 ('D1108','MELAMINA SOBRE MDF 18MM CEREZO NATURAL FAPLAC 75%','UDS',0.000,'S',502,'','D','','','N',1,'PESO',100.000),
 ('D1109','MELAMINA SOBRE MDF 18MM MAPLE FAPLAC','UDS',446.360,'S',503,'','D','','','N',1,'PESO',100.000),
 ('D1110','MELAMINA SOBRE MDF 18MM MAPLE FAPLAC 25%','UDS',0.000,'S',504,'','D','','','N',1,'PESO',100.000),
 ('D1111','MELAMINA SOBRE MDF 18MM MAPLE FAPLAC 50%','UDS',0.000,'S',505,'','D','','','N',1,'PESO',100.000),
 ('D1112','MELAMINA SOBRE MDF 18MM MAPLE FAPLAC 75%','UDS',0.000,'S',506,'','D','','','N',1,'PESO',100.000),
 ('D1113','MELAMINA SOBRE MDF 18MM NOGAL HABANO MASISA','UDS',489.460,'S',507,'','D','','','N',1,'PESO',100.000),
 ('D1114','MELAMINA SOBRE MDF 18MM NOGAL HABANO MASISA 25%','UDS',0.000,'S',508,'','D','','','N',1,'PESO',100.000),
 ('D1115','MELAMINA SOBRE MDF 18MM NOGAL HABANO MASISA 50%','UDS',0.000,'S',509,'','D','','','N',1,'PESO',100.000),
 ('D1116','MELAMINA SOBRE MDF 18MM NOGAL HABANO MASISA 75%','UDS',0.000,'S',510,'','D','','','N',1,'PESO',100.000),
 ('D1117','MDF 15MM CRUDO FAPLAC','UDS',436.860,'S',511,'','D','','','N',1,'PESO',100.000),
 ('D1118','MDF 15MM CRUDO FAPLAC 25%','UDS',0.000,'S',512,'','D','','','N',1,'PESO',100.000),
 ('D1119','MDF 15MM CRUDO FAPLAC 50%','UDS',0.000,'S',513,'','D','','','N',1,'PESO',100.000),
 ('D1120','MDF 15MM CRUDO FAPLAC 75%','UDS',0.000,'S',514,'','D','','','N',1,'PESO',100.000),
 ('D1121','MDF 18MM CRUDO FAPLAC','UDS',0.000,'S',515,'','D','','','N',1,'PESO',100.000),
 ('D1122','MDF 18MM CRUDO FAPLAC 25%','UDS',0.000,'S',516,'','D','','','N',1,'PESO',100.000),
 ('D1123','MDF 18MM CRUDO FAPLAC 50%','UDS',0.000,'S',517,'','D','','','N',1,'PESO',100.000),
 ('D1124','MDF 18MM CRUDO FAPLAC 75%','UDS',0.000,'S',518,'','D','','','N',1,'PESO',100.000),
 ('D1125','MDF PARA LUSTRE18MM CEDRO MASISA','UDS',436.860,'S',519,'','D','','','N',1,'PESO',100.000),
 ('D1126','MDF PARA LUSTRE18MM CEDRO MASISA 25%','UDS',0.000,'S',520,'','D','','','N',1,'PESO',100.000),
 ('D1127','MDF PARA LUSTRE18MM CEDRO MASISA 50%','UDS',0.000,'S',521,'','D','','','N',1,'PESO',100.000),
 ('D1128','MDF PARA LUSTRE18MM CEDRO MASISA 75%','UDS',0.000,'S',522,'','D','','','N',1,'PESO',100.000),
 ('D1129','MDF PARA LUSTRE18MM GUATAMBU MASISA','UDS',436.860,'S',523,'','D','','','N',1,'PESO',100.000),
 ('D1130','MDF PARA LUSTRE18MM GUATAMBU MASISA 25%','UDS',0.000,'S',524,'','D','','','N',1,'PESO',100.000),
 ('D1131','MDF PARA LUSTRE18MM GUATAMBU MASISA 50%','UDS',0.000,'S',525,'','D','','','N',1,'PESO',100.000),
 ('D1132','MDF PARA LUSTRE18MM GUATAMBU MASISA 75%','UDS',0.000,'S',526,'','D','','','N',1,'PESO',100.000),
 ('D1133','MDF PARA LUSTRE18MM ROBLE MASISA','UDS',436.860,'S',527,'','D','','','N',1,'PESO',100.000),
 ('D1134','MDF PARA LUSTRE18MM ROBLE MASISA 25%','UDS',0.000,'S',528,'','D','','','N',1,'PESO',100.000),
 ('D1135','MDF PARA LUSTRE18MM ROBLE MASISA 50%','UDS',0.000,'S',529,'','D','','','N',1,'PESO',100.000),
 ('D1136','MDF PARA LUSTRE18MM ROBLE MASISA 75%','UDS',0.000,'S',530,'','D','','','N',1,'PESO',100.000),
 ('D1137','MELAMINA SOBRE MDF 12MM BLANCO MASISA','UDS',353.840,'S',531,'','D','','','N',1,'PESO',100.000),
 ('D1138','MELAMINA SOBRE MDF 12MM BLANCO MASISA 25%','UDS',0.000,'S',532,'','D','','','N',1,'PESO',100.000),
 ('D1139','MELAMINA SOBRE MDF 12MM BLANCO MASISA 50%','UDS',0.000,'S',533,'','D','','','N',1,'PESO',100.000),
 ('D1140','MELAMINA SOBRE MDF 12MM BLANCO MASISA 75%','UDS',0.000,'S',534,'','D','','','N',1,'PESO',100.000),
 ('D1141','MELAMINA SOBRE MDF 18 MM BLANCO MASISA','UDS',404.000,'S',535,'','D','','','N',1,'PESO',100.000),
 ('D1142','MELAMINA SOBRE MDF 18 MM BLANCO MASISA 25%','UDS',0.000,'S',536,'','D','','','N',1,'PESO',100.000),
 ('D1143','MELAMINA SOBRE MDF 18 MM BLANCO MASISA 50%','UDS',0.000,'S',537,'','D','','','N',1,'PESO',100.000),
 ('D1144','MELAMINA SOBRE MDF 18 MM BLANCO MASISA 75%','UDS',0.000,'S',538,'','D','','','N',1,'PESO',100.000),
 ('D1145','MELAMINA SOBRE MDF 18 MM NOCCE MILANO FAPLAC','UDS',472.630,'S',539,'','D','','','N',1,'PESO',100.000),
 ('D1146','MELAMINA SOBRE MDF 18 MM NOCCE MILANO FAPLAC 25%','UDS',0.000,'S',540,'','D','','','N',1,'PESO',100.000),
 ('D1147','MELAMINA SOBRE MDF 18 MM NOCCE MILANO FAPLAC 50%','UDS',0.000,'S',541,'','D','','','N',1,'PESO',100.000),
 ('D1148','MELAMINA SOBRE MDF 18 MM NOCCE MILANO FAPLAC 75%','UDS',0.000,'S',542,'','D','','','N',1,'PESO',100.000),
 ('D1149','PANEL RANURADO 18 MM BLANCO MASISA 2.60 X 1.83','UDS',477.590,'S',543,'','D','','','N',1,'PESO',100.000),
 ('D1150','PANEL RANURADO 18 MM BLANCO MASISA 2.60 X 1.83 25%','UDS',0.000,'S',544,'','D','','','N',1,'PESO',100.000),
 ('D1151','PANEL RANURADO 18 MM BLANCO MASISA 2.60 X 1.83 50%','UDS',0.000,'S',545,'','D','','','N',1,'PESO',100.000),
 ('D1152','PANEL RANURADO 18 MM BLANCO MASISA 2.60 X 1.83 75%','UDS',0.000,'S',546,'','D','','','N',1,'PESO',100.000),
 ('D1153','MELAMINA SOBRE MDF 12MM BLANCO FAPLAC','UDS',324.590,'S',547,'','D','','','N',1,'PESO',100.000),
 ('D1154','MELAMINA SOBRE MDF 12MM BLANCO FAPLAC 25%','UDS',0.000,'S',548,'','D','','','N',1,'PESO',100.000),
 ('D1155','MELAMINA SOBRE MDF 12MM BLANCO FAPLAC 50%','UDS',0.000,'S',549,'','D','','','N',1,'PESO',100.000),
 ('D1156','MELAMINA SOBRE MDF 12MM BLANCO FAPLAC 75%','UDS',0.000,'S',550,'','D','','','N',1,'PESO',100.000),
 ('D1157','MELAMINA SOBRE MDF 18 MM LARICINA MASISA','UDS',483.000,'S',551,'','D','','','N',1,'PESO',100.000),
 ('D1158','MELAMINA SOBRE MDF 18 MM LARICINA MASISA 25%','UDS',0.000,'S',552,'','D','','','N',1,'PESO',100.000),
 ('D1159','MELAMINA SOBRE MDF 18 MM LARICINA MASISA 50%','UDS',0.000,'S',553,'','D','','','N',1,'PESO',100.000),
 ('D1160','MELAMINA SOBRE MDF 18 MM LARICINA MASISA 75%','UDS',0.000,'S',554,'','D','','','N',1,'PESO',100.000),
 ('D1161','MELAMINA SOBRE MDF 18 MM CEDRO MASISA','UDS',468.040,'S',555,'','D','','','N',1,'PESO',100.000),
 ('D1162','MELAMINA SOBRE MDF 18 MM CEDRO MASISA 25%','UDS',0.000,'S',556,'','D','','','N',1,'PESO',100.000),
 ('D1163','MELAMINA SOBRE MDF 18 MM CEDRO MASISA 50%','UDS',0.000,'S',557,'','D','','','N',1,'PESO',100.000),
 ('D1164','MELAMINA SOBRE MDF 18 MM CEDRO MASISA 75%','UDS',0.000,'S',558,'','D','','','N',1,'PESO',100.000),
 ('D1165','MELAMINA SOBRE MDF 18 MM MALAGA CHERRY','UDS',500.000,'S',559,'','D','','','N',1,'PESO',100.000),
 ('D1166','MELAMINA SOBRE MDF 18 MM MALAGA CHERRY 25%','UDS',0.000,'S',560,'','D','','','N',1,'PESO',100.000),
 ('D1167','MELAMINA SOBRE MDF 18 MM MALAGA CHERRY 50%','UDS',0.000,'S',561,'','D','','','N',1,'PESO',100.000),
 ('D1168','MELAMINA SOBRE MDF 18 MM MALAGA CHERRY 75%','UDS',0.000,'S',562,'','D','','','N',1,'PESO',100.000),
 ('D2001','MELAMINA SOBRE AGLOMERADO 15MM CEREJEIRA MASISA','UDS',0.000,'S',563,'','D','','','N',1,'PESO',100.000),
 ('D2002','MELAMINA SOBRE AGLOMERADO 15MM CEREJEIRA MASISA 25%','UDS',0.000,'S',564,'','D','','','N',1,'PESO',100.000),
 ('D2003','MELAMINA SOBRE AGLOMERADO 15MM CEREJEIRA MASISA 50%','UDS',0.000,'S',565,'','D','','','N',1,'PESO',100.000),
 ('D2004','MELAMINA SOBRE AGLOMERADO 15MM CEREJEIRA MASISA 75%','UDS',0.000,'S',566,'','D','','','N',1,'PESO',100.000),
 ('D2005','MELAMINA SOBRE AGLOMERADO 18MM AZUL MASISA','UDS',436.860,'S',567,'','D','','','N',1,'PESO',100.000),
 ('D2006','MELAMINA SOBRE AGLOMERADO 18MM AZUL MASISA 25%','UDS',0.000,'S',568,'','D','','','N',1,'PESO',100.000),
 ('D2007','MELAMINA SOBRE AGLOMERADO 18MM AZUL MASISA 50%','UDS',0.000,'S',569,'','D','','','N',1,'PESO',100.000),
 ('D2008','MELAMINA SOBRE AGLOMERADO 18MM AZUL MASISA 75%','UDS',0.000,'S',570,'','D','','','N',1,'PESO',100.000),
 ('D2009','MELAMINA SOBRE AGLOMERADO 18MM AZUL LAGO FAPLAC','UDS',436.860,'S',571,'','D','','','N',1,'PESO',100.000),
 ('D2010','MELAMINA SOBRE AGLOMERADO 18MM AZUL LAGO FAPLAC 25%','UDS',0.000,'S',572,'','D','','','N',1,'PESO',100.000),
 ('D2011','MELAMINA SOBRE AGLOMERADO 18MM AZUL LAGO FAPLAC 50%','UDS',0.000,'S',573,'','D','','','N',1,'PESO',100.000),
 ('D2012','MELAMINA SOBRE AGLOMERADO 18MM AZUL LAGO FAPLAC 75%','UDS',0.000,'S',574,'','D','','','N',1,'PESO',100.000),
 ('D2013','MELAMINA SOBRE AGLOMERADO 18MM ZEBRANO MASISA','UDS',436.860,'S',575,'','D','','','N',1,'PESO',100.000),
 ('D2014','MELAMINA SOBRE AGLOMERADO 18MM ZEBRANO MASISA 25%','UDS',0.000,'S',576,'','D','','','N',1,'PESO',100.000),
 ('D2015','MELAMINA SOBRE AGLOMERADO 18MM ZEBRANO MASISA 50%','UDS',0.000,'S',577,'','D','','','N',1,'PESO',100.000),
 ('D2016','MELAMINA SOBRE AGLOMERADO 18MM ZEBRANO MASISA 75%','UDS',0.000,'S',578,'','D','','','N',1,'PESO',100.000),
 ('D3001','FIBRO PLUS 3MM BLANCO','UDS',98.070,'S',579,'','D','','','N',1,'PESO',100.000),
 ('D3002','FIBRO PLUS 3MM BLANCO 25%','UDS',0.000,'S',580,'','D','','','N',1,'PESO',100.000),
 ('D3003','FIBRO PLUS 3MM BLANCO 50%','UDS',0.000,'S',581,'','D','','','N',1,'PESO',100.000),
 ('D3004','FIBRO PLUS 3MM BLANCO 75%','UDS',0.000,'S',582,'','D','','','N',1,'PESO',100.000),
 ('D3005','FIBRO PLUS 3MM HAYA','UDS',91.400,'S',583,'','D','','','N',1,'PESO',100.000),
 ('D3006','FIBRO PLUS 3MM HAYA 25%','UDS',0.000,'S',584,'','D','','','N',1,'PESO',100.000),
 ('D3007','FIBRO PLUS 3MM HAYA 50%','UDS',0.000,'S',585,'','D','','','N',1,'PESO',100.000),
 ('D3008','FIBRO PLUS 3MM HAYA 75%','UDS',0.000,'S',586,'','D','','','N',1,'PESO',100.000),
 ('D3009','FIBRO PLUS 3MM CEDRO NATURAL','UDS',91.400,'S',587,'','D','','','N',1,'PESO',100.000),
 ('D3010','FIBRO PLUS 3MM CEDRO NATURAL 25%','UDS',0.000,'S',588,'','D','','','N',1,'PESO',100.000),
 ('D3011','FIBRO PLUS 3MM CEDRO NATURAL 50%','UDS',0.000,'S',589,'','D','','','N',1,'PESO',100.000),
 ('D3012','FIBRO PLUS 3MM CEDRO NATURAL 75%','UDS',0.000,'S',590,'','D','','','N',1,'PESO',100.000),
 ('D3013','FIBRO PLUS 3MM CEREJEIRRA','UDS',91.400,'S',591,'','D','','','N',1,'PESO',100.000),
 ('D3013','FIBRO PLUS 3MM CEREJEIRRA 25%','UDS',0.000,'S',592,'','D','','','N',1,'PESO',100.000),
 ('D3014','FIBRO PLUS 3MM CEREJEIRRA 50%','UDS',0.000,'S',593,'','D','','','N',1,'PESO',100.000),
 ('D3015','FIBRO PLUS 3MM CEREJEIRRA 75%','UDS',0.000,'S',594,'','D','','','N',1,'PESO',100.000),
 ('D3016','FIBRO PLUS 3MM ROBLE ESPAÑOL','UDS',91.400,'S',595,'','D','','','N',1,'PESO',100.000),
 ('D3017','FIBRO PLUS 3MM ROBLE ESPAÑOL 25%','UDS',0.000,'S',596,'','D','','','N',1,'PESO',100.000),
 ('D3018','FIBRO PLUS 3MM ROBLE ESPAÑOL 50%','UDS',0.000,'S',597,'','D','','','N',1,'PESO',100.000),
 ('D3019','FIBRO PLUS 3MM ROBLE ESPAÑOL 75%','UDS',0.000,'S',598,'','D','','','N',1,'PESO',100.000),
 ('D3020','FIBRO PLUS 3MM WENGUE','UDS',91.400,'S',599,'','D','','','N',1,'PESO',100.000),
 ('D3021','FIBRO PLUS 3MM WENGUE 25%','UDS',0.000,'S',600,'','D','','','N',1,'PESO',100.000),
 ('D3022','FIBRO PLUS 3MM WENGUE 50%','UDS',0.000,'S',601,'','D','','','N',1,'PESO',100.000),
 ('D3023','FIBRO PLUS 3MM WENGUE 75%','UDS',0.000,'S',602,'','D','','','N',1,'PESO',100.000),
 ('D3024','FIBRO PLUS 3MM NEGRO','UDS',91.400,'S',603,'','D','','','N',1,'PESO',100.000),
 ('D3025','FIBRO PLUS 3MM NEGRO 25%','UDS',0.000,'S',604,'','D','','','N',1,'PESO',100.000),
 ('D3026','FIBRO PLUS 3MM NEGRO 50%','UDS',0.000,'S',605,'','D','','','N',1,'PESO',100.000),
 ('D3027','FIBRO PLUS 3MM NEGRO 75%','UDS',0.000,'S',606,'','D','','','N',1,'PESO',100.000);
INSERT INTO `otmateriales` (`codigomat`,`detalle`,`unidad`,`impuni`,`ctrlstock`,`idmate`,`ctacontable`,`codlinea`,`fbaja`,`observa`,`ocultar`,`idmoneda`,`moneda`,`stockmin`) VALUES 
 ('D3028','FIBRO PLUS 3MM ROBLE MORO','UDS',91.400,'S',607,'','D','','','N',1,'PESO',100.000),
 ('D3029','FIBRO PLUS 3MM ROBLE MORO 25%','UDS',0.000,'S',608,'','D','','','N',1,'PESO',100.000),
 ('D3030','FIBRO PLUS 3MM ROBLE MORO 50%','UDS',0.000,'S',609,'','D','','','N',1,'PESO',100.000),
 ('D3031','FIBRO PLUS 3MM ROBLE MORO 75%','UDS',0.000,'S',610,'','D','','','N',1,'PESO',100.000),
 ('D3032','FIBRO PLUS 3MM CEREZO','UDS',91.400,'S',611,'','D','','','N',1,'PESO',100.000),
 ('D3033','FIBRO PLUS 3MM CEREZO 25%','UDS',0.000,'S',612,'','D','','','N',1,'PESO',100.000),
 ('D3034','FIBRO PLUS 3MM CEREZO 50%','UDS',0.000,'S',613,'','D','','','N',1,'PESO',100.000),
 ('D3035','FIBRO PLUS 3MM CEREZO 75%','UDS',0.000,'S',614,'','D','','','N',1,'PESO',100.000),
 ('D3036','FIBRO PLUS 3MM NOGAL HABANO','UDS',102.440,'S',615,'','D','','','N',1,'PESO',100.000),
 ('D3037','FIBRO PLUS 3MM NOGAL HABANO 25%','UDS',0.000,'S',616,'','D','','','N',1,'PESO',100.000),
 ('D3038','FIBRO PLUS 3MM NOGAL HABANO 50%','UDS',0.000,'S',617,'','D','','','N',1,'PESO',100.000),
 ('D3039','FIBRO PLUS 3MM NOGAL HABANO 75%','UDS',0.000,'S',618,'','D','','','N',1,'PESO',100.000),
 ('D3040','FIBRO PLUS 3MM CEDRO','UDS',91.400,'S',619,'','D','','','N',1,'PESO',100.000),
 ('D3041','FIBRO PLUS 3MM CEDRO 25%','UDS',0.000,'S',620,'','D','','','N',1,'PESO',100.000),
 ('D3042','FIBRO PLUS 3MM CEDRO 50%','UDS',0.000,'S',621,'','D','','','N',1,'PESO',100.000),
 ('D3043','FIBRO PLUS 3MM CEDRO 75%','UDS',0.000,'S',622,'','D','','','N',1,'PESO',100.000),
 ('D3044','FIBRO PLUS 3MM GRIS GRAFITO','UDS',91.400,'S',623,'','D','','','N',1,'PESO',100.000),
 ('D3045','FIBRO PLUS 3MM GRIS GRAFITO 25%','UDS',0.000,'S',624,'','D','','','N',1,'PESO',100.000),
 ('D3046','FIBRO PLUS 3MM GRIS GRAFITO 50%','UDS',0.000,'S',625,'','D','','','N',1,'PESO',100.000),
 ('D3047','FIBRO PLUS 3MM GRIS GRAFITO 75%','UDS',0.000,'S',626,'','D','','','N',1,'PESO',100.000),
 ('D3048','FIBRO PLUS 3MM FRESNO ABEDUL','UDS',0.000,'S',627,'','D','','','N',1,'PESO',100.000),
 ('D3049','FIBRO PLUS 3MM FRESNO ABEDUL 25%','UDS',0.000,'S',628,'','D','','','N',1,'PESO',100.000),
 ('D3050','FIBRO PLUS 3MM FRESNO ABEDUL 50%','UDS',0.000,'S',629,'','D','','','N',1,'PESO',100.000),
 ('D3051','FIBRO PLUS 3MM FRESNO ABEDUL 75%','UDS',0.000,'S',630,'','D','','','N',1,'PESO',100.000),
 ('D3052','FIBRO PLUS 3MM TANGANICA TABACO','UDS',91.400,'S',631,'','D','','','N',1,'PESO',100.000),
 ('D3053','FIBRO PLUS 3MM TANGANICA TABACO 25%','UDS',0.000,'S',632,'','D','','','N',1,'PESO',100.000),
 ('D3054','FIBRO PLUS 3MM TANGANICA TABACO 50%','UDS',0.000,'S',633,'','D','','','N',1,'PESO',100.000),
 ('D3055','FIBRO PLUS 3MM TANGANICA TABACO 75%','UDS',0.000,'S',634,'','D','','','N',1,'PESO',100.000),
 ('D3056','FIBRO PLUS 3MM ZEBRANO','UDS',0.000,'S',635,'','D','','','N',1,'PESO',100.000),
 ('D3057','FIBRO PLUS 3MM ZEBRANO 25%','UDS',0.000,'S',636,'','D','','','N',1,'PESO',100.000),
 ('D3058','FIBRO PLUS 3MM ZEBRANO 50%','UDS',0.000,'S',637,'','D','','','N',1,'PESO',100.000),
 ('D3059','FIBRO PLUS 3MM ZEBRANO 75%','UDS',0.000,'S',638,'','D','','','N',1,'PESO',100.000),
 ('D3060','FIBRO PLUS 3MM AZUL LAGO','UDS',0.000,'S',639,'','D','','','N',1,'PESO',100.000),
 ('D3061','FIBRO PLUS 3MM AZUL LAGO 25%','UDS',0.000,'S',640,'','D','','','N',1,'PESO',100.000),
 ('D3062','FIBRO PLUS 3MM AZUL LAGO 50%','UDS',0.000,'S',641,'','D','','','N',1,'PESO',100.000),
 ('D3063','FIBRO PLUS 3MM AZUL LAGO 75%','UDS',0.000,'S',642,'','D','','','N',1,'PESO',100.000),
 ('D3064','FIBRO PLUS 5MM TECA ITALIA TOUCH','UDS',0.000,'S',643,'','D','','','N',1,'PESO',100.000),
 ('D3065','FIBRO PLUS 5MM TECA ITALIA TOUCH 25%','UDS',0.000,'S',644,'','D','','','N',1,'PESO',100.000),
 ('D3066','FIBRO PLUS 5MM TECA ITALIA TOUCH 50%','UDS',0.000,'S',645,'','D','','','N',1,'PESO',100.000),
 ('D3067','FIBRO PLUS 5MM TECA ITALIA TOUCH 75%','UDS',0.000,'S',646,'','D','','','N',1,'PESO',100.000),
 ('D3068','FIBRO PLUS 3MM ALMENDRA','UDS',91.400,'S',647,'','D','','','N',1,'PESO',100.000),
 ('D3069','FIBRO PLUS 3MM ALMENDRA 25%','UDS',0.000,'S',648,'','D','','','N',1,'PESO',100.000),
 ('D3070','FIBRO PLUS 3MM ALMENDRA 50%','UDS',0.000,'S',649,'','D','','','N',1,'PESO',100.000),
 ('D3071','FIBRO PLUS 3MM ALMENDRA 75%','UDS',0.000,'S',650,'','D','','','N',1,'PESO',100.000),
 ('D3072','FIBRO PLUS 3MM ROBLE AMERICANO','UDS',91.400,'S',651,'','D','','','N',1,'PESO',100.000),
 ('D3073','FIBRO PLUS 3MM ROBLE AMERICANO 25%','UDS',0.000,'S',652,'','D','','','N',1,'PESO',100.000),
 ('D3074','FIBRO PLUS 3MM ROBLE AMERICANO 50%','UDS',0.000,'S',653,'','D','','','N',1,'PESO',100.000),
 ('D3075','FIBRO PLUS 3MM ROBLE AMERICANO 75%','UDS',0.000,'S',654,'','D','','','N',1,'PESO',100.000),
 ('D3076','FIBRO PLUS 3MM CENIZA','UDS',92.910,'S',655,'','D','','','N',1,'PESO',100.000),
 ('D3077','FIBRO PLUS 3MM CENIZA 25%','UDS',0.000,'S',656,'','D','','','N',1,'PESO',100.000),
 ('D3078','FIBRO PLUS 3MM CENIZA 50%','UDS',0.000,'S',657,'','D','','','N',1,'PESO',100.000),
 ('D3079','FIBRO PLUS 3MM CENIZA 75%','UDS',0.000,'S',658,'','D','','','N',1,'PESO',100.000),
 ('D3080','FIBRO PLUS 5.5MM CARBALHO MEZZO','UDS',163.190,'S',659,'','D','','','N',1,'PESO',100.000),
 ('D3081','FIBRO PLUS 5.5MM CARBALHO MEZZO 25%','UDS',0.000,'S',660,'','D','','','N',1,'PESO',100.000),
 ('D3082','FIBRO PLUS 5.5MM CARBALHO MEZZO 50%','UDS',0.000,'S',661,'','D','','','N',1,'PESO',100.000),
 ('D3083','FIBRO PLUS 5.5MM CARBALHO MEZZO 75%','UDS',0.000,'S',662,'','D','','','N',1,'PESO',100.000),
 ('D3084','FIBRO PLUS 3MM GUINDO','UDS',91.400,'S',663,'','D','','','N',1,'PESO',100.000),
 ('D3085','FIBRO PLUS 3MM GUINDO 25%','UDS',0.000,'S',664,'','D','','','N',1,'PESO',100.000),
 ('D3086','FIBRO PLUS 3MM GUINDO 50%','UDS',0.000,'S',665,'','D','','','N',1,'PESO',100.000),
 ('D3087','FIBRO PLUS 3MM GUINDO 75%','UDS',0.000,'S',666,'','D','','','N',1,'PESO',100.000),
 ('D3088','FIBRO PLUS 3MM FRESNO NEGRO','UDS',0.000,'S',667,'','D','','','N',1,'PESO',100.000),
 ('D3089','FIBRO PLUS 3MM FRESNO NEGRO 25%','UDS',0.000,'S',668,'','D','','','N',1,'PESO',100.000),
 ('D3090','FIBRO PLUS 3MM FRESNO NEGRO 50%','UDS',0.000,'S',669,'','D','','','N',1,'PESO',100.000),
 ('D3091','FIBRO PLUS 3MM FRESNO NEGRO 75%','UDS',0.000,'S',670,'','D','','','N',1,'PESO',100.000),
 ('D3092','FIBRO PLUS 5MM LINOZA CINZA TOUCH','UDS',91.400,'S',671,'','D','','','N',1,'PESO',100.000),
 ('D3093','FIBRO PLUS 5MM LINOZA CINZA TOUCH 25%','UDS',0.000,'S',672,'','D','','','N',1,'PESO',100.000),
 ('D3094','FIBRO PLUS 5MM LINOZA CINZA TOUCH 50%','UDS',0.000,'S',673,'','D','','','N',1,'PESO',100.000),
 ('D3095','FIBRO PLUS 5MM LINOZA CINZA TOUCH 75%','UDS',0.000,'S',674,'','D','','','N',1,'PESO',100.000),
 ('D3096','FIBRO PLUS 3MM VISON','UDS',0.000,'S',675,'','D','','','N',1,'PESO',100.000),
 ('D3097','FIBRO PLUS 3MM VISON 25%','UDS',0.000,'S',676,'','D','','','N',1,'PESO',100.000),
 ('D3098','FIBRO PLUS 3MM VISON 50%','UDS',0.000,'S',677,'','D','','','N',1,'PESO',100.000),
 ('D3099','FIBRO PLUS 3MM VISON 75%','UDS',0.000,'S',678,'','D','','','N',1,'PESO',100.000),
 ('D3100','FIBRO PLUS 3MM ROBLE RUSTICO','UDS',0.000,'S',679,'','D','','','N',1,'PESO',100.000),
 ('D3101','FIBRO PLUS 3MM ROBLE RUSTICO 25%','UDS',0.000,'S',680,'','D','','','N',1,'PESO',100.000),
 ('D3102','FIBRO PLUS 3MM ROBLE RUSTICO 50%','UDS',0.000,'S',681,'','D','','','N',1,'PESO',100.000),
 ('D3103','FIBRO PLUS 3MM ROBLE RUSTICO 75%','UDS',0.000,'S',682,'','D','','','N',1,'PESO',100.000),
 ('D3104','FIBRO PLUS 3MM ABEDUL','UDS',91.400,'S',683,'','D','','','N',1,'PESO',100.000),
 ('D3105','FIBRO PLUS 3MM ABEDUL 25%','UDS',0.000,'S',684,'','D','','','N',1,'PESO',100.000),
 ('D3106','FIBRO PLUS 3MM ABEDUL 50%','UDS',0.000,'S',685,'','D','','','N',1,'PESO',100.000),
 ('D3107','FIBRO PLUS 3MM ABEDUL 75%+','UDS',0.000,'S',686,'','D','','','N',1,'PESO',100.000),
 ('D3108','FIBRO PLUS 3MM ROBLE DAKAR','UDS',108.040,'S',687,'','D','','','N',1,'PESO',100.000),
 ('D3109','FIBRO PLUS 3MM ROBLE DAKAR 25%','UDS',0.000,'S',688,'','D','','','N',1,'PESO',100.000),
 ('D3110','FIBRO PLUS 3MM ROBLE DAKAR 50%','UDS',0.000,'S',689,'','D','','','N',1,'PESO',100.000),
 ('D3111','FIBRO PLUS 3MM ROBLE DAKAR 75%','UDS',0.000,'S',690,'','D','','','N',1,'PESO',100.000),
 ('D3112','FIBRO PLUS 3MM MAPLE','UDS',0.000,'S',691,'','D','','','N',1,'PESO',100.000),
 ('D3113','FIBRO PLUS 3MM MAPLE 25%','UDS',0.000,'S',692,'','D','','','N',1,'PESO',100.000),
 ('D3114','FIBRO PLUS 3MM MAPLE 50%','UDS',0.000,'S',693,'','D','','','N',1,'PESO',100.000),
 ('D3115','FIBRO PLUS 3MM MAPLE 75%','UDS',0.000,'S',694,'','D','','','N',1,'PESO',100.000),
 ('D3116','FIBRO PLUS 3MM CEREZO NATURAL','UDS',91.400,'S',695,'','D','','','N',1,'PESO',100.000),
 ('D3117','FIBRO PLUS 3MM CEREZO NATURAL 25%','UDS',0.000,'S',696,'','D','','','N',1,'PESO',100.000),
 ('D3118','FIBRO PLUS 3MM CEREZO NATURAL 50%','UDS',0.000,'S',697,'','D','','','N',1,'PESO',100.000),
 ('D3119','FIBRO PLUS 3MM CEREZO NATURAL 75%','UDS',0.000,'S',698,'','D','','','N',1,'PESO',100.000),
 ('D3120','FIBRO PLUS 3MM TECA','UDS',91.400,'S',699,'','D','','','N',1,'PESO',100.000),
 ('D3121','FIBRO PLUS 3MM TECA 25%','UDS',0.000,'S',700,'','D','','','N',1,'PESO',100.000),
 ('D3122','FIBRO PLUS 3MM TECA 50%','UDS',0.000,'S',701,'','D','','','N',1,'PESO',100.000),
 ('D3123','FIBRO PLUS 3MM TECA 75%','UDS',0.000,'S',702,'','D','','','N',1,'PESO',100.000),
 ('D3124','FIBRO PLUS 3MM GUATAMBU PARA LUSTRE','UDS',91.400,'S',703,'','D','','','N',1,'PESO',100.000),
 ('D3125','FIBRO PLUS 3MM GUATAMBU PARA LUSTRE 25%','UDS',0.000,'S',704,'','D','','','N',1,'PESO',100.000),
 ('D3126','FIBRO PLUS 3MM GUATAMBU PARA LUSTRE 50%','UDS',0.000,'S',705,'','D','','','N',1,'PESO',100.000),
 ('D3127','FIBRO PLUS 3MM GUATAMBU PARA LUSTRE 75%','UDS',0.000,'S',706,'','D','','','N',1,'PESO',100.000),
 ('D3128','FIBRO PLUS 3MM CEREJEIRA','UDS',91.400,'S',707,'','D','','','N',1,'PESO',100.000),
 ('D3129','FIBRO PLUS 3MM CEREJEIRA 25%','UDS',0.000,'S',708,'','D','','','N',1,'PESO',100.000),
 ('D3130','FIBRO PLUS 3MM CEREJEIRA 50%','UDS',0.000,'S',709,'','D','','','N',1,'PESO',100.000),
 ('D3131','FIBRO PLUS 3MM CEREJEIRA 75%','UDS',0.000,'S',710,'','D','','','N',1,'PESO',100.000),
 ('D3132','FIBRO PLUS 3MM NOCCE MILANO','UDS',98.890,'S',711,'','D','','','N',1,'PESO',100.000),
 ('D3133','FIBRO PLUS 3MM NOCCE MILANO 25%','UDS',0.000,'S',712,'','D','','','N',1,'PESO',100.000),
 ('D3134','FIBRO PLUS 3MM NOCCE MILANO 50%','UDS',0.000,'S',713,'','D','','','N',1,'PESO',100.000),
 ('D3135','FIBRO PLUS 3MM NOCCE MILANO 75%','UDS',0.000,'S',714,'','D','','','N',1,'PESO',100.000),
 ('D3136','FIBRO PLUS 5MM MALAGA CHERRY','UDS',128.000,'S',715,'','D','','','N',1,'PESO',100.000),
 ('D3137','FIBRO PLUS 5MM MALAGA CHERRY 25%','UDS',0.000,'S',716,'','D','','','N',1,'PESO',100.000),
 ('D3138','FIBRO PLUS 5MM MALAGA CHERRY 50%','UDS',0.000,'S',717,'','D','','','N',1,'PESO',100.000),
 ('D3139','FIBRO PLUS 5MM MALAGA CHERRY 75%','UDS',0.000,'S',718,'','D','','','N',1,'PESO',100.000),
 ('E4001','LIJA ROLO CHICA','UDS',0.000,'S',719,'','E','','','N',1,'PESO',100.000),
 ('E4002','LIJA ROLO GRANDE','UDS',0.000,'S',720,'','E','','','N',1,'PESO',100.000),
 ('E4003','LIJA DISCO AMOLADORA GRANDE','UDS',0.000,'S',721,'','E','','','N',1,'PESO',100.000),
 ('E4004','LIJA GRANO 120','UDS',1.770,'S',722,'','E','','','N',1,'PESO',100.000),
 ('E4005','LIJA GRANO 100','UDS',1.770,'S',723,'','E','','','N',1,'PESO',100.000),
 ('E4006','LIJA DOBLE A GRANO 60','UDS',0.000,'S',724,'','E','','','N',1,'PESO',100.000),
 ('E6001','PUNTA PHILIPS PH1','UDS',0.000,'S',725,'','E','','','N',1,'PESO',100.000),
 ('E6002','PUNTA PHILIPS PH2','UDS',0.000,'S',726,'','E','','','N',1,'PESO',100.000),
 ('F1001','STRECH CHICO','UDS',24.300,'S',727,'','F','','','N',1,'PESO',100.000),
 ('F1002','STRECH GRANDE','UDS',43.860,'S',728,'','F','','','N',1,'PESO',100.000),
 ('F2001','CINTA STICO ANCHA','UDS',0.000,'S',729,'','F','','','N',1,'PESO',100.000),
 ('F2002','CINTA DE PAPEL 18 X 50','UDS',6.960,'S',730,'','F','','','N',1,'PESO',100.000);
/*!40000 ALTER TABLE `otmateriales` ENABLE KEYS */;


--
-- Definition of table `otmonedah`
--

DROP TABLE IF EXISTS `otmonedah`;
CREATE TABLE `otmonedah` (
  `moneda` int(10) unsigned NOT NULL,
  `nombre` char(50) NOT NULL,
  `cotizacion` float(13,2) NOT NULL,
  `fechacot` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otmonedah`
--

/*!40000 ALTER TABLE `otmonedah` DISABLE KEYS */;
INSERT INTO `otmonedah` (`moneda`,`nombre`,`cotizacion`,`fechacot`) VALUES 
 (1,'PESO',1.00,'20140801'),
 (3,'LIBRA ESTERLINA',18.00,'20141008'),
 (2,'DOLAR',14.50,'20171012');
/*!40000 ALTER TABLE `otmonedah` ENABLE KEYS */;


--
-- Definition of table `otmonedas`
--

DROP TABLE IF EXISTS `otmonedas`;
CREATE TABLE `otmonedas` (
  `moneda` int(10) unsigned NOT NULL,
  `nombre` char(50) NOT NULL,
  `cotizacion` float(13,2) NOT NULL,
  `fechacot` char(8) NOT NULL,
  `simbolo` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otmonedas`
--

/*!40000 ALTER TABLE `otmonedas` DISABLE KEYS */;
INSERT INTO `otmonedas` (`moneda`,`nombre`,`cotizacion`,`fechacot`,`simbolo`) VALUES 
 (1,'PESO',1.00,'20140101','$'),
 (2,'DOLAR',14.50,'20171012','U$S'),
 (3,'LIBRA ESTERLINA',18.00,'20141008','Lib'),
 (4,'CENTAVO',0.10,'20171012','c$');
/*!40000 ALTER TABLE `otmonedas` ENABLE KEYS */;


--
-- Definition of table `otmovistockh`
--

DROP TABLE IF EXISTS `otmovistockh`;
CREATE TABLE `otmovistockh` (
  `idmovip` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `idmate` int(10) unsigned NOT NULL,
  `codigomat` char(20) NOT NULL,
  `detalle` char(20) NOT NULL,
  `idtipomov` int(10) unsigned NOT NULL,
  `descmov` char(20) NOT NULL,
  `ie` char(1) NOT NULL,
  `cantidad` float(13,2) NOT NULL,
  `anulado` char(1) NOT NULL,
  `impuni` float(13,2) NOT NULL,
  `imptotal` float(13,2) NOT NULL,
  `m2` float(13,2) NOT NULL,
  `idmovih` int(10) unsigned NOT NULL,
  `iddepo` int(10) unsigned NOT NULL,
  `unidad` char(10) NOT NULL,
  PRIMARY KEY (`idmovih`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otmovistockh`
--

/*!40000 ALTER TABLE `otmovistockh` DISABLE KEYS */;
/*!40000 ALTER TABLE `otmovistockh` ENABLE KEYS */;


--
-- Definition of table `otmovistockp`
--

DROP TABLE IF EXISTS `otmovistockp`;
CREATE TABLE `otmovistockp` (
  `idmovip` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `usuario` char(10) NOT NULL,
  `fechacarga` char(8) NOT NULL,
  `codigo` int(10) unsigned NOT NULL DEFAULT '0',
  `sucursal` char(4) NOT NULL DEFAULT '""',
  `nombre` char(200) NOT NULL,
  `responsa` char(50) NOT NULL,
  `obs1` char(200) NOT NULL,
  `obs2` char(200) NOT NULL,
  `obs3` char(200) NOT NULL,
  `obs4` char(200) NOT NULL,
  `procli` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idmovip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otmovistockp`
--

/*!40000 ALTER TABLE `otmovistockp` DISABLE KEYS */;
/*!40000 ALTER TABLE `otmovistockp` ENABLE KEYS */;


--
-- Definition of table `otordentra`
--

DROP TABLE IF EXISTS `otordentra`;
CREATE TABLE `otordentra` (
  `idpedido` int(10) unsigned NOT NULL,
  `idot` int(10) unsigned NOT NULL,
  `fechaot` char(8) NOT NULL,
  `fechaini` char(8) NOT NULL,
  `testimado` char(20) NOT NULL DEFAULT '',
  `costoest` float(13,2) NOT NULL,
  `descriptot` char(200) NOT NULL,
  `idestado` int(10) unsigned NOT NULL,
  `detaestado` char(200) NOT NULL,
  `responsa` char(200) NOT NULL,
  `observa` char(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otordentra`
--

/*!40000 ALTER TABLE `otordentra` DISABLE KEYS */;
INSERT INTO `otordentra` (`idpedido`,`idot`,`fechaot`,`fechaini`,`testimado`,`costoest`,`descriptot`,`idestado`,`detaestado`,`responsa`,`observa`) VALUES 
 (1,1,'20140826','20140826','30000000',10000.00,'COCINA',1,'INICIADOS','ALEJANDRO','PRUEBA'),
 (1,2,'20140826','20140826','45000000',15000.00,'DORMITORIO',1,'INICIADOS','GERMAN','');
/*!40000 ALTER TABLE `otordentra` ENABLE KEYS */;


--
-- Definition of table `ototetapas`
--

DROP TABLE IF EXISTS `ototetapas`;
CREATE TABLE `ototetapas` (
  `idpedido` int(10) unsigned NOT NULL,
  `idot` int(10) unsigned NOT NULL,
  `idotetapa` int(10) unsigned NOT NULL,
  `idetapa` int(10) unsigned NOT NULL,
  `etapa` char(200) NOT NULL,
  `coloretapa` char(20) NOT NULL,
  `fecha` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ototetapas`
--

/*!40000 ALTER TABLE `ototetapas` DISABLE KEYS */;
INSERT INTO `ototetapas` (`idpedido`,`idot`,`idotetapa`,`idetapa`,`etapa`,`coloretapa`,`fecha`) VALUES 
 (1,1,6,2,'ETAPA 2','4227327','20140906'),
 (1,1,7,3,'PEGADO DE CANTO','65535','20140805'),
 (1,1,9,3,'PEGADO DE CANTO','32768','20140917'),
 (1,1,10,5,'COLOCACION','33023','20140917'),
 (1,1,11,1,'DISEÑO','16711680','20140917'),
 (1,1,12,6,'PROYECTO TERMINADO','255','20140917');
/*!40000 ALTER TABLE `ototetapas` ENABLE KEYS */;


--
-- Definition of table `otparametros`
--

DROP TABLE IF EXISTS `otparametros`;
CREATE TABLE `otparametros` (
  `idmate` int(10) unsigned NOT NULL,
  `idmovip` int(10) unsigned NOT NULL,
  `idmovih` int(10) unsigned NOT NULL,
  `idpedido` int(10) unsigned NOT NULL,
  `idot` int(10) unsigned NOT NULL,
  `idotdet` int(10) unsigned NOT NULL,
  `idoteje` int(10) unsigned NOT NULL,
  `iddocu` int(10) unsigned NOT NULL,
  `idotetapa` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otparametros`
--

/*!40000 ALTER TABLE `otparametros` DISABLE KEYS */;
INSERT INTO `otparametros` (`idmate`,`idmovip`,`idmovih`,`idpedido`,`idot`,`idotdet`,`idoteje`,`iddocu`,`idotetapa`) VALUES 
 (731,0,0,5,9,17,3,2,13);
/*!40000 ALTER TABLE `otparametros` ENABLE KEYS */;


--
-- Definition of table `otpedido`
--

DROP TABLE IF EXISTS `otpedido`;
CREATE TABLE `otpedido` (
  `idpedido` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `responsa` char(50) NOT NULL DEFAULT '',
  `fechacarga` char(8) NOT NULL,
  `codigo` int(10) unsigned NOT NULL DEFAULT '0',
  `sucursal` char(4) NOT NULL,
  `nombre` char(200) NOT NULL,
  `direccion` char(200) NOT NULL,
  `telefono` char(50) NOT NULL,
  `email` char(200) NOT NULL,
  `proyecto` char(200) NOT NULL,
  `observa` char(200) NOT NULL,
  `idestado` int(10) unsigned NOT NULL,
  `detaestado` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otpedido`
--

/*!40000 ALTER TABLE `otpedido` DISABLE KEYS */;
INSERT INTO `otpedido` (`idpedido`,`fecha`,`responsa`,`fechacarga`,`codigo`,`sucursal`,`nombre`,`direccion`,`telefono`,`email`,`proyecto`,`observa`,`idestado`,`detaestado`) VALUES 
 (1,'20140826','ALEJANDRO','20140826',2500,'0001','ROSSI TULIO','COLON S/N','498465','trossi@krumbein.com.ar','PROYECTO DE PRUEBA','',1,'INICIADOS');
/*!40000 ALTER TABLE `otpedido` ENABLE KEYS */;


--
-- Definition of table `otperfiles`
--

DROP TABLE IF EXISTS `otperfiles`;
CREATE TABLE `otperfiles` (
  `idper` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `detalle` char(50) NOT NULL,
  `habilita` char(1) NOT NULL,
  PRIMARY KEY (`idper`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otperfiles`
--

/*!40000 ALTER TABLE `otperfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `otperfiles` ENABLE KEYS */;


--
-- Definition of table `otperfusu`
--

DROP TABLE IF EXISTS `otperfusu`;
CREATE TABLE `otperfusu` (
  `usuario` char(20) NOT NULL,
  `idper` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idper`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otperfusu`
--

/*!40000 ALTER TABLE `otperfusu` DISABLE KEYS */;
/*!40000 ALTER TABLE `otperfusu` ENABLE KEYS */;


--
-- Definition of table `otpresu`
--

DROP TABLE IF EXISTS `otpresu`;
CREATE TABLE `otpresu` (
  `idot` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpresu` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  PRIMARY KEY (`idot`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otpresu`
--

/*!40000 ALTER TABLE `otpresu` DISABLE KEYS */;
/*!40000 ALTER TABLE `otpresu` ENABLE KEYS */;


--
-- Definition of table `otstandar`
--

DROP TABLE IF EXISTS `otstandar`;
CREATE TABLE `otstandar` (
  `idstandar` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `detalleot` char(200) NOT NULL,
  `idot` int(10) unsigned NOT NULL,
  `fechastan` char(8) NOT NULL,
  `usuario` char(20) NOT NULL,
  PRIMARY KEY (`idstandar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otstandar`
--

/*!40000 ALTER TABLE `otstandar` DISABLE KEYS */;
/*!40000 ALTER TABLE `otstandar` ENABLE KEYS */;


--
-- Definition of table `otstock`
--

DROP TABLE IF EXISTS `otstock`;
CREATE TABLE `otstock` (
  `iddepo` int(10) unsigned NOT NULL,
  `idmate` int(10) unsigned NOT NULL,
  `stock` float(13,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otstock`
--

/*!40000 ALTER TABLE `otstock` DISABLE KEYS */;
/*!40000 ALTER TABLE `otstock` ENABLE KEYS */;


--
-- Definition of table `ottiposmovi`
--

DROP TABLE IF EXISTS `ottiposmovi`;
CREATE TABLE `ottiposmovi` (
  `idtipomov` int(10) unsigned NOT NULL DEFAULT '0',
  `descmov` char(200) NOT NULL,
  `ie` char(1) NOT NULL,
  PRIMARY KEY (`idtipomov`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ottiposmovi`
--

/*!40000 ALTER TABLE `ottiposmovi` DISABLE KEYS */;
INSERT INTO `ottiposmovi` (`idtipomov`,`descmov`,`ie`) VALUES 
 (1,'INGRESO POR FACT PROV','I'),
 (2,'EGRESO SEGUN PRODUCCION','E'),
 (3,'INGRESOS VARIOS','I'),
 (4,'EGRESOS VARIOS','E'),
 (5,'AJUSTE DE INVENTARIO (I)','I'),
 (6,'AJUSTE DE INVENTARIO (E)','E');
/*!40000 ALTER TABLE `ottiposmovi` ENABLE KEYS */;


--
-- Definition of table `pagosprov`
--

DROP TABLE IF EXISTS `pagosprov`;
CREATE TABLE `pagosprov` (
  `idpago` int(10) unsigned NOT NULL,
  `pventa` int(10) unsigned NOT NULL,
  `idcomproba` int(10) unsigned NOT NULL,
  `actividad` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `entidad` int(10) unsigned NOT NULL,
  `apellido` char(254) NOT NULL,
  `nombre` char(254) NOT NULL,
  `importe` float(13,4) NOT NULL,
  `concepto` char(254) NOT NULL,
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
  `idfactprovep` int(10) unsigned NOT NULL DEFAULT '0',
  `idncprove` int(10) unsigned NOT NULL,
  `imputado` float(13,4) NOT NULL,
  `fecha` char(8) NOT NULL,
  `idpagosprovfc` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idpagosprovfc`)
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
  `codigo` char(14) NOT NULL,
  `idconcepto` int(10) unsigned NOT NULL,
  KEY `idmenu` (`idmenu`),
  KEY `idperfil` (`idperfil`),
  KEY `habilitado` (`habilitado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perfilmh`
--

/*!40000 ALTER TABLE `perfilmh` DISABLE KEYS */;
INSERT INTO `perfilmh` (`idperfil`,`idmenu`,`habilitado`,`codigo`,`idconcepto`) VALUES 
 (1,1,'S','',0),
 (1,2,'S','',0),
 (1,3,'S','',0),
 (1,4,'S','',0),
 (1,5,'S','',0),
 (1,6,'S','',0),
 (1,7,'S','',0),
 (1,8,'S','',0),
 (1,9,'S','',0),
 (1,10,'S','',0),
 (1,11,'S','',0),
 (1,12,'S','',0),
 (1,13,'S','',0),
 (1,14,'S','',0),
 (1,15,'S','',0),
 (1,16,'S','',0),
 (1,17,'S','',0),
 (1,18,'S','',0),
 (1,19,'S','',0),
 (1,20,'S','',0),
 (1,21,'S','',0),
 (1,22,'S','',0),
 (1,23,'S','',0),
 (1,24,'S','',0),
 (1,25,'S','',0),
 (1,26,'S','',0),
 (1,27,'S','',0),
 (1,28,'S','',0),
 (1,29,'S','',0),
 (1,30,'S','',0),
 (1,31,'S','',0),
 (1,32,'S','',0),
 (1,33,'S','',0),
 (1,34,'S','',0),
 (1,35,'S','',0),
 (1,36,'S','',0),
 (1,37,'S','',0),
 (1,38,'S','',0),
 (1,39,'S','',0),
 (1,40,'S','',0),
 (1,41,'S','',0),
 (1,42,'S','',0),
 (1,43,'S','',0),
 (1,44,'S','',0),
 (1,45,'S','',0),
 (1,46,'S','',0),
 (1,50,'S','',0),
 (1,47,'S','',0),
 (1,48,'S','',0),
 (1,49,'S','',0);
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
  `usuario` char(15) NOT NULL,
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
  `detalle` char(254) NOT NULL,
  `idpland` int(10) unsigned NOT NULL,
  `idplandup` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idpland`) USING BTREE
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
  `pventa` int(10) unsigned NOT NULL DEFAULT '0',
  `actividad` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
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
  `tipodoc` char(3) NOT NULL DEFAULT '',
  `dni` int(10) unsigned NOT NULL,
  `telefono` char(50) NOT NULL,
  `cp` char(50) NOT NULL,
  `fax` char(50) NOT NULL,
  `email` char(200) NOT NULL,
  `trasp` int(10) unsigned NOT NULL,
  `nomtransp` char(254) NOT NULL,
  `domentrega` char(254) NOT NULL,
  `condvta` int(10) unsigned NOT NULL DEFAULT '0',
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
  `vendedor` int(10) unsigned NOT NULL DEFAULT '0',
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
  `fecha` char(8) NOT NULL
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
  `impuestos` float(13,4) NOT NULL DEFAULT '0.0000',
  `total` float(13,4) NOT NULL,
  `codigocta` char(20) NOT NULL,
  `cuota` int(10) unsigned NOT NULL,
  `cantcuotas` int(10) unsigned NOT NULL,
  `impuesto` int(10) unsigned NOT NULL DEFAULT '0',
  `entidad` int(10) unsigned NOT NULL DEFAULT '0',
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
  `impuesto` int(10) unsigned NOT NULL DEFAULT '0',
  `detalle` char(254) NOT NULL,
  `neto` float(13,4) NOT NULL,
  `razon` float(13,4) NOT NULL,
  `importe` float(13,4) NOT NULL
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
  `electronica` char(1) NOT NULL,
  PRIMARY KEY (`pventa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `puntosventa`
--

/*!40000 ALTER TABLE `puntosventa` DISABLE KEYS */;
INSERT INTO `puntosventa` (`pventa`,`detalle`,`puntov`,`habilitado`,`fechaini`,`fechabaja`,`electronica`) VALUES 
 (1,'CoSeMar','0001','1','20170202','','N'),
 (3,'PUNTO DE VENTA PARA ID','0','1','','','N'),
 (4,'CoSeMar_Electrónica','0003','1','','','S');
/*!40000 ALTER TABLE `puntosventa` ENABLE KEYS */;


--
-- Definition of table `recibos`
--

DROP TABLE IF EXISTS `recibos`;
CREATE TABLE `recibos` (
  `idrecibo` int(10) unsigned NOT NULL,
  `idcomproba` int(10) unsigned NOT NULL,
  `pventa` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `entidad` int(10) unsigned NOT NULL,
  `apellido` char(254) NOT NULL,
  `nombre` char(254) NOT NULL,
  `importe` float(13,4) NOT NULL,
  `concepto` char(254) NOT NULL,
  PRIMARY KEY (`idrecibo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recibos`
--

/*!40000 ALTER TABLE `recibos` DISABLE KEYS */;
INSERT INTO `recibos` (`idrecibo`,`idcomproba`,`pventa`,`numero`,`fecha`,`entidad`,`apellido`,`nombre`,`importe`,`concepto`) VALUES 
 (8,5,4,5,'20180316',1,'','ROSSI TULIO',366.6300,'Pago Contado - Efectivo'),
 (9,5,4,6,'20180316',1,'','ROSSI TULIO',246.8400,'Pago Contado - Efectivo'),
 (10,5,4,7,'20180316',1,'','ROSSI TULIO',246.8400,'Pago Contado - Efectivo'),
 (11,5,4,8,'20180316',1,'','ROSSI TULIO',244.4200,'Pago Contado - Efectivo');
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
  `pventa` int(10) unsigned NOT NULL DEFAULT '0',
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
  `tipodoc` char(3) NOT NULL DEFAULT '',
  `dni` int(10) unsigned NOT NULL,
  `telefono` char(50) NOT NULL,
  `cp` char(50) NOT NULL,
  `fax` char(50) NOT NULL,
  `email` char(200) NOT NULL,
  `transporte` int(10) unsigned NOT NULL DEFAULT '0',
  `nomtransp` char(254) NOT NULL,
  `domentrega` char(254) NOT NULL,
  `stock` char(1) NOT NULL,
  `condvta` int(10) unsigned NOT NULL DEFAULT '0',
  `neto` float(13,4) NOT NULL,
  `subtotal` float(13,4) NOT NULL,
  `recargo` float(13,4) NOT NULL,
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
  `vendedor` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`idremito`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `remitos`
--

/*!40000 ALTER TABLE `remitos` DISABLE KEYS */;
/*!40000 ALTER TABLE `remitos` ENABLE KEYS */;


--
-- Definition of table `remitosanul`
--

DROP TABLE IF EXISTS `remitosanul`;
CREATE TABLE `remitosanul` (
  `idremito` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `remitosanul`
--

/*!40000 ALTER TABLE `remitosanul` DISABLE KEYS */;
/*!40000 ALTER TABLE `remitosanul` ENABLE KEYS */;


--
-- Definition of table `remitosh`
--

DROP TABLE IF EXISTS `remitosh`;
CREATE TABLE `remitosh` (
  `idremito` int(10) unsigned NOT NULL,
  `idremitoh` int(10) unsigned NOT NULL,
  `articulo` char(20) NOT NULL,
  `idconcepto` int(10) unsigned NOT NULL,
  `servicio` int(10) unsigned NOT NULL,
  `cantidad` float(13,4) NOT NULL DEFAULT '0.0000',
  `unidad` char(10) NOT NULL,
  `cantidadfc` float(13,4) NOT NULL DEFAULT '0.0000',
  `unidadfc` char(10) NOT NULL,
  `detalle` char(254) NOT NULL,
  `unitario` float(13,4) NOT NULL,
  `impuestos` float(13,4) NOT NULL DEFAULT '0.0000',
  `total` float(13,4) NOT NULL,
  `codigocta` char(20) NOT NULL,
  `nombrecta` char(100) NOT NULL,
  `cuota` int(10) unsigned NOT NULL,
  `cancuotas` int(10) unsigned NOT NULL,
  `padron` int(10) unsigned NOT NULL,
  `impuesto` int(10) unsigned NOT NULL DEFAULT '0',
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
  `idremiprovh` int(10) unsigned NOT NULL DEFAULT '0',
  `idremiprovp` int(10) unsigned NOT NULL DEFAULT '0',
  `renglon` int(10) unsigned NOT NULL,
  `articulo` char(20) NOT NULL,
  `codartprov` char(20) NOT NULL,
  `detalle` char(254) NOT NULL,
  `cantidad` float(13,2) NOT NULL,
  `unitario` float(13,2) NOT NULL,
  `unidad` char(20) NOT NULL,
  `impuestos` float(13,2) NOT NULL,
  `total` float(13,2) NOT NULL,
  PRIMARY KEY (`idremiprovh`) USING BTREE
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
  `idremitprovp` int(10) unsigned NOT NULL DEFAULT '0',
  `actividad` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `entidad` int(10) unsigned NOT NULL,
  `apellido` char(200) NOT NULL,
  `nombre` char(200) NOT NULL,
  `direccion` char(100) NOT NULL,
  `localidad` int(10) unsigned NOT NULL DEFAULT '0',
  `iva` int(10) unsigned NOT NULL,
  `cuit` char(13) NOT NULL,
  `fecha` char(8) NOT NULL,
  `observa1` char(254) NOT NULL DEFAULT '',
  `observa2` char(254) NOT NULL DEFAULT '',
  `observa3` char(254) NOT NULL DEFAULT '',
  `observa4` char(254) NOT NULL DEFAULT '',
  `fecharp` char(8) NOT NULL,
  `actividadrp` int(10) unsigned NOT NULL DEFAULT '0',
  `numerorp` int(10) unsigned NOT NULL,
  `deposito` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idremitprovp`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `remitosprovp`
--

/*!40000 ALTER TABLE `remitosprovp` DISABLE KEYS */;
/*!40000 ALTER TABLE `remitosprovp` ENABLE KEYS */;


--
-- Definition of table `reportesimp`
--

DROP TABLE IF EXISTS `reportesimp`;
CREATE TABLE `reportesimp` (
  `idreporte` int(10) unsigned NOT NULL,
  `nombre` char(50) NOT NULL,
  `descripcion` char(254) NOT NULL,
  PRIMARY KEY (`idreporte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reportesimp`
--

/*!40000 ALTER TABLE `reportesimp` DISABLE KEYS */;
INSERT INTO `reportesimp` (`idreporte`,`nombre`,`descripcion`) VALUES 
 (1,'facturas1.rpt','Modelo 1 de facturas u otros comprobantes'),
 (2,'recibos1.rpt','Modelo 1 de recibos');
/*!40000 ALTER TABLE `reportesimp` ENABLE KEYS */;


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
  `servicio` int(10) unsigned NOT NULL
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
INSERT INTO `tablasidx` (`idindex`,`tabla`,`campo`,`tipocampo`,`maxvalorc`,`maxvalori`) VALUES 
 (1,'facturas','idfactura','I','0',61),
 (2,'detafactu','idfacturah','I','0',62),
 (3,'cupones','idcupon','I','0',0),
 (4,'detallecobros','iddetacobro','I','0',41),
 (5,'facturasfe','idfe','I','0',42),
 (6,'recibos','idrecibo','I','0',11),
 (7,'cobros','idcobro','I','0',2);
/*!40000 ALTER TABLE `tablasidx` ENABLE KEYS */;


--
-- Definition of table `tarjetacredito`
--

DROP TABLE IF EXISTS `tarjetacredito`;
CREATE TABLE `tarjetacredito` (
  `idtarjeta` int(10) unsigned NOT NULL DEFAULT '0',
  `nombre` char(254) NOT NULL,
  `idbanco` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idtarjeta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tarjetacredito`
--

/*!40000 ALTER TABLE `tarjetacredito` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarjetacredito` ENABLE KEYS */;


--
-- Definition of table `tarjetacuotas`
--

DROP TABLE IF EXISTS `tarjetacuotas`;
CREATE TABLE `tarjetacuotas` (
  `idtarjetacta` int(10) unsigned NOT NULL,
  `idtarjeta` int(10) unsigned NOT NULL,
  `cuotas` int(10) unsigned NOT NULL,
  `razon` float(13,4) NOT NULL,
  PRIMARY KEY (`idtarjetacta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tarjetacuotas`
--

/*!40000 ALTER TABLE `tarjetacuotas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarjetacuotas` ENABLE KEYS */;


--
-- Definition of table `tipocajabanco`
--

DROP TABLE IF EXISTS `tipocajabanco`;
CREATE TABLE `tipocajabanco` (
  `idtipocta` int(10) unsigned NOT NULL,
  `detalle` char(254) NOT NULL,
  `abrevia` char(50) NOT NULL,
  PRIMARY KEY (`idtipocta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipocajabanco`
--

/*!40000 ALTER TABLE `tipocajabanco` DISABLE KEYS */;
INSERT INTO `tipocajabanco` (`idtipocta`,`detalle`,`abrevia`) VALUES 
 (1,'CAJA','CAJA');
/*!40000 ALTER TABLE `tipocajabanco` ENABLE KEYS */;


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
  `destino` char(50) NOT NULL DEFAULT '',
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
 (4,'AJUSTE DE STOCK',0,'STOCK','S','N'),
 (5,'RECIBO',0,'RECIBO','S','N');
/*!40000 ALTER TABLE `tipocompro` ENABLE KEYS */;


--
-- Definition of table `tipocomprobante`
--

DROP TABLE IF EXISTS `tipocomprobante`;
CREATE TABLE `tipocomprobante` (
  `idtipocomp` int(10) unsigned NOT NULL,
  `descripcion` char(100) NOT NULL,
  PRIMARY KEY (`idtipocomp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipocomprobante`
--

/*!40000 ALTER TABLE `tipocomprobante` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipocomprobante` ENABLE KEYS */;


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
  `idmovotint` int(10) unsigned NOT NULL DEFAULT '0',
  `detalle` char(254) NOT NULL DEFAULT '',
  `operacion` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idmovotint`) USING BTREE
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
  `deposito` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idtipomov`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipomstock`
--

/*!40000 ALTER TABLE `tipomstock` DISABLE KEYS */;
INSERT INTO `tipomstock` (`idtipomov`,`descmov`,`ie`,`reporte`,`generaeti`,`deposito`) VALUES 
 (1,'EGRESO POR AJUSTE DE STOCK','E','AJUSTE DE STOCK','N',0),
 (2,'INGRESO POR AJUSTE DE STOCK','I','AJUSTE DE STOCK','S',0);
/*!40000 ALTER TABLE `tipomstock` ENABLE KEYS */;


--
-- Definition of table `tiponp`
--

DROP TABLE IF EXISTS `tiponp`;
CREATE TABLE `tiponp` (
  `idtiponp` int(10) unsigned NOT NULL DEFAULT '0',
  `descpe` char(254) NOT NULL,
  `stock` char(1) NOT NULL,
  PRIMARY KEY (`idtiponp`) USING BTREE
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
-- Definition of table `tipopagos`
--

DROP TABLE IF EXISTS `tipopagos`;
CREATE TABLE `tipopagos` (
  `idtipopago` int(10) unsigned NOT NULL,
  `detalle` char(254) NOT NULL,
  PRIMARY KEY (`idtipopago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipopagos`
--

/*!40000 ALTER TABLE `tipopagos` DISABLE KEYS */;
INSERT INTO `tipopagos` (`idtipopago`,`detalle`) VALUES 
 (1,'CTA CTE - SIN CUOTAS'),
 (2,'CTA CTE - CON CUOTAS'),
 (3,'CTADO - EFECTIVO'),
 (4,'CTADO - TARJETA'),
 (5,'CTADO - CHEQUE'),
 (6,'CTADO - DEPOSITO BCO');
/*!40000 ALTER TABLE `tipopagos` ENABLE KEYS */;


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
-- Definition of table `transfeh`
--

DROP TABLE IF EXISTS `transfeh`;
CREATE TABLE `transfeh` (
  `idtransfep` int(10) unsigned NOT NULL,
  `idtipopago` int(10) unsigned NOT NULL,
  `idcheque` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `importe` float(13,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transfeh`
--

/*!40000 ALTER TABLE `transfeh` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfeh` ENABLE KEYS */;


--
-- Definition of table `transfep`
--

DROP TABLE IF EXISTS `transfep`;
CREATE TABLE `transfep` (
  `idtransfep` int(10) unsigned NOT NULL,
  `idcomproba` int(10) unsigned NOT NULL,
  `pventa` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `fecha` char(8) NOT NULL,
  `importe` float(13,4) NOT NULL,
  `comprobante` char(254) NOT NULL,
  `idcuentao` int(10) unsigned NOT NULL,
  `idcuentad` int(10) unsigned NOT NULL,
  `observa` char(254) NOT NULL,
  PRIMARY KEY (`idtransfep`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transfep`
--

/*!40000 ALTER TABLE `transfep` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfep` ENABLE KEYS */;


--
-- Definition of table `transporte`
--

DROP TABLE IF EXISTS `transporte`;
CREATE TABLE `transporte` (
  `transporte` int(10) unsigned NOT NULL,
  `entidad` int(10) unsigned NOT NULL,
  PRIMARY KEY (`transporte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transporte`
--

/*!40000 ALTER TABLE `transporte` DISABLE KEYS */;
INSERT INTO `transporte` (`transporte`,`entidad`) VALUES 
 (1,4);
/*!40000 ALTER TABLE `transporte` ENABLE KEYS */;


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




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
