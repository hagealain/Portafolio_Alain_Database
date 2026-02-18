-- Crear la base de datos

    CREATE DATABASE retail_sales

-- Seleccionar la base de datos en la que se trabajará

    use retail_sales

-- Creamos la tabla "sales"

CREATE TABLE sales (
    transaction_id VARCHAR(50),
    order_date DATE,
    customer_id VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    product_category VARCHAR(100),
    quantity INT,
    price_per_unit DECIMAL(10,2),
    total_amount DECIMAL(10,2)
);

-- Habilitar carga de archivos (Solo en caso de que esté bloqueada la importación)

    SHOW VARIABLES LIKE "local_infile"; /*Que se encuentre el switch en OFF*/

    SET GLOBAL local_infile = 1; /* Activa la importación de archivos*/

    SHOW VARIABLES LIKE "local_infile"; /*Que se encuentre el switch en ON*/

-- Activar LOCAL INFILE por conexión (Workbench)

    En la pantalla inicial de Workbench > Click derecho sobre tu conexión > Edit Connection > Ve a la pestaña Advanced > En Others, agrega una sola línea: "OPT_LOCAL_INFILE=1" > Guarda > Cierra Workbench completamente > Ábrelo de nuevo > Reconéctate

-- Cargar base de datos

    LOAD DATA LOCAL INFILE "E:/Documentos/Visual studio/Carpeta de seguridad Portafolio Alain Tinoco/Retail Sales Dataset/retail_sales_dataset.csv"
    INTO TABLE sales
    FIELDS TERMINATED BY ","
    ENCLOSED BY """
    LINES TERMINATED BY "\n"
    IGNORE 1 ROWS;
