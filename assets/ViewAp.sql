CREATE OR REPLACE VIEW VAP
(name_AP)
AS SELECT Amenity.name
FROM Amenity INNER JOIN PlaceAmenity ON PlaceAmenity.amenity_id = Amenity.id INNER JOIN Place ON Place.id = PlaceAmenity.place_id WITH READ ONLY;