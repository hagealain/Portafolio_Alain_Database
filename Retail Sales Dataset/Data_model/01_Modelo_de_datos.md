## Modelo de Datos

El proyecto se desarrolló utilizando una tabla transaccional única, dada la estructura del dataset público.

Justificación

    El objetivo del proyecto es demostrar capacidad analítica y de modelado financiero, no replicar un entorno productivo empresarial.

En un entorno real se recomienda implementar un modelo estrella:

    Fact_Sales (tabla de hechos)

    Dim_Date

    Dim_Product

    Dim_Customer

Ventajas del modelo estrella:

    Mejor performance

    Escalabilidad

    Separación lógica entre hechos y dimensiones

    Facilita análisis avanzados (Time Intelligence, segmentación compleja)

    La migración a modelo estrella sería el siguiente paso natural para escalar el proyecto a un entorno productivo.