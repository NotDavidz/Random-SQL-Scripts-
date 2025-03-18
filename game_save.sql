CREATE DATABASE GameDB;
GO
USE GameDB;
GO

-- Player
CREATE TABLE Players (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(50),
    level INT DEFAULT 1,
    experience INT DEFAULT 0
);
GO

-- Inventory
CREATE TABLE Inventory (
    id INT IDENTITY(1,1) PRIMARY KEY,
    player_id INT,
    item_name NVARCHAR(50),
    quantity INT DEFAULT 1,
    -- Delete from other table if deleted
    FOREIGN KEY (player_id) REFERENCES Players(id) ON DELETE CASCADE
);
GO

-- Adding players
INSERT INTO Players (name, level, experience) VALUES ('NotDavid', 5, 1200);
INSERT INTO Players (name, level, experience) VALUES ('tacocaT', 3, 800);
GO

-- Adding stuff to inventory
-- NotDavid
INSERT INTO Inventory (player_id, item_name) VALUES (1, 'Sword');
INSERT INTO Inventory (player_id, item_name, quantity) VALUES (1, 'Potion', 3);
-- Tacocat
INSERT INTO Inventory (player_id, item_name) VALUES (2, 'Shield');
INSERT INTO Inventory (player_id, item_name) VALUES (2, 'Axe');
GO

--Joining 
SELECT * FROM Inventory
INNER JOIN Players ON Inventory.player_id = Players.id

-- Retrieve all players
SELECT * FROM Players;
GO

-- Ret. inventory for somebody 
SELECT i.item_name, i.quantity 
FROM Inventory i
JOIN Players p ON i.player_id = p.id
WHERE p.name = 'NotDavid';
GO

-- Updating smth 
UPDATE Players 
SET level = 6, experience = 1500 
WHERE name = 'NotDavid';
GO

-- Delete player from table 
DELETE FROM Players WHERE name = 'tacocaT';
GO

-- Retrieve all players
SELECT * FROM Players;
GO

DROP TABLE Players;
DROP TABLE Inventory;
GO