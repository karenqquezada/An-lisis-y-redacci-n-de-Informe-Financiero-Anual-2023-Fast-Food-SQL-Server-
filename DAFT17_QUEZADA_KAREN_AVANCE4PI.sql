use FastFood;

--CONSULTAS CON MULTIPLES TABLAS Y JOINS

--1.LISTAR TODOS LOS PRODUCTOS Y SUS CATEGORIAS
--¿Cómo puedo obtener una lista de todos los productos junto con sus categorías?
--(Informacion localizada: INSIGHT CARTA MENU)
SELECT 
	p.id_productos,
	p.nombre AS nombre_producto,
	c.nombre AS nombre_categoria
FROM productos p
LEFT JOIN 
	Categorias c ON p.id_categoria = c.id_categoria;

--2.OBTENER EMPLEADOS Y SU SUCURSAL ASIGNADA
--¿Cómo puedo saber a qué sucursal está asignado cada empleado?
--(Informacion localizada: INSIGHT EMPLEADOS)
SELECT 
	s.id_sucursal,
	s.nombre AS nombre_sucursal,
	e.nombre AS nombre_empleado
FROM Sucursales s
LEFT JOIN 
	Empleados e ON s.id_sucursal = e.id_sucursal;

--3.IDENTIFICAR PRODUCTOS SIN CATEGORIA ASIGNADA
--¿Existen productos que no tiene una categoria asignada? r=no existen productos sin categoria
--(No figurar en el informe)
SELECT 
	p.id_productos,
	p.nombre AS nombre_producto
FROM productos p
LEFT JOIN 
	Categorias c ON p.id_categoria = c.id_categoria
WHERE 
	p.id_categoria IS NULL;

--4.DETALLE COMPLETO DE ÓRDENES
/*¿Cómo puedo obtener un detalle completo de las órdenes, incluyendo el Nombre del cliente, Nombre del empleado que tomo la
orden, y Nombre del mensajero que la entrego?*/
--(No figurara en el informe)
SELECT 
	o.*,
	c.nombre AS nombre_cliente,
	e.nombre AS nombre_empleado,
	m.nombre AS nombre_mensajero
FROM Ordenes o
LEFT JOIN 
	Clientes c ON o.id_clientes = c.id_clientes
LEFT JOIN
	Empleados e ON o.id_empleado = e.id_empleado
LEFT JOIN
	Mensajeros m ON o.id_mensajero = m.id_mensajero;

--Mismo código mejor presentacion:
SELECT 
	c.nombre AS nombre_cliente,
	e.nombre AS nombre_empleado,
	m.nombre AS nombre_mensajero,
	o.*
FROM Ordenes o
LEFT JOIN 
	Clientes c ON o.id_clientes = c.id_clientes
LEFT JOIN
	Empleados e ON o.id_empleado = e.id_empleado
LEFT JOIN
	Mensajeros m ON o.id_mensajero = m.id_mensajero;

--5.PRODUCTOS VENDIDOS POR SUCURSAL
--¿Cuántos artículos correspondientes a cada Categoría de Productos se han vendido en cada sucursal?
--(Informacion localizada: INSIGHT SUCURSALES)
SELECT 
	do.id_productos,
	do.cantidad AS productos_vendidos,
	p.nombre AS nombre_producto,
	c.nombre AS nombre_categoria,
	s.nombre AS nombre_sucursal,
	o.id_sucursal
FROM DetalleOrdenes do
LEFT JOIN 
	Productos p ON do.id_productos = p.id_productos
LEFT JOIN
	Categorias c ON p.id_categoria = c.id_categoria
LEFT JOIN
	Ordenes O ON do.id_orden = o.id_orden
LEFT JOIN
	Sucursales s ON o.id_sucursal = s.id_sucursal
ORDER BY id_sucursal;

SELECT 
    do.id_productos,
    SUM(do.cantidad) AS productos_vendidos,
    p.nombre AS nombre_producto,
    c.nombre AS nombre_categoria,
    s.nombre AS nombre_sucursal,
    o.id_sucursal
FROM 
    DetalleOrdenes do
LEFT JOIN Productos p ON do.id_productos = p.id_productos
LEFT JOIN Categorias c ON p.id_categoria = c.id_categoria
LEFT JOIN Ordenes o ON do.id_orden = o.id_orden
LEFT JOIN Sucursales s ON o.id_sucursal = s.id_sucursal
GROUP BY 
    do.id_productos,
    p.nombre,
    c.nombre,
    s.nombre,
    o.id_sucursal
ORDER BY 
    o.id_sucursal;


