CREATE OR REPLACE VIEW VPlace
(id_p, updated_at_p, created_at_p,  user_id_p, name_p, city_id_p,  description_p, number_rooms_p, number_bathrooms_p, max_guest_p, prince_by_night_p, latitude_p, longitude_p)
AS SELECT id, updated_at, created_at,  user_id, name, city_id,  description, number_rooms, number_bathrooms, max_guest, prince_by_night, latitude, longitude
FROM Place WITH READ ONLY;