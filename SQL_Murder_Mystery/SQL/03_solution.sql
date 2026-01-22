-- Soluciones al ejercicio.

/* Con esta Query encontramos al villano después de indagar en los datos con las pistas de los testigos y la información disponible
 Se inserta en: "Find the murderer!" */

    select gy.person_id, gy.id as gym_id, gy.membership_status as gym_status, 
    p.name, gy.name as gym_name, p.license_id, d.plate_number as placa, c.check_in_date as checkin
    from get_fit_now_member gy
    join get_fit_now_check_in c
    on gy.id = c.membership_id
    join person p
    on p.id = gy.person_id
    join drivers_license d
    on d.id = p.license_id
    where gym_id like "48Z%" and gym_status = "gold" and placa like "%H42W%" and checkin like "%0109"

/* La respuesta oficial al Villano es: */

    INSERT INTO solution VALUES (1, 'Jeremy Bowers');
    SELECT value FROM solution;

/* No obstante el ejercicio nos propone indagar más allá de la respuesta porque existe un verdadero villano detrás de este crimen. Para desbloquear esta sección es necesario haber insertado correctamente la respuesta en "Did you find the killer?"
El mensaje que nos arroja es el siguiente: 

"Congrats, you found the murderer! But wait, there's more... If you think you're up for a challenge, try querying the interview transcript of the murderer to find the real villain behind this crime. If you feel especially confident in your SQL skills, try to complete this final step with no more than 2 queries. Use this same INSERT statement with your new suspect to check your answer."

Con la siguiente query averiguamos quien es la verdadera mente maestra detrás del crimen. */

    select name, person_id, event_name, date, height, hair_color, car_make, car_model from person p 
    join drivers_license d 
    on p.license_id = d.id
    join facebook_event_checkin f
    on p.id = f.person_id
    where event_name like "SQL%" and date like "201712__" 
    and height between "65" and "67" and hair_color = "red" and car_make = "Tesla" and car_model = "Model S"
    order by person_id

/* Respuesta final */ 

    INSERT INTO solution VALUES (1, 'Miranda Priestly');
    SELECT value FROM solution;