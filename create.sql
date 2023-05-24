IF EXISTS (SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'APP_DELIVERY')
    DROP SCHEMA APP_DELIVERY

--TENGO QUE VER COMO ES ESTO DEL GO, LO COPIO DE UN TP YA HECHO
USE GD1C2023
GO

--DROP PREVENTIVO DE TABLAS-------------------------

------------ Eliminaci�n de tablas    ------------------
IF OBJECT_ID('APP_DELIVERY.ITEM_PRODUCTO','U') IS NOT NULL
	DROP TABLE APP_DELIVERY.ITEM_PRODUCTO;
IF OBJECT_ID('APP_DELIVERY.CUPON_RECLAMO','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.CUPON_RECLAMO;
IF OBJECT_ID('APP_DELIVERY.RECLAMO','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.RECLAMO;
IF OBJECT_ID('APP_DELIVERY.PEDIDO','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.PEDIDO;
IF OBJECT_ID('APP_DELIVERY.CUPON','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.CUPON;
IF OBJECT_ID('APP_DELIVERY.TIPO_CUPON','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.TIPO_CUPON;
IF OBJECT_ID('APP_DELIVERY.TIPO_RECLAMO','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.TIPO_RECLAMO;
IF OBJECT_ID('APP_DELIVERY.OPERADOR_RECLAMO','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.OPERADOR_RECLAMO;
IF OBJECT_ID('APP_DELIVERY.MENSAJERIA','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.MENSAJERIA;
IF OBJECT_ID('APP_DELIVERY.PRODUCTO_LOCAL','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.PRODUCTO_LOCAL;
IF OBJECT_ID('APP_DELIVERY.LOCAL_HORARIO','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.LOCAL_HORARIO;
IF OBJECT_ID('APP_DELIVERY.LOCAL','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.LOCAL;
IF OBJECT_ID('APP_DELIVERY.DIA','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.DIA;
IF OBJECT_ID('APP_DELIVERY.PRODUCTO','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.PRODUCTO;
IF OBJECT_ID('APP_DELIVERY.MEDIO_PAGO','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.MEDIO_PAGO;
IF OBJECT_ID('APP_DELIVERY.MARCA_TARJETA','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.MARCA_TARJETA;
IF OBJECT_ID('APP_DELIVERY.TIPO_MEDIO_PAGO','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.TIPO_MEDIO_PAGO;
IF OBJECT_ID('APP_DELIVERY.ENVIO','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.ENVIO;
IF OBJECT_ID('APP_DELIVERY.REPARTIDOR','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.REPARTIDOR;
IF OBJECT_ID('APP_DELIVERY.TIPO_MOVILIDAD','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.TIPO_MOVILIDAD;
IF OBJECT_ID('APP_DELIVERY.LOCALIZACION','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.LOCALIZACION;
IF OBJECT_ID('APP_DELIVERY.LOCALIDAD','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.LOCALIDAD;
IF OBJECT_ID('APP_DELIVERY.PROVINCIA','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.PROVINCIA;
IF OBJECT_ID('APP_DELIVERY.TIPO_LOCALIZACION','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.TIPO_LOCALIZACION;
IF OBJECT_ID('APP_DELIVERY.ESTADO_RECLAMO','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.ESTADO_RECLAMO;
IF OBJECT_ID('APP_DELIVERY.ESTADO_PEDIDO','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.ESTADO_PEDIDO;
IF OBJECT_ID('APP_DELIVERY.ESTADO_MENSAJERIA','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.ESTADO_MENSAJERIA;
IF OBJECT_ID('APP_DELIVERY.ENTREGA','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.ENTREGA;
IF OBJECT_ID('APP_DELIVERY.SEGURO','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.SEGURO;
IF OBJECT_ID('APP_DELIVERY.PAQUETE','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.PAQUETE;
IF OBJECT_ID('APP_DELIVERY.TIPO_PAQUETE','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.TIPO_PAQUETE;
IF OBJECT_ID('APP_DELIVERY.USUARIO','U') IS NOT NULL
    DROP TABLE APP_DELIVERY.USUARIO;

-------------------- Eliminaci�n del esquema ---------------------------

IF EXISTS (SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'APP_DELIVERY')
    DROP SCHEMA APP_DELIVERY
GO

-------------------- Creaci�n del esquema ---------------------------
CREATE SCHEMA APP_DELIVERY;
GO

-------------------- Creaci�n de tablas ---------------------------

CREATE TABLE APP_DELIVERY.USUARIO(
	ID_USUARIO BIGINT PRIMARY KEY NOT NULL, 
	DNI DECIMAL(18,0) NOT NULL,
	NOMBRE NVARCHAR(255) NOT NULL,
	APELLIDO NVARCHAR(255) NOT NULL,
	FECHA_REGISTRO DATETIME2(3) NOT NULL,
	FECHA_NAC DATE NOT NULL,
	MAIL NVARCHAR(255) NOT NULL,
	TELEFONO DECIMAL(18,0) NOT NULL
);

CREATE TABLE APP_DELIVERY.TIPO_PAQUETE (
	ID_TIPO_PAQUETE BIGINT PRIMARY KEY NOT NULL,
	DESCRIPCION NVARCHAR(50) NOT NULL
);

CREATE TABLE APP_DELIVERY.PAQUETE(
	ID_PAQUETE BIGINT PRIMARY KEY NOT NULL, 
	ID_TIPO_PAQUETE BIGINT REFERENCES APP_DELIVERY.TIPO_PAQUETE NOT NULL,
	ALTO_MAX DECIMAL(18,2) NOT NULL,
	ANCHO_MAX DECIMAL(18,2) NOT NULL,
	LARGO_MAX DECIMAL(18,2) NOT NULL,
	PESO_MAX DECIMAL(18,2) NOT NULL,
	TIPO_PRECIO DECIMAL(18,2) NOT NULL
);

CREATE TABLE APP_DELIVERY.SEGURO (
	ID_SEGURO BIGINT PRIMARY KEY NOT NULL,
	VALOR_ASEGURADO DECIMAL(18,2) NOT NULL,
	PRECIO DECIMAL(18,2) NOT NULL
);


CREATE TABLE APP_DELIVERY.ENTREGA (
	ID_ENTREGA BIGINT PRIMARY KEY NOT NULL,
	FECHA_ENTREGA DATETIME2(3) NOT NULL,
	TIEMPO_ESTIMADO DECIMAL (18,2) NOT NULL,
	CALIFICACION DECIMAL(18,0) NOT NULL
);

CREATE TABLE APP_DELIVERY.ESTADO_MENSAJERIA (
	ID_ESTADO_MENSAJERIA BIGINT PRIMARY KEY NOT NULL,
	DESCRIPCION NVARCHAR(50) NOT NULL
);

CREATE TABLE APP_DELIVERY.ESTADO_PEDIDO (
	ID_ESTADO_PEDIDO BIGINT PRIMARY KEY NOT NULL,
	DESCRIPCION NVARCHAR(50) NOT NULL
);

CREATE TABLE APP_DELIVERY.ESTADO_RECLAMO (
	ID_ESTADO_RECLAMO BIGINT PRIMARY KEY NOT NULL,
	DESCRIPCION NVARCHAR(50) NOT NULL
);

CREATE TABLE APP_DELIVERY.TIPO_LOCALIZACION (
	ID_TIPO_LOCALIZACION BIGINT PRIMARY KEY NOT NULL,
	DESCRIPCION NVARCHAR(50) NOT NULL
);

CREATE TABLE APP_DELIVERY.PROVINCIA (
	ID_PROVINCIA BIGINT PRIMARY KEY NOT NULL,
	NOMBRE NVARCHAR(255) NOT NULL
);

CREATE TABLE APP_DELIVERY.LOCALIDAD (
	ID_LOCALIDAD BIGINT PRIMARY KEY NOT NULL,
	NOMBRE NVARCHAR(255) NOT NULL,
	ID_PROVINCIA BIGINT REFERENCES APP_DELIVERY.PROVINCIA NOT NULL
);

CREATE TABLE APP_DELIVERY.LOCALIZACION (
	ID_LOCALIZACION BIGINT PRIMARY KEY NOT NULL,
	ID_TIPO_LOCALIZACION BIGINT REFERENCES APP_DELIVERY.TIPO_LOCALIZACION NOT NULL,
	ID_LOCALIDAD BIGINT REFERENCES APP_DELIVERY.LOCALIDAD NOT NULL,
	DIRECCION NVARCHAR(255) NOT NULL,
	DESCRIPCION NVARCHAR(50) NOT NULL
);

CREATE TABLE APP_DELIVERY.TIPO_MOVILIDAD (
	ID_TIPO_MOVILIDAD BIGINT PRIMARY KEY NOT NULL,
	DESCRIPCION NVARCHAR(50) NOT NULL
);

CREATE TABLE APP_DELIVERY.REPARTIDOR(
	ID_REPARTIDOR BIGINT PRIMARY KEY NOT NULL, 
	ID_LOCALIZACION BIGINT REFERENCES APP_DELIVERY.LOCALIZACION NOT NULL,
	ID_TIPO_MOVILIDAD BIGINT REFERENCES APP_DELIVERY.TIPO_MOVILIDAD NOT NULL,
	DNI DECIMAL(18,0),
	NOMBRE NVARCHAR(255),
	APELLIDO NVARCHAR(255),
	TELEFONO DECIMAL(18,0),
	MAIL NVARCHAR(255),
	FECHA_NAC DATE
);
CREATE TABLE APP_DELIVERY.ENVIO (
	ID_ENVIO BIGINT PRIMARY KEY NOT NULL,
	ID_REPARTIDOR  BIGINT REFERENCES APP_DELIVERY.REPARTIDOR NOT NULL,
	ID_LOCALIZACION_DESTINO  BIGINT REFERENCES APP_DELIVERY.LOCALIZACION NOT NULL,
	ID_LOCALIZACION_ORIGEN  BIGINT REFERENCES APP_DELIVERY.LOCALIZACION NOT NULL,
	PROPINA DECIMAL(18,2),
	PRECIO DECIMAL(18,2)
);

CREATE TABLE APP_DELIVERY.TIPO_MEDIO_PAGO (
	ID_TIPO_MEDIO_PAGO BIGINT PRIMARY KEY NOT NULL,
	DESCRIPCION NVARCHAR(50) NOT NULL
);
CREATE TABLE APP_DELIVERY.MARCA_TARJETA (
	ID_MARCA_TARJETA BIGINT PRIMARY KEY NOT NULL,
	DESCRIPCION NVARCHAR(100) NOT NULL
);
CREATE TABLE APP_DELIVERY.MEDIO_PAGO (
	ID_MEDIO_PAGO BIGINT PRIMARY KEY NOT NULL,
	ID_TIPO_MEDIO_PAGO BIGINT REFERENCES APP_DELIVERY.TIPO_MEDIO_PAGO NOT NULL,
	ID_MARCA_TARJETA BIGINT NOT NULL,
	NRO_TARJETA NVARCHAR(50) NOT NULL
);

CREATE TABLE APP_DELIVERY.PRODUCTO (
	ID_PRODUCTO BIGINT PRIMARY KEY NOT NULL,
	CODIGO NVARCHAR(50) ,
	NOMBRE NVARCHAR(50) ,
	DESCRIPCION NVARCHAR(255),
	PRECIO DECIMAL(18,2) 
);

CREATE TABLE APP_DELIVERY.DIA (
	ID_DIA BIGINT PRIMARY KEY NOT NULL,
	DESCRIPCION NVARCHAR(50) NOT NULL
);

CREATE TABLE APP_DELIVERY.LOCAL (
	ID_LOCAL BIGINT PRIMARY KEY NOT NULL,
	NOMBRE NVARCHAR(100),
	DESCRIPCION NVARCHAR(255),
	ID_LOCALIZACION BIGINT REFERENCES APP_DELIVERY.LOCALIZACION NOT NULL
);

CREATE TABLE APP_DELIVERY.LOCAL_HORARIO (
	ID_LOCAL_HORARIO BIGINT PRIMARY KEY NOT NULL,
    	ID_LOCAL BIGINT REFERENCES APP_DELIVERY.LOCAL NOT NULL,
    	ID_DIA BIGINT REFERENCES APP_DELIVERY.DIA NOT NULL,
    	HORA_APERTURA DECIMAL(18,0) NOT NULL,
    	HORA_CIERRE DECIMAL(18,0) NOT NULL
);


CREATE TABLE APP_DELIVERY.PRODUCTO_LOCAL (
	ID_PRODUCTO_LOCAL BIGINT PRIMARY KEY NOT NULL,
	ID_PRODUCTO BIGINT REFERENCES APP_DELIVERY.PRODUCTO NOT NULL,
	ID_LOCAL BIGINT REFERENCES APP_DELIVERY.LOCAL NOT NULL,
	PRECIO_UNITARIO DECIMAL(18,2) 	NOT NULL
);

CREATE TABLE APP_DELIVERY.MENSAJERIA(
	ID_MENSAJERIA BIGINT PRIMARY KEY NOT NULL, 
	ID_ENVIO BIGINT REFERENCES APP_DELIVERY.ENVIO NOT NULL,
	ID_PAQUETE BIGINT REFERENCES APP_DELIVERY.PAQUETE NOT NULL,
	ID_ENTREGA BIGINT REFERENCES APP_DELIVERY.ENTREGA NOT NULL,
	ID_MEDIO_PAGO BIGINT REFERENCES APP_DELIVERY.MEDIO_PAGO NOT NULL,
	ID_USUARIO BIGINT REFERENCES APP_DELIVERY.USUARIO NOT NULL,
	ID_SEGURO BIGINT REFERENCES APP_DELIVERY.SEGURO NOT NULL,
	ID_ESTADO_MENSAJERIA BIGINT REFERENCES APP_DELIVERY.ESTADO_MENSAJERIA NOT NULL,
	FECHA DATETIME2(3) NOT NULL,
	TOTAL DECIMAL(18,2) NOT NULL,
	KM DECIMAL(18,2) NOT NULL,
	OBSERVACIONES NVARCHAR(255) NOT NULL
);

CREATE TABLE APP_DELIVERY.OPERADOR_RECLAMO (
	ID_OPERADOR_RECLAMO BIGINT PRIMARY KEY NOT NULL,
	ID_LOCALIZACION BIGINT REFERENCES APP_DELIVERY.LOCALIZACION NOT NULL,
	NOMBRE NVARCHAR(255) NOT NULL,
	APELLIDO NVARCHAR(255) NOT NULL,
	DNI DECIMAL(18,0) NOT NULL,
	TELEFONO DECIMAL(18,0) NOT NULL,
	MAIL NVARCHAR(255) NOT NULL,
	FECHA_NAC DATE NOT NULL,
);

CREATE TABLE APP_DELIVERY.TIPO_RECLAMO (
	ID_TIPO_RECLAMO BIGINT PRIMARY KEY NOT NULL,
	DESCRIPCION NVARCHAR(50) NOT NULL
);

CREATE TABLE APP_DELIVERY.TIPO_CUPON (
	ID_TIPO_CUPON BIGINT PRIMARY KEY NOT NULL,
	DESCRIPCION NVARCHAR(50) NOT NULL
);

CREATE TABLE APP_DELIVERY.CUPON (
	ID_CUPON BIGINT PRIMARY KEY NOT NULL,
	ID_USUARIO BIGINT REFERENCES APP_DELIVERY.USUARIO NOT NULL,
	ID_TIPO_CUPON BIGINT REFERENCES APP_DELIVERY.TIPO_CUPON NOT NULL,
	CUPON_NRO DECIMAL(18,9) NOT NULL,
	CUPON_MONTO DECIMAL (18,2) NOT NULL,
	CUPON_FECHA_ALTA DATETIME2(3) NOT NULL,
	CUPON_FECHA_VENCIMIENTO DATETIME2(3) NOT NULL
);


CREATE TABLE APP_DELIVERY.PEDIDO (
	ID_PEDIDO BIGINT PRIMARY KEY NOT NULL, 
	ID_ENTREGA BIGINT REFERENCES APP_DELIVERY.ENTREGA NOT NULL,
	ID_ENVIO BIGINT REFERENCES APP_DELIVERY.ENVIO NOT NULL,
	ID_USUARIO BIGINT REFERENCES APP_DELIVERY.USUARIO NOT NULL,
	ID_LOCAL BIGINT REFERENCES APP_DELIVERY.LOCAL NOT NULL,
	ID_MEDIO_PAGO BIGINT REFERENCES APP_DELIVERY.MEDIO_PAGO NOT NULL,
	ID_CUPON BIGINT REFERENCES APP_DELIVERY.CUPON NOT NULL,
	OBSERVACION NVARCHAR(255) NOT NULL,
	FECHA DATETIME2(3) NOT NULL,
	TOTAL_SERVICIO DECIMAL(18,2) NOT NULL,
	TOTAL_CUPONES DECIMAL(18,2) NOT NULL,
	TOTAL_PRODUCTOS DECIMAL(18,2) NOT NULL,
	TARIFA_SERVICIO DECIMAL(18,2) NOT NULL
);

CREATE TABLE APP_DELIVERY.RECLAMO (
    ID_RECLAMO BIGINT PRIMARY KEY NOT NULL,
    ID_PEDIDO BIGINT REFERENCES APP_DELIVERY.PEDIDO NOT NULL,
    ID_USUARIO BIGINT REFERENCES APP_DELIVERY.USUARIO NOT NULL,
    ID_OPERADOR_RECLAMO BIGINT REFERENCES APP_DELIVERY.OPERADOR_RECLAMO NOT NULL,
    ID_TIPO_RECLAMO BIGINT REFERENCES APP_DELIVERY.TIPO_RECLAMO NOT NULL,
    ID_ESTADO_RECLAMO BIGINT REFERENCES APP_DELIVERY.ESTADO_RECLAMO NOT NULL,
    FECHA DATETIME2(3) NOT NULL,
    SOLUCION NVARCHAR(255) NOT NULL,
    FECHA_SOLUCION DATETIME2(3) NOT NULL,
    CALIFICACION DECIMAL(18,0) NOT NULL,
    DESCRIPCION NVARCHAR(255) NOT NULL
);

CREATE TABLE APP_DELIVERY.CUPON_RECLAMO (
	ID_CUPON_RECLAMO BIGINT PRIMARY KEY NOT NULL,
	ID_CUPON BIGINT REFERENCES APP_DELIVERY.CUPON NOT NULL,
	ID_RECLAMO BIGINT REFERENCES APP_DELIVERY.RECLAMO NOT NULL
);

CREATE TABLE APP_DELIVERY.ITEM_PRODUCTO(
	ID_ITEM_PRODUCTO BIGINT PRIMARY KEY NOT NULL,
	ID_PRODUCTO_LOCAL BIGINT REFERENCES APP_DELIVERY.PRODUCTO_LOCAL NOT NULL,
	ID_PEDIDO BIGINT REFERENCES APP_DELIVERY.PEDIDO NOT NULL,
	CANTIDAD DECIMAL(18,0) NOT NULL,
	PRECIO_UNITARIO DECIMAL(18,2) NOT NULL,
	TOTAL DECIMAL(18,2) NOT NULL
);

--------Drops procedures------------------------

IF OBJECT_ID('APP_DELIVERY.Migrar_usuario', 'P') IS NOT NULL  
  DROP PROCEDURE APP_DELIVERY.Migrar_usuario;
GO
IF OBJECT_ID('APP_DELIVERY.Migrar_tipo_paquete', 'P') IS NOT NULL  
  DROP PROCEDURE APP_DELIVERY.Migrar_tipo_paquete;
GO
IF OBJECT_ID('APP_DELIVERY.Migrar_paquete', 'P') IS NOT NULL  
  DROP PROCEDURE APP_DELIVERY.Migrar_paquete;
GO
IF OBJECT_ID('APP_DELIVERY.Migrar_seguro', 'P') IS NOT NULL  
  DROP PROCEDURE APP_DELIVERY.Migrar_estado_pedido;
GO
IF OBJECT_ID('APP_DELIVERY.Migrar_estado_mensajeria', 'P') IS NOT NULL  
  DROP PROCEDURE APP_DELIVERY.Migrar_estado_mensajeria;
GO
IF OBJECT_ID('APP_DELIVERY.Migrar_estado_pedido', 'P') IS NOT NULL  
  DROP PROCEDURE APP_DELIVERY.Migrar_estado_pedido;
GO
IF OBJECT_ID('APP_DELIVERY.Migrar_estado_reclamo', 'P') IS NOT NULL  
  DROP PROCEDURE APP_DELIVERY.Migrar_estado_reclamo;
GO
IF OBJECT_ID('APP_DELIVERY.Migrar_tipo_movilidad', 'P') IS NOT NULL  
  DROP PROCEDURE APP_DELIVERY.Migrar_tipo_movilidad;
GO
IF OBJECT_ID('APP_DELIVERY.Migrar_tipo_medio_pago', 'P') IS NOT NULL  
  DROP PROCEDURE APP_DELIVERY.Migrar_tipo_medio_pago;
GO
IF OBJECT_ID('APP_DELIVERY.Migrar_medio_pago', 'P') IS NOT NULL  
  DROP PROCEDURE APP_DELIVERY.Migrar_medio_pago;
GO
IF OBJECT_ID('APP_DELIVERY.Migrar_marca_tarjeta', 'P') IS NOT NULL  
  DROP PROCEDURE APP_DELIVERY.Migrar_marca_tarjeta;
GO
IF OBJECT_ID('APP_DELIVERY.Migrar_medio_pago', 'P') IS NOT NULL  
  DROP PROCEDURE APP_DELIVERY.Migrar_medio_pago;
GO
IF OBJECT_ID('APP_DELIVERY.Migrar_producto', 'P') IS NOT NULL  
  DROP PROCEDURE APP_DELIVERY.Migrar_producto;
GO
IF OBJECT_ID('APP_DELIVERY.Migrar_dia', 'P') IS NOT NULL  
  DROP PROCEDURE APP_DELIVERY.Migrar_dia;
GO
IF OBJECT_ID('APP_DELIVERY.Migrar_tipo_reclamo', 'P') IS NOT NULL  
  DROP PROCEDURE APP_DELIVERY.Migrar_tipo_reclamo;
GO
IF OBJECT_ID('APP_DELIVERY.Migrar_tipo_cupon', 'P') IS NOT NULL  
  DROP PROCEDURE APP_DELIVERY.Migrar_tipo_cupon;
GO
IF OBJECT_ID('APP_DELIVERY.Migrar_cupon', 'P') IS NOT NULL  
  DROP PROCEDURE APP_DELIVERY.Migrar_cupon;
GO
IF OBJECT_ID('APP_DELIVERY.Migrar_operador_reclamo', 'P') IS NOT NULL  
  DROP PROCEDURE APP_DELIVERY.Migrar_operador_reclamo;
GO
IF OBJECT_ID('APP_DELIVERY.Migrar_repartidor', 'P') IS NOT NULL  
  DROP PROCEDURE APP_DELIVERY.Migrar_repartidor;
GO
IF OBJECT_ID('APP_DELIVERY.Migrar_local', 'P') IS NOT NULL  
  DROP PROCEDURE APP_DELIVERY.Migrar_local;
GO
IF OBJECT_ID('APP_DELIVERY.Migrar_producto_local', 'P') IS NOT NULL  
  DROP PROCEDURE APP_DELIVERY.Migrar_producto_local;
GO
IF OBJECT_ID('APP_DELIVERY.Migrar_local_horario', 'P') IS NOT NULL  
  DROP PROCEDURE APP_DELIVERY.Migrar_local_horario;
GO
IF OBJECT_ID('APP_DELIVERY.Migrar_reclamo', 'P') IS NOT NULL  
  DROP PROCEDURE APP_DELIVERY.Migrar_reclamo;
GO
IF OBJECT_ID('APP_DELIVERY.Migrar_cupon_reclamo', 'P') IS NOT NULL  
  DROP PROCEDURE APP_DELIVERY.Migrar_cupon_reclamo;
GO
IF OBJECT_ID('APP_DELIVERY.Migrar_item_producto', 'P') IS NOT NULL  
  DROP PROCEDURE APP_DELIVERY.Migrar_item_producto;


--Inserts

CREATE PROCEDURE APP_DELIVERY.Migrar_usuario AS
	BEGIN
		INSERT INTO APP_DELIVERY.USUARIO
		SELECT  row_number() over (order by (select NULL)), USUARIO_DNI,USUARIO_NOMBRE ,USUARIO_APELLIDO,USUARIO_FECHA_REGISTRO,USUARIO_FECHA_NAC,USUARIO_MAIL,USUARIO_TELEFONO
		FROM gd_esquema.Maestra
		GROUP BY USUARIO_NOMBRE ,USUARIO_APELLIDO,USUARIO_DNI,USUARIO_FECHA_REGISTRO,USUARIO_MAIL,USUARIO_FECHA_NAC,USUARIO_MAIL,USUARIO_TELEFONO
	END
GO
CREATE PROCEDURE APP_DELIVERY.Migrar_tipo_paquete AS 
	BEGIN 
		INSERT INTO APP_DELIVERY.TIPO_PAQUETE
		SELECT row_number() over (order by (select NULL)) , PAQUETE_TIPO
		FROM gd_esquema.Maestra
		WHERE PAQUETE_TIPO IS NOT NULL
		GROUP BY PAQUETE_TIPO
	END
GO
CREATE PROCEDURE APP_DELIVERY.Migrar_paquete AS 
	BEGIN 
		INSERT INTO APP_DELIVERY.PAQUETE
		SELECT row_number() over (order by (select NULL)) , T.ID_TIPO_PAQUETE , PAQUETE_ALTO_MAX , PAQUETE_ANCHO_MAX , PAQUETE_LARGO_MAX , PAQUETE_PESO_MAX , PAQUETE_TIPO_PRECIO
		FROM gd_esquema.Maestra m
		JOIN APP_DELIVERY.TIPO_PAQUETE t ON t.DESCRIPCION = m.PAQUETE_TIPO 
		GROUP BY T.ID_TIPO_PAQUETE , PAQUETE_ALTO_MAX , PAQUETE_ANCHO_MAX , PAQUETE_LARGO_MAX , PAQUETE_PESO_MAX , PAQUETE_TIPO_PRECIO
	END
GO
CREATE PROCEDURE APP_DELIVERY.Migrar_seguro	AS 
	BEGIN 
		INSERT INTO APP_DELIVERY.SEGURO
		SELECT row_number() over (order by (select NULL)) , ENVIO_MENSAJERIA_VALOR_ASEGURADO , ENVIO_MENSAJERIA_PRECIO_SEGURO
		FROM gd_esquema.Maestra
		WHERE ENVIO_MENSAJERIA_VALOR_ASEGURADO IS NOT NULL
		GROUP BY ENVIO_MENSAJERIA_VALOR_ASEGURADO , ENVIO_MENSAJERIA_PRECIO_SEGURO
	END
GO
CREATE PROCEDURE APP_DELIVERY.Migrar_estado_mensajeria	AS 
	BEGIN 
		INSERT INTO APP_DELIVERY.ESTADO_MENSAJERIA
		SELECT row_number() over (order by (select NULL)) , ENVIO_MENSAJERIA_ESTADO
		FROM gd_esquema.Maestra
		WHERE ENVIO_MENSAJERIA_ESTADO IS NOT NULL
		GROUP BY ENVIO_MENSAJERIA_ESTADO
	END
GO
CREATE PROCEDURE APP_DELIVERY.Migrar_estado_pedido	AS 
	BEGIN 
		INSERT INTO APP_DELIVERY.ESTADO_PEDIDO
		SELECT row_number() over (order by (select NULL)) , PEDIDO_ESTADO
		FROM gd_esquema.Maestra
		WHERE PEDIDO_ESTADO IS NOT NULL
		GROUP BY PEDIDO_ESTADO
	END
GO
CREATE PROCEDURE APP_DELIVERY.Migrar_estado_reclamo	AS 
	BEGIN 
		INSERT INTO APP_DELIVERY.ESTADO_RECLAMO
		SELECT row_number() over (order by (select NULL)) , RECLAMO_ESTADO
		FROM gd_esquema.Maestra
		WHERE RECLAMO_ESTADO IS NOT NULL
		GROUP BY RECLAMO_ESTADO
	END
GO
CREATE PROCEDURE APP_DELIVERY.Migrar_tipo_movilidad	AS 
	BEGIN 
		INSERT INTO APP_DELIVERY.TIPO_MOVILIDAD
		SELECT row_number() over (order by (select NULL)) , REPARTIDOR_TIPO_MOVILIDAD
		FROM gd_esquema.Maestra
		GROUP BY REPARTIDOR_TIPO_MOVILIDAD
	END
GO
CREATE PROCEDURE APP_DELIVERY.Migrar_tipo_medio_pago	AS 
	BEGIN 
		INSERT INTO APP_DELIVERY.TIPO_MEDIO_PAGO
		SELECT row_number() over (order by (select NULL)) , MEDIO_PAGO_TIPO
		FROM gd_esquema.Maestra
		GROUP BY MEDIO_PAGO_TIPO
	END
GO
CREATE PROCEDURE APP_DELIVERY.Migrar_marca_tarjeta	AS 
	BEGIN 
		INSERT INTO APP_DELIVERY.MARCA_TARJETA
		SELECT row_number() over (order by (select NULL)) , MARCA_TARJETA
		FROM gd_esquema.Maestra
		GROUP BY MARCA_TARJETA
	END
GO
CREATE PROCEDURE APP_DELIVERY.Migrar_medio_pago	AS 
	BEGIN 
		INSERT INTO APP_DELIVERY.MEDIO_PAGO
		SELECT row_number() over (order by (select NULL)) , t.ID_TIPO_MEDIO_PAGO , mrk.ID_MARCA_TARJETA , MEDIO_PAGO_NRO_TARJETA 
		FROM gd_esquema.Maestra m
		JOIN APP_DELIVERY.TIPO_MEDIO_PAGO t on m.MEDIO_PAGO_TIPO = t.DESCRIPCION 
		JOIN APP_DELIVERY.MARCA_TARJETA mrk on m.MARCA_TARJETA = mrk.DESCRIPCION
		GROUP BY t.ID_TIPO_MEDIO_PAGO , mrk.ID_MARCA_TARJETA , MEDIO_PAGO_NRO_TARJETA 
	END
GO
CREATE PROCEDURE APP_DELIVERY.Migrar_producto AS
	BEGIN
		INSERT INTO APP_DELIVERY.PRODUCTO
		SELECT row_number() over (order by (select NULL)) , PRODUCTO_LOCAL_CODIGO , PRODUCTO_LOCAL_NOMBRE , PRODUCTO_LOCAL_DESCRIPCION , PRODUCTO_LOCAL_PRECIO
		FROM gd_esquema.Maestra
		GROUP BY PRODUCTO_LOCAL_CODIGO , PRODUCTO_LOCAL_NOMBRE , PRODUCTO_LOCAL_DESCRIPCION , PRODUCTO_LOCAL_PRECIO
	END
GO
CREATE PROCEDURE APP_DELIVERY.Migrar_dia AS
	BEGIN
		INSERT INTO APP_DELIVERY.DIA
		SELECT row_number() over (order by (select NULL)) , HORARIO_LOCAL_DIA
		FROM gd_esquema.Maestra
		WHERE HORARIO_LOCAL_DIA IS NOT NULL
		GROUP BY HORARIO_LOCAL_DIA
	END	
GO
CREATE PROCEDURE APP_DELIVERY.Migrar_tipo_reclamo AS
	BEGIN
		INSERT INTO APP_DELIVERY.TIPO_RECLAMO
		SELECT row_number() over (order by (select NULL)) , RECLAMO_TIPO
		FROM gd_esquema.Maestra
		WHERE RECLAMO_TIPO IS NOT NULL
		GROUP BY RECLAMO_TIPO
	END	
GO
CREATE PROCEDURE APP_DELIVERY.Migrar_tipo_cupon AS
	BEGIN
		INSERT INTO APP_DELIVERY.TIPO_CUPON
		SELECT row_number() over (order by (select NULL)) , CUPON_TIPO
		FROM gd_esquema.Maestra
		WHERE CUPON_TIPO IS NOT NULL
		GROUP BY CUPON_TIPO
	END	
GO
CREATE PROCEDURE APP_DELIVERY.Migrar_cupon AS
	BEGIN
		INSERT INTO APP_DELIVERY.CUPON
		SELECT row_number() over (order by (select NULL)) , U.ID_USUARIO , T.ID_TIPO_CUPON , M.CUPON_NRO , M.CUPON_MONTO , M.CUPON_FECHA_ALTA , M.CUPON_FECHA_VENCIMIENTO
		FROM gd_esquema.Maestra m
		JOIN APP_DELIVERY.USUARIO u on m.USUARIO_DNI = u.DNI AND M.USUARIO_MAIL = u.MAIL
		JOIN APP_DELIVERY.TIPO_CUPON t ON t.DESCRIPCION = m.CUPON_TIPO
		GROUP BY U.ID_USUARIO , T.ID_TIPO_CUPON , M.CUPON_NRO , M.CUPON_MONTO , M.CUPON_FECHA_ALTA , M.CUPON_FECHA_VENCIMIENTO
	END
GO
CREATE PROCEDURE APP_DELIVERY.Migrar_operador_reclamo AS
	BEGIN
		INSERT INTO APP_DELIVERY.OPERADOR_RECLAMO
		SELECT row_number() over (order by (select NULL)) , L.ID_LOCALIZACION , OPERADOR_RECLAMO_NOMBRE , OPERADOR_RECLAMO_APELLIDO , OPERADOR_RECLAMO_DNI , 
		OPERADOR_RECLAMO_TELEFONO , OPERADOR_RECLAMO_MAIL ,OPERADOR_RECLAMO_FECHA_NAC
		FROM gd_esquema.Maestra M
		JOIN APP_DELIVERY.LOCALIZACION L ON L.DIRECCION = M.OPERADOR_RECLAMO_DIRECCION
		GROUP BY L.ID_LOCALIZACION , OPERADOR_RECLAMO_NOMBRE , OPERADOR_RECLAMO_APELLIDO , OPERADOR_RECLAMO_DNI , 
		OPERADOR_RECLAMO_TELEFONO , OPERADOR_RECLAMO_MAIL ,OPERADOR_RECLAMO_FECHA_NAC
	END
GO
CREATE PROCEDURE APP_DELIVERY.Migrar_repartidor AS 
	BEGIN
		INSERT INTO APP_DELIVERY.REPARTIDOR
		SELECT row_number() over (order by (select NULL))  ,L.ID_LOCALIZACION, MOV.ID_TIPO_MOVILIDAD , M.REPARTIDOR_DNI , M.REPARTIDOR_NOMBRE ,
		M.REPARTIDOR_APELLIDO , M.REPARTIDOR_TELEFONO , M.REPARTIDOR_EMAIL , M.REPARTIDOR_FECHA_NAC
		FROM gd_esquema.Maestra m
		JOIN APP_DELIVERY.LOCALIZACION L ON L.DIRECCION = M.REPARTIDOR_DIRECION -- �SE DEBERIA PODER NULEAR ID_LOCALIDAD? XQ LOS REPARTIDORES NO TIENEN LOCALIDAD ASOCIADA
		JOIN APP_DELIVERY.TIPO_MOVILIDAD mov ON mov.DESCRIPCION = m.REPARTIDOR_TIPO_MOVILIDAD
		GROUP BY  L.ID_LOCALIZACION, MOV.ID_TIPO_MOVILIDAD , M.REPARTIDOR_DNI , M.REPARTIDOR_NOMBRE ,
		M.REPARTIDOR_APELLIDO , M.REPARTIDOR_TELEFONO , M.REPARTIDOR_EMAIL , M.REPARTIDOR_FECHA_NAC
	END
GO
CREATE PROCEDURE APP_DELIVERY.Migrar_local AS 
	BEGIN
		INSERT INTO APP_DELIVERY.LOCAL
		SELECT row_number() over (order by (select NULL))  , LOCAL_NOMBRE , LOCAL_DESCRIPCION , L.ID_LOCALIZACION
		FROM gd_esquema.Maestra m
		JOIN APP_DELIVERY.LOCALIZACION L ON L.DIRECCION = M.LOCAL_DIRECCION AND L.DESCRIPCION = M.LOCAL_DESCRIPCION
		JOIN APP_DELIVERY.LOCALIDAD LOC ON LOC.NOMBRE = M.LOCAL_LOCALIDAD
		JOIN APP_DELIVERY.PROVINCIA P ON P.NOMBRE = M.LOCAL_PROVINCIA
		GROUP BY LOCAL_NOMBRE , LOCAL_DESCRIPCION , L.ID_LOCALIZACION
	END
GO
CREATE PROCEDURE APP_DELIVERY.Migrar_producto_local AS 
	BEGIN
		INSERT INTO APP_DELIVERY.PRODUCTO_LOCAL
		SELECT row_number() over (order by (select NULL))  , P.ID_PRODUCTO , L.ID_LOCAL , P.PRECIO
		FROM gd_esquema.Maestra m
		JOIN APP_DELIVERY.PRODUCTO P ON P.CODIGO = M.PRODUCTO_LOCAL_CODIGO
		JOIN APP_DELIVERY.LOCAL L ON L.NOMBRE = M.LOCAL_NOMBRE
		GROUP BY P.ID_PRODUCTO , L.ID_LOCAL , P.PRECIO
	END
GO
CREATE PROCEDURE APP_DELIVERY.Migrar_local_horario AS 
	BEGIN 
		INSERT INTO APP_DELIVERY.LOCAL_HORARIO
		SELECT row_number() over (order by (select NULL)) , L.ID_LOCAL , D.ID_DIA , HORARIO_LOCAL_HORA_APERTURA , HORARIO_LOCAL_HORA_CIERRE
		FROM gd_esquema.Maestra M
		JOIN APP_DELIVERY.LOCAL L ON L.NOMBRE = M.LOCAL_NOMBRE
		JOIN APP_DELIVERY.DIA D ON D.DESCRIPCION = M.HORARIO_LOCAL_DIA
		GROUP BY L.ID_LOCAL , D.ID_DIA , HORARIO_LOCAL_HORA_APERTURA , HORARIO_LOCAL_HORA_CIERRE
	END
GO
CREATE PROCEDURE APP_DELIVERY.Migrar_reclamo AS 
	BEGIN 
		INSERT INTO APP_DELIVERY.RECLAMO
		SELECT M.RECLAMO_NRO , P.ID_PEDIDO , U.ID_USUARIO , OP.ID_OPERADOR_RECLAMO , TR.ID_TIPO_RECLAMO , ER.ID_ESTADO_RECLAMO ,
		M.RECLAMO_FECHA , M.RECLAMO_SOLUCION , M.RECLAMO_FECHA_SOLUCION , M.RECLAMO_CALIFICACION , M.RECLAMO_DESCRIPCION
		FROM gd_esquema.Maestra M
		JOIN APP_DELIVERY.USUARIO U ON U.DNI = M.USUARIO_DNI AND U.MAIL = M.USUARIO_MAIL
		JOIN APP_DELIVERY.OPERADOR_RECLAMO OP ON OP.DNI = M.OPERADOR_RECLAMO_DNI AND OP.MAIL = M.OPERADOR_RECLAMO_MAIL
		JOIN APP_DELIVERY.TIPO_RECLAMO TR ON  TR.DESCRIPCION = M.RECLAMO_DESCRIPCION 
		JOIN APP_DELIVERY.ESTADO_RECLAMO ER ON ER.DESCRIPCION = M.RECLAMO_ESTADO
		JOIN APP_DELIVERY.PEDIDO P ON P.ID_PEDIDO = M.PEDIDO_NRO
		GROUP BY M.RECLAMO_NRO , P.ID_PEDIDO , U.ID_USUARIO , OP.ID_OPERADOR_RECLAMO , TR.ID_TIPO_RECLAMO , ER.ID_ESTADO_RECLAMO ,
		M.RECLAMO_FECHA , M.RECLAMO_SOLUCION , M.RECLAMO_FECHA_SOLUCION , M.RECLAMO_CALIFICACION , M.RECLAMO_DESCRIPCION
	END	
GO
CREATE PROCEDURE APP_DELIVERY.Migrar_cupon_reclamo AS 
	BEGIN 
		INSERT INTO APP_DELIVERY.CUPON_RECLAMO
		SELECT  row_number() over (order by (select NULL)) , C.ID_CUPON , R.ID_RECLAMO
		FROM gd_esquema.Maestra M
		JOIN APP_DELIVERY.CUPON C ON C.CUPON_NRO = M.CUPON_RECLAMO_NRO
		JOIN APP_DELIVERY.RECLAMO R ON R.ID_RECLAMO = M.RECLAMO_NRO
		GROUP BY  C.ID_CUPON , R.ID_RECLAMO
	END
GO
CREATE PROCEDURE APP_DELIVERY.Migrar_item_producto AS
	BEGIN 
		INSERT INTO APP_DELIVERY.ITEM_PRODUCTO
		SELECT  row_number() over (order by (select NULL)) , PL.ID_PRODUCTO_LOCAL , PE.ID_PEDIDO , M.PRODUCTO_CANTIDAD , M.PRODUCTO_LOCAL_PRECIO , M.PRODUCTO_CANTIDAD * M.PRODUCTO_LOCAL_PRECIO
		FROM gd_esquema.Maestra M 
		JOIN APP_DELIVERY.PRODUCTO P ON P.CODIGO =M.PRODUCTO_LOCAL_CODIGO 
		JOIN APP_DELIVERY.PRODUCTO_LOCAL PL ON PL.ID_PRODUCTO = P.ID_PRODUCTO
		JOIN APP_DELIVERY.LOCAL L ON L.ID_LOCAL = PL.ID_LOCAL
		JOIN APP_DELIVERY.PEDIDO PE ON PE.ID_PEDIDO = M.PEDIDO_NRO
		GROUP BY PL.ID_PRODUCTO_LOCAL , PE.ID_PEDIDO , M.PRODUCTO_CANTIDAD , M.PRODUCTO_LOCAL_PRECIO , M.PRODUCTO_CANTIDAD * M.PRODUCTO_LOCAL_PRECIO
	END


CREATE PROCEDURE APP_DELIVERY.Migrar_pedido AS 
	BEGIN 
		INSERT INTO APP_DELIVERY.PEDIDO
		SELECT  M.PEDIDO_NRO , E.ID_ENTREGA , EV.ID_ENVIO , U.ID_USUARIO , L.ID_LOCAL, MP.ID_MEDIO_PAGO , C.ID_CUPON , M.PEDIDO_OBSERV ,
		M.PEDIDO_FECHA , M.PEDIDO_TOTAL_SERVICIO , M.PEDIDO_TOTAL_CUPONES , M.PEDIDO_TOTAL_PRODUCTOS , M.PEDIDO_TARIFA_SERVICIO
		FROM gd_esquema.Maestra M
		JOIN APP_DELIVERY.ENTREGA E ON E.CALIFICACION = M.PEDIDO_CALIFICACION AND E.FECHA_ENTREGA = M.PEDIDO_FECHA_ENTREGA 
		AND E.TIEMPO_ESTIMADO = M.PEDIDO_TIEMPO_ESTIMADO_ENTREGA
		--JOIN APP_DELIVERY.ENVIO EV ON EV.
		JOIN APP_DELIVERY.USUARIO U ON U.DNI = M.USUARIO_DNI AND U.MAIL = M.USUARIO_MAIL
		JOIN APP_DELIVERY.LOCAL L ON L.NOMBRE = M.LOCAL_NOMBRE
		JOIN APP_DELIVERY.MEDIO_PAGO MP ON MP.NRO_TARJETA = M.MEDIO_PAGO_NRO_TARJETA
		JOIN APP_DELIVERY.CUPON C ON C.CUPON_NRO = M.CUPON_NRO
		GROUP BY M.PEDIDO_NRO , E.ID_ENTREGA , EV.ID_ENVIO , U.ID_USUARIO , L.ID_LOCAL, MP.ID_MEDIO_PAGO , C.ID_CUPON , M.PEDIDO_OBSERV ,
		M.PEDIDO_FECHA , M.PEDIDO_TOTAL_SERVICIO , M.PEDIDO_TOTAL_CUPONES , M.PEDIDO_TOTAL_PRODUCTOS , M.PEDIDO_TARIFA_SERVICIO
	END

	SELECT MEDIO_PAGO_NRO_TARJETA   FROM gd_esquema.Maestra GROUP BY MEDIO_PAGO_NRO_TARJETA 

CREATE PROCEDURE APP_DELIVERY.Migrar_entrega AS 
	BEGIN 
		INSERT INTO APP_DELIVERY.ENTREGA
		SELECT row_number() over (order by (select NULL)) , ENVIO_MENSAJERIA_FECHA_ENTREGA , ENVIO_MENSAJERIA_TIEMPO_ESTIMADO , ENVIO_MENSAJERIA_CALIFICACION
		FROM gd_esquema.Maestra
		GROUP BY ENVIO_MENSAJERIA_FECHA_ENTREGA , ENVIO_MENSAJERIA_TIEMPO_ESTIMADO , ENVIO_MENSAJERIA_CALIFICACION
		UNION
		SELECT row_number() over (order by (select NULL)) , PEDIDO_FECHA_ENTREGA , PEDIDO_TIEMPO_ESTIMADO_ENTREGA , PEDIDO_CALIFICACION
		FROM gd_esquema.Maestra
		GROUP BY PEDIDO_FECHA_ENTREGA , PEDIDO_TIEMPO_ESTIMADO_ENTREGA , PEDIDO_CALIFICACION
	END

SELECT CUPON_RECLAMO_NRO , CUPON_NRO , RECLAMO_NRO FROM gd_esquema.Maestra

--Executes

EXECUTE APP_DELIVERY.Migrar_usuario
EXECUTE APP_DELIVERY.Migrar_tipo_paquete
EXECUTE APP_DELIVERY.Migrar_paquete
EXECUTE APP_DELIVERY.Migrar_seguro
EXECUTE APP_DELIVERY.Migrar_estado_mensajeria
EXECUTE APP_DELIVERY.Migrar_estado_pedido
EXECUTE APP_DELIVERY.Migrar_estado_reclamo
EXECUTE APP_DELIVERY.Migrar_tipo_movilidad 
EXECUTE APP_DELIVERY.Migrar_tipo_medio_pago
EXECUTE APP_DELIVERY.Migrar_marca_tarjeta
EXECUTE APP_DELIVERY.Migrar_medio_pago
EXECUTE APP_DELIVERY.Migrar_producto
EXECUTE APP_DELIVERY.Migrar_dia
EXECUTE APP_DELIVERY.Migrar_tipo_reclamo
EXECUTE APP_DELIVERY.Migrar_tipo_cupon
EXECUTE APP_DELIVERY.Migrar_cupon
EXECUTE APP_DELIVERY.Migrar_operador_reclamo
EXECUTE APP_DELIVERY.Migrar_repartidor
EXECUTE APP_DELIVERY.Migrar_local
EXECUTE APP_DELIVERY.Migrar_producto_local
EXECUTE APP_DELIVERY.Migrar_local_horario
EXECUTE APP_DELIVERY.Migrar_reclamo
EXECUTE APP_DELIVERY.Migrar_cupon_reclamo

