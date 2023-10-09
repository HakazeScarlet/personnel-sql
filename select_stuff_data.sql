SELECT snils_id, surname, name, patronymic FROM personnel.personal_information
INNER JOIN personnel.education ON personnel.personal_information.snils_id = personnel.education.personal_information_snils_id
GROUP BY snils_id, surname, name, patronymic, personal_information_snils_id
HAVING count(personal_information_snils_id) = 2;

SELECT snils_id, personal_information.surname, personal_information.name, personal_information.patronymic FROM personnel.personal_information
INNER JOIN personnel.family ON personnel.personal_information.snils_id = personnel.family.personal_information_snils_id
WHERE kinship = 'son'
GROUP BY personal_information_snils_id, kinship, snils_id
HAVING count(kinship) = 1;

SELECT snils_id, personal_information.surname, personal_information.name, personal_information.patronymic FROM personnel.personal_information
INNER JOIN personnel.personal_vehicle ON personal_information.snils_id = personal_vehicle.personal_information_snils_id
WHERE brand SIMILAR TO '[m]%';

SELECT nationality, count(nationality) FROM personnel.personal_information
GROUP BY nationality;

SELECT snils_id, personal_information.surname, personal_information.name, personal_information.patronymic FROM personnel.personal_information
INNER JOIN personnel.personal_vehicle ON personal_information.snils_id = personal_vehicle.personal_information_snils_id
GROUP BY personal_information_snils_id, snils_id
HAVING count(personal_information_snils_id) = 1;

SELECT * FROM personnel.personal_information ORDER BY surname;

