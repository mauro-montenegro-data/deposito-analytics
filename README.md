# Depósito Analytics (SQL + Python + Power BI + ML)

Proyecto de portafolio con datos reales del depósito (anonimizados/agrupados).
Fase actual: **SQL** (consultas de stock y consumo) + primeros exportes para BI.

## Estructura
- `sql/` consultas reproducibles (solo lectura)
- `data_exports/` CSV exportados desde pgAdmin para BI/Python
- `notebooks/` ETL y ML (próximo paso)
- `bi/` archivo PBIX o capturas
- `docs/` capturas y notas

## Cómo reproducir (SQL)
1. Ejecutar `sql/02_stock_actual.sql` en pgAdmin y exportar a `data_exports/stock_actual.csv`.
2. Ejecutar `sql/03_consumo_mensual.sql` y exportar a `data_exports/consumo_mensual.csv`.

## Próximos pasos
- ETL en Python → `data_clean/*.parquet`
- Dashboard Power BI (1 página, 5 visuales)
- ML baseline (regresión con lags por SKU)
# deposito-analytics
