-- Exercise 8.1 (Single Table Queries)
-- a. Retrieve a list of all the games, ordered by date with the most recent game coming first.
-- SELECT *
-- FROM Game
-- ORDER BY time ASC;

-- b. Retrieve all the games that occurred in the past week.
-- SELECT *
-- FROM Game
-- WHERE time > (NOW() - interval '7 days');

-- c. Retrieve a list of players who have (non-NULL) names.
-- SELECT *
-- FROM Player
-- WHERE name IS NOT NULL;

-- d. Retrieve a list of IDs for players who have some game score larger than 2000.
-- SELECT DISTINCT playerID
-- FROM PlayerGame
-- WHERE score > 2000;

-- e. Retrieve a list of players who have GMail accounts.
-- SELECT *
-- FROM Player
-- WHERE emailAddress LIKE '%gmail%';