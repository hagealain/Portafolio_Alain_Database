-- Crear una base de datos

    create database sea_abnb

-- Seleccionar el esquema que se utilizará

    use sea_abnb

-- Crear tablas con sus debidos atributos, definir las PK y FK
 --   Tabla 1: Listings

    CREATE TABLE IF NOT EXISTS listings (
        id INT PRIMARY KEY,
        name VARCHAR(150),
        host_id INT,
        host_name VARCHAR(150),
        neighborhood_group VARCHAR(150),
        neighborhood VARCHAR(150),
        latitude FLOAT,
        longitude FLOAT,
        room_type VARCHAR(150),
        price FLOAT,
        minimum_nights INT,
        number_of_reviews INT,
        last_review DATE,
        reviews_per_month FLOAT,
        calculated_host_listings_count INT,
        availability_365 INT
        number_of_reviews_ltm int,
        license varchar(150) DEFAULT "no license"
        );

    -- Insertamos una prueba en la tabla para verificar que nuestros datos se ingresan correctamente, de esta manera nos percatamos que en nuestra base de datos "CSV" el formato de la fecha está dado en la forma DD/MM/YYYY y SQL lo requiere en la forma YYYY-MM-DD, por lo que es necesario realizar una modificación a la base.

    Insert into listings 
        (id, name, host_id, host_name, neighbourhood_group,
        neighbourhood, latitude, longitude, room_type,
        price, minimum_nights, number_of_reviews, last_review,
        reviews_per_month, calculated_host_listings_count,
        availability_365, number_of_reviews_ltm, license)
    values  
        (6606, "Fab private seattle urban cottage!", 14942, "Joyce", "Other neighborhoods", "Wallingford", 47.65444, -122.33629, "Entire home/apt", 
        99, 30, 160, "2023-08-05", 0.88, 2, 147, 1, "str-opli-19-002622");

    select * from listings
    limit 1

 --   Tabla 2: Calendar. 
 -- Nota: No es necesario agregar las columnas "adjusted_price, minimum_nights, maximum_nights" puesto que no nos aportan ningun valor a nuestra tabla.

    CREATE TABLE calendar (
        listing_id INT,
        date DATE,
        available VARCHAR(5),
        price VARCHAR(150),
        PRIMARY KEY (listing_id, date),
        foreign key(listing_id) references listings (id) ON DELETE CASCADE
         );

 --   Tabla 3: Reviews

    CREATE TABLE reviews (
        listing_id INT,
        id INT PRIMARY KEY,
        date DATE,
        reviewer_id INT,
        reviewer_name VARCHAR(150),
        comments TEXT,
        foreign key(listing_id) references listings (id) ON DELETE CASCADE
         );

-- Cargar la data a las tablas generadas (cambiar rutas)
    --Cargar datos en Tabla 1: Listings

    LOAD DATA LOCAL INFILE "E:/Documentos/Visual studio/Carpeta de seguridad Portafolio Alain Tinoco/listings.csv" /* Cambiar ruta*/
    INTO TABLE listings
    FIELDS TERMINATED BY ',' 
    ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS;

    --Cargar datos en Tabla 2: Calendar

    LOAD DATA LOCAL INFILE "E:/Documentos/Visual studio/Carpeta de seguridad Portafolio Alain Tinoco/calendar.csv" /* Cambiar ruta*/
    INTO TABLE calendar
    FIELDS TERMINATED BY ',' 
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;

    --Cargar datos en Tabla 3: Reviews

    LOAD DATA LOCAL INFILE "E:/Documentos/Visual studio/Carpeta de seguridad Portafolio Alain Tinoco/reviews.csv" /* Cambiar ruta*/
    INTO TABLE reviews
    FIELDS TERMINATED BY ',' 
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;

-- Mostrar las advertencias: En caso de existir advertencias utilizar el comando show warnings para verificar la alerta
    
    show warnings
