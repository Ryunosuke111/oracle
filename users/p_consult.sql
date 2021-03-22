#pERMISOS DE sesion

GRANT create session
TO consultas; 

#pERMISOS DE CONSULTA PARA CADA TABLA EN EL USUARIO CONSULTAS

GRANT select
ON Review
TO consultas;

GRANT select
ON  User_airbnb
TO consultas;

GRANT select
ON Place
TO consultas;

GRANT select
ON Amenity
TO consultas;

GRANT select
ON PlaceAmenity
TO consultas;

GRANT select
ON State
TO consultas;

GRANT select
ON City 
TO consultas;

#pERMISOS DE CONSULTA PARA CADA VISTA EN EL USUARIO CONSULTAS

GRANT select
ON VAP
TO consultas;

GRANT select
ON  VPA
TO consultas;

GRANT select
ON VPlace
TO consultas;

GRANT select
ON VPCS
TO consultas;

GRANT select
ON VPC
TO consultas;
