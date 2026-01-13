/* Limpieza de datos */

    -- Limpieza de la tabla "calendar"
        -- Deshabilitar temporalmente el safe mode para updates y deletes en muchos datos de nuestra tabla
        
        SET SQL_SAFE_UPDATES = 0

        -- Remover el símbolo "$" y quitar las "," de la columna "price". De esta manera nos deshacemos de los decimales también.

        UPDATE calendar SET price = REPLACE(REPLACE(price, '$', ''), ',', '') + 0 WHERE listing_id IS NOT NULL;

    -- Limpieza de la tabla listings
        -- Actualizar los precios en "0" en la tabla listings con la información que existen en la tabla Calendar
        
        UPDATE listings l 
        JOIN (
            SELECT DISTINCT listing_id, MAX(price) as price
            FROM calendar 
            WHERE price > 0 
            GROUP BY listing_ID
            ) c
        ON l.id = c.listing_id
        SET l.price = c.price
        WHERE l.price = 0;
                
        -- Comprobamos que el cambio se haya efectuado, es decir, que los datos de "0" hayan sido reemplazados por el precio de la tabla calendar

        SELECT * FROM listings WHERE price = 0;

        