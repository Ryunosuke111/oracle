CREATE OR REPLACE VIEW VPC
(name_pc)
AS SELECT Place.name
FROM Place INNER JOIN City ON City.id = Place.city_id;