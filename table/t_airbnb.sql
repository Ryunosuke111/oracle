CREATE TABLE Review
		(id VARCHAR2(20),
		 updated_at DATE,
		 created_at DATE,
		 user_id VARCHAR2(20),
		 place_id VARCHAR2(20),
		 text VARCHAR2(30)
		 );

CREATE TABLE User_airbnb
		(id VARCHAR2(20),
		 updated_at DATE,
		 created_at DATE,
		 email VARCHAR2(30),
		 password VARCHAR2(20),
		 first_name VARCHAR2(20),
		 last_name VARCHAR2(20)
		 );

CREATE TABLE Place
		(id VARCHAR2(20),
		 updated_at DATE,
		 created_at DATE,
		 user_id VARCHAR2(20),
		 name VARCHAR2(20),
		 city_id VARCHAR2(20),
		 description VARCHAR2(20),
		 number_rooms NUMBER(10),
		 number_bathrooms NUMBER(10),
		 max_guest NUMBER(10),
		 prince_by_night NUMBER(10),
		 latitude NUMBER(10,4),
		 longitude NUMBER(10,4)
		 );

CREATE TABLE Amenity
		(id VARCHAR2(20),
		 updated_at DATE,
		 created_at DATE,
		 name VARCHAR2(20)
		);

CREATE TABLE PlaceAmenity
		(amenity_id VARCHAR2(20),
		 place_id VARCHAR2(20)		
		);

CREATE TABLE State
		(id VARCHAR(20),
		 updated_at DATE,
		 created_at DATE,
		 name VARCHAR(20)
		);

CREATE TABLE City
		(id VARCHAR2(20),
		 updated_at DATE,
		 created_at DATE,
		 state_id VARCHAR2(20),
		 name VARCHAR2(20)
		);
