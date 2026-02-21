### Retail Business Intelligence & Financial Simulation by Alain Zahid Tinoco Rodríguez

1. Descripción general

    - Este proyecto consiste en el desarrollo de un conjunto de dashboards de Business Intelligence orientados al análisis comercial, segmentación de ingresos y simulación financiera, utilizando un dataset transaccional público de retail.

    - El proyecto simula un flujo real de análisis de datos, desde datos crudos hasta visualización ejecutiva, utilizando SQL para el tratamiento de datos y Power BI para la exploración visual y generación de insights.

2. Objetivo del proyecto

    Desarrollar un análisis integral de desempeño comercial y rentabilidad a partir de datos transaccionales, con el fin de identificar patrones de ingresos, concentración por segmento y estructura financiera del negocio. El proyecto busca transformar datos en insights accionables que apoyen la toma de decisiones estratégicas bajo un enfoque de Business Intelligence.

2.1 Objetivos específicos

    - Analizar el desempeño comercial de la empresa.

    - Identificar concentración de ingresos mediante análisis Pareto.

    - Evaluar comportamiento demográfico.

    - Simular estructura de costos y rentabilidad.

    - Medir contribución porcentual por categoría.

3. Fuente de datos

    Los datos utilizados corresponden al dataset público de "Retail Sales Dataset" publicado en la página Kaggle con URL: "https://www.kaggle.com/datasets/mohammadtalib786/retail-sales-dataset" realizado por Mohammad Talib.

    - Dataset: Retail Sales Dataset (Kaggle)

    - Tipo: Transaccional

    - Nivel de granularidad: Transacción individual

    - Periodo analizado: 2023–2024

4. Enfoque analítico

    4.1 Extracción

        - Carga del dataset en MySQL.

        - Validación de tipos de datos.

        - Limpieza básica de inconsistencias.

    4.2 Transformación (SQL)

        Se desarrollaron consultas para:

        - Revenue total

        - Crecimiento mensual (MoM)

        - Ticket promedio

        - Pareto 80/20 por grupo etario

        - Validación de sumatorias

        - Análisis de volumen vs precio

        - Se utilizaron funciones agregadas y window functions para cálculos acumulados.

    4.3 Validaciones

        - Validación de ingresos totales contra SQL.

        - Verificación de acumulado Pareto = 100%.

        - Control de duplicados.

        - Validación de crecimiento mensual.

5. Limpieza y preparación de datos

    Dado que el dataset proviene de una fuente pública y ya se encontraba estructurado, se realizó una limpieza básica enfocada en asegurar consistencia y calidad mínima para análisis.

    - Validación de tipos de datos (fecha, numéricos, texto).

    - Revisión de valores nulos y consistencia en categorías.

    - Estandarización de nombres de columnas.

    - Verificación de duplicados.

    - Ajustes menores en Power Query para:

        Crear columnas derivadas necesarias para KPIs.

        Agrupar rangos etarios.

        Facilitar visualizaciones específicas (Pareto, segmentación).

    Nota: No fue necesario realizar procesos de limpieza complejos, ya que el dataset se encontraba relativamente ordenado. El enfoque del proyecto se centró en análisis y modelado, más que en depuración avanzada.

6. Dashboards desarrollados

    - Performance comercial

    Incluye:

            Ingresos totales

            Unidades vendidas

            Ticket promedio

            Crecimiento MoM

            Segmentación por género y categoría

        Insight principal:

        Los ingresos presentan volatilidad mensual, con concentración en segmentos demográficos económicamente activos.

    - Concentración demográfica

        Incluye:

            Pareto 80/20 por edad

            Precio promedio vs volumen

            Distribución de clientes por rango etario

        Insight principal:

        Los grupos 25–54 concentran ~80% del ingreso total, indicando alta dependencia del segmento adulto.

    - Simulación financiera

        Incluye:

            Ingresos totales

            Costos simulados

            Ganancias

            Margen %

            Contribution % por categoría

            Supuestos financieros

            Margen fijo del 40%.

            Costos estimados como 60% del ingreso.

            No se consideran costos operativos fijos adicionales.

        Insight principal:

        La rentabilidad está impulsada por volumen, con estructura de costos homogénea entre categorías.

7. KPIs definidos

    - Revenue

    - MoM Growth

    - Ticket Promedio

    - Profit (simulado)

    - Margin %

    - Contribution %

    Todas las métricas fueron implementadas mediante DAX en Power BI y validadas contra consultas SQL.

8. Insights clave

    A partir del análisis desarrollado en los tres dashboards, se identificaron los siguientes hallazgos estratégicos:

    - Los segmentos de edad entre 25 y 54 años concentran aproximadamente el 80% de los ingresos totales, evidenciando alta dependencia del segmento adulto económicamente activo.

    - Se observa volatilidad en el crecimiento mensual (MoM), con picos significativos seguidos de caídas abruptas, lo que sugiere posible estacionalidad o variabilidad en la demanda.

    - La estructura de costos simulada (60% del ingreso) muestra un margen estable del 40% en todas las categorías, lo que indica homogeneidad en la rentabilidad por línea de producto.

    - Electronics y Clothing lideran en contribución porcentual de ingresos (~34% cada una), mientras que Beauty representa una menor participación (~31%), aunque mantiene margen competitivo.

    - El portafolio muestra un equilibrio saludable sin dependencia extrema de una sola categoría.

9. Modelo de Datos

    El proyecto se desarrolló utilizando una tabla transaccional única, dada la estructura del dataset público. Para más información ir al apartado de "Data_model".

10. Estructura del repositorio

    proyecto_retail_sales_data
    ┣ data_raw        (datos originales, no versionados)
    ┣ data_model      (datos limpios/modelados)
    ┣ sql             (queries de exploración, limpieza y análisis)
    ┣ powerbi         (archivo PBIX, modelo y capturas del dashboard)
    ┣ docs            (objetivos, exploración, decisiones, validación y proceso)
    ┗ README.md

11. Conclusión

    Este proyecto busca demostrar capacidad de transformar datos transaccionales en insights ejecutivos mediante SQL y Power BI, integrando análisis comercial y simulación financiera bajo un enfoque estructurado de Business Intelligence.