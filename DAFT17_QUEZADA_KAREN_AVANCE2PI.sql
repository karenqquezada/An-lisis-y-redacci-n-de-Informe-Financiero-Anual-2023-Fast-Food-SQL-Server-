USE FastFood;

--1.Insertar datos en tablas

INSERT INTO Categorias (Nombre) 
VALUES
('Comida R�pida'), 
('Postres'), 
('Bebidas'), 
('Ensaladas'), 
('Desayunos'),
('Cafeter�a'), 
('Helados'), 
('Comida Vegana'), 
('Carnes'), 
('Pizzas');

Select * from Categorias

INSERT INTO Productos (Nombre, id_categoria, Precio) 
VALUES
('Hamburguesa Deluxe', 1, 9.99), 
('Cheeseburger', 1, 7.99), 
('Pizza Margarita', 10, 11.99), 
('Pizza Pepperoni', 10, 12.99), 
('Helado de Chocolate', 7, 2.99),
('Helado de Vainilla', 7, 2.99), 
('Ensalada C�sar', 4, 5.99), 
('Ensalada Griega', 4, 6.99), 
('Pastel de Zanahoria', 2, 3.99), 
('Brownie', 2, 2.99);

Select * from Productos;

INSERT INTO Sucursales (Nombre, Direccion) 
VALUES
('Sucursal Central', '1234 Main St'), 
('Sucursal Norte', '5678 North St'), 
('Sucursal Este', '9101 East St'), 
('Sucursal Oeste', '1121 West St'), 
('Sucursal Sur', '3141 South St'),
('Sucursal Playa', '1516 Beach St'), 
('Sucursal Monta�a', '1718 Mountain St'), 
('Sucursal Valle', '1920 Valley St'), 
('Sucursal Lago', '2122 Lake St'), 
('Sucursal Bosque', '2324 Forest St');

Select * from Sucursales;

INSERT INTO Empleados (Nombre, puesto, Departamento, id_sucursal, Rol) 
VALUES
('John Doe', 'Gerente', 'Administraci�n', 1, 'Vendedor'), 
('Jane Smith', 'Subgerente', 'Ventas', 1, 'Vendedor'), 
('Bill Jones', 'Cajero', 'Ventas', 1, 'Vendedor'), 
('Alice Johnson', 'Cocinero', 'Cocina', 1, 'Vendedor'), 
('Tom Brown', 'Barista', 'Cafeter�a', 1, 'Vendedor'),
('Emma Davis', 'Repartidor', 'Log�stica', 1, 'Mensajero'),
('Lucas Miller', 'Atenci�n al Cliente', 'Servicio', 1, 'Vendedor'), 
('Olivia Garc�a', 'Encargado de Turno', 'Administraci�n', 1, 'Vendedor'), 
('Ethan Martinez', 'Mesero', 'Restaurante', 1, 'Vendedor'), 
('Sophia Rodriguez', 'Auxiliar de Limpieza', 'Mantenimiento', 1, 'Vendedor');

Select * from Empleados;

INSERT INTO Clientes (Nombre, Direccion) 
VALUES
('Cliente Uno', '1000 A Street'), 
('Cliente Dos', '1001 B Street'), 
('Cliente Tres', '1002 C Street'), 
('Cliente Cuatro', '1003 D Street'),
('Cliente Cinco', '1004 E Street'),
('Cliente Seis', '1005 F Street'), 
('Cliente Siete', '1006 G Street'),
('Cliente Ocho', '1007 H Street'),
('Cliente Nueve', '1008 I Street'),
('Cliente Diez', '1009 J Street');

Select * from Clientes;

INSERT INTO OrigenesOrden (Descripcion) 
VALUES
('En l�nea'), 
('Presencial'),
('Tel�fono'),
('Drive Thru'),
('App M�vil'),
('Redes Sociales'),
('Correo Electr�nico'),
('Publicidad'),
('Recomendaci�n'),
('Evento');

Select * from OrigenesOrden;

INSERT INTO TipoPago (Descripcion) 
VALUES
('Efectivo'), 
('Tarjeta de Cr�dito'),
('Tarjeta de D�bito'), 
('PayPal'), 
('Transferencia Bancaria'),
('Criptomonedas'),
('Cheque'),
('Vale de Comida'),
('Cup�n de Descuento'), 
('Pago M�vil');

Select * from TipoPago;

INSERT INTO Mensajeros (Nombre, es_externo) 
VALUES
('Mensajero Uno', 0), 
('Mensajero Dos', 1), 
('Mensajero Tres', 0),
('Mensajero Cuatro', 1),
('Mensajero Cinco', 0),
('Mensajero Seis', 1),
('Mensajero Siete', 0), 
('Mensajero Ocho', 1),
('Mensajero Nueve', 0), 
('Mensajero Diez', 1);

Select * from Mensajeros;

INSERT INTO Ordenes (id_clientes, id_empleado, id_sucursal, id_mensajero, id_tipo_pago, id_origenes, horario_venta, total_compra, kilometro_recorrer, fecha_despacho, fecha_entrega, fecha_orden_tomada, fecha_orden_lista) 
VALUES
(1, 1, 1, 1, 1, 1, 'Ma�ana', 1053.51, 5.5, '2023-01-10 08:30:00', '2023-01-10 09:00:00', '2023-01-10 08:00:00', '2023-01-10 08:15:00'),
(2, 2, 2, 2, 2, 2, 'Tarde', 1075.00, 10.0, '2023-02-15 14:30:00', '2023-02-15 15:00:00', '2023-02-15 13:30:00', '2023-02-15 14:00:00'),
(3, 3, 3, 3, 3, 3, 'Noche', 920.00, 2.0, '2023-03-20 19:30:00', '2023-03-20 20:00:00', '2023-03-20 19:00:00', '2023-03-20 19:15:00'),
(4, 4, 4, 4, 4, 4, 'Ma�ana', 930.00, 0.5, '2023-04-25 09:30:00', '2023-04-25 10:00:00', '2023-04-25 09:00:00', '2023-04-25 09:15:00'),
(5, 5, 5, 5, 5, 5, 'Tarde', 955.00, 8.0, '2023-05-30 15:30:00', '2023-05-30 16:00:00', '2023-05-30 15:00:00', '2023-05-30 15:15:00'),
(6, 6, 6, 6, 6, 1, 'Noche', 945.00, 12.5, '2023-06-05 20:30:00', '2023-06-05 21:00:00', '2023-06-05 20:00:00', '2023-06-05 20:15:00'),
(7, 7, 7, 7, 7, 2, 'Ma�ana', 1065.00, 7.5, '2023-07-10 08:30:00', '2023-07-10 09:00:00', '2023-07-10 08:00:00', '2023-07-10 08:15:00'),
(8, 8, 8, 8, 8, 3, 'Tarde', 1085.00, 9.5, '2023-08-15 14:30:00', '2023-08-15 15:00:00', '2023-08-15 14:00:00', '2023-08-15 14:15:00'),
(9, 9, 9, 9, 9, 4, 'Noche', 1095.00, 3.0, '2023-09-20 19:30:00', '2023-09-20 20:00:00', '2023-09-20 19:00:00', '2023-09-20 19:15:00'),
(10, 10, 10, 10, 10, 5, 'Ma�ana', 900.00, 15.0, '2023-10-25 09:30:00', '2023-10-25 10:00:00', '2023-10-25 09:00:00', '2023-10-25 09:15:00');

Select * from Ordenes;


--CORRECCION DE CLAVE PRIMARIA DE TABLA DE DELLATEORDENES
ALTER TABLE DetalleOrdenes
DROP CONSTRAINT PK_DetalleOrdenes;

DROP TABLE DetalleOrdenes;

CREATE TABLE DetalleOrdenes (
id_orden INT NOT NULL,
id_productos INT NOT NULL,
cantidad INT,
precio NUMERIC (6,2),
CONSTRAINT PK_DetalleOrdenes PRIMARY KEY (id_orden,id_productos),
CONSTRAINT FK_DetalleOrdenes_Ordenes FOREIGN KEY (id_orden) REFERENCES Ordenes (id_orden),
CONSTRAINT FK_DetalleOrdenes_Productos FOREIGN KEY (id_productos) REFERENCES Productos (id_productos)
);

INSERT INTO DetalleOrdenes (id_orden, id_productos, Cantidad, Precio) 
VALUES
(1, 1, 3, 23.44),
(1, 2, 5, 45.14),
(1, 3, 4, 46.37),
(1, 4, 4, 42.34),
(1, 5, 1, 18.25),
(1, 6, 4, 20.08),
(1, 7, 2, 13.31),
(1, 8, 2, 20.96),
(1, 9, 4, 30.13),
(1, 10, 3, 38.34);

Select * from DetalleOrdenes;

--2.UTILIZA SENTENCIAS UPDATE Y DELETE

--ACTUALIZACION UPDATE:

-- Aumentar el precio de todos los productos en la categor�a 1
UPDATE Productos 
SET Precio = Precio + 1 
WHERE id_categoria  = 1;

SELECT id_categoria,precio
FROM Productos;

-- Cambiar la posici�n de todos los empleados del departamento 'Cocina' a 'Chef'
UPDATE Empleados 
SET puesto = 'Chef' 
WHERE Departamento = 'Cocina';

SELECT puesto,departamento
FROM Empleados;

-- Actualizar la direcci�n de una sucursal espec�fica
UPDATE Sucursales 
SET Direccion = '1234 New Address St'
WHERE id_sucursal = 1;

SELECT id_sucursal, direccion
FROM Sucursales;

--ELIMINACION DELETE:

--Eliminar la orden id_orden = 10
-- no existe la orden 10 en tabla DetalleOrdenes
DELETE FROM DetalleOrdenes 
WHERE id_orden = 10;

SELECT *
FROM DetalleOrdenes;


DELETE FROM Ordenes 
WHERE id_orden = 10;

SELECT *
FROM Ordenes;

--Eliminar categoria postre (no realice esta eliminacion ya que habia ordenes que consideraban productos con esta categoria)

--Eliminar empleados de la sucursal 10 (no tengo empleados considerados para esa sucursal)

--3.EJECUTA CONSULTAS BASICAS QUE RESPONDAN LAS SIGUIENTES PREGUNTAS:

--1.REGISTROS UNICOS: �Cu�l es la cantidad total de registros unicos en la tabla de ordenes? 
--(informacion localizada: INSIGHT VENTAS)
SELECT COUNT (id_orden) as 'totalorden'
FROM Ordenes;

--2.EMPLEADOS POR DEPARTAMENTO: �Cu�ntos empleados existen en cada departamento?
--(informacion localizada: INSIGHT EMPLEADO)
SELECT departamento,
COUNT (*) AS 'cantidad_empleados'
FROM Empleados
GROUP BY departamento;

--3.PRODUCTOS POR CATEGORIA: �Cu�ntos productos hay por codigo de categoria?
-- (informacion localizada: INSIGHT CARTA MENU)
SELECT id_categoria,
COUNT (*) AS 'prodcutos_categoria'
FROM Productos
GROUP BY id_categoria;

--4.IMPORTACION DE CLIENTES: �Cu�ntos clientes se han importado a la tabla de clientes?
--(informacion localizada: INSIGHT VENTAS)
SELECT COUNT (id_clientes) as 'totalclientes'
FROM Clientes;

/*5.ANALISIS DE DESEMPE�O DE SUCURSALES: �Cu�les son las sucursales con un promedio de facturacion/ingresos
superior a 1000.00 y que minimizan sus costos en base al promedio de kilometros recorridos de todas sus 
entregas gestionadas? para un mejor relevantamiento, ordene el listado por el promedio km recorridos. */
--((informacion localizada: INSIGHT SUCURSALES)
SELECT 
id_sucursal,
AVG (total_compra) AS 'promedio_ingresos',
AVG (kilometro_recorrer) AS 'promedio_kilometros'
FROM Ordenes
WHERE total_compra >= 1000.00
GROUP BY id_sucursal
HAVING AVG(kilometro_recorrer) < 100
ORDER BY 'promedio_kilometros' DESC;