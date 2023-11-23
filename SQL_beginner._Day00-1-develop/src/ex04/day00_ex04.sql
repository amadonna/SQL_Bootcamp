SELECT CONCAT(person.name, ' (age:', person.age,',gender:''',person.gender,''',address:''',person.address,''')')
AS person_information
FROM person
ORDER BY person_information;