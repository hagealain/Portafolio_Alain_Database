## Objetivo y contexto:
   
Objetivo: 
    
    Identificar al responsable de un crimen ficticio utilizando consultas SQL sobre una base de datos relacional.

Contexto:

    - Este ejercicio se basa en The SQL Murder Mystery, un reto público de SQL diseñado para practicar la resolución de problemas a partir de la exploración de datos.

    - El enfoque principal no es únicamente llegar a la respuesta final, sino documentar el proceso de razonamiento: comprender el modelo de datos, formular hipótesis iniciales y reducir progresivamente el conjunto de posibles resultados mediante filtros y joins  entre tablas.

    - Este ejercicio busca demostrar habilidades prácticas en SQL y pensamiento analítico en un escenario abierto y poco estructurado, similar a situaciones reales en el análisis de datos.

## Exploración e hipótesis

- La exploración inicial se centró en identificar las tablas relacionadas con el evento del crimen y las personas involucradas. El primer paso fue revisar los reportes del crimen para obtener información básica como ubicación, fecha y descripciones relevantes que pudieran servir como punto de partida.

- A partir de esta información, se identificaron tablas relacionadas con personas y direcciones como candidatas clave para continuar la investigación. El análisis exploratorio permitió reconocer qué campos podían funcionar como filtros iniciales y cuáles no aportaban valor en esta etapa.

- Con base en los datos disponibles, se plantearon hipótesis preliminares sobre posibles testigos y sospechosos, con la intención de validarlas o descartarlas progresivamente mediante consultas más específicas en las siguientes etapas.

## Investigación y decisiones

- A partir de las hipótesis iniciales, la investigación se enfocó en relacionar la información del crimen con los registros de personas mediante joins entre tablas. Las decisiones de cruce se basaron en campos que permitían conectar ubicación, fechas, placas y características relevantes de los individuos involucrados.

- Conforme avanzaba el análisis, se aplicaron filtros más específicos para reducir el número de posibles casos, validando en cada paso que los resultados fueran coherentes con la información disponible. Algunas rutas de análisis (principalmente las que sugiere el ejercicio para aprendizaje) fueron descartadas al no aportar señales claras o al generar resultados demasiado amplios.

- Este proceso dinámico permitió refinar las hipótesis iniciales y enfocar la investigación únicamente en los registros que cumplían con todos los criterios definidos.

## Conclusión y aprendizajes

Mediante la aplicación progresiva de filtros y la validación de hipótesis, la investigación permitió llegar a una conclusión consistente a partir de los datos disponibles. El énfasis del ejercicio estuvo en el proceso analítico y no únicamente en el resultado final.

Como principales aprendizajes de este ejercicio se destacan:

    1. La importancia de comprender el modelo de datos antes de realizar uniones complejas.

    2. El uso de filtros bien definidos para reducir gradualmente el volumen de información.

    3. La necesidad de validar cada hipótesis con evidencia en los datos.

    4. El valor de documentar decisiones y descartar caminos que no aportan información relevante.