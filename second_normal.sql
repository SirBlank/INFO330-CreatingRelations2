--- SECOND NORMAL FORM ---

-- creating a 'pokemon_2NF' to define variable types
CREATE TABLE pokemon_2NF AS
SELECT *
FROM pokemon_1NF;

CREATE TABLE poke_temp (
	   pokedex_number INTEGER,
	   name TEXT,
	   ability TEXT,
	   against_bug REAL,
	   against_dark REAL,
	   against_dragon REAL,
	   against_electric REAL,
	   against_fairy REAL,
	   against_fight REAL,
	   against_fire REAL,
	   against_flying REAL,
	   against_ghost REAL,
	   against_grass REAL,
	   against_ground REAL,
	   against_ice REAL,
	   against_normal REAL,
	   against_poison REAL,
	   against_psychic REAL,
	   against_rock REAL,
	   against_steel REAL,
	   against_water REAL,
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
	   type1 TEXT,
	   type2 TEXT,
	   weight_kg REAL,
	   generation INTEGER,
	   is_legendary INTEGER
);
INSERT INTO poke_temp SELECT * FROM pokemon_2NF;

DROP TABLE pokemon_2NF;

ALTER TABLE poke_temp
RENAME TO pokemon_2NF;

-- creating 'abilities' table to store pokedex_number and each pokemon's abilities, allowing us to remove the 'ability' column from the main table.
CREATE TABLE abilities AS
SELECT pokedex_number, ability
FROM pokemon_2NF;

ALTER TABLE pokemon_2NF
DROP COLUMN ability;

CREATE TABLE temp_2NF AS
SELECT DISTINCT *
FROM pokemon_2NF;

DROP TABLE pokemon_2NF;

ALTER TABLE temp_2NF
RENAME TO pokemon_2NF;

-- defining primary key for 'pokemon_2NF'
CREATE TABLE poke_temp (
	   pokedex_number INTEGER PRIMARY KEY,
	   name TEXT,
	   against_bug REAL,
	   against_dark REAL,
	   against_dragon REAL,
	   against_electric REAL,
	   against_fairy REAL,
	   against_fight REAL,
	   against_fire REAL,
	   against_flying REAL,
	   against_ghost REAL,
	   against_grass REAL,
	   against_ground REAL,
	   against_ice REAL,
	   against_normal REAL,
	   against_poison REAL,
	   against_psychic REAL,
	   against_rock REAL,
	   against_steel REAL,
	   against_water REAL,
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
	   type1 TEXT,
	   type2 TEXT,
	   weight_kg REAL,
	   generation INTEGER,
	   is_legendary INTEGER
);

INSERT INTO poke_temp SELECT * FROM pokemon_2NF;

DROP TABLE pokemon_2NF;

ALTER TABLE poke_temp
RENAME TO pokemon_2NF;
	
-- creating table 'types' to store types for each pokemon, allowing us to remove column 'type1' and 'type2' from the main table.
CREATE TABLE types AS
SELECT pokedex_number, type1, type2
FROM pokemon_2NF;

ALTER TABLE pokemon_2NF
DROP COLUMN type1;

ALTER TABLE pokemon_2NF
DROP COLUMN type2;

-- Creating 'weaknesses' table to eliminate against_type columns from the main table.
CREATE TABLE weaknesses (
	pokedex_number INTEGER,
	against_type TEXT,
	multiplier REAL
);

INSERT INTO weaknesses (pokedex_number, against_type, multiplier)
SELECT pokedex_number, 'bug', against_bug AS multiplier FROM pokemon_2NF
UNION ALL
SELECT pokedex_number, 'dark', against_dark AS multiplier FROM pokemon_2NF
UNION ALL
SELECT pokedex_number, 'dragon', against_dragon AS multiplier FROM pokemon_2NF
UNION ALL
SELECT pokedex_number, 'electric', against_electric AS multiplier FROM pokemon_2NF
UNION ALL
SELECT pokedex_number, 'fairy', against_fairy AS multiplier FROM pokemon_2NF
UNION ALL
SELECT pokedex_number, 'fight', against_fight AS multiplier FROM pokemon_2NF
UNION ALL
SELECT pokedex_number, 'fire', against_fire AS multiplier FROM pokemon_2NF
UNION ALL
SELECT pokedex_number, 'flying', against_flying AS multiplier FROM pokemon_2NF
UNION ALL
SELECT pokedex_number, 'ghost', against_ghost AS multiplier FROM pokemon_2NF
UNION ALL
SELECT pokedex_number, 'grass', against_grass AS multiplier FROM pokemon_2NF
UNION ALL
SELECT pokedex_number, 'ground', against_ground AS multiplier FROM pokemon_2NF
UNION ALL
SELECT pokedex_number, 'ice', against_ice AS multiplier FROM pokemon_2NF
UNION ALL
SELECT pokedex_number, 'normal', against_normal AS multiplier FROM pokemon_2NF
UNION ALL
SELECT pokedex_number, 'poison', against_poison AS multiplier FROM pokemon_2NF
UNION ALL
SELECT pokedex_number, 'psychic', against_psychic AS multiplier FROM pokemon_2NF
UNION ALL
SELECT pokedex_number, 'rock', against_rock AS multiplier FROM pokemon_2NF
UNION ALL
SELECT pokedex_number, 'steel', against_steel AS multiplier FROM pokemon_2NF
UNION ALL
SELECT pokedex_number, 'water', against_water AS multiplier FROM pokemon_2NF
ORDER BY pokedex_number ASC;

ALTER TABLE pokemon_2NF
DROP COLUMN against_bug;

ALTER TABLE pokemon_2NF
DROP COLUMN against_dark;

ALTER TABLE pokemon_2NF
DROP COLUMN against_dragon;

ALTER TABLE pokemon_2NF
DROP COLUMN against_electric;

ALTER TABLE pokemon_2NF
DROP COLUMN against_fairy;

ALTER TABLE pokemon_2NF
DROP COLUMN against_fight;

ALTER TABLE pokemon_2NF
DROP COLUMN against_fire;

ALTER TABLE pokemon_2NF
DROP COLUMN against_flying;

ALTER TABLE pokemon_2NF
DROP COLUMN against_ghost;

ALTER TABLE pokemon_2NF
DROP COLUMN against_grass;

ALTER TABLE pokemon_2NF
DROP COLUMN against_ground;

ALTER TABLE pokemon_2NF
DROP COLUMN against_ice;

ALTER TABLE pokemon_2NF
DROP COLUMN against_normal;

ALTER TABLE pokemon_2NF
DROP COLUMN against_poison;

ALTER TABLE pokemon_2NF
DROP COLUMN against_psychic;

ALTER TABLE pokemon_2NF
DROP COLUMN against_rock;

ALTER TABLE pokemon_2NF
DROP COLUMN against_steel;

ALTER TABLE pokemon_2NF
DROP COLUMN against_water;

-------------------------


/* Calling/dropping tables
SELECT * FROM abilities;
SELECT * FROM pokemon_2NF;
SELECT * FROM weaknesses;
SELECT * FROM imported_pokemon_data;

DROP TABLE abilities;
DROP TABLE types;
DROP TABLE weaknesses;
DROP TABLE pokemon_2NF;
*/
