### Análisis de Alojamientos Airbnb – Seattle by Alain Zahid Tinoco Rodríguez

1. Descripción general

   - Este proyecto analiza los datos de alojamientos Airbnb en Seattle con el objetivo de identificar patrones de oferta, precios y disponibilidad que apoyen la toma de decisiones tanto para usuarios que buscan hospedaje como para anfitriones que ofrecen sus propiedades.

   - El proyecto simula un flujo real de análisis de datos, desde datos crudos hasta visualización ejecutiva, utilizando SQL para el tratamiento de datos y Power BI para la exploración visual y generación de insights.

2. Objetivo del proyecto

    Analizar los datos de alojamientos Airbnb en Seattle para identificar patrones relevantes de oferta, precios y disponibilidad que permitan entender mejor el comportamiento del mercado de hospedaje en la ciudad.

2.1  Objetivos específicos

    - Analizar la distribución de la oferta por tipo de alojamiento y vecindario.

    - Evaluar el comportamiento de precios según ubicación y tipo de alojamiento.

    - Identificar la concentración de la oferta en hosts con múltiples propiedades.

    - Analizar patrones de disponibilidad y su relación con el precio.

3. Fuente de datos

    Los datos utilizados corresponden al dataset público de "Seattle Airbnb Open Data - SQL Project" publicado en la página Kaggle con URL: "https://www.kaggle.com/datasets/swsw1717/seatle-airbnb-open-data-sql-project" y que a su vez son un agregado de "inside airbnb" con URL: "https://insideairbnb.com/get-the-data/" que publican información opensource de algunos alojamientos en ciudades de Estados Unidos. El dataset incluye información de:

    - Alojamientos (listings)

    - Disponibilidad y precios por fecha (calendar)

    - Reseñas de usuarios (reviews)

    Los datos se trabajaron inicialmente en formato crudo (CSV) y posteriormente fueron limpiados y modelados en SQL.

4. Enfoque analítico

    - El desarrollo del proyecto siguió un enfoque estructurado:

    - Exploración inicial de los datos para identificar problemas de calidad.

    - Documentación de hallazgos y definición de criterios de limpieza.

    - Limpieza, normalización y modelado de datos en SQL.

    - Validación de integridad, coherencia y métricas clave.

    - Construcción de dashboards en Power BI orientados a análisis y toma de decisiones.

    Los detalles técnicos del proceso se encuentran documentados en la carpeta docs/.

5. Limpieza y modelado (resumen)

    - Normalización de columnas de precio (eliminación de símbolos monetarios y conversión a formato numérico).

    - Tratamiento de valores nulos y atípicos (precios iguales a 0).

    - Estandarización de formatos de fecha para compatibilidad con SQL.

    - Evaluación y exclusión de columnas con bajo valor analítico para los objetivos definidos.

    - Modelado de datos orientado a análisis y visualización.

6. Visualización y métricas

    Los dashboards desarrollados en Power BI incluye métricas como:

    - Precio promedio por vecindario y tipo de alojamiento

    - Distribución de alojamientos por tipo

    - Concentración de alojamientos por host

    - Disponibilidad de alojamientos por periodo

    Las visualizaciones están diseñadas para facilitar la exploración y comparación de patrones relevantes del mercado.

7. Insights clave

    - Existe una concentración significativa de alojamientos en un grupo reducido de hosts con múltiples propiedades.

    - El precio promedio varía considerablemente entre vecindarios y tipos de alojamiento.

    - Algunos vecindarios combinan alta disponibilidad con precios elevados, lo que sugiere una mayor demanda.

    - La oferta de alojamientos se concentra principalmente en ciertos tipos de propiedad.

8. Herramientas utilizadas

    - Excel: Previsualización de datos crudos y preanálisis.

    - SQL: limpieza, transformación, modelado y análisis de datos.

    - Power BI: modelado semántico, medidas y visualización.

    - GitHub: control de versiones y documentación del proyecto.

9. Estructura del repositorio

    proyecto_airbnb_seattle
    ┣ data_raw        (datos originales, no versionados)
    ┣ data_model      (datos limpios/modelados)
    ┣ sql             (queries de exploración, limpieza y análisis)
    ┣ powerbi         (archivo PBIX, modelo y capturas del dashboard)
    ┣ docs            (objetivos, exploración, decisiones, validación y proceso)
    ┗ README.md

10. Conclusión

    Este proyecto demuestra un flujo completo de análisis de datos, desde la comprensión y tratamiento de datos crudos hasta la generación de insights accionables, priorizando la calidad, coherencia y claridad analítica en cada etapa del proceso.

11. Nota final

    Los archivos dentro de la carpeta docs/ documentan de forma detallada el razonamiento detrás de cada decisión técnica y analítica.