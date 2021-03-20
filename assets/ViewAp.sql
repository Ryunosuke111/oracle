CREATE OR REPLACE VIEW VAP
(name_AP)
AS SELECT Place.name
FROM Place INNER JOIN PlaceAmenity ON PlaceAmenity.place_id = Place.id INNER JOIN Amenity ON Amenity.id = PlaceAmenity.amenity_id;