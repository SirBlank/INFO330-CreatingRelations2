--- THIRD NORAML FORM ---

-- Createing 'type_combinations' table to assign a unique id for all unique combinations of types.
CREATE TABLE type_combinations (
  type_combination_id INTEGER PRIMARY KEY,
  type_1 TEXT,
  type_2 TEXT
);

INSERT INTO type_combinations (type_combination_id, type_1, type_2)
SELECT DISTINCT NULL, type1, type2
FROM imported_pokemon_data;

-- creating 3NF table
CREATE TABLE pokemon_3NF (
	   pokedex_number INTEGER,
	   name TEXT,
	   type_combination_id INTEGER,
	   attack INTEGER,
	   base_egg_steps INTEGER,
	   base_happiness INTEGER,
	   base_total INTEGER,
	   capture_rate INTEGER,
	   classfication TEXT,
	   defense INTEGER,
	   experience_growth INTEGER,
	   height_m REAL,
	   hp INTEGER,
	   percentage_male REAL,
	   sp_attack INTEGER,
	   sp_defense INTEGER,
	   speed INTEGER,
	   weight_kg REAL,
	   generation INTEGER,
	   is_legendary INTEGER,
	   type1 TEXT,
	   type2 TEXT
);
INSERT INTO pokemon_3NF (pokedex_number,
	   name,
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
	   weight_kg,
	   generation,
	   is_legendary,
	   type1,
	   type2)
SELECT
	   pokedex_number,
	   name,
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
	   weight_kg,
	   generation,
	   is_legendary,
	   type1,
	   type2
FROM pokemon_1NF;

-- Assigning type_combination_id to the matching pokemon type combinations for each pokemon
UPDATE pokemon_3NF
SET type_combination_id = (
  SELECT type_combination_id
  FROM type_combinations
  WHERE type_combinations.type_1 = pokemon_3NF.type1
  AND type_combinations.type_2 = pokemon_3NF.type2
);

-- Removing duplicate rows
CREATE TABLE temp_3NF AS
SELECT DISTINCT *
FROM pokemon_3NF;

DROP TABLE pokemon_3NF;

ALTER TABLE temp_3NF
RENAME TO pokemon_3NF;

ALTER TABLE pokemon_3NF
DROP COLUMN type1;

ALTER TABLE pokemon_3NF
DROP COLUMN type2;

CREATE TABLE temp_3NF (
	   pokedex_number INTEGER PRIMARY KEY,
	   name TEXT,
	   type_combination_id INTEGER,
	   attack INTEGER,
	   base_egg_steps INTEGER,
	   base_happiness INTEGER,
	   base_total INTEGER,
	   capture_rate INTEGER,
	   classfication TEXT,
	   defense INTEGER,
	   experience_growth INTEGER,
	   height_m REAL,
	   hp INTEGER,
	   percentage_male REAL,
	   sp_attack INTEGER,
	   sp_defense INTEGER,
	   speed INTEGER,
	   weight_kg REAL,
	   generation INTEGER,
	   is_legendary INTEGER
);
INSERT INTO temp_3NF (pokedex_number,
	   name,
	   type_combination_id,
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
	   weight_kg,
	   generation,
	   is_legendary)
SELECT
	   pokedex_number,
	   name,
	   type_combination_id,
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
	   weight_kg,
	   generation,
	   is_legendary
FROM pokemon_3NF;

DROP TABLE pokemon_3NF;

ALTER TABLE temp_3NF
RENAME TO pokemon_3NF;

-- Creating table 'pokemon_type_id' to subset type_id from the main pokemon table (pokemon_3NF).
CREATE TABLE pokemon_type_id (
	pokedex_number INTEGER,
	type_combination_id INTEGER,
	FOREIGN KEY(pokedex_number) REFERENCES pokemon_3NF(pokedex_number)
);

INSERT INTO pokemon_type_id (type_combination_id, pokedex_number)
SELECT type_combination_id, pokedex_number
FROM pokemon_3NF;

-- Updating table 'weaknesses' to match type_combination_id with pokedex_number
ALTER TABLE weaknesses
ADD COLUMN type_combination_id INTEGER;

UPDATE weaknesses
SET type_combination_id = (
  SELECT type_combination_id
  FROM pokemon_type_id
  WHERE pokemon_type_id.pokedex_number = weaknesses.pokedex_number
);

ALTER TABLE weaknesses
DROP COLUMN pokedex_number;

CREATE TABLE temp_weaknesses AS
SELECT DISTINCT *
FROM weaknesses;

DROP TABLE weaknesses;

ALTER TABLE temp_weaknesses
RENAME TO weaknesses;

-- Creating 'pokemon_abilities' table to generate a unique key for each ability.
CREATE TABLE pokemon_abilities (
	ability_id INTEGER PRIMARY KEY,
	ability TEXT
);

INSERT INTO pokemon_abilities (ability)
SELECT DISTINCT ability
FROM abilities;

-- Creating 'pokemon_ability_id' table to assign pokemons' abilities to their ability id.
CREATE TABLE pokemon_ability_id (
	pokedex_number INTEGER,
	ability_id INTEGER,
	FOREIGN KEY(pokedex_number) REFERENCES pokemon_3NF(pokedex_number),
	FOREIGN KEY(ability_id) REFERENCES pokemon_abilities(ability_id)
);

INSERT INTO pokemon_ability_id (pokedex_number, ability_id)
SELECT abilities.pokedex_number, pokemon_abilities.ability_id
FROM abilities
LEFT JOIN pokemon_abilities ON
	abilities.ability = pokemon_abilities.ability;

--- Dropping type_ability_id from main pokemon table
ALTER TABLE pokemon_3NF
DROP COLUMN type_combination_id;

--- Dropping helper tables
DROP TABLE pokemon_1NF;
DROP TABLE pokemon_2NF;
DROP TABLE abilities;
DROP TABLE types;
DROP TABLE split_abilities;
DROP TABLE imported_pokemon_data;

/* Calling/dropping tables
SELECT * FROM pokemon_type_id
SELECT * FROM pokemon_ability_id
SELECT * FROM pokemon_3NF
SELECT * FROM type_combinations
SELECT * FROM weaknesses
SELECT * FROM pokemon_abilities
SELECT * FROM pokemon_ability_id

DROP TABLE pokemon_type_id;
DROP TABLE pokemon_ability_id;
DROP TABLE pokemon_abilities;
DROP TABLE pokemon_3NF;
DROP TABLE type_combinations;
DROP TABLE weaknesses;
*/