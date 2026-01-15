/* Estadísitica descriptiva e insights */ 

    -- Promedio por vencindario y conteo total de ids

    SELECT neighborhood_group, ROUND(AVG(price), 2) as avg_price, COUNT(id) as total_listings
    FROM listings
    GROUP BY neighborhood_group
    ORDER BY avg_price;

    -- Los 10 precios más altos de alojamiento por vecindario

    SELECT neighborhood_group, MAX(price) as max_price
    FROM listings
    GROUP BY neighborhood_group
    ORDER BY max_price DESC
    LIMIT 10;

    -- Los 10 precios más bajos de alojamiento por vecindario

    SELECT neighborhood_group, MIN(price) as min_price
    FROM listings
    GROUP BY neighborhood_group
    ORDER BY min_price ASC
    LIMIT 10;

    -- Valores atípicos del precio
        -- Este filtro selecciona únicamente los ids cuyo precio es extremadamente alto en comparación con la mayoría, usando la regla de “3 sigmas” que en estadística identifica valores raros o fuera de lo común.

    SELECT id, name, price
    FROM listings
    WHERE price > (SELECT AVG(price) + 3 * STD(price) FROM listings)
    ORDER BY price DESC;

    -- Tipo de alojamiento que más ingresos totales genera

    SELECT room_type, SUM((365 - availability_365)*price) AS revenue
    FROM listings
    GROUP BY room_type
    ORDER BY revenue DESC;

/* Análisis Temporal */ 

    -- Los meses con mayor ocupación en los Seattle Airbnb Bookings

    SELECT DATE_FORMAT(date, "%m") AS month, COUNT(*) as booking_count
    FROM calendar
    WHERE available = "f"
    GROUP BY month
    ORDER BY booking_count DESC;

    -- Los meses con mayor ocupación ordenados de acuerdo con su año en los Seattle Airbnb Bookings

    SELECT DATE_FORMAT(date, "%Y-%m") AS month, COUNT(*) as booking_count
    FROM calendar
    WHERE available = "f"
    GROUP BY month
    ORDER BY booking_count DESC;

/* Análisis exploratorio de precios, alojamientos y comportamiento de hosts (EDA analítico) */

    -- Top 10 de los hosts con mayor cantidad de alojamientos

    SELECT host_id, host_name, COUNT(*) as listing_count
    FROM listings
    GROUP BY host_id, host_name
    ORDER BY listing_count DESC
    LIMIT 10;

    -- Host con mayor alojamientos en Seattle por tipo de alojamiento y locación

    SELECT host_id, host_name, neighborhood, name, room_type 
    FROM listings
    WHERE host_id = "3074414" AND host_name = "Melissa"

    -- Cantidad total de alojamientos, precio promedio, precio mínimo y máximo y desviación estándar del precio categorizados por tipo de alojamiento. Distribución del precio por alojamiento.

    SELECT room_type, COUNT(*) as total_listings, ROUND(AVG(price), 0) as avg_price, MIN(price) as min_price, MAX(price) as max_price, ROUND(STDDEV(price), 0) as stddev_price
    FROM listings
    GROUP BY room_type;

    -- Grupo de vecindarios con el promedio de precio más alto para cada tipo de alojamiento.

    WITH NeighborhoodRoomTypeAvg AS (
        SELECT 	neighborhood_group,
                room_type,
                ROUND(AVG(price), 0) as avg_price
        FROM listings
        GROUP BY neighborhood_group, room_type
    ),
    RankedNeighborhoods AS (
	    SELECT	neighborhood_group,
			room_type,
			avg_price,
			RANK() OVER (PARTITION BY room_type ORDER BY avg_price DESC) as price_rank
	    FROM NeighborhoodRoomTypeAvg
    )
    SELECT	neighborhood_group,
            room_type,
            avg_price
    FROM RankedNeighborhoods
    WHERE price_rank <= 3
    ORDER BY room_type, price_rank
    ;

    -- Tendencia de precios a lo largo del tiempo para cada vecindario

    SELECT 
        DATE_FORMAT(c.date, '%Y-%m') AS month,
        l.neighborhood_group,
        ROUND(AVG(c.price), 0) AS avg_price
    FROM calendar c
    JOIN listings l ON c.listing_id = l.id
    GROUP BY month, l.neighborhood_group
    ORDER BY l.neighborhood_group, month;