CREATE OR REPLACE VIEW VPCS
(name_pt)
AS SELECT Place.name
FROM Place INNER JOIN City ON City.id = Place.city_id INNER JOIN State ON State.id = City.state_id WITH READ ONLY;