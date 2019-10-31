--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS GameProperty;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Property;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY, 
	time timestamp,
	finished boolean
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY, 
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	score integer,
	location integer,
	cash integer
	);

CREATE TABLE Property (
	ID integer PRIMARY KEY,
	name varchar(50),
	color varchar(50),
	price integer,
	rentBase integer,
	rent1House integer,
	rent2Houses integer,
	rent3Houses integer,
	rent4Houses integer,
	rentHotel integer,
	housePrice integer
	);

CREATE TABLE GameProperty (
	gameID integer REFERENCES Game(ID),
	playerID integer REFERENCES Player(ID),
	propertyID integer REFERENCES Property(ID),
	houses integer,
	mortgage boolean
	);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON Property TO PUBLIC;
GRANT SELECT ON GameProperty TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00', TRUE);
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00', TRUE);
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00', TRUE);
INSERT INTO Game VALUES (4, '2021-09-18 12:13:30', FALSE);

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');

INSERT INTO Property VALUES (1, 'Mediterranean Avenue', 'brown', 60, 2, 10, 30, 90, 160, 250, 50);
INSERT INTO Property VALUES (2, 'Oriental Avenue', 'light blue', 100, 6, 30, 90, 270, 400, 550, 50);
INSERT INTO Property VALUES (3, 'St. Charles Place', 'pink', 140, 10, 50, 150, 450, 625, 750, 100);
INSERT INTO Property VALUES (4, 'Tennessee Avenue', 'orange', 180, 14, 70, 200, 550, 750, 950, 100);
INSERT INTO Property VALUES (5, 'Indiana Avenue', 'red', 220, 18, 90, 250, 700, 875, 1050, 150);

INSERT INTO PlayerGame VALUES (1, 1, 0.00, 0, 0);
INSERT INTO PlayerGame VALUES (1, 2, 0.00, 0, 0);
INSERT INTO PlayerGame VALUES (1, 3, 2350.00, 0, 2000);
INSERT INTO PlayerGame VALUES (2, 1, 1000.00, 0, 500);
INSERT INTO PlayerGame VALUES (2, 2, 0.00, 0, 0);
INSERT INTO PlayerGame VALUES (2, 3, 500.00, 0, 250);
INSERT INTO PlayerGame VALUES (3, 2, 0.00, 0, 0);
INSERT INTO PlayerGame VALUES (3, 3, 5500.00, 0, 4000);
INSERT INTO PlayerGame VALUES (4, 1, NULL, 12, 100);
INSERT INTO PlayerGame VALUES (4, 2, NULL, 4, 785);
INSERT INTO PlayerGame VALUES (4, 3, NULL, 7, 320);

INSERT INTO GameProperty VALUES (4, 1, 3, 0, FALSE);
INSERT INTO GameProperty VALUES (4, 2, 1, 1, FALSE);
INSERT INTO GameProperty VALUES (4, 1, 2, 2, FALSE);
INSERT INTO GameProperty VALUES (4, 3, 5, 0, TRUE);
INSERT INTO GameProperty VALUES (4, 3, 4, 3, FALSE);