CREATE DATABASE  IF NOT EXISTS `kdnd` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `kdnd`;
-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: kdnd
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `character`
--

DROP TABLE IF EXISTS `character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `age` int(10) unsigned NOT NULL,
  `circles` int(10) unsigned NOT NULL,
  `description` text DEFAULT NULL,
  `money` int(10) unsigned NOT NULL DEFAULT 0,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`role_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `character_role1_idx` (`role_id`),
  CONSTRAINT `character_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character`
--

LOCK TABLES `character` WRITE;
/*!40000 ALTER TABLE `character` DISABLE KEYS */;
INSERT INTO `character` VALUES (1,'Origin','bruh',0,100,'The original god (its me lol)',6262,1),(2,'Oscar','bruh',21,3,'Vesnický pleb. Jako malý pracoval na poli a hrabal se v zemině. Ve 20 se u něj objevily znaky magie po útoku na jeho vesnice. Jeho rodina byla zavražděna bandity a většina z nich i jejich vůdce utekli dřív než se Oscar vrátil z rybaření. Od té chvíle hledá vůdce pirátů.Avšak při jeho cestě se naskytly obtíže, přátel a dokonce souboje s bohy.',1920,2),(3,'Greneha','bruh',18,4,'Původně člověk, přítomně mutant. Své dětství bezstarostně trávila v Nikolijské republice, avšak život se jí změnil poté, co objevila jeskyň vedoucí do podzemní pevnosti, kde podstoupila mutaci. Její mysl je naplněna neznámou nenávistí a touhou najít způsob, jakým se vyléčí její kletba.',670,2),(4,'Eryn','bruh',80,4,'Mladý elf na cestách po světě. Už od 20 let ho zaujala existence bohů a historie světa. Během jeho cesty přes Skatashian byl přepaden místním kmenem, před kterým byl zachráněn andělem lásky jménem Iroxid. Chvíli spolu cestovali za stejným cílem, přičemž Eryn nabyl spojení s bohyní Lásky. Po dobrodružné cestě s Iroxidem se rozloučili a cestovali po svých osách.',360,2);
/*!40000 ALTER TABLE `character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_image`
--

DROP TABLE IF EXISTS `character_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `image` mediumblob NOT NULL,
  `description` text NOT NULL DEFAULT 'image description',
  `character_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`character_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `character_image_character1_idx` (`character_id`),
  CONSTRAINT `character_image_character1` FOREIGN KEY (`character_id`) REFERENCES `character` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_image`
--

LOCK TABLES `character_image` WRITE;
/*!40000 ALTER TABLE `character_image` DISABLE KEYS */;

/*!40000 ALTER TABLE `character_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_magic`
--

DROP TABLE IF EXISTS `character_magic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_magic` (
  `character_id` int(10) unsigned NOT NULL,
  `magic_name` varchar(255) NOT NULL,
  `complexity` int(10) unsigned NOT NULL,
  `fail_rate` int(10) unsigned NOT NULL,
  `cast_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`character_id`,`magic_name`),
  CONSTRAINT `character_magic_character1` FOREIGN KEY (`character_id`) REFERENCES `character` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_magic`
--

LOCK TABLES `character_magic` WRITE;
/*!40000 ALTER TABLE `character_magic` DISABLE KEYS */;
INSERT INTO `character_magic` VALUES (2,'Chaos enhance',5,0,0),(2,'Hide object',3,8,1),(2,'Life steal',4,45,2),(3,'Brimstone skin',4,22,0),(3,'Curse projectile',0,10,1),(3,'Touch of death',5,42,1),(4,'Basic healing',1,20,1),(4,'Charm',4,65,1);
/*!40000 ALTER TABLE `character_magic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `charges` int(10) unsigned NOT NULL,
  `charges_max` int(10) unsigned NOT NULL,
  `description` text DEFAULT NULL,
  `is_deleted` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `is_favourite` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `is_equipped` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `character_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`type_id`,`character_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `inventory_type1_idx` (`type_id`),
  KEY `inventory_character1_idx` (`character_id`),
  CONSTRAINT `inventory_character1` FOREIGN KEY (`character_id`) REFERENCES `character` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `inventory_type1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,'Prsten pozornosti',7,1,0,0,'Vibruje při detekci nebezpečí vůci nositeli prstene',0,1,1,2),(2,'Gladiátor',2,1,0,0,'Meč, který zvyšuje sílu nárazu o 50%',0,1,1,2),(3,'Prsten váhy',7,1,0,0,'Jakýkoliv objek držený v ruce, na které prsten leží, je 5x těžší pro všechny, kromě vlastníka prstene',0,1,1,2),(4,'Zbroj vzdušných triků',4,1,10,10,'Zbroj, pomocí které vlastník může dělat pohyby bez pevného povrchu o který by byla potřeba se opřít',0,0,1,2),(5,'Róbě morového doktora',4,1,0,0,'Oblečení s vizáží morových doktorů ze středověké Evropy',0,1,0,2),(6,'Kožené rukavice',6,1,0,0,'Kožené rukavice',0,0,0,2),(7,'Maska morového doktora',5,1,0,0,'Maska s vizáží morových doktorů ze středověké Evropy. Obsahuje ornamenty pro lepší vizi ve tmě.',0,1,0,2),(8,'Meč transformace',2,1,5,20,'Původně meč který využíval kameny elementů, avšak po vstřebání křišťálu existence ztratil tento název. Po každém poškození živé bytosti absorbuje kámen na hrušce esenci a po dostatečném nabití se může transformovat na jakýkoliv tvar.',0,1,0,2),(9,'Meč chaosu',2,1,5,5,'Meč který napodobuje sílu bohyně chaosu. Ignoruje většinu štítů a rozbíjí magii, jakoby byla fyzický objekt.',0,1,1,2),(10,'Prsten posunu',7,1,3,3,'Posune fyzický objekt 5 metrů od nositele prstenu. Má 3 použití za souboj.',0,1,1,2),(11,'Prsten přisunutí',7,1,3,3,'Přisune fyzický objekt 5 metrů k nositeli prstene. Má 3 použití za souboj.',0,1,1,2),(12,'Prsten odpuštění',7,2,0,0,'Když nositel tohoto prstene selže ve vyvolávání kouzla, efekty selhání neproběhnou, avšak prsten se rozbije.',0,1,1,2),(13,'Odznak Gisonia',7,1,0,0,'Odznak za hrdinské činy v království Gisonie, přidělen králem Nicholasem.',1,0,0,2),(14,'Odznak gisonia',7,1,0,0,'Odznak za hrdinské činy v království Gisonie, přidělen králem Nicholasem.',1,0,0,2),(15,'Odznak respektu Gisonia',7,1,0,0,'Odznak za hrdinské činy v království Gisonie, přidělen králem Nicholasem.',0,1,1,2),(16,'nožík',2,1,0,0,'Běžný malý nožík',0,0,0,2),(17,'Lektvar regenerace',9,3,4,5,'Zrychluje regenerace. Časté používání oslabuje tělo.',0,1,0,2),(18,'Šperky',1,3,0,0,'Šperky z pokladnice původního Abzhiánu.',0,0,0,2),(19,'Batůžek',8,1,0,0,'Malý batoh',0,0,1,2),(20,'Křišťál existence',11,5,0,0,'Křišťál držící sílu existence (původně se jmenoval křišťál transformace)',0,0,0,2),(21,'Křišťál chaosu',11,27,0,0,'Křišťál držící sílu chaosu',0,0,0,2),(22,'Kus zdi',1,1,0,0,'zeď ???',0,0,0,2),(23,'Náhrdelník záchrany',7,1,3,3,'Náhrdelník chránící postavu před jistou smrtí.',0,1,1,2),(24,'Luk a šípy',2,1,20,20,'Základní luk který používá základní šípy.',0,1,1,3),(25,'Prsten odpuštění',7,1,0,0,'Když nositel tohoto prstene selže ve vyvolávání kouzla, efekty selhání neproběhnou, avšak prsten se rozbije.',0,1,1,3),(26,'Prsten nenávisti',7,1,0,0,'Prsten, který umožňuje nositeli používat magii nenávisti o jeden řád víš. ( 1 hate magic)',0,1,1,3),(27,'Křišťál řádu',11,1,0,0,'Křišťál držící sílu řádu',0,0,0,3),(28,'Smlouva Chaosu',10,1,0,0,'Síla chaosu tebou prochází. ( 2 chaos magic)',1,1,0,2),(29,'Smlouva nenávisti',10,1,0,0,'Síla nenávisti skrz tebe prochází. ( 1 hate magic)',0,1,0,3),(30,'Krátký meč',2,1,0,0,'Krátký meč. Toť vše :P',0,0,1,4),(31,'Jednoduché náčiní',1,1,0,0,'Náčiní obsahuje jednoduché nástroje. (nevim jaký přesně, kdyžtak se mě zeptej, jestli tam je zrovna to co potřebuješ)',0,0,0,4),(32,'Šipky',2,1,8,8,'Jednoduché házecí šipky. Malá ofenzivní hodnota. (a Eryn házet zas tak neumí)',0,0,1,4),(33,'Jednoduchý plášť',4,1,0,0,'Jednoduchý plášť. Přidává malou hodnotu ochrany před řezným útokem.',0,0,1,4),(34,'Smlouva Chaosu',1,1,0,0,'Síla chaosu tebou prochází. ( 2 chaos magic)',1,0,0,2),(35,'Smlouva Chaosu',1,1,0,0,'Síla chaosu tebou prochází. ( 2 chaos magic)',1,0,0,2),(36,'Kniha Life Steal',1,1,0,0,'Life steal goes brrr',0,0,0,2),(37,'Kámen co mě má rád',1,1,0,0,'(spadl mi na hlavu)',0,0,0,2),(38,'Granát Statiky',2,5,3,3,'Granát který po aktivaci zastaví pohyb 1 metr okolo sebe. Každý granát má 3 použití.',0,0,0,2),(39,'Prsten odpuštění',7,1,0,0,'Když nositel tohoto prstene selže ve vyvolávání kouzla, efekty selhání neproběhnou, avšak prsten se rozbije.',0,0,1,4),(40,'Džbán piva',9,1,10,20,'Pivo',0,1,0,2);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magic`
--

DROP TABLE IF EXISTS `magic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `origin` varchar(20) NOT NULL,
  `complexity` int(11) NOT NULL,
  `fail_rate` int(10) unsigned NOT NULL,
  `cast_time` int(11) NOT NULL,
  `rules` text DEFAULT NULL,
  `effects` text DEFAULT NULL,
  `limits` text DEFAULT NULL,
  `tags` varchar(100) DEFAULT NULL,
  `other` text DEFAULT NULL,
  `is_mod` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`,`name`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magic`
--

LOCK TABLES `magic` WRITE;
/*!40000 ALTER TABLE `magic` DISABLE KEYS */;
INSERT INTO `magic` VALUES (95,'Artus','Existence',4,50,1,'- Can only grow limbs specific to your race','- Gain another limb of your choosing','- max two times the amount of limbs specific to your race','- #dynamic-spell \n- #Hard-concept\n- #skill-posibility \n- #magic-system-1','- Upon fail voids all new limbs',0),(96,'Basic healing','Love',1,25,1,'- Only works with direct contact','- Repairs broken tissue\n- Stops up to moderate bleeding','- Cannot create tissue (can only reconnect, ex. cuts or broken bones)','- #static-spell\n- #Advanced-concept \n- #skill-posibility \n- #magic-system-1','-',0),(97,'Basic Telepathy','Truth',2,10,0,'- requires direct line of sight','- telepathic communication between two beings','- 1 km range\n- both beings need to speak the same language','- #static-spell \n- #Intermediate-concept \n- #magic-system-1','- works for up to an hour\n- Doesn\'t require focus',0),(98,'Brimstone skin','Hate',4,25,0,'-','- Anyone who touches the user receives burn-like pain and even injury with enough contact\n- Works through equipment and physical ranged attacks\n- Effect lasts for 3 rounds','- Damage doesn\'t work through magic attacks','- #static-spell \n- #Advanced-concept \n- #skill-posibility \n- #magic-system-1','- Upon fail paralyzes user for a round',0),(99,'Chains of Order','Order',6,50,2,'- Needs solid matter near target','- Chains a target to the ground or any solid surface (wall or roof)\n- Targets movements are severely limited','- Chains can be dispelled with 8 circles','- #static-spell \n- #Advanced-concept \n- #magic-system-1','- effect lasts for 5 rounds',0),(100,'Chains of sea','Order',3,25,1,'- Needs solid matter near target\n- Needs direct line of sight','- Chains a target to the ground or any solid surface (wall or roof)\n- Targets movements are somewhat limited','- Chains can be broken with enough force\n- Chains can be dispelled with 5 circles','- #dynamic-spell \n- #Advanced-concept\n- #magic-system-1','- Effect lasts for 2 rounds',0),(101,'Chaos effect','Chaos',5,25,1,'-','- Implements randomness (d20) into any action','-','- #static-spell \n- #Advanced-concept \n- #magic-system-1','- Somewhat useless now that we roll for everything :P',0),(102,'Chaos enhance','Chaos',5,50,0,'- Can be cast after any roll','- Performs another random roll (with the same die)\n- lower half decreases luck, upper half increases it','- can only be activated once per roll','- #static-spell \n- #Hard-concept \n- #skill-posibility \n- #magic-system-1','- If the final value is 0 or less, the caster falls unconscious \n- example of luck change with a d20:\n\n| d20 roll | luck value |\n| -------- | ---------- |\n| 1        | -10        |\n| 2        | -9         |\n| 3        | -8         |\n| 4        | -7         |\n| 5        | -6         |\n| 6        | -5         |\n| 7        | -4         |\n| 8        | -3         |\n| 9        | -2         |\n| 10       | -1         |\n| 11       | +1         |\n| 12       | +2         |\n| 13       | +3         |\n| 14       | +4         |\n| 15       | +5         |\n| 16       | +6         |\n| 17       | +7         |\n| 18       | +8         |\n| 19       | +9         |\n| 20       | +10        |',0),(103,'Charm','Love',4,75,1,'- both targets must be within 5 meters','- Enhances ones affection towards another\n- Victim doesn\'t want to:\n	- injure the other\n	- defy the other\n- victim will try to help the other\n- lasts for a day','- Doesn\'t work on individuals with strong willpower or either high or extremely low inteligence\n- Victim wont perform extreme tasks','- #static-spell \n- #Master-concept \n- #magic-system-1','- Upon fail disables this magic for a day\n- both targets are chosen by the caster',0),(104,'Communication network','Truth',5,25,2,'- All targets need a direct line of sight when casting','- Free communication throughout the entire party','- Stops working immediately when the caster falls unconscious\n- works for up to a day','- #static-spell \n- #Advanced-concept \n- #skill-posibility \n- #magic-system-1','- Caster can keep the connection indefinitely by casting again even without direct line of sight\n- doesn\'t require focus',0),(105,'Copy spell','Lie',0,10,0,'- Needs at least one less complexity than the targeted spell','- Creates a weaker version of the targeted spell','- works up to 7th tier complexity spells','- #static-spell \n- #Intermediate-concept \n- #magic-system-1','- Upon fail causes the caster to suffer the fail effects of targeted spell',0),(106,'Create Elemental','Creation',7,10,1,'-','- Creates an elemental from basic elements \n- Elemental will follow commands from the caster','- Doesn\'t have a consciousness \n- Up to 10 elementals may be formed by the caster','- #dynamic-spell \n- #Master-concept \n- #magic-system-1','- Elemental can cast up to ten 4 tier spells\n- Elemental will perish upon casting all of their spells',0),(107,'Create Matter','Creation',5,5,1,'-','- creates matter the size of a cubic decimeter','- Only basic matter can be created (dirt, stone, water...), however the limit is lessened with every upscale','- #dynamic-spell \n- #Basic-concept \n- #magic-system-1','-',0),(108,'Curse projectile','Hate',2,10,1,'-','- Inflicts pain to the target and light burns\n- Ignores armor','- Doesn\'t affect beings with 5 or more circles','- #dynamic-spell \n- #Intermediate-concept \n- #magic-system-1','-',0),(109,'Dead world illusion','Lie',5,50,2,'- Requires eye contact with the target (at least once during cast time)','- Creates an illusion of a fake world, where all living beings die on the spot\n- Effect lasts indefinitely','- If target realizes they\'re in a fake world the effect only lasts up to 1 round','- #static-spell \n- #Hard-concept \n- #skill-posibility \n- #magic-system-1','- Upon fail disables this magic targets the caster',0),(110,'Endure','Existence',3,25,0,'- requires focus for the duration of the effect (but caster doesn\'t suffer consequences of losing focus)','- Makes caster somewhat invulnerable (most physical attacks don\'t work and some magic too)\n- Paralyzes caster\n- Effect lasts for 3 rounds, but can be undone by losing focus','- Caster needs to be on stable ground to keep focus for this spell','- #static-spell \n- #Advanced-concept \n- #skill-posibility \n- #magic-system-1','- Upon fail makes caster dizzy',0),(111,'Fact','Truth',5,50,1,'-','- Figure out a desired fact','- Can only be cast once a day\n- Not omniscient','- #static-spell \n- #Hard-concept \n- #magic-system-1','- Upon fail disables this magic for a day',0),(112,'Familiar command','Love',5,10,0,'- Needs an allied familiar as a target','- Make a familiar perform one active magic for you\n- All of the magics effects apply to the familiar instead of you','- Familiar needs to have enough magic circles (or suffers the consequences)\n- Caster has less control over the magic','- #static-spell \n- #Intermediate-concept \n- #skill-posibility \n- #magic-system-1','- Upon fail knocks the familiar unconscious',0),(113,'Fireball','Creation',3,10,1,'- starting point of the projectile cannot be inside solid or liquid matter','- Creates a ball of fire that can be thrown','- throwing distance depends on the strength of the caster','- #dynamic-spell \n- #Intermediate-concept \n- #magic-system-1','- Upon fail explodes in hand',0),(114,'Form Bullet','Creation',4,5,1,'- Needs material from the environment','- Form a bullet from rock, ice, or any matter around\n- The bullet will be the size of around a cubic centimeter','-','- #dynamic-spell \n- #Basic-concept \n- #magic-system-1','- cast time can be longer, which will cause the bullet to be bigger, faster and denser\n- upon fail, erupts in a small explosion',0),(115,'Form Golem','Creation',6,20,3,'- Needs material from the environment','- Creates a golem out of solid matter\n- Golem will obey basic commands from the caster','- Can be made only with basic solid matter\n- Crumbles after 10 minutes \n- Golem has a very simple mind\n- Up to 10 golems may be formed by the caster','- #dynamic-spell \n- #Hard-concept \n- #magic-system-1','-',0),(116,'Hide object','Lie',3,10,1,'- Requires direct contact with target','- Makes object/being almost invisible','- can only be cast once per round','- #static-spell \n- #Hard-concept \n- #magic-system-1','- Can be cast on the caster',0),(117,'Jitter','Chaos',3,25,1,'- Needs direct contact to the target during casting','- makes the targeted being have uneven and difficult movement\n- depending on the strength of the target, may cause extreme spasms\n- effect lasts for 5 rounds','- If target has enough strength or magic rezistence, there is no effect','- #static-spell \n- #Advanced-concept \n- #magic-system-1','- Upon fail, the caster becomes the target\n- Can be cast on inanimate objects',0),(118,'Life steal','Existence',4,50,2,'- needs direct contact with target (or works through weapons)','- Gain as 10% vitality of the damage dealt\n- lasts for 10 rounds after cast','- Both target and caster needs to be conscious\n- doesn\'t stack','- #static-spell \n- #Hard-concept \n- #skill-posibility \n- #magic-system-1','- Upon fail gives intense pain',0),(119,'Mind control','Order',5,50,2,'- Doesn\'t work for long distances','- Control the mind of a target\n- Can perform magic while in control','- Effect lasts 5 rounds, or until target is severely damaged\n- Doesn\'t work on strong willed targets','- #static-spell \n- #Hard-concept \n- #magic-system-1','- Upon fail disables this magic for a day',0),(120,'Orb of shielding','Order',2,10,1,'- needs a target that is to be shielded','- creates a sphere made up of shielding matter that blocks most attacks','-','- #static-spell \n- #Intermediate-concept \n- #magic-system-1','-',0),(121,'Pain inflict','Hate',3,20,1,'- Caster needs direct line of sight to the body of the target','- Inflicts pain on to target','- Only works on physical bodies\n- Doesn\'t work on powerful enemies or just enrages them\n- Doesn\'t work on covered areas','- #static-spell \n- #Advanced-concept \n- #skill-posibility\n- #magic-system-1','- Upon fail targets the caster\n- Targeted area can be very specific',0),(122,'Paralyse','Hate',4,25,2,'- Requires direct contact with the target\n- Doesn\'t need that much focus','- Stops movement of both caster and target\n- Effect indefinitely until cancelled by caster','- doesn\'t stop magic','- #static-spell \n- #Advanced-concept\n- #magic-system-1','- Upon fail paralyzes caster for a round',0),(123,'Platform','Creation',2,10,0,'- needs direct line of sight','- Summons a 2D platform\n- effect lasts for 2 rounds','- Cannot be summoned inside solid matter\n- only 2 can be activated per round\n- only strong enough to withstand the weight of a lighter person (around 60 kg)','- #dynamic-spell\n- #Intermediate-concept \n- #magic-system-1','-',0),(124,'Raise wall','Order',4,10,1,'- needs to be activated on a stable surface','- raises a wall out of a solid surface','- can be raised in the radius of 20m away from the caster','- #dynamic-spell \n- #Basic-concept \n- #magic-system-1','-',0),(125,'Rebound','Lie',0,75,0,'- Requires one less complexity of the targeted spell','- Take control of another spell','- Doesn\'t work on some spells','- #static-spell\n- #Master-concept\n- #casting-exchange\n- #magic-system-1','- Targeted spell can be your own (possible to redirect spells)',0),(126,'Skip','Existence',5,40,1,'- Needs direct line of sight','- Teleports a targeted object/being\n- Caster can target itself','- Range is 10m from the original position','- #static-spell \n- #Master-concept\n- #skill-posibility \n- #magic-system-1','-',0),(127,'Spark','Creation',1,1,0,'- Within direct line of sight of 5m','- Creates a spark\n- lasts for a round','- Cannot be created inside solid matter','- #dynamic-spell \n- #Trivial-concept\n- #magic-system-1','-',0),(128,'Sparkbolt','Creation',2,5,1,'-','- Fires a bolt of lightning\n- Upon hit hinders the movement of the target','- Cannot be summoned inside solid matter','- #dynamic-spell\n- #Basic-concept\n- #magic-system-1','-',0),(129,'Touch of death','Hate',5,50,1,'-','- floating hand made of red ice quickly creeps up to the target\n- upon contact with any living creature kills it by slowly freezing it from within','- ice will follow for up to 15 meters','- #dynamic-spell \n- #Hard-concept\n- #magic-system-1','- spawns 5 meters above target (or closer if area above is obstructed)\n- remains until all ice is completely melted',0),(130,'Truth detection','Truth',4,25,1,'- Used on one sentence per cast','- Detects if a person is lying or not','- Doesn\'t work on individuals with contact to the god of lies','- #static-spell\n- #Advanced-concept\n- #skill-posibility \n- #magic-system-1','- Can be used to disspell some illusion magic',0),(131,'Freeze charge','Creation',1,10,0,'-','- Area around casted magic starts freezing\n- Extinguishes fire\n- Sometimes slows down enemies hit with the spell','-','- #dynamic-mod \n- #Intermediate-concept \n- #casting-exchange\n- #magic-system-1','-',1),(132,'Homing','Origin',2,25,0,'-','- Magic tries to travel in the direction of the target','- Effect either fades after 3 rounds or needs active focus','- #dynamic-mod\n- #Advanced-concept\n- #casting-exchange \n- #skill-posibility \n- #magic-system-1','-',1),(133,'Magic downscale','Origin',-1,5,1,'- can be stacked','- decreases the effect of a spell, depending on the spell','-','- #Basic-concept \n- #universal-mod \n- #magic-system-1','-',1),(134,'Magic upscale','Origin',1,10,1,'- can be stacked','- Increases the effect of a spell, depending on the spell','-','- #universal-mod\n- #Intermediate-concept\n- #magic-system-1','-',1),(135,'Mass addition','Existence',1,25,0,'- can be stacked','- Adds mass to your spell\n- Projectiles become heavier and caster receives more knockback','-','- #dynamic-mod \n- #Advanced-concept \n- #casting-exchange\n- #skill-posibility \n- #magic-system-1','-',1),(136,'Prepared invocation','Origin',-1,10,3,'- CANNOT be stacked','- Decreases the required spell complexity\n- Requires longer cast time','- complexity cannot be less than 1','- #universal-mod \n- #Intermediate-concept \n- #magic-system-1','-',1),(137,'Re-Routing','Existence',1,10,0,'-','- Changes the target or direction of a spell while the spell is active\n- Can be activated multiple times during the spells lifetime','-','- #dynamic-mod\n- #Intermediate-concept\n- #casting-exchange\n- #magic-system-1','-',1),(138,'Shortened invocation','Origin',1,25,-1,'- can be stacked','- shortens the cast time\n- increases complexity','- final cast time cannot go under 0','- #universal-mod\n- #Advanced-concept\n- #magic-system-1','-',1),(139,'Speed up','Existence',1,10,0,'- can be stacked','- Speeds up projectile spells (and maybe some more)','- doesn\'t work well on spells that do not move','- #dynamic-mod\n- #Intermediate-concept\n- #skill-posibility\n- #magic-system-1','-',1),(140,'Spell Compression','Existence',1,25,-1,'-','- Compresses the spell but amplifies the effect','- Has no effect on certain spells','- #dynamic-mod \n- #Advanced-concept\n- #magic-system-1','-',1),(141,'Spell Decompression','Existence',-1,25,1,'-','- Decompresses the spell but reduces the effect\n- Gives bigger AOE (area of effect)','- Has no effect on certain spells','- #dynamic-mod\n- #Advanced-concept \n- #magic-system-1','-',1);
/*!40000 ALTER TABLE `magic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options` (
  `character_id` int(10) unsigned NOT NULL,
  `refresh_inventory` int(10) unsigned NOT NULL DEFAULT 30000,
  `refresh_magic` int(10) unsigned NOT NULL DEFAULT 30000,
  `show_message` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`character_id`),
  UNIQUE KEY `character_id_UNIQUE` (`character_id`),
  CONSTRAINT `options_character1` FOREIGN KEY (`character_id`) REFERENCES `character` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,0,0,0),(2,0,0,0),(3,0,0,1),(4,60000,60000,0);
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin'),(3,'Champion'),(4,'NPC'),(2,'Player');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `special_item`
--

DROP TABLE IF EXISTS `special_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `special_item` (
  `inventory_id` int(10) unsigned NOT NULL,
  `enchantment` varchar(300) DEFAULT NULL,
  `enchantment_eq_only` tinyint(4) DEFAULT NULL,
  `blessing` varchar(150) DEFAULT NULL,
  `blessing_eq_only` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`inventory_id`),
  UNIQUE KEY `inventory_id_UNIQUE` (`inventory_id`),
  KEY `special_item_inventory1_idx` (`inventory_id`),
  CONSTRAINT `special_item_inventory1` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_item`
--

LOCK TABLES `special_item` WRITE;
/*!40000 ALTER TABLE `special_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `special_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (7,'accessory'),(4,'armor'),(8,'bag'),(9,'consumable'),(6,'gloves'),(5,'headwear'),(10,'key item'),(11,'material'),(1,'misc'),(3,'shield'),(2,'weapon');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-20 19:14:33
