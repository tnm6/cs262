-- Example queries for monopoly.sql database
-- Completed for Lab 8, CS 262

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


-- Exercise 8.2
-- a. Retrieve all The King's game scores in decreasing order.
-- SELECT score
-- FROM PlayerGame, Player
-- WHERE Player.name = 'The King'
--   AND Player.ID = PlayerGame.playerID
-- ORDER BY score DESC;

-- b. Retrieve the name of the winner of the game played on 2006-06-28 13:20:00.
-- SELECT Player.name
-- FROM Player, PlayerGame, Game
-- WHERE Game.ID = PlayerGame.gameID
--   AND Player.ID = PlayerGame.playerID
--   AND PlayerGame.score = (
--                           SELECT MAX(score)
--                           FROM PlayerGame, Game
--                           WHERE Game.time = '2006-06-28 13:20:00'
--                             AND PlayerGame.gameID = game.ID
--                             AND Game.finished = TRUE
--                          );

-- c. So what does that P1.ID < P2.ID clause do in the last example query?
-- It prevents the query from displaying duplicates. Since the SELECT query is only looking to display one instance of the shared name, checking that P1's ID is less than (distinct from) P2's ID is sufficient for this.

-- d. The query that joined the Player table to itself seems rather contrived. Can you think of a realistic situation in which you’d want to join a table to itself?
-- It is practical when you are looking to compare two different entries in the same table, such as comparing the salaries of two different employees.