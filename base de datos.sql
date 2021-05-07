
CREATE DATABASE sistema1;
USE sistema1;


CREATE TABLE producto (
  id_producto int primary key NOT NULL, 
  id_categoria int(11) NOT NULL,
  codigo varchar(80) NOT NULL,
  nombre int(8) NOT NULL,
  precio_venta DECIMAL(40) NOT NULL,
  descripcion varchar(256) NOT NULL,
  fechaentrega datetime NOT NULL,
  fecha_vencimiento DATE NOT NULL,
  estado CHAR(1) NOT NULL
  
) ;
alter table producto
add constraint fk_1
foreign key (id_categoria)
references categoria (id_categoria);



CREATE TABLE proveedor (
  id_proveedor int primary key NOT NULL,
  nombre_proveedor varchar(110) NOT NULL,
  nombre_contacto varchar(110) NOT NULL,
  cargo_contacto varchar(110) NOT NULL,
  numero_ruc varchar(20) NOT NULL,
  stock int(11) DEFAULT NULL,
  direccion  varchar(70) NOT NULL,
  telefono varchar(15) NOT NULL,
  email varchar(50) NOT NULL
) ;




CREATE TABLE administrador (
  id_administrador int primary key NOT NULL,
  nombre varchar(50) NOT NULL,
  tipo_documento varchar(30) NOT NULL,
  num_documento varchar(30) NOT NULL,
  direccion varchar(70) NOT NULL,
  telefono varchar(15) NOT NULL,
  email varchar(50) NOT NULL,
  codigo varchar(50) NOT NULL
) ;




CREATE TABLE cliente (
  id_cliente int primary key not null,
  nombres varchar(50) NOT NULL,
  tipo_documento varchar(30) NOT NULL,
  num_documento varchar(30) NOT NULL,
  direccion varchar(70) NOT NULL,
  telefono varchar(15) NOT NULL,
  email varchar(50) NOT NULL,
  num_tarjeta int(11) NOT NULL,
  fecha_VENCIMIENTO DATETIME NOT NULL,
  codigo_tarjeta char(3) NOT NULL
);

CREATE TABLE categoria (
  id_categoria int primary key NOT NULL,
  nombre varchar(50) NOT NULL,
  descripcion varchar(250) NOT NULL
) ;

CREATE TABLE detalle_ingreso (
  id_detalle int primary key NOT NULL,
  id_ingreso int,
  id_producto int,
  cantidad int(11) NOT NULL,
  precio DECIMAL(11,2) NOT NULL
) ;
alter table detalle_ingreso
add constraint fk_2
foreign key (id_ingreso)
references ingreso ( id_ingreso);

alter table detalle_ingreso
add constraint fk_3
foreign key (id_producto)
references producto ( id_producto);

CREATE TABLE ingreso (
  id_ingreso int primary key NOT NULL,
  id_proveedor int,
  id_administrador int,
  tipo_comprobante varchar(20) NOT NULL,
  guia_comprobante varchar(7) NOT NULL,
  numero_comprobante varchar(10) NOT NULL,
  fecha DATETIME NOT NULL,
  impuesto DECIMAL(4,2) NOT NULL,
  total DECIMAL(11,5) NOT NULL,
  estado varchar(20) NOT NULL
) ;
alter table ingreso
add constraint fk_4
foreign key (id_proveedor)
references proveedor ( id_proveedor);

alter table ingreso
add constraint fk_5
foreign key (id_administrador)
references administrador ( id_administrador);

CREATE TABLE venta (
  id int primary key NOT NULL,
  id_cliente int,
  id_administrador int,
  tipo_comprobante varchar(20) NOT NULL,
  guia_comprobante varchar(7) NOT NULL,
  numero_comprobante varchar(10) NOT NULL,
  fecha_hora DATETIME NOT NULL,
  impuesto DECIMAL(4,2) NOT NULL,
  total DECIMAL(11,2) NOT NULL,
  estado varchar(20) NOT NULL
) ;
alter table venta
add constraint fk_6
foreign key (id_cliente)
references cliente ( id_cliente);

alter table venta
add constraint fk_7
foreign key (id_administrador)
references administrador ( id_administrador);



CREATE TABLE detalle_venta (
  id int primary key NOT NULL,
  id_venta int,
  id_producto int,
  cantidad int(11) NOT NULL,
  precio DECIMAL(11,2) NOT NULL,
  descuento DECIMAL(11,2) NOT NULL
) ;

alter table detalle_venta
add constraint fk_8
foreign key (id_venta)
references venta ( id);

alter table detalle_venta
add constraint fk_9
foreign key (id_producto)
references producto ( id_producto);



