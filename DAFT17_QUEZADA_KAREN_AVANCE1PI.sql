--1.Crear Base de Datos
CREATE DATABASE FastFood;

USE FastFood;


--4.Crear Tablas
CREATE TABLE Categorias (
id_categoria  INT IDENTITY (1,1) PRIMARY KEY,
nombre NVARCHAR (100) NOT NULL
);

CREATE TABLE Sucursales (
id_sucursal  INT IDENTITY (1,1) PRIMARY KEY,
nombre NVARCHAR (100) NOT NULL,
direccion NVARCHAR (255) NOT NULL
);

CREATE TABLE Clientes (
id_clientes  INT IDENTITY (1,1) PRIMARY KEY,
nombre NVARCHAR (100) NOT NULL,
direccion NVARCHAR (255) NOT NULL
);

CREATE TABLE TipoPago (
id_tipo_pago  INT IDENTITY (1,1) PRIMARY KEY,
descripcion NVARCHAR (100) NOT NULL
);

CREATE TABLE OrigenesOrden (
id_origenes  INT IDENTITY (1,1) PRIMARY KEY,
descripcion NVARCHAR (100) NOT NULL
);

CREATE TABLE Empleados (
id_empleado  INT IDENTITY (1,1) PRIMARY KEY,
nombre NVARCHAR (100) NOT NULL,
puesto NVARCHAR (100) NOT NULL,
departamento NVARCHAR (100) NOT NULL,
id_sucursal INT,
rol NVARCHAR (100) NOT NULL,
CONSTRAINT FK_Empleados_Sucursales FOREIGN KEY (id_sucursal) REFERENCES Sucursales (id_sucursal)
);

CREATE TABLE Mensajeros (
id_mensajero  INT IDENTITY (1,1) PRIMARY KEY,
nombre NVARCHAR (100) NOT NULL,
es_externo BIT
);

CREATE TABLE Productos (
id_productos  INT IDENTITY (1,1) PRIMARY KEY,
nombre NVARCHAR (100) NOT NULL,
id_categoria  INT NOT NULL ,
precio NUMERIC (6,2),
CONSTRAINT FK_Productos_Categorias FOREIGN KEY (id_categoria) REFERENCES Categorias (id_categoria)
);

CREATE TABLE Ordenes (
id_orden  INT IDENTITY (1,1) PRIMARY KEY,
id_clientes INT,
id_empleado INT, 
id_sucursal INT,
id_mensajero INT,
id_tipo_pago INT,
id_origenes INT,
horario_venta CHAR(6) NOT NULL,
total_compra NUMERIC (10,2),
kilometro_recorrer DECIMAL(10,2),
fecha_despacho DATETIME,
fecha_entrega DATETIME ,
fecha_orden_tomada DATE,
fecha_orden_lista DATETIME DEFAULT GETDATE (),
CONSTRAINT FK_Ordenes_Clientes FOREIGN KEY (id_clientes) REFERENCES Clientes (id_clientes),
CONSTRAINT FK_Ordenes_Empleados FOREIGN KEY (id_empleado) REFERENCES Empleados (id_empleado),
CONSTRAINT FK_Ordenes_Sucursales FOREIGN KEY (id_sucursal) REFERENCES Sucursales (id_sucursal),
CONSTRAINT FK_Ordenes_Mensajeros FOREIGN KEY (id_mensajero) REFERENCES Mensajeros (id_mensajero),
CONSTRAINT FK_Ordenes_TipoPago FOREIGN KEY (id_tipo_pago) REFERENCES TipoPago (id_tipo_pago),
CONSTRAINT FK_Ordenes_OrigenesOrden FOREIGN KEY (id_origenes) REFERENCES OrigenesOrden (id_origenes)
);

CREATE TABLE DetalleOrdenes (
id_orden INT,
id_productos INT,
cantidad INT,
precio NUMERIC (6,2),
CONSTRAINT PK_DetalleOrdenes PRIMARY KEY (id_orden),
CONSTRAINT FK_DetalleOrdenes_Ordenes FOREIGN KEY (id_orden) REFERENCES Ordenes (id_orden),
CONSTRAINT FK_DetalleOrdenes_Productos FOREIGN KEY (id_productos) REFERENCES Productos (id_productos)
);
