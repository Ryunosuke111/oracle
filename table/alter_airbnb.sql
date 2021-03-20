ALTER TABLE Review
MODIFY	(id VARCHAR2(20) NOT NULL,
		 updated_at DATE NOT NULL,
		 created_at DATE NOT NULL,
		 user_id VARCHAR2(20) NOT NULL,
		 place_id VARCHAR2(20) NOT NULL,
		 text VARCHAR2(30) NOT NULL);

ALTER TABLE User_airbnb
MODIFY	(id VARCHAR2(20) ,
		 updated_at DATE NOT NULL,
		 created_at DATE NOT NULL,
		 email VARCHAR2(30) NOT NULL,
		 password VARCHAR2(20) NOT NULL);

ALTER TABLE Place
MODIFY	(id VARCHAR2(20) NOT NULL,
		 updated_at DATE NOT NULL,
		 created_at DATE NOT NULL,
		 user_id VARCHAR2(20) NOT NULL,
		 name VARCHAR2(20) NOT NULL,
		 city_id VARCHAR2(20) NOT NULL,
         number_rooms NUMBER(10) NOT NULL,
		 number_bathrooms NUMBER(10) NOT NULL,
		 max_guest NUMBER(10) NOT NULL,
		 prince_by_night NUMBER(10) NOT NULL);

ALTER TABLE Amenity
MODIFY	(id VARCHAR2(20) NOT NULL,
		 updated_at DATE NOT NULL,  
		 created_at DATE NOT NULL,
		 name VARCHAR2(20) NOT NULL);

ALTER TABLE PlaceAmenity
MODIFY	(amenity_id VARCHAR2(20)  NOT NULL,
		 place_id VARCHAR2(20)	 NOT NULL);

ALTER TABLE State
MODIFY	(id VARCHAR(20) NOT NULL,
		 updated_at DATE NOT NULL,
		 created_at DATE NOT NULL,
		 name VARCHAR(20) NOT NULL);

ALTER TABLE City
MODIFY	(id VARCHAR2(20) NOT NULL,
		 updated_at DATE NOT NULL,
		 created_at DATE NOT NULL,
		 state_id VARCHAR2(20) NOT NULL,
		 name VARCHAR2(20) NOT NULL);

#->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>



# ALTERAR LA TABLA PARA PONER LOS VALORES POR DEFAULT
#->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

ALTER TABLE Place
MODIFY	( number_rooms NUMBER(10) DEFAULT 0,
		 number_bathrooms NUMBER(10) DEFAULT 0,
		 max_guest NUMBER(10) DEFAULT 0,
		 prince_by_night NUMBER(10) DEFAULT 0);


#->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>



#ALTERAR LA TABLA PARA MODIFICAR LOS VALORES NUMERICOS PARA QUE SEAN MAYOR A 0
#->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

ALTER TABLE Place
MODIFY	( number_rooms NUMBER(10) CONSTRAINT emp_number_rooms_ck CHECK (number_rooms >= 0),
		 number_bathrooms NUMBER(10) CONSTRAINT emp_number_bathrooms_ck CHECK (number_bathrooms >= 0),
		 max_guest NUMBER(10) CONSTRAINT emp_max_guest_ck CHECK (max_guest >= 0),
		 prince_by_night NUMBER(10) CONSTRAINT emp_prince_by_night_ck CHECK (prince_by_night >= 0));

#->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>



#ALTERACION DE LAS TABLAS PARA AGREGAR LAS LLAVES PRIMARIAS
#->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

ALTER TABLE Review
ADD	CONSTRAINT Review_id_pk
PRIMARY KEY (id);

ALTER TABLE Place
ADD	CONSTRAINT Place_id_pk
PRIMARY KEY (id);

ALTER TABLE Amenity
ADD	CONSTRAINT Amenity_id_pk
PRIMARY KEY (id);

ALTER TABLE State
ADD	CONSTRAINT State_id_pk
PRIMARY KEY (id);

ALTER TABLE City
ADD	CONSTRAINT City_id_pk
PRIMARY KEY (id);

#->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>



# ALTERACION DE LAS TABLAS PARA AGREGAR LAS LLAVES FORANIAS
#->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

ALTER TABLE Review
ADD CONSTRAINT Review_fk
FOREIGN KEY(user_id)
REFERENCES User_airbnb(id);

ALTER TABLE Review
ADD CONSTRAINT Review_p_fk
FOREIGN KEY(place_id)
REFERENCES Place(id);

ALTER TABLE Place
ADD CONSTRAINT Placeu_fk
FOREIGN KEY(user_id)
REFERENCES User_airbnb(id);

ALTER TABLE Place
ADD CONSTRAINT PlaceC_fk
FOREIGN KEY(city_id)
REFERENCES City(id);

ALTER TABLE PlaceAmenity
ADD CONSTRAINT PlaceAmenity_fk
FOREIGN KEY(amenity_id)
REFERENCES Amenity(id);

ALTER TABLE PlaceAmenity
ADD CONSTRAINT PlaceAmenityP_fk
FOREIGN KEY(place_id)
REFERENCES Place(id);

ALTER TABLE City
ADD CONSTRAINT City_fk
FOREIGN KEY(state_id)
REFERENCES State(id);
