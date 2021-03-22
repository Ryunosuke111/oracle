CREATE OR REPLACE VIEW VPA
(name_PA)
AS SELECT Place.name
FROM Place INNER JOIN PlaceAmenity ON PlaceAmenity.place_id = Place.id INNER JOIN Amenity ON Amenity.id = PlaceAmenity.amenity_id WITH READ ONLY;