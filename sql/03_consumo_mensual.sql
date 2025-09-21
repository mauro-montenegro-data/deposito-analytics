WITH sal AS (
  SELECT TRIM("ID_PRODUCTO") AS id,
         DATE_TRUNC('month',"FECHA")::date AS mes,
         SUM(CAST("CANTIDAD" AS numeric)) AS consumo
  FROM public."SALIDAS"
  GROUP BY 1,2
)
SELECT s.mes, s.id AS id_producto, p."NOMBRE_PRODUCTO", s.consumo
FROM sal s
LEFT JOIN public."PRODUCTOS" p ON TRIM(p."ID_PRODUCTO")=s.id
ORDER BY s.mes DESC, s.consumo DESC;
