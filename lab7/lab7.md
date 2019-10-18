# Lab 7
## Nathan Meyer (tnm6)
### Exercise 7.1 - Modified Schema

Player(ID, emailAddress, name)
PlayerGame(gameID, playerID, location, cash)
Game(ID, time, finished)
Property(ID, name, color, price, rentBase, rent1House, rent2Houses, rent3Houses, rent4Houses, rentHotel, housePrice)
GameProperty(gameID, playerID, propertyID, houses, mortgage)