use dbcomuna


DROP TABLE IF EXISTS `dbcomuna`.`menusql`;
CREATE TABLE  `dbcomuna`.`menusql` (
  `idmenu` int(11) NOT NULL DEFAULT '0',
  `nivel` char(2) NOT NULL DEFAULT '',
  `codigo` char(14) NOT NULL DEFAULT '',
  `arranque` char(254) NOT NULL DEFAULT '',
  `comando` char(254) NOT NULL DEFAULT '',
  `opcion` char(2) NOT NULL DEFAULT '',
  `habilitado` char(1) NOT NULL DEFAULT 'S',
  `descrip` varchar(50) NOT NULL,
  `pusu` char(1) NOT NULL DEFAULT 'S',
  `idmenup` int(11) NOT NULL DEFAULT '0',
  `usuario` char(20) NOT NULL DEFAULT '',
  `fechahora` char(18) NOT NULL DEFAULT '',
  `orden` char(2) NOT NULL DEFAULT '00',
  `prun` char(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`idmenu`),
  KEY `idmenu` (`idmenu`),
  KEY `nivel` (`nivel`),
  KEY `codigo` (`codigo`),
  KEY `habilitado` (`habilitado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `dbcomuna`.`perfilmp`;
CREATE TABLE  `dbcomuna`.`perfilmp` (
  `idperfil` int(11) NOT NULL DEFAULT '0',
  `perfil` char(20) NOT NULL DEFAULT '',
  `descrip` char(200) NOT NULL DEFAULT '',
  `habilitado` char(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`idperfil`),
  KEY `idperfil` (`idperfil`),
  KEY `habilitado` (`habilitado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


	
DROP TABLE IF EXISTS `dbcomuna`.`perfilmh`;
CREATE TABLE  `dbcomuna`.`perfilmh` (
  `idperfil` int(11) NOT NULL DEFAULT '0',
  `idmenu` int(11) NOT NULL DEFAULT '0',
  `habilitado` char(1) NOT NULL DEFAULT 'S',
  KEY `idmenu` (`idmenu`),
  KEY `idperfil` (`idperfil`),
  KEY `habilitado` (`habilitado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `dbcomuna`.`perfilusu`;
CREATE TABLE  `dbcomuna`.`perfilusu` (
  `idperfil` int(11) NOT NULL DEFAULT '0',
  `usuario` char(20) NOT NULL DEFAULT '',
  `habilitado` char(1) NOT NULL DEFAULT 'S',
  `activo` int(1) NOT NULL DEFAULT '0',
  KEY `idperfil` (`idperfil`),
  KEY `usuario` (`usuario`),
  KEY `habilitado` (`habilitado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `dbcomuna`.`usuarios`;
CREATE TABLE  `dbcomuna`.`usuarios` (
  `usuario` char(200) NOT NULL DEFAULT '',
  `clave` char(20) NOT NULL DEFAULT '',
  `nombre` char(200) NOT NULL DEFAULT '',
  `email` char(200) NOT NULL DEFAULT '',
  `jerarquia` char(17) NOT NULL DEFAULT '',
  `habilitado` char(1) NOT NULL DEFAULT '',
  `seccion` char(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;