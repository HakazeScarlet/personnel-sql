DROP DATABASE IF EXISTS personnel;
CREATE DATABASE personnel;
\c personnel;

CREATE SCHEMA personnel;

CREATE TABLE personnel.staff (
position_id integer NOT NULL,
position character varying(100) NOT NULL,
CONSTRAINT position_id_pk PRIMARY KEY (position_id)
);

CREATE TABLE personnel.personnel_department (
personal_id integer NOT NULL,
surname character varying(100) NOT NULL,
name character varying(100) NOT NULL,
patronymic character varying(100) NOT NULL,
staff_position_id integer NOT NULL,
CONSTRAINT personal_id_pk PRIMARY KEY (personal_id),
CONSTRAINT staff_position_id_fk FOREIGN KEY (staff_position_id)
	REFERENCES personnel.staff (position_id)
	ON UPDATE CASCADE ON DELETE
);

CREATE TABLE personnel.personal_information (
snils_id integer NOT NULL,
surname character varying(100) NOT NULL,
name character varying(100) NOT NULL,
patronymic character varying(100) NOT NULL,
birthday date,
nationality character varying(100) NOT NULL,
passport character varying(10) NOT NULL,
military_identification character varying(9) NOT NULL,
family_status character varying(100) NOT NULL,
driver_licence character varying(10) NOT NULL,
criminal_record boolean NOT NULL,
personnel_department_personal_id integer NOT NULL,
CONSTRAINT snils_id_pk PRIMARY KEY (snils_id)
CONSTRAINT personnel_department_personal_id_fk FOREIGN KEY (personal_id_personnel_department)
	REFERENCES personnel.personnel_department (personal_id)
	ON UPDATE CASCADE ON DELETE
);

CREATE TABLE personnel.family (
id serial unique NOT NULL,
surname character varying(100) NOT NULL,
name character varying(100) NOT NULL,
patronymic character varying(100) NOT NULL,
kinship character varying(100) NOT NULL,
passport character varying(10) NOT NULL,
birthday date NOT NULL,
personal_information_snils_id integer NOT NULL,
CONSTRAINT id_pk PRIMARY KEY (id)
CONSTRAINT personal_information_snils_id_fk FOREIGN KEY (snils_id_personal_information)
	REFERENCES personnel.personal_information (snils_id)
	ON UPDATE CASCADE ON DELETE
);

CREATE TABLE personnel.birth_location (
id serial unique NOT NULL,
country character varying(100),
subject character varying(100),
district character varying(100),
locality character varying(100),
personal_information_snils_id integer NOT NULL,
family_id integer NOT NULL,
CONSTRAINT id_pk PRIMARY KEY (id)
CONSTRAINT personal_information_snils_id_fk FOREIGN KEY (snils_id_personal_information)
	REFERENCES personnel.personal_information (snils_id)
	ON UPDATE CASCADE ON DELETE,
CONSTRAINT family_id_fk FOREIGN KEY (family_id)
	REFERENCES personnel.family (id)
	ON UPDATE CASCADE ON DELETE
);

CREATE TABLE personnel.phone_number (
id serial unique NOT NULL,
phone_country_code character varying(5) NOT NULL,
phone_number character varying(11) NOT NULL,
number_type character varying(100) NOT NULL,
personal_information_snils_id integer NOT NULL,
family_id integer NOT NULL,
CONSTRAINT id_pk PRIMARY KEY (id)
CONSTRAINT personal_information_snils_id_fk FOREIGN KEY (snils_id_personal_information)
	REFERENCES personnel.personal_information (snils_id)
	ON UPDATE CASCADE ON DELETE 
CONSTRAINT family_id_fk FOREIGN KEY (id_family)
	REFERENCES personnel.family (id)
	ON UPDATE CASCADE ON DELETE
);

CREATE TABLE personnel.personal_vehicle (
id serial unique NOT NULL,
car_brand character varying(100) NOT NULL,
car_number character varying(15) NOT NULL,
car_registration_certificate character varying(10) NOT NULL,
car_release_date date NOT NULL,
personal_information_snils_id integer NOT NULL,
CONSTRAINT id_pk PRIMARY KEY (id)
CONSTRAINT personal_information_snils_id_fk FOREIGN KEY (snils_id_personal_information)
	REFERENCES personnel.personal_information (snils_id)
	ON UPDATE CASCADE ON DELETE
);

CREATE TABLE personnel.education (
id serial unique NOT NULL,
institution_name character varying(200) NOT NULL,
institution_type character varying(100) NOT NULL,
education_type character varying(50) NOT NULL,
start_date date NOT NULL,
graduation_date date NOT NULL,
personal_information_snils_id integer NOT NULL,
CONSTRAINT id_pk PRIMARY KEY (id)
CONSTRAINT personal_information_snils_id_fk FOREIGN KEY (snils_id_personal_information)
	REFERENCES personnel.personal_information (snils_id)
	ON UPDATE CASCADE ON DELETE
);

CREATE TABLE personnel.location (
id serial unique NOT NULL,
country character varying(100),
subject character varying(100),
district character varying(100),
locality character varying(100),
street character varying(100),
house integer,
block character varying(10),
apartment integer,
personal_information_snils_id integer NOT NULL,
family_id integer NOT NULL,
CONSTRAINT id_pk PRIMARY KEY (id)
CONSTRAINT personal_information_snils_id_fk FOREIGN KEY (snils_id_personal_information)
	REFERENCES personnel.personal_information (snils_id)
	ON UPDATE CASCADE ON DELETE,
CONSTRAINT family_id_fk FOREIGN KEY (family_id)
	REFERENCES personnel.family (id)
	ON UPDATE CASCADE ON DELETE
);