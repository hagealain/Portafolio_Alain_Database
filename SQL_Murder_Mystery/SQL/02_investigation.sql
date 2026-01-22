-- En esta sección indagamos de manera profunda las pistas que el ejercicio nos proporciona y utilizamos las herramientas de SQL para rastear los datos que nos lleven con el culpable

/* Esta Query nos permite indigar directamente en la ciudad donde ocurrió el crimen y el tipo de asesinato, aunque es exploratorio, ya está modificada para el análisis que necesitamos para descubrir al culpable
La query se inserta en: "This query only returns reports about a specific type of crime in a specific city."" */

    SELECT * FROM crime_scene_report 
    WHERE type = 'murder' 
    AND city = 'SQL City';

/* Con esta Query podemos identificar al primer testigo que nos brinde información
Se inserta en: "Write a query that identifies the first witness."" */
    
    select * from person
    where address_street_name = "Northwestern Dr"
    order by address_number desc
    limit 1

/* Identificamos al segundo testigo
Se inserta en: "Write a query that identifies the second witness." */
    select * from person
    where address_street_name = "Franklin Ave" and name like "Ann%"

/* Utilizamos joins para conocer los testimonios de los testigos y así obtener las pistas que nos lleven al asesino
Se inserta en: Write a query that shows the interview transcripts for our two subjects. */
    select name, transcript from person p
    join interview i 
    on p.id = i.person_id
    where id like "14887" or id like "16371"
   