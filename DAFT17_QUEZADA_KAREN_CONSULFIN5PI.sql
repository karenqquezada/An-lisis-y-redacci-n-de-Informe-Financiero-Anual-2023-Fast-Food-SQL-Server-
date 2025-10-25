USE FASTFOOD;

--1.EFICIENCIA DE LOS EMPLEADOS
/*¿Cuál es el tiempo promedio desde el despacho hasta la entrega de los pedidos gestionados por todo el equipo 
de mensajeria?*/
--(Informacion localizada: INSIGHT EMPLEADOS, SUCURSALES)

SELECT
	AVG (DATEDIFF(MINUTE, fecha_despacho, fecha_entrega)) AS tiempo_promedio_minutos
FROM Ordenes;

--2.ANALISIS DE VENTAS POR ORIGEN DE ORDEN
--¿Qué canal de ventas genera más ingresos?
--(Informacion localizada: INSIGHT VENTAS)

SELECT
	o.id_origenes,
	MAX (o.total_compra) AS venta_maxima,
	ori.descripcion AS nombre_origen_venta
FROM Ordenes o
JOIN
	OrigenesOrden ori ON o.id_origenes = ori.id_origenes
GROUP BY
	o.id_origenes,ori.descripcion
ORDER BY
	venta_maxima DESC;

--lIMITANDO LA CONSULTA A LA MEJOR VENTA DEL ORIGEN
SELECT TOP 1
	o.id_origenes,
	MAX (o.total_compra) AS venta_maxima,
	ori.descripcion AS nombre_origen_venta
FROM Ordenes o
JOIN
	OrigenesOrden ori ON o.id_origenes = ori.id_origenes
GROUP BY
	o.id_origenes,ori.descripcion
ORDER BY
	venta_maxima DESC;

--3.PRODUCTIVIDAD DE LOS EMPLEADOS
--¿Cuál es el nivel de ingresos generdo por Empleado?
--(Informacion localizada: INSIGHT EMPLEADOS)

SELECT
	o.id_empleado,
	MAX (o.total_compra) AS venta_maxima,
	e.nombre AS nombre_empleado
FROM Ordenes o
JOIN
	Empleados e ON o.id_empleado = e.id_empleado
GROUP BY
	o.id_empleado,e.nombre
ORDER BY
	venta_maxima DESC;

--4.ANALISIS DE DEMANDA POR HORARIO Y DIA
--¿Cómo varia la demanda de productos a los largo del día?
/*NOTA: Esta consulta no puede ser implementada sin una definición clara del horario (mañana, tarde, noche)
en la base de datos existente. Asumiremos que HorarioVenta refleja esta información correctamente.*/
--(Informacion localizada: INSIGHT VENTAS)
--para este analisis consideraremos el mismo codigo del avance 3, de la pregunta 10.
SELECT 
	horario_venta,
	SUM (total_compra) AS total_venta,
	AVG (total_compra) AS promedio_ventas,
	MAX (total_compra) AS max_ventas
FROM Ordenes
GROUP BY 
	horario_venta
ORDER BY
	total_venta DESC;

--5.COMPARACION DE VENTAS MENSUALES
--¿Cuál es la tendencia de los ingresos generados en cada periodo mensual?
--(Informacion localizada: INSIGHT VENTAS)

SELECT
	YEAR (fecha_orden_tomada) AS anio,
	MONTH (fecha_orden_tomada) AS mes,
	SUM (total_compra) AS ventas_mensual
FROM 
	Ordenes
GROUP BY
	YEAR (fecha_orden_tomada), MONTH (fecha_orden_tomada)
ORDER BY
	ventas_mensual DESC;

--ordenado por mes
SELECT
	YEAR (fecha_orden_tomada) AS anio,
	MONTH (fecha_orden_tomada) AS mes,
	SUM (total_compra) AS ventas_mensual
FROM 
	Ordenes
GROUP BY
	YEAR (fecha_orden_tomada), MONTH (fecha_orden_tomada)
ORDER BY
	YEAR (fecha_orden_tomada), MONTH (fecha_orden_tomada) DESC;