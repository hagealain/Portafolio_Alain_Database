-- SQL Murder Mystery
    -- https://mystery.knightlab.com/walkthrough.html
    
    
    --- Respuesta
    --- This query only returns reports about a specific type of crime in a specific city.
    SELECT * FROM crime_scene_report 
    WHERE type = 'murder' 
    AND city = 'SQL City';
    ---Write a query that identifies the first witness.
    select * from person
    where address_street_name = "Northwestern Dr"
    order by address_number desc
    limit 1
    ---Write a query that identifies the second witness.
    select * from person
    where address_street_name = "Franklin Ave" and name like "Ann%"
    ---Write a query that shows the interview transcripts for our two subjects.
    select name, transcript from person p
    join interview i 
    on p.id = i.person_id
    where id like "14887" or id like "16371"
    --- Find the murderer!
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
    -- If you feel especially confident in your SQL skills, try to complete this final step with no more than 2 queries. Use this same INSERT statement with your new suspect to check your answer. (VERSION COMPLETA)
    select name, person_id, event_name, date, height, hair_color, car_make, car_model from person p 
    join drivers_license d 
    on p.license_id = d.id
    join facebook_event_checkin f
    on p.id = f.person_id
    where event_name like "SQL%" and date like "201712__" 
    and height between "65" and "67" and hair_color = "red" and car_make = "Tesla" and car_model = "Model S"
    order by person_id
    -- If you feel especially confident in your SQL skills, try to complete this final step with no more than 2 queries. Use this same INSERT statement with your new suspect to check your answer. (VERSION DOS LINEAS)