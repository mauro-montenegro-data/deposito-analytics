-- Tablas
SELECT table_name
FROM information_schema.tables
WHERE table_schema='public' AND table_type='BASE TABLE'
ORDER BY 1;

-- Columnas clave
SELECT table_name, column_name, data_type
FROM information_schema.columns
WHERE table_schema='public'
  AND table_name IN ('PRODUCTOS','INFORMACION','ENTRADAS','SALIDAS')
ORDER BY table_name, ordinal_position;

-- Conteos y rangos
SELECT 'PRODUCTOS' t, COUNT(*) FROM public."PRODUCTOS"
UNION ALL SELECT 'ENTRADAS', COUNT(*) FROM public."ENTRADAS"
UNION ALL SELECT 'SALIDAS', COUNT(*) FROM public."SALIDAS";

SELECT 'ENTRADAS' t, MIN(TO_DATE("FECHA",'YYYY-MM-DD')), MAX(TO_DATE("FECHA",'YYYY-MM-DD')) FROM public."ENTRADAS"
UNION ALL
SELECT 'SALIDAS', MIN("FECHA"), MAX("FECHA") FROM public."SALIDAS";
