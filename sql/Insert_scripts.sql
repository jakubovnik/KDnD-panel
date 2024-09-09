INSERT INTO kdnd.role (name) VALUES
("Admin"),
("Player"),
("NPC");

INSERT INTO kdnd.character (name,password,age,circles,description,role_id)
VALUES
("Origin","isTheAnswer",0,100,"The original god (its me lol)",1);

INSERT INTO kdnd.type (name) VALUES
("misc"),
("weapon"),
("shield"),
("armor"),
("headwear"),
("gloves"),
("accessory"),
("consumable"),
("key item"),
("bag"),
("material");