-- La tabla centra de la base de datos es "person" aunque también tenemos otras tablas que nos brindan información relevante. El mismo ejercico nos brinda las pistas necesarias para la exploración de los datos.

-- Para saber el número total de registros en la tabla person

    SELECT count(*) FROM person;

-- Para explorar todas las columnas de la tabla person pero limitando a la base en 10 registros. Nos sirve para saber cómo se compone la tabla

    SELECT * FROM person LIMIT 10;

-- Esta función nos permite saber que datos son distintos en la columna type de la tabla crime_scene_report

    SELECT DISTINCT type FROM crime_scene_report;

-- En el caso de que queramos indagar con una persona específica en la tabla, podemos utilizar:

    SELECT * FROM person WHERE name = 'Kinsey Erickson'

-- Si queremos indagar con filtros, es decir, para un tipo de crimen y una ciudad específicos utilizamos la siguiente función exploratoria:

    SELECT * FROM crime_scene_report 
    WHERE type = 'theft' 
    AND city = 'Chicago';

-- En el caso de que conozcamos al poca información de una ciudad, por ejemplo que queramos investigar en ciudades que sepamos que comienzan con "I" pero no sepamos lo demás, entonces utilizamos:

    SELECT DISTINCT city 
    FROM crime_scene_report 
    WHERE city LIKE 'I%';

-- Si de igual manera conocemos que el asesinato pudiera haber sido en una ciudad que comience por las letras "W, X, Y o Z", pero queramos indigar en todas ellas, entonces:

    SELECT DISTINCT city 
    FROM crime_scene_report 
    WHERE city BETWEEN 'W%' AND 'Z%';

-- En el caso que no tengamos una búsqueda exacta con respecto a las mayúsculas o minúsculas podemos utilizar las funciones de "UPPER" o "LOWER"

    SELECT DISTINCT city 
    FROM crime_scene_report 
    WHERE LOWER(city) ='sql city';

-- Si queremos saber el dato máximo o min de una columna podemos utilizar:

    SELECT max(age) FROM drivers_license;

-- Si queremos ordenar nuestros datos de forma ascendente y limitar nuestra búsqueda a 10 resultados.

    SELECT * FROM drivers_license ORDER BY age ASC LIMIT 10