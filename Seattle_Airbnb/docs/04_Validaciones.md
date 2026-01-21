## Validación del proceso de limpieza y modelado

1. Validación de integridad de registros
Se verificó que el número total de registros analizados después del proceso de limpieza no presentara una reducción significativa que comprometiera la representatividad del dataset. La eliminación de registros se limitó únicamente a casos atípicos claramente identificados, como precios iguales a 0.

2. Validación de métricas agregadas
Se compararon métricas agregadas clave, como el conteo de alojamientos y la suma de precios, antes y después del proceso de limpieza para asegurar que las transformaciones aplicadas no introdujeran sesgos artificiales en los resultados.

3. Validación de tipos de datos
Se confirmó que las columnas numéricas transformadas desde formato texto a formato decimal permitieran la ejecución correcta de cálculos aritméticos, agregaciones y comparaciones sin errores de tipo o inconsistencias.

4. Validación del formato de fechas
Se validó que la estandarización del formato de fechas permitiera realizar correctamente agrupaciones temporales, filtros por periodo y análisis de tendencias sin pérdida de registros.

5. Validación de relaciones entre tablas
Se comprobó que las relaciones entre las tablas del modelo analítico (listings, calendar y reviews) se mantuvieran consistentes después del proceso de limpieza, evitando duplicidades o referencias inválidas en las claves utilizadas.

6. Validación de coherencia analítica
Se realizó una revisión manual de métricas clave como precio promedio y distribución por vecindario para confirmar que los resultados obtenidos fueran coherentes con el comportamiento esperado del mercado de alojamientos en Seattle.