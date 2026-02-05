-- Crear una base de datos

    Create database olympic_games

-- Seleccionar el esquema "olympic_games"

    use olympic_games

/* Habilita carga de archivos: Es necesario activar un comando en SQL para que se puedan importar archivos de manera local.
-- Primero debemos verificar si está activo el modo con el siguiente comando */

    SHOW VARIABLES LIKE 'local_infile';

/* Si no está activo, lo podemos activar con el siguiente comando */

    SET GLOBAL local_infile = 1;

    -- o si no siguiendo la siguiente ruta En MySQL Workbench:

        Edit → Preferences → SQL Editor → Allow LOAD DATA LOCAL INFILE

-- Activar LOCAL INFILE por conexión (Workbench)

    En la pantalla inicial de Workbench (home) > Click derecho sobre tu conexión > Edit Connection > Ve a la pestaña Advanced > En Others, agrega una sola línea: "OPT_LOCAL_INFILE=1" > Guardar > Cerrar Workbench completamente > abrir nuevamente > Reconéctarse */

-- Crear tablas con sus debidos atributos, definir las PK y FK
 --   Tabla 1: countriessdr
     
     CREATE TABLE IF NOT EXISTS countriessdr (
        Country varchar(100),
        Code varchar(10),
        Population FLOAT,
        GDP_per_capita Float
	);

-- Cargar datos para la tabla 1. 
--Es necesario indicar que se realizó una limpieza previa a los datos porque SQL no los cargaba correctamente, más información en: "3_Olympic_Games_Data_Clean.sql"

LOAD DATA LOCAL INFILE "E:/Documentos/Visual studio/Portafolio_Alain_Tinoco/Portafolio_Alain_Database/Proyecto_2/data_model/CountriesSDm.csv" /* Cambiar ruta*/
    INTO TABLE countriessdr
    FIELDS TERMINATED BY ',' 
    ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS
    (@ignore, country, code, population, gdp_per_capita); /* Utilizamos esta variante para excluir la primera columna de nuestro archivo, ya que nos es prescindible */

-- Tabla 2: summersdr 

    Create table summersdr (
        Year int, 
        City varchar(100),
        Sport varchar (100),
        Discipline varchar (100),
        Athlete varchar (100),
        Code varchar (10),
        Gender varchar (100),
        Event varchar (100),
        Medal varchar (100),
        Country varchar (100)
    );

-- Cargar datos para la Tabla 2:
--Es necesario indicar que se realizó una limpieza previa a los datos porque SQL no los cargaba correctamente, más información en: "3_Olympic_Games_Data_Clean.sql"

LOAD DATA LOCAL INFILE "E:/Documentos/Visual studio/Portafolio_Alain_Tinoco/Portafolio_Alain_Database/Proyecto_2/data_model/SummerSDm.csv" /* Cambiar ruta*/
    INTO TABLE summersdr
    CHARACTER SET utf8mb4 /* Seleccionamos el formato UTF-8 */
    FIELDS TERMINATED BY ',' 
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS
    (@ignore, @year, @city, @sport, @discipline, @athlete, @code, @gender, @event, @medal, @country) /* Utilizamos esta variante para excluir la primera columna de nuestro archivo, ya que es prescindible, además seleccionamos nuestras columnas como variables y compatibles con el formato UTF-8 ya que existen caracteres que no detecta SQL por default */
    SET
    year       = NULLIF(@year, ''),
    city       = TRIM(@city),
    sport      = TRIM(@sport),
    discipline = TRIM(@discipline),
    athlete    = TRIM(@athlete),
    code       = TRIM(@code),
    gender     = TRIM(@gender),
    event      = TRIM(@event),
    medal      = TRIM(@medal),
    country    = TRIM(@country);

-- Tabla 3: wintersdm

    Create table wintersdm (
    Year int, 
    City varchar(100),
    Sport varchar (100),
    Discipline varchar (100),
    Athlete varchar (100),
    Code varchar (10),
    Gender varchar (100),
    Event varchar (100),
    Medal varchar (100)
    );

-- Cargar datos para la Tabla 3: 
--Es necesario indicar que se realizó una limpieza previa a los datos porque SQL no los cargaba correctamente, más información en: "3_Olympic_Games_Data_Clean.sql"

 LOAD DATA LOCAL INFILE "E:/Documentos/Visual studio/Portafolio_Alain_Tinoco/Portafolio_Alain_Database/Proyecto_2/data_model/WinterSDm.csv" /* Cambiar ruta*/
    INTO TABLE wintersdm
    CHARACTER SET utf8mb4 /* Seleccionamos el formato UTF-8 */
    FIELDS TERMINATED BY ',' 
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS
    (@ignore, @year, @city, @sport, @discipline, @athlete, @country, @gender, @event, @medal)
    SET
    year       = NULLIF(@year, ''),
    city       = TRIM(@city),
    sport      = TRIM(@sport),
    discipline = TRIM(@discipline),
    athlete    = TRIM(@athlete),
    code       = TRIM(@country), /* Es aquí donde cambiamos la columna "country" por "code" ya que la base "wintersdm" no cuenta con la columna "country"*/
    gender     = TRIM(@gender),
    event      = TRIM(@event),
    medal      = TRIM(@medal);

-- Creación de nuevas tablas 

