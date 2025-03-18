INSERT INTO `role` (name) VALUES
("Admin"),
("Player"),
("Champion"),
("NPC");

INSERT INTO `character` (name,password,age,circles,description,role_id)
VALUES
("Origin","bruh",0,100,"The original god (its me lol)",1),
("Oscar","bruh",21,3,"Vesnický pleb. Jako malý pracoval na poli a hrabal se v zemině. Ve 20 se u něj objevily znaky magie po útoku na jeho vesnice. Jeho rodina byla zavražděna bandity a většina z nich i jejich vůdce utekli dřív než se Oscar vrátil z rybaření. Od té chvíle hledá vůdce pirátů.Avšak při jeho cestě se naskytly obtíže, přátel a dokonce souboje s bohy.",2),
("Greneha","bruh",18,4,"Původně člověk, přítomně mutant. Své dětství bezstarostně trávila v Nikolijské republice, avšak život se jí změnil poté, co objevila jeskyň vedoucí do podzemní pevnosti, kde podstoupila mutaci. Její mysl je naplněna neznámou nenávistí a touhou najít způsob, jakým se vyléčí její kletba.",2),
("Eryn","bruh",80,4,"Mladý elf na cestách po světě. Už od 20 let ho zaujala existence bohů a historie světa. Během jeho cesty přes Skatashian byl přepaden místním kmenem, před kterým byl zachráněn andělem lásky jménem Iroxid. Chvíli spolu cestovali za stejným cílem, přičemž Eryn nabyl spojení s bohyní Lásky. Po dobrodružné cestě s Iroxidem se rozloučili a cestovali po svých osách.",2);

INSERT INTO `type` (name) VALUES
("misc"),
("weapon"),
("shield"),
("armor"),
("headwear"),
("gloves"),
("accessory"),
("bag"),
("consumable"),
("key item"),
("material");