## Exploración:

1. Se identificaron valores nulos en múltiples columnas de la tabla "listings.csv", lo que indica pérdida o ausencia de información relevante para ciertos registros.

2. Se observó que algunas variables clave relacionadas con precio presentan valores atípicos, incluyendo precios con valor 0, lo cual requiere validación y tratamiento posterior.

3. Las columnas de precio se encuentran almacenadas como texto, incluyendo símbolos monetarios ("$") y separadores de miles (","), lo que impide su uso directo en cálculos numéricos.

4. Existen columnas que contienen valores numéricos almacenados como cadenas de texto, por lo que será necesario redefinir los tipos de datos durante el proceso de limpieza.

5. Se identificaron columnas adicionales como "adjusted_price", "minimum_nights" y "maximum_nights" cuya utilidad analítica deberá evaluarse durante la fase de modelado.

6. El formato de fecha presente en los datos crudos corresponde a "dd/mm/yyyy", lo cual puede generar inconsistencias al ser importado en SQL, donde se utilizará el formato "yyyy-mm-dd".

7. Se identificaron que los id´s utilizados en las bases no siguen una secuencia incremental por lo que será importante tomar en cuenta que puede afectar las Primary Keys o Foreign Keys en caso de ser definidas.