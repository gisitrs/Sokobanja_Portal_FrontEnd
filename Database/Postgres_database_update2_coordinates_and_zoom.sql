-- City center coordinates and zoom level
UPDATE city
SET geom = ST_GeomFromText('POINT(2434914 5410511)'),
zoom_level = 14
WHERE name = 'Sokobanja';


-- Database update, English
ALTER TABLE location_translation ADD COLUMN name VARCHAR(50);

UPDATE location_translation
SET name = 'Milos''s residence'
WHERE location_id = 24;

UPDATE location_translation
SET name = 'Waterfall Ripaljka'
WHERE location_id = 11;

UPDATE location_translation
SET name = 'City park'
WHERE location_id = 36;

UPDATE location_translation
SET name = 'Picnic area Ozren'
WHERE location_id = 12;

UPDATE location_translation
SET name = 'Park Borici'
WHERE location_id = 38;

UPDATE location_translation
SET name = 'Primary school "Mitropolit Mihailo"'
WHERE location_id = 1;

UPDATE location_translation
SET name = 'Aqua park "Podina"'
WHERE location_id = 35;

UPDATE location_translation
SET name = 'Picnic area Lepterija'
WHERE location_id = 10;

UPDATE location_translation
SET name = 'Turkish bath "Amam"'
WHERE location_id = 72;

UPDATE location_translation
SET name = 'Sokograd'
WHERE location_id = 73;

UPDATE location_translation
SET name = 'The Church of the Holy Transfiguration'
WHERE location_id = 71;