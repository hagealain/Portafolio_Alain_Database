## Decisiones de limpieza y modelado de datos

    1. Tratamiento de valores nulos
    Se decidió conservar los registros que presentan valores nulos en columnas no críticas para el análisis, con el fin de no reducir innecesariamente el tamaño del dataset. En el caso de variables clave relacionadas con precio y disponibilidad, se evaluó su completitud utilizando información de tablas complementarias cuando fue posible.

    2. Manejo de precios con valor 0
    Los registros con precios iguales a 0 fueron considerados atípicos, ya que no representan escenarios reales de mercado. Estos casos fueron buscados y reemplazados con los datos pertinentes de las tablas complementarias (calendar, reviews), ya que en ellas se encontraban los datos faltantes o pérdidos de la data de "listings" con el fin evitar distorsiones en métricas como precio promedio y distribución de valores.

    3. Normalización de columnas de precio
    Las columnas relacionadas con precio fueron transformadas desde formato texto a un tipo numérico decimal, eliminando símbolos monetarios y separadores de miles. Esta decisión permitió realizar cálculos precisos sin pérdida de información en los valores originales.

    4. Redefinición de tipos de datos
    Se redefinieron los tipos de datos de múltiples columnas que contenían valores numéricos almacenados como texto, con el objetivo de garantizar consistencia, integridad y eficiencia en los cálculos realizados en SQL.

    5. Evaluación de columnas con bajo valor analítico
    Las columnas "adjusted_price", "minimum_nights" y "maximum_nights" fueron evaluadas en función de su relevancia para los objetivos del proyecto. Al no aportar información directa a las métricas definidas, se decidió excluirlas del modelo analítico final para simplificar la estructura de datos y mejorar la legibilidad del análisis.

    6. Estandarización del formato de fechas
    Se estandarizó el formato de fechas al estándar "yyyy-mm-dd" para asegurar compatibilidad con SQL y evitar inconsistencias en operaciones temporales y agregaciones por periodo. SQL realizó el cambio de manera automática cuando se cargaron los datos en él.

    7. Se definieron las Primary keys y Foreign keys para las columnas correspondientes aún cuando los ids no presentaban un orden incremental, se tomó esta decisión ya que aún cuando los ids no eran incrementales, sí estaban ligados con sus respectivos ids de las tablas "reviews" y "calendar".