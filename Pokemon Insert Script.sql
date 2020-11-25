INSERT INTO Pokemon
VALUES (1, 1, 'Bulbasaur', 2.04, 6.9),
	(2, 2, 'Ivysaur', 3.03, 13.0),
	(3, 3, 'Venusaur', 6.07, 100.0),
	(4,4, 'Charmander', 2.00, 8.5),
	(5, 5, 'Charmeleon', 3.07, 19.0),
	(6, 6, 'Charizard', 5.07, 90.5),
	(7, 7, 'Squirtle', 1.08, 9.0),
	(8, 8, 'Wartortle', 3.03, 22.5),
	(9, 9, 'Blastoise', 5.03, 85.8);


INSERT INTO `Base Stats` 
VALUES (1, 45, 49, 49, 65, 65, 45),
	(2, 60, 62, 63, 80, 80, 60),
	(3, 80, 82, 83, 100, 100, 80),
	(4, 39, 52, 43, 60, 50, 65),
	(5, 58, 64, 58, 80, 65, 80),
	(6, 78, 84, 78, 109, 85, 100),
	(7, 44, 48, 65, 50, 64, 43),
	(8, 59, 63, 80, 65, 80, 58),
	(9, 79, 83, 100, 85, 105, 78);
	

INSERT INTO `Type`
	VALUES (1, 'Normal'),
	(2, 'Fighting'),
	(3, 'Flying'),
	(4, 'Poison'),
	(5, 'Ground'),
	(6, 'Rock'),
	(7, 'Bug'),
	(8, 'Ghost'),
	(9, 'Steel'),
	(10, 'Fire'),
	(11, 'Water'),
	(12, 'Grass'),
	(13, 'Electric'),
	(14, 'Psychic'),
	(15, 'Ice'),
	(16, 'Dragon'),
	(17, 'Dark'),
	(18, 'Fairy');


#Adds typing for each Pokemon
INSERT INTO `Pokemon Types`
	VALUES (1, 12, NULL),
	(2, 12, 4),
	(3, 12, 4),
	(4, 10, NULL),
	(5, 10, NULL),
	(6, 10, 3),
	(7, 11, NULL),
	(8, 11, NULL),
	(9, 11, NULL);


#Other alternate forms added through CSV
INSERT INTO `Alternate Forms` 
VALUES (1, 1, 'Mega Venusaur', 1, 'Venusaurite', 7.10, 100.0),
	(9, 4, 'Mega Blastoise', 1, 'Blastoisinite', 1.6, 101.1),
	(6, 2, 'Mega Charizard X', 1, 'Charizardite X', 1.7, 110.5),
	(6, 3, 'Mega Charizard Y', 1, 'Charizardite Y', 1.7, 100.5), #Mega Evolutions added
	(1, 80, 'Gigantamax Venusaur', 3, 'Dynamax Band', 78.09, NULL),
	(6, 81, 'Gigantamax Charizard', 3, 'Dynamax Band', 91.10, NULL),
	(9, 82, 'Gigantamax Blastoise', 3, 'Dynamax Band', 82.00, NULL);
	#Null values for Gigantamax weights as they're unknown


#Assumes that Abilities have already been CSV imported into 'Ability'
INSERT INTO `Pokemon Ability`
	VALUES (3, 142, FALSE),
	(3, 24, TRUE),
	(2, 24, TRUE),
	(2, 142, FALSE),
	(1, 142, FALSE),
	(1, 24, TRUE);
#Bulbsaur line with Chlorophyll and Overgrow


INSERT INTO `Evolution` (`National Number`, `Evolves At Level`, `Evolves Into`)
VALUES (1, 16, 2),
	(4, 16, 5),
	(7, 16, 8);#Inputting data for the 3 base starters
	

INSERT INTO `Evolution` (`National Number`, `Evolves From`, `Evolves At Level`,
	`Evolves Into`)
VALUES (2, 1, 32, 3),
	(5, 4, 32, 6),
	(8, 7, 32, 9);#Inputting for the middle kids
	

INSERT INTO `Evolution` (`National Number`, `Evolves From`, `Alternate Forms`)
VALUES (3, 2, TRUE),
	(6, 5, TRUE),
	(9, 8, TRUE);#inputting for final evolutions. all have at least 1 mega.
	#looking at you, Charizard
	

INSERT INTO `Pokemon Moves`
VALUES (1, 33),
	(4, 33),
	(7, 33),
	(1, 39),
	(4, 39),
	(7, 39);  #in this all the starters now know tackle and tail whip
