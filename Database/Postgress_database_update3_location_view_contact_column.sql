-- create new view with contact columns
CREATE OR REPLACE VIEW test_app_locations AS
SELECT location.id AS location_id,
    city.id AS city_id,
    city.name AS city_name,
    location.name,
    location_translation.name AS name_eng,
    location.image_url_location,
    location_type.id AS location_type_id,
    location_type.name AS location_type,
    location.priority,
    location.availability,
    location.geom,
    round(st_y(st_transform(location.geom, 4326))::numeric, 4) AS x_coord,
    round(st_x(st_transform(location.geom, 4326))::numeric, 4) AS y_coord,
    location.description,
    location_translation.text AS description_eng,
    location.image_position,
    location.facebook AS facebook_link,
    location.instagram AS instagram_link,
    location.web_address,
    location.email,
    concat(
        CASE 
           WHEN location.address IS NOT NULL
                THEN concat('Adresa: ', location.address, '  ')
                ELSE NULL
        END, 
        CASE
            WHEN location.phone_number IS NOT NULL
                THEN concat('Telefon: ', location.phone_number, '  ')
                ELSE NULL
        END,
        CASE
            WHEN location.mobile_phone_number IS NOT NULL
                THEN concat('Mobilni: ', location.mobile_phone_number)
                ELSE NULL
        END) AS contact,
    concat(
        CASE 
           WHEN location.address IS NOT NULL
                THEN concat('Address: ', location.address, '  ')
                ELSE NULL
        END, 
        CASE
            WHEN location.phone_number IS NOT NULL
                THEN concat('Phone: ', location.phone_number, '  ')
                ELSE NULL
        END,
        CASE
            WHEN location.mobile_phone_number IS NOT NULL
                THEN concat('Mobile: ', location.mobile_phone_number)
                ELSE NULL
        END) AS contact_eng
FROM location
     JOIN location_type ON location.location_type_id = location_type.id
     JOIN city ON location.city_id = city.id
     JOIN location_translation ON location.id = location_translation.location_id;