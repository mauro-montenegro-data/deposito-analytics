WITH ent AS (
  SELECT TRIM("ID_PRODUCTO") id, SUM(CAST("CANTIDAD" AS numeric)) q_ent
  FROM public."ENTRADAS"
  GROUP BY TRIM("ID_PRODUCTO")
),
sal AS (
  SELECT TRIM("ID_PRODUCTO") id, SUM(CAST("CANTIDAD" AS numeric)) q_sal
  FROM public."SALIDAS"
  GROUP BY TRIM("ID_PRODUCTO")
),
mov AS (
  SELECT COALESCE(e.id,s.id) AS id_producto,
         COALESCE(e.q_ent,0)  AS total_entradas,
         COALESCE(s.q_sal,0)  AS total_salidas
  FROM ent e
  FULL OUTER JOIN sal s ON s.id=e.id
)
SELECT
  m.id_producto,
  p."NOMBRE_PRODUCTO",
  m.total_entradas,
  m.total_salidas,
  (m.total_entradas - m.total_salidas) AS stock_actual
FROM mov m
LEFT JOIN public."PRODUCTOS" p
       ON TRIM(p."ID_PRODUCTO") = m.id_producto
ORDER BY stock_actual DESC;
