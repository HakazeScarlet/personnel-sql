SELECT personal_information_snils_id, count(personal_information_snils_id) FROM personnel.education
GROUP BY personal_information_snils_id
HAVING count(personal_information_snils_id) = 2;

SELECT personal_information_snils_id, count(kinship) FROM personnel.family
WHERE kinship = 'son'
GROUP BY personal_information_snils_id, kinship
HAVING count(kinship) = 1;

SELECT personal_information_snils_id FROM personnel.personal_vehicle
WHERE brand SIMILAR TO '[m]%';

SELECT nationality, count(nationality) FROM personnel.personal_information
GROUP BY nationality;

SELECT personal_information_snils_id, count(personal_information_snils_id) FROM personnel.personal_vehicle
GROUP BY personal_information_snils_id
HAVING count(personal_information_snils_id) = 1;

SELECT * FROM personnel.personal_information ORDER BY surname;

