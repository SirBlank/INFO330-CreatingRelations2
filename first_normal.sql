--- FIRST NORMAL FORM ---

-- Splitting the array of values in the column 'abilities' into two columns.
CREATE TABLE split_abilities AS
SELECT abilities, pokedex_number,
	trim(value) AS ability
FROM imported_pokemon_data,
	json_each('["' || replace(abilities, ',', '","') || '"]')
WHERE ability <> '';

-- Cleaning up the string value by removing unwanted characters.
UPDATE split_abilities SET ability = REPLACE(REPLACE(REPLACE(ability, '[', ''), ']', ''), '''', '');

-- Creating the main 1NF pokemon table by joining the 'abilities' table and the 'imported_pokemon_data' table.
CREATE TABLE pokemon_1NF AS
SELECT *
FROM imported_pokemon_data
JOIN split_abilities
ON imported_pokemon_data.pokedex_number = split_abilities.pokedex_number;

-- Removing unnecessary columns
ALTER TABLE pokemon_1NF
DROP COLUMN 'abilities:1';

ALTER TABLE pokemon_1NF
DROP COLUMN 'abilities';

ALTER TABLE pokemon_1NF
DROP COLUMN 'pokedex_number:1';

-- Reordering columns
CREATE TABLE temp1nf AS
SELECT pokedex_number,
	   name,
	   ability,
	   against_bug,
	   against_dark,
	   against_dragon,
	   against_electric,
	   against_fairy,
	   against_fight,
	   against_fire,
	   against_flying,
	   against_ghost,
	   against_grass,
	   against_ground,
	   against_ice,
	   against_normal,
	   against_poison,
	   against_psychic,
	   against_rock,
	   against_steel,
	   against_water,
	   attack,
	   base_egg_steps,
	   base_happiness,
	   base_total,
	   capture_rate,
	   classfication,
	   defense,
	   experience_growth,
	   height_m,
	   hp,
	   percentage_male,
	   sp_attack,
	   sp_defense,
	   speed,
	   type1,
	   type2,
	   weight_kg,
	   generation,
	   is_legendary
FROM pokemon_1NF;

DROP TABLE pokemon_1NF;

ALTER TABLE temp1nf
RENAME TO pokemon_1NF;


/* Calling/dropping tables
drop table split_abilities;
drop table pokemon_1NF;
drop table imported_pokemon_data;

SELECT * FROM pokemon_1NF
SELECT * FROM imported_pokemon_data
SELECT * FROM split_abilities
SELECT * FROM abilities
*/