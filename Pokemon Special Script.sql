CREATE VIEW `Pokemon View`
AS SELECT p.`National Number`, p.`Name`, bs.`HP`, bs.`Attack`, bs.`Defence`,
		bs.`Special Attack`, bs.`Special Defence`, bs.`Speed`,
		pt.`Type ID`, pt.`Subtype ID`
	FROM `Pokemon` p
	JOIN `Base Stats` bs ON p.`National Number` = bs.`National Number`
	JOIN `Pokemon Types` pt ON p.`National Number` = pt.`National Number`
	JOIN `Type` t ON pt.`Type ID` = t.`Type ID`;
	
#Demonstrate a view
SELECT * FROM `Pokemon View`
ORDER BY `National Number` ASC;

##########################################################

#This stored procedure will simply select and show
#Pokemon's name, number, and speed for the top 6 fastest
DELIMITER $$
$$
CREATE PROCEDURE most_speed()
BEGIN
	SELECT p.`Name`, p.`National Number`, bs.`Speed` FROM `Pokemon` p
	JOIN `Base Stats` bs ON p.`National Number` = bs.`National Number`
	ORDER BY bs.`Speed` DESC
	LIMIT 6;
END
$$
DELIMITER ;

#Demonstrate a stored procedure
CALL most_speed();

##########################################################

CREATE FUNCTION highest_hp(Name VARCHAR(12), HP INT)
RETURNS VARCHAR(15) DETERMINISTIC
RETURN CONCAT(Name, ' ', HP);

#Demonstrate a stored function
#This stored function concatenates the HP value next to the name
SELECT highest_hp(p.`Name`, bs.`HP`) FROM `Pokemon` p
	JOIN `Base Stats` bs ON p.`National Number` = bs.`National Number`
	ORDER BY bs.`HP` DESC;

##########################################################

#Trigger to insert the national number into Evolution
#When a Pokemon is added to the generic table.
#A hint at adding in that Pokemon's evolutions
AFTER INSERT ON `Pokemon`
FOR EACH ROW
	INSERT INTO `Evolution`(`National Number`)
	VALUES
	(NEW.`National Number`);

#Trigger can be tested using this code:
INSERT INTO `Pokemon`(`National Number`, `Name`)
VALUES(495, 'Snivy');
