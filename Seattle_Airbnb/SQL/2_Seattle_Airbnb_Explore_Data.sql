/*Exploración de los datos (EDA técnico)*/

    --Verificar que la información de las tablas sean visualizadas para las 50 primeras filas

    SELECT * FROM calendar LIMIT 10;
    SELECT * FROM listings LIMIT 10;
    SELECT * FROM reviews LIMIT 10;

    --Utilizamos la función count para contar todas las filas de cada tabla

    SELECT COUNT(*) AS total_listings FROM listings;
    SELECT COUNT(*) AS total_reviews FROM reviews;
    SELECT COUNT(*) AS total_calendar FROM calendar;

    --Identificar los valores duplicados de la columna "id" de la tabla listings, para saber si todos son valores únicos

    SELECT id, COUNT(*) FROM listings GROUP BY id HAVING COUNT(*) > 1;

    -- Identificar los valores "0" de la columna "price" en la tabla listings

    SELECT * FROM listings WHERE price = 0;