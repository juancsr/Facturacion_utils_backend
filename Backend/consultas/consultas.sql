select * from v$version where banner like 'Oracle%';


create table producto(
    id integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nombre varchar(50) not null,
    descripcion varchar(50) not null,
    precio_unidad NUMBER(10,3) not null,
    id_categoria integer not null,
    state integer default 1
);

insert into producto(nombre,descripcion,precio_unidad,id_categoria) 
values ('Cuaderno Norma 50 hojas','Cuaderno cuadriculado grande',3500,1);
select producto.nombre from producto,categoria where producto.id_categoria=categoria.id_categoria and producto.id_categoria=1; 
select * from categoria; 
commit;
insert into producto(nombre,descripcion,precio_unidad,id_categoria) 
values ('Lapiz Mirado 2','Lapiz con mina numero 2',700,1);
--//oracle ->insert->tablas externas-> tablas relaes
---
ALTER TABLE producto MODIFY (id_categoria NOT NULL);


------tabla categoría
create table categoria(
    id_categoria integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nombre varchar(50) not null,
    descripcion varchar(50) not null,
    iva NUMBER(5,2) not null,
    state integer default 1
);

insert into categoria(nombre,descripcion,iva) 
values ('Papelería','Articulosd epapeleria',5);
drop table producto;

ALTER TABLE producto
ADD CONSTRAINT fk_producto_categoria
  FOREIGN KEY (id_categoria)
  REFERENCES categoria(id_categoria);
 -----------------------
 alter table producto
  add codigo varchar(25) default '0' not null;
  select *from producto;
  select categoria.nombre from categoria,producto where producto.id_categoria=categoria.id_categoria and producto.state=1;

---------------SENTENCIAS YA PROBADAS EN ORACLE CENTOS 7
  /*
  select * from v$version where banner like 'Oracle%';


create table producto(
    id integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nombre varchar(50) not null,
    descripcion varchar(50) not null,
    precio_unidad NUMBER(10,3) not null,
    id_categoria integer not null,
    state integer default 1
);

insert into producto(nombre,descripcion,precio_unidad,id_categoria) 
values ('Cuaderno Norma 50 hojas','Cuaderno cuadriculado grande',3500,1);
select producto.nombre from producto,categoria where producto.id_categoria=categoria.id_categoria and producto.id_categoria=1; 
select * from categoria; 
commit;
insert into producto(nombre,descripcion,precio_unidad,id_categoria) 
values ('Lapiz Mirado 2','Lapiz con mina numero 2',700,1);
--//oracle ->insert->tablas externas-> tablas relaes
---
ALTER TABLE producto MODIFY (id_categoria NOT NULL);


------tabla categoría
create table categoria(
    id_categoria integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nombre varchar(50) not null,
    descripcion varchar(50) not null,
    iva NUMBER(5,2) not null,
    state integer default 1
);

insert into categoria(nombre,descripcion,iva) 
values ('Papelería','Articulosd epapeleria',5);
drop table producto;

ALTER TABLE producto
ADD CONSTRAINT fk_producto_categoria
  FOREIGN KEY (id_categoria)
  REFERENCES categoria(id_categoria);
 -----------------------
 alter table producto
  add codigo varchar(25) default '0' not null;
  select *from producto;
  select categoria.nombre from categoria,producto where producto.id_categoria=categoria.id_categoria and producto.state=1;
  
  
  ------------------------------------------------------------------------------CREACION DE TABLAS
 

CREATE TABLE   cliente 
(
	 id_CLIENTE integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
     FECHA_REGISTRO  DATE NOT NULL,
	 ID_PERSONA  INTEGER NOT NULL,
     state integer default 1
)
;

CREATE TABLE   factura 
(
	 ID_FACTURA integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	 FECHA_COMPRA  DATE NOT NULL,
     ID_PEDIDO integer not null,
	 ESTADO  VARCHAR(20) NOT NULL,
     state integer default 1
)
;

CREATE TABLE   inventario 
(
	 ID_INVENTARIO  integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	 CANTIDAD_DISPONIBLE  NUMBER(4) NOT NULL,
	 ID_PRODUCTO  INTEGER NOT NULL,
     state integer default 1
)
;

CREATE TABLE   operador 
(
	 ID_OPERADOR  integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	 ROL  VARCHAR(50) NOT NULL,
	 ID_PERSONA  INTEGER NOT NULL,
     state integer default 1
)
;

CREATE TABLE   pago 
(
	 ID_PAGO  integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	 TIPO_PAGO  VARCHAR(20) NOT NULL,
	 ESTADO  VARCHAR(20) NOT NULL,
     ID_PEDIDO integer not null,
     state integer default 1
)
;

CREATE TABLE   pedido_cliente 
(
	 ID_PEDIDO  integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	 NUMERO_PRODUCTOS  NUMBER(20,4) NOT NULL,
	 ID_CLIENTE  INTEGER NOT NULL,
     state integer default 1
)
;

CREATE TABLE   persona 
(
	 ID_PERSONA  integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	 NOMBRES  VARCHAR(100) NOT NULL,
	 APELLIDOS  VARCHAR(100) NOT NULL,
	 NUMERO_IDENTIFICACION  VARCHAR(50) NOT NULL,
	 TELEFONO  VARCHAR(50) NOT NULL,
	 FECHA_NACIMIENTO  DATE NOT NULL,
     state integer default 1
)
;



CREATE TABLE   producto_pedido_cliente 
(
	 ID_PRODUCTO_PEDIDO_CLIENTE  integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	 ID_PRODUCTO  INTEGER NOT NULL,
	 ID_PEDIDO  INTEGER NOT NULL,
     CANTIDAD_PRODUCTO  NUMBER(4) NOT NULL,
     state integer default 1
)
;
------------------------ASIGNACION DE FK

ALTER TABLE   cliente  
 ADD CONSTRAINT  FK_cliente_persona 
	FOREIGN KEY ( ID_PERSONA ) REFERENCES   persona  ( ID_PERSONA )
;
ALTER TABLE   operador  
 ADD CONSTRAINT  FK_operador_persona 
	FOREIGN KEY ( ID_PERSONA ) REFERENCES   persona  ( ID_PERSONA )
;

ALTER TABLE   pedido_cliente  
 ADD CONSTRAINT  FK_pedido_cliente_cliente 
	FOREIGN KEY ( ID_CLIENTE ) REFERENCES   cliente  ( ID_CLIENTE )
;
ALTER TABLE   pago
 ADD CONSTRAINT  FK_pedido_cliente_pago 
	FOREIGN KEY ( ID_PEDIDO ) REFERENCES   pedido_cliente  ( ID_PEDIDO )
;
ALTER TABLE   factura  
 ADD CONSTRAINT  FK_factura_pedido_cliente 
 FOREIGN KEY ( ID_PEDIDO) REFERENCES  pedido_cliente  ( ID_PEDIDO )
;
desc pedido_cliente;
desc factura;
ALTER TABLE   producto_pedido_cliente  
 ADD CONSTRAINT  FK_producto_ped_pedido_clie_01 
	FOREIGN KEY ( ID_PEDIDO ) REFERENCES   pedido_cliente  ( ID_PEDIDO )
;
ALTER TABLE   producto_pedido_cliente  
 ADD CONSTRAINT  FK_producto_pedido_producto_01 
	FOREIGN KEY ( ID_PRODUCTO ) REFERENCES   producto  ( ID)
;
ALTER TABLE   inventario  
 ADD CONSTRAINT  FK_inventario_producto 
	FOREIGN KEY ( ID_PRODUCTO ) REFERENCES   producto  ( ID )
;

---add the username and password to table operador
alter table operador
  add username varchar(25) default '' not null;
alter table operador
  add password varchar(25) default '' not null;
select * from categoria;
select id from producto where rownum=1 order by id desc  ;----> nos da el ultimo registro

select id_cliente from cliente where rownum=1 order by id_cliente desc  ;

-----------------------insercion de datos de prueba para consultas.
select categoria.nombre, categoria.id_categoria, producto.nombre, producto.id from categoria,producto where producto.id_categoria=categoria.id_categoria and producto.state=1;
desc operador;
desc persona;
desc cliente;
SELECT TO_DATE(SYSDATE) FROM DUAL;
insert into persona (NOMBRES,apellidos,numero_identificacion,telefono,fecha_nacimiento) values ('JUAN','SARMIENTO','1018435869','3056278667',TO_DATE('28/11/20'));
/*
1-CREAR PERSONAS
2-CREAR YA SEA CLIENTE U OPERADOR CON BASE EN EL ID DE LA PERSONA
3-Crear un inventario con las cantidades de ese producto
4-CREAR PEDIDO
5-CREAR CONTENIDO EN LA TABLA PRODUCTO_PEDIDO_CLIENTE
6-Insercio de metodo de pago
7-factura

--1
select id_persona from persona where rownum=1 order by id_persona desc;
INSERT INTO CLIENTE (fecha_registro,id_persona) values (to_date(sysdate),2);
select * from cliente;

INSERT INTO OPERADOR (ROL,ID_PERSONA,USERNAME,PASSWORD) VALUES ('ADMINISTRADOR',1,'alejomora999','supersecret');
commit;
--2
select * from persona,operador where persona.id_persona=operador.id_operador and persona.id_persona=1;
select * from persona,cliente where persona.id_persona=cliente.id_persona and persona.id_persona=2;
desc inventario;
select * from producto;
--3
INSERT INTO INVENTARIO (CANTIDAD_DISPONIBLE,ID_PRODUCTO) VALUES (10,2); 
SELECT * FROM PRODUCTO, INVENTARIO,CATEGORIA WHERE inventario.id_producto=producto.id AND producto.id_categoria=categoria.id_categoria;
--4PARA ESTA PARTE para numeros de prducto se pasa 0
INSERT INTO pedido_cliente (numero_productos,id_cliente) values (0,1);
desc pedido_cliente;

--5 
desc producto_pedido_cliente;
insert into producto_pedido_cliente(id_producto,id_pedido,cantidad_producto) values (1,1,5);
insert into producto_pedido_cliente(id_producto,id_pedido,cantidad_producto) values (2,1,2);
insert into producto_pedido_cliente(id_producto,id_pedido,cantidad_producto) values (3,1,1);
commit;
select * from pedido_cliente, producto_pedido_cliente where pedido_cliente.id_pedido=producto_pedido_cliente.id_pedido;
select * from producto_pedido_cliente;
--drop table pedido_cliente cascade CONSTRAINTS;
--6
desc pago;
insert into pago (tipo_pago,estado,id_pedido) values ('TRAJETA CREDITO','PAGADO',1);
select * from pago;
--7
insert into factura (fecha_compra,id_pedido,estado) values (to_date(sysdate),1,'EN PROCESO');
desc factura;
select * from factura;
--drop table factura cascade CONSTRAINTS;
--drop table pago cascade CONSTRAINTS;
--drop table producto_pedido_cliente cascade CONSTRAINTS;
------------------------------------
--consulta que se mostraria en fron end como factura
/*
  cliente nombre, cedula cliente, pedido cliente, factura,productos del pedido, valor de cada producto, cantidad, iva, categoria nombre, fecha factura, pago  
  tablas: cliente, persona, pedido_cliente, pago, producto_pedido_cliente, producto, categoria, factura  
    

select  cliente.id_cliente, persona.nombres||' '||persona.apellidos,persona.numero_identificacion,factura.vendedor,pedido_cliente.id_pedido,factura.id_factura,
        producto.nombre,producto.codigo,producto.descripcion, '$'||producto.precio_unidad, producto_pedido_cliente.cantidad_producto,
        '$'||(producto.precio_unidad*producto_pedido_cliente.cantidad_producto) as subtotal ,categoria.iva||'%' as iva,
        '$'||(((categoria.iva/100)+1)*(producto.precio_unidad*producto_pedido_cliente.cantidad_producto)) as TOTAL_PRODUCTO,categoria.nombre,
        factura.fecha_compra, pago.tipo_pago 
from cliente, persona,pedido_cliente, pago, producto_pedido_cliente, producto, categoria, factura
where cliente.id_persona=persona.id_persona and pedido_cliente.id_cliente=cliente.id_cliente and pedido_cliente.id_pedido=factura.id_pedido and pedido_cliente.id_pedido=pago.id_pedido
    and pedido_cliente.id_pedido=producto_pedido_cliente.id_pedido and producto_pedido_cliente.id_producto=producto.id and producto.id_categoria=categoria.id_categoria;
-----------------------suma total de los productos
select  '$'||sum((((categoria.iva/100)+1)*(producto.precio_unidad*producto_pedido_cliente.cantidad_producto))) as TOTAL_SUMA_TOTAL 
from cliente, persona,pedido_cliente, pago, producto_pedido_cliente, producto, categoria, factura
where cliente.id_persona=persona.id_persona and pedido_cliente.id_cliente=cliente.id_cliente and pedido_cliente.id_pedido=factura.id_pedido and pedido_cliente.id_pedido=pago.id_pedido
    and pedido_cliente.id_pedido=producto_pedido_cliente.id_pedido and producto_pedido_cliente.id_producto=producto.id and producto.id_categoria=categoria.id_categoria;

-----------------
select count(username) from operador where username='alejomora999';
--este if es de backen si retorna cero se crea el user, de lo contrario se escribe que el usuario ya existe
select nombres||' '||apellidos from persona WHERE STATE=1;
desc factura;
alter table factura
  add vendedor varchar(100) default '';
select * from factura;
--update factura set vendedor='ALEJANDRO MORALES MOJICA';
--commit;

----
/*
codigo, vendedor, cliente, Estado, fecha registro, fecha compra, valor total

select distinct producto.codigo,factura.vendedor,persona.nombres||' '||persona.apellidos as CLIENTE,REPLACE(REPLACE(factura.state,1,'HABILITADA'),0,'ANULADA') AS ESTADO,factura.fecha_compra as FECHA_REGISTRO,
factura.fecha_compra as FECHA_COMPRA,(select  '$'||sum((((categoria.iva/100)+1)*(producto.precio_unidad*producto_pedido_cliente.cantidad_producto)))  
from cliente, persona,pedido_cliente, pago, producto_pedido_cliente, producto, categoria, factura
where cliente.id_persona=persona.id_persona and pedido_cliente.id_cliente=cliente.id_cliente and pedido_cliente.id_pedido=factura.id_pedido and pedido_cliente.id_pedido=pago.id_pedido
    and pedido_cliente.id_pedido=producto_pedido_cliente.id_pedido and producto_pedido_cliente.id_producto=producto.id and producto.id_categoria=categoria.id_categoria) as TOTAL_SUMA_TOTAL 
from cliente, persona,pedido_cliente, pago, producto_pedido_cliente, producto, categoria, factura
where cliente.id_persona=persona.id_persona and pedido_cliente.id_cliente=cliente.id_cliente and pedido_cliente.id_pedido=factura.id_pedido and pedido_cliente.id_pedido=pago.id_pedido
    and pedido_cliente.id_pedido=producto_pedido_cliente.id_pedido and producto_pedido_cliente.id_producto=producto.id and producto.id_categoria=categoria.id_categoria;
-----
select  '$'||sum((((categoria.iva/100)+1)*(producto.precio_unidad*producto_pedido_cliente.cantidad_producto))) as TOTAL_SUMA_TOTAL 
from cliente, persona,pedido_cliente, pago, producto_pedido_cliente, producto, categoria, factura
where cliente.id_persona=persona.id_persona and pedido_cliente.id_cliente=cliente.id_cliente and pedido_cliente.id_pedido=factura.id_pedido and pedido_cliente.id_pedido=pago.id_pedido
    and pedido_cliente.id_pedido=producto_pedido_cliente.id_pedido and producto_pedido_cliente.id_producto=producto.id and producto.id_categoria=categoria.id_categoria;


-----
select  cliente.id_cliente, persona.nombres||' '||persona.apellidos,persona.numero_identificacion,factura.vendedor,pedido_cliente.id_pedido,factura.id_factura,
        producto.nombre,producto.codigo,producto.descripcion, '$'||producto.precio_unidad, producto_pedido_cliente.cantidad_producto,
        '$'||(producto.precio_unidad*producto_pedido_cliente.cantidad_producto) as subtotal ,categoria.iva||'%' as iva,
        '$'||(((categoria.iva/100)+1)*(producto.precio_unidad*producto_pedido_cliente.cantidad_producto)) as TOTAL_PRODUCTO,categoria.nombre,
        factura.fecha_compra, pago.tipo_pago 
from cliente, persona,pedido_cliente, pago, producto_pedido_cliente, producto, categoria, factura
where cliente.id_persona=persona.id_persona and pedido_cliente.id_cliente=cliente.id_cliente and pedido_cliente.id_pedido=factura.id_pedido and pedido_cliente.id_pedido=pago.id_pedido
    and pedido_cliente.id_pedido=producto_pedido_cliente.id_pedido and producto_pedido_cliente.id_producto=producto.id and producto.id_categoria=categoria.id_categoria;
    
    
    
    --select * from persona;
    
    --select REPLACE(REPLACE(id_persona,1,'vendedor'),2,'cliente'), nombres from persona;
    
    
SELECT REPLACE(REPLACE('0','1','HABILITADA'),'0','anulada') FROM DUAL;    
SELECT REPLACE(REPLACE('TEST123','123','456'),'45','89') FROM DUAL;

desc factura;
desc operador;
select * from operador;
select count(username) from operador where username='alejomora999' and password='supersecret'



  */