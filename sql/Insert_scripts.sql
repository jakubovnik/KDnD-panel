INSERT INTO kdnd.role (name) VALUES
("Admin"),
("Player"),
("NPC");

INSERT INTO kdnd.character (name,password,age,circles,description,role_id)
VALUES
("Origin","bruh",0,100,"The original god (its me lol)",1),
("Oscar","Doom",21,3,"Vesnický pleb. Jako malý pracoval na poli a hrabal se v zemině. Ve 20 se u něj objevily znaky magie po útoku na jeho vesnice. Jeho rodina byla zavražděna bandity a většina z nich i jejich vůdce utekli dřív než se Oscar vrátil z rybaření. Od té chvíle hledá vůdce pirátů.Avšak při jeho cestě se naskytly obtíže, přátel a dokonce souboje s bohy.",2);

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