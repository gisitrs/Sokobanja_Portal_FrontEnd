-- delete previous view
DROP VIEW test_app_locations;

-- create new view with location_translation.name column
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
    location.instagram AS instagram_link
FROM location
     JOIN location_type ON location.location_type_id = location_type.id
     JOIN city ON location.city_id = city.id
     JOIN location_translation ON location.id = location_translation.location_id;
