CREATE TABLE MenuItems
(MenuItemID INT IDENTITY(1,1) PRIMARY KEY
,ItemName NVARCHAR(250)
,ItemDescription NVARCHAR(500)
,ItemValue DECIMAL(4,2))

CREATE TABLE MenuDrinks
(MenuDrinkID INT IDENTITY(1,1) PRIMARY KEY
,DrinkName NVARCHAR(250)
,DrinkDescription NVARCHAR(500)
,DrinkValue DECIMAL(4,2)
,IsAlcoholic BIT)

INSERT INTO MenuItems
	(ItemName, ItemDescription, ItemValue)
VALUES
	('Sunny Side Up and Potatoes', 'Sunny side up eggs with a side of potatoes, and your choice of beans, or toast with butter', '10.99'),
	('Morning Slider and Cakes', 'a bacon and avocado hamburger with sunny side up eggs, and your choice of fresh toast, or two pancakes', '14.99'),
	('Wellness Wrap', 'Scrambled egg whites, sauteed spinach, red bell pepper, and Feta cheese wrapped in a spinach tortilla.', '09.99'),
	('Acai Bowl', 'Acai berry sorbet topped with fresh strawberries, blueberries, bananas, granola, shredded coconut, and honey.', '09.99')

INSERT INTO MenuDrinks
	(DrinkName, DrinkDescription, DrinkValue, IsAlcoholic)
VALUES
	('Coffee', 'A good cup of morning brew.', '02.49', 0),
	('Orange Juice', 'A glass of orange juice', '1.35', 0),
	('Orange Soda', 'A glass of Orange Soda', '01.99', 0),
	('Gatorade', 'A glass of Gatorade', '02.35', 0),
	('Pepsi', 'A glass of Pepsi', '01.99', 0),
	('Seven Up', 'A glass of Seven Up Soda', '01.99', 0),
	('Pina Colada', 'ice, frozen pineapple, juice, coconut cream, and the white and dark rums into a blender. Blend until smooth and frosty.', '07.99', 1),
	('Jack Rose', 'A Jack Rose is a cocktail containing applejack, grenadine, and lemon or lime juice.', '09.99', 1)