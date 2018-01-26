*ARCHIVO CREADO  : 09/07/2012 09:02:53 PM


create table jerarquias ( 
             jerarquia             char(20) default  ''  not null , 
             index jerarquia (jerarquia), 

) TYPE = InnoDB ;
 
 

create table menu ( 
             idmenu                integer default 0  not null , 
             idmenup               integer default 0  not null , 
             nivel                 char(2) default  ''  not null , 
             codigo                char(14) default  ''  not null , 
             descrip               char(50) default  ''  not null , 
             arranque              char(254) default  ''  not null , 
             comando               char(254) default  ''  not null , 
             opcion                char(2) default  ''  not null , 
             prun                  char(1) default  ''  not null , 
             pusu                  char(1) default  ''  not null , 
             habilitado            char(1) default  ''  not null , 
             orden                 integer default 0  not null , 
             usuario               char(20) default  ''  not null , 
             fechahora             char(18) default  ''  not null , 
             index usuario (usuario), 
             index codigo (codigo), 
             index idmenup (idmenup), 
             index nivel (nivel), 
             index idmenu (idmenu), 

) TYPE = InnoDB ;
 
 

create table perfilmh ( 
             idperfil              integer default 0  not null , 
             idmenu                integer default 0  not null , 
             habilitado            char(1) default  ''  not null , 
             index idmenu (idmenu), 
             index idperfil (idperfil), 

) TYPE = InnoDB ;
 
 

create table perfilmp ( 
             idperfil              integer default 0  not null , 
             perfil                char(200) default  ''  not null , 
             descrip               char(200) default  ''  not null , 
             habilitado            char(1) default  ''  not null , 
             index perfil (perfil), 
             index idperfil (idperfil), 

) TYPE = InnoDB ;
 
 

create table perfilusu ( 
             idperfil              integer default 0  not null , 
             usuario               char(20) default  ''  not null , 
             habilitado            char(1) default  ''  not null , 
             activo                integer default 0  not null , 
             index activo (activo), 
             index habilitado (habilitado), 
             index usuario (usuario), 
             index idperfil (idperfil), 

) TYPE = InnoDB ;
 
 

create table usuarios ( 
             usuario               char(20) default  ''  not null , 
             nombre                char(100) default  ''  not null , 
             clave                 char(15) default  ''  not null , 
             jerarquia             char(60) default  ''  not null , 
             seccion               char(20) default  ''  not null , 
             email                 char(80) default  ''  not null , 
             habilitado            char(1) default  ''  not null , 
             index jerarquia (jerarquia), 
             index clave (clave), 
             index usuario (usuario), 

) TYPE = InnoDB ;
 
 
