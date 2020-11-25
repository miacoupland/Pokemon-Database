CREATE TABLE Pokemon (
	`National Number` INT,
	`Regional Number` INT,
	`Name` VARCHAR(11), #Longest is fletchinder at 11 chars
	`Height (ft)` FLOAT,
	`Weight (kg)` FLOAT,
	PRIMARY KEY(`National Number`)
);

CREATE TABLE `Base Stats` (
	`National Number` INT,
	`HP` INT,
	`Attack` INT,
	`Defence` INT,
	`Special Attack` INT,
	`Special Defence` INT,
	`Speed` INT,
	PRIMARY KEY(`National Number`),
	FOREIGN KEY(`National Number`) REFERENCES Pokemon(`National Number`)
);

CREATE TABLE `Ability` (
	`Ability ID` INT,
	`Ability Name` VARCHAR(20),
	PRIMARY KEY (`Ability ID`));
	
CREATE TABLE Type (
	`Type ID` INT,
	`Type Name` VARCHAR(10),
	PRIMARY KEY (`Type ID`));

CREATE TABLE `Evolution` (
	`National Number` INT,
	`Evolves From` INT,
	`Evolves At Level` INT,
	`Evolves Into` INT,
	`Alternate Forms` BOOL,#True if one or more, so can run query to see what they are
	PRIMARY KEY(`National Number`),
	FOREIGN KEY(`National Number`) REFERENCES Pokemon(`National Number`),
	FOREIGN KEY(`Evolves From`) REFERENCES Pokemon(`National Number`),
	FOREIGN KEY(`Evolves Into`) REFERENCES Pokemon(`National Number`),
);

CREATE TABLE `Alternate Forms` (
	`National Number` INT,
	`Alternate Form ID` INT,
	`Alternate Form Name` VARCHAR(30),
	`Alternate Form Type` INT, #1 mega, 2 alolan, 3 gigantamax, 4 other (cosplay, etc)
	`Item Required` VARCHAR(20),
	`Height (ft)` FLOAT,
	`Weight (kg)` FLOAT,
	PRIMARY KEY (`Alternate Form ID`),
	FOREIGN KEY (`National Number`) REFERENCES Pokemon(`National Number`)
);

CREATE TABLE `Pokemon Ability` (
	`National Number` INT,
	`Ability ID` INT,
	`Hidden Ability` BOOL,
	FOREIGN KEY (`National Number`) REFERENCES Pokemon(`National Number`),
	FOREIGN KEY (`Ability ID`) REFERENCES Ability(`Ability ID`));


CREATE TABLE `Pokemon Types` (
	`National Number` INT,
	`Type ID` INT,
	`Subtype ID` INT,
	PRIMARY KEY (`National Number`),
	FOREIGN KEY (`National Number`) REFERENCES `Pokemon`(`National Number`),
	FOREIGN KEY (`Type ID`) REFERENCES Type(`Type ID`),
	FOREIGN KEY (`Subtype ID`) REFERENCES Type(`Type ID`)
);

CREATE TABLE `Type Damage` (
	`Damaged Type ID` INT,
	`Attacker Type ID` INT,
	`Damage Multiplier` FLOAT,
	FOREIGN KEY (`Damaged Type ID`) REFERENCES Type(`Type ID`),
	FOREIGN KEY (`Attacker Type ID`) REFERENCES Type(`Type ID`) );

CREATE TABLE `Moves` (
	`Type ID` INT,
	`Move ID` INT,
	`Move Name` VARCHAR(30),
	`Move Category` VARCHAR(10),
	`Move Power` INT,
	`Move PP` INT,
	`Move Accuracy` INT,
	PRIMARY KEY (`Move ID`),
	FOREIGN KEY (`Type ID`) REFERENCES Type(`Type ID`)
);#All Pokemon moves added from a CSV

CREATE TABLE `Pokemon Moves` (
	`National Number` INT,
	`Move ID` INT,
	FOREIGN KEY (`Move ID`) REFERENCES Moves(`Move ID`)
);