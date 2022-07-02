CREATE OR REPLACE VIEW test_app_locations AS
SELECT location.id AS location_id, 
       city.id                      AS city_id, 
       city.name                    AS city_name, 
       location.name, 
       location.image_url_location, 
       location_type.name           AS location_type, 
       location_type.id             AS location_type_id, 
       location.priority, 
       location.availability, 
       location.geom, 
       ROUND(ST_Y(ST_Transform(location.geom,4326))::DECIMAL, 4) AS x_coord,
       ROUND(ST_X(ST_Transform(location.geom,4326))::DECIMAL, 4) AS y_coord,
       location.description, 
       location_translation.text    AS description_eng,
       location.image_position,
       location.facebook            AS facebook_link,
       location.instagram           AS instagram_link
FROM location JOIN location_type
ON location.location_type_id = location_type.id
JOIN city
ON location.city_id = city.id
JOIN location_translation
ON location.id = location_translation.location_id;