use FastFood;

-- 1.Aplica funciones de agregacion  2. Utiliza GROUP BY y otras cláusulas

--RESOLUCION DE PREGUNTAS:

--1.TOTAL DE VENTAS GLOBALES ¿Cuál es el total de ventas (total_compra) a nivel global?
--(Informacion localizada: INSIGHT VENTAS)
SELECT SUM (total_compra) AS 'Total_ventas'
FROM ORDENES;

--2.PROMEDIO DE PRECIOS DE PRODUCTOS POR CATEGORIA 
--¿Cuál es el precio promedio de los productos dentro de cada categoria?
-- (Informacion localizada: INSIGHT CARTA MENÚ)
SELECT 
nombre,
id_categoria,
AVG (precio) AS 'precio_promedio'
FROM Productos
GROUP BY nombre, id_categoria;

--respuesta
SELECT id_categoria,
AVG (precio) AS precio_promedio
FROM Productos
GROUP BY id_categoria;

--3.ORDEN MÍNIMA Y MAXIMA POR SUCURSAL ¿Cuál es el valor de la orden mínima y máxima por cada sucursal?
--(Informacion localizada: INSIGHT SUCURSAL)
SELECT id_sucursal,
MIN (total_compra) AS min_compra,
MAX (total_compra) AS max_compra
FROM Ordenes
GROUP BY id_sucursal;

--valor minimo
SELECT top 1 
id_sucursal,
MIN (total_compra) AS min_compra,
MAX (total_compra) AS max_compra
FROM Ordenes
GROUP BY id_sucursal
ORDER BY MIN(total_compra);

--valor maximo
SELECT top 1 
id_sucursal,
MIN (total_compra) AS min_compra,
MAX (total_compra) AS max_compra
FROM Ordenes
GROUP BY id_sucursal
ORDER BY MAX(total_compra)DESC;

--4.MAYOR NUMERO DE KILOMETROS RECORRIDOS PARA ENTREGA
--¿Cuál es el mayor número de kilometros recorridos para una entrega?
--(Informacion localizada: INSIGHT SUCURSAL)
SELECT 
MAX (kilometro_recorrer) AS max_kilometros
FROM Ordenes;

--5.PROMEDIO DE CANTIDAD DE PRODUCTOS POR ORDEN
--¿Cuál es la cantidad promedio de productos por orden?
-- (Informacion localizada: INSIGHT CARTA MENÚ)
SELECT 
AVG (cantidad) AS cantidad_promedio
FROM DetalleOrdenes;

--6.TOTAL DE VENTAS POR TIPO DE PAGO
--¿Cómo se distribuye la facturacion total del negocio de acuerdo a los método de pago?
--(Informacion localizada: INSIGHT VENTAS)
SElECT id_tipo_pago,
SUM (total_compra) AS total_tipopago
FROM Ordenes
GROUP BY id_tipo_pago;

--7.SUCURSAL CON LA VENTA PROMEDIO MAS ALTA ¿Cuál sucursal tiene el ingreso promedio mas alto?
-- (Informacion localizada: INSIGHT SUCURSALES)
SELECT TOP 1
id_sucursal,
AVG (total_compra) AS promedio_max_compra
FROM Ordenes
GROUP BY id_sucursal
ORDER BY promedio_max_compra DESC;

--8.SUCURSAL CON LA MAYOR CANTIDAD DE VENTAS POR ENCIMA DE UN UMBRAL
--¿Cuáles son las sucursales que han generado ventas totales por encima de $1000?
--(Informacion localizada: INSIGHT SUCURSALES)
SELECT id_sucursal,
SUM (total_compra) AS ventas_totales
FROM Ordenes
GROUP BY id_sucursal
HAVING SUM(total_compra) >= 1000.00;

--9.COMPARACION DE VENTAS PROMEDIO ANTES Y DESPUES DE UNA FECHA ESPECIFICA
--¿Cómo se compran las ventas promedio antes y despues del 1 de julio de 2023?
--(Informacion localizada: INSIGHT VENTAS)
SELECT 'antes del 1 de julio' AS periodo, 
AVG (total_compra) AS promedio_ventas
FROM Ordenes
WHERE fecha_orden_tomada < '2023-07-01';

SELECT 'despues del 1 de julio' AS periodo, 
AVG (total_compra) AS promedio_ventas
FROM Ordenes
WHERE fecha_orden_tomada > '2023-07-01';

--se busco una funcion que uniera las dos y se encontro "UNION ALL"
SELECT 'antes del 1 de julio' AS periodo, 
AVG (total_compra) AS promedio_ventas
FROM Ordenes
WHERE fecha_orden_tomada < '2023-07-01'

UNION ALL

SELECT 'despues del 1 de julio' AS periodo, 
AVG (total_compra) AS promedio_ventas
FROM Ordenes
WHERE fecha_orden_tomada > '2023-07-01';

/*10.ANALISIS DE ACTIVIDAD DE VENTAS POR HORARIO
¿Durante qué horario del día (mañana, tarde, noche) se registra la mayor cantidad de ventas, 
cuál es el ingreso promedio de estas ventas, y 
cuál ha sido el importe máximo alcanzado por una orden en dicha jornada?*/
--(Informacion localizada: INSIGHT VENTAS)

SELECT horario_venta,
SUM (total_compra) AS total_ventas,
AVG (total_compra) AS promedio_ventas,
MAX (total_compra) AS max_ventas
FROM Ordenes
GROUP BY horario_venta
ORDER BY total_ventas DESC;