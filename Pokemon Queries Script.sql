#Basic inner join with the Pokemon's characteristics and st
SELECT p.`Name`, p.`National Number`, p.`Regional Number`, bs.`HP`
	FROM Pokemon p
	INNER JOIN `Base Stats`bs ON bs.`National Number` = p.`National Number`;


#WHERE and ORDER BY clauses. Shows Top 6 Pokemon with high HP and their basic characteristics
SELECT Pokemon.`National Number`, Pokemon.Name, `Base Stats`.HP
	FROM Pokemon
	JOIN `Base Stats` ON Pokemon.`National Number` = `Base Stats`.`National Number`
	WHERE `Base Stats`.HP > 150
	ORDER BY `Base Stats`.Speed DESC LIMIT 6;

#best special attackers
SELECT p.`National Number`, p.`Name`, bs.`Attack`, bs.`Special Attack` FROM Pokemon p
	JOIN `Base Stats` bs ON p.`National Number` = bs.`National Number`
	WHERE `Special Attack` > `Attack`
	ORDER BY `Special Attack` DESC;
	

#Multiple joins, shows Pokemon and moves
#Future potential for a stored function showing all moves in one row
SELECT  p.`National Number`, p.Name, m.`Move Name` FROM `Pokemon Moves` pm
	JOIN Pokemon p ON pm.`National Number` = p.`National Number`
	JOIN Moves m ON m.`Move ID` = pm.`Move ID`
	ORDER BY p.`National Number` ASC;
	

#This shows type effectiveness for water types. Where no type is matched, assume normal damage
SELECT `Type Damage`.`Damage Multiplier`, `Type`.`Type Name`
FROM `Type Damage`
JOIN `Type` ON `Type Damage`.`Damaged Type ID` = `Type`.`Type ID`
WHERE `Attacker Type ID` = 12;


#Demonstrates GROUP BY and HAVING, also showing underrepresentation of ghost types
SELECT p.`National Number`, p.`Name`, t.`Type Name`
	FROM `Pokemon` p
	JOIN `Pokemon Types` pt ON p.`National Number` = pt.`National Number`
	JOIN `Type`t ON pt.`Type ID` = t.`Type ID`
	JOIN `Base Stats` bs ON p.`National Number` = bs.`National Number`
	GROUP BY p.`National Number`
	HAVING t.`Type Name` = 'Ghost';
	

#Multi-table query showing off how many tables we can use at once
SELECT p.`National Number`, p.`Name`, t.`Type Name`, bs.`HP`, bs.`Attack`, bs.`Defence`,
		bs.`Special Attack`, bs.`Special Defence`, bs.`Speed`
	FROM `Pokemon` p
	JOIN `Pokemon Types` pt ON p.`National Number` = pt.`National Number`
	JOIN `Type` t ON pt.`Type ID` = t.`Type ID`
	JOIN `Base Stats` bs ON p.`National Number` = bs.`National Number`
	ORDER BY p.`National Number`;

