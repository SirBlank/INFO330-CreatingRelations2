--- EXTRA CREDIT 1 ---

-- Adding new pokemon 'Huskichu'
INSERT INTO pokemon_3NF (
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
	is_legendary
)
VALUES (
	'Huskichu',
	200,
	5120,
	70,
	625,
	1,
	'Dub Pokémon',
	200,
	1059860,
	1.0,
	200,
	50.0,
	200,
	200,
	200,
	30.0,
	10,
	1
);

-- Adding new abilities
INSERT INTO pokemon_abilities (ability)
VALUES ('Procrastination');

INSERT INTO pokemon_abilities (ability)
VALUES ('Dubbing');

-- Inserting Huskichu's abilities
INSERT INTO pokemon_ability_id
VALUES (
	(SELECT pokedex_number FROM pokemon_3NF WHERE name = 'Huskichu'),
	(SELECT ability_id FROM pokemon_abilities WHERE ability = 'Procrastination')
);

INSERT INTO pokemon_ability_id
VALUES (
	(SELECT pokedex_number FROM pokemon_3NF WHERE name = 'Huskichu'),
	(SELECT ability_id FROM pokemon_abilities WHERE ability = 'Dubbing')
);

-- Adding new type 'mascot'
INSERT INTO type_combinations (type_1, type_2)
VALUES ('mascot', '');

-- Adding type 'mascot' weaknesses
INSERT INTO weaknesses
VALUES ('bug', 0.5, (SELECT type_combination_id FROM type_combinations WHERE type_1 = 'mascot' AND type_2 = ''));

INSERT INTO weaknesses
VALUES ('dark', 0.5, (SELECT type_combination_id FROM type_combinations WHERE type_1 = 'mascot' AND type_2 = ''));

INSERT INTO weaknesses
VALUES ('dragon', 0.5, (SELECT type_combination_id FROM type_combinations WHERE type_1 = 'mascot' AND type_2 = ''));

INSERT INTO weaknesses
VALUES ('electric', 0.5, (SELECT type_combination_id FROM type_combinations WHERE type_1 = 'mascot' AND type_2 = ''));

INSERT INTO weaknesses
VALUES ('fairy', 0.5, (SELECT type_combination_id FROM type_combinations WHERE type_1 = 'mascot' AND type_2 = ''));

INSERT INTO weaknesses
VALUES ('fight', 0.5, (SELECT type_combination_id FROM type_combinations WHERE type_1 = 'mascot' AND type_2 = ''));

INSERT INTO weaknesses
VALUES ('fire', 0.5, (SELECT type_combination_id FROM type_combinations WHERE type_1 = 'mascot' AND type_2 = ''));

INSERT INTO weaknesses
VALUES ('flying', 0.5, (SELECT type_combination_id FROM type_combinations WHERE type_1 = 'mascot' AND type_2 = ''));

INSERT INTO weaknesses
VALUES ('ghost', 0.5, (SELECT type_combination_id FROM type_combinations WHERE type_1 = 'mascot' AND type_2 = ''));

INSERT INTO weaknesses
VALUES ('grass', 0.5, (SELECT type_combination_id FROM type_combinations WHERE type_1 = 'mascot' AND type_2 = ''));

INSERT INTO weaknesses
VALUES ('ground', 0.5, (SELECT type_combination_id FROM type_combinations WHERE type_1 = 'mascot' AND type_2 = ''));

INSERT INTO weaknesses
VALUES ('ice', 0.5, (SELECT type_combination_id FROM type_combinations WHERE type_1 = 'mascot' AND type_2 = ''));

INSERT INTO weaknesses
VALUES ('normal', 0.5, (SELECT type_combination_id FROM type_combinations WHERE type_1 = 'mascot' AND type_2 = ''));

INSERT INTO weaknesses
VALUES ('psychic', 0.5, (SELECT type_combination_id FROM type_combinations WHERE type_1 = 'mascot' AND type_2 = ''));

INSERT INTO weaknesses
VALUES ('rock', 0.5, (SELECT type_combination_id FROM type_combinations WHERE type_1 = 'mascot' AND type_2 = ''));

INSERT INTO weaknesses
VALUES ('steel', 0.5, (SELECT type_combination_id FROM type_combinations WHERE type_1 = 'mascot' AND type_2 = ''));

INSERT INTO weaknesses
VALUES ('water', 0.5, (SELECT type_combination_id FROM type_combinations WHERE type_1 = 'mascot' AND type_2 = ''));

-- Inserting Huskichu's type
INSERT INTO pokemon_type_id
VALUES (
	(SELECT pokedex_number FROM pokemon_3NF WHERE name = 'Huskichu'),
	(SELECT type_combination_id FROM type_combinations WHERE type_1 = 'mascot' AND type_2 = ''));
	



-- Adding new pokemon 'Cougarite'
INSERT INTO pokemon_3NF (
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
	is_legendary
)
VALUES (
	'Cougarite',
	1,
	5120,
	70,
	625,
	99,
	'Dub Pokémon',
	1,
	1059860,
	1.0,
	1,
	50.0,
	0,
	1,
	1,
	30.0,
	10,
	0
);

-- Adding new ability 'Slow Attack'
INSERT INTO pokemon_abilities (ability)
VALUES ('Slow Attack');

-- Inserting Cougarite's abilities
INSERT INTO pokemon_ability_id
VALUES (
	(SELECT pokedex_number FROM pokemon_3NF WHERE name = 'Cougarite'),
	(SELECT ability_id FROM pokemon_abilities WHERE ability = 'Slow Attack')
);

-- Inserting Cougarite's type
INSERT INTO pokemon_type_id
VALUES (
	(SELECT pokedex_number FROM pokemon_3NF WHERE name = 'Cougarite'),
	(SELECT type_combination_id FROM type_combinations WHERE type_1 = 'mascot' AND type_2 = ''));