-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: sql6.webzdarma.cz:3306
-- Generation Time: Jan 20, 2026 at 10:06 AM
-- Server version: 8.0.43-34
-- PHP Version: 8.4.15

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kubakwzcz0796`
--

-- --------------------------------------------------------

--
-- Table structure for table `calendar`
--

CREATE TABLE `calendar` (
  `id` int UNSIGNED NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `character`
--

CREATE TABLE `character` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `age` int UNSIGNED NOT NULL,
  `circles` int UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb3_unicode_ci,
  `money` int UNSIGNED NOT NULL DEFAULT '0',
  `role_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `character`
--

INSERT INTO `character` (`id`, `name`, `password`, `age`, `circles`, `description`, `money`, `role_id`) VALUES
(1, 'Origin', 'dumbass', 0, 100, 'The original god (its me lol)', 0, 1),
(2, 'Oscar', 'bruh', 24, 3, 'Vesnický pleb. Jako malý pracoval na poli a hrabal se v zemině. Ve 20 se u něj objevily znaky magie po útoku na jeho vesnice. Jeho rodina byla zavražděna bandity a většina z nich i jejich vůdce utekli dřív než se Oscar vrátil z rybaření. Od té chvíle hledá vůdce pirátů.Avšak při jeho cestě se naskytly obtíže, přátel a dokonce souboje s bohy.', 1762, 2),
(3, 'Greneha', 'bruh', 21, 4, 'Původně člověk, přítomně mutant. Své dětství bezstarostně trávila v Nikolijské republice, avšak život se jí změnil poté, co objevila jeskyň vedoucí do podzemní pevnosti, kde podstoupila mutaci. Její mysl je naplněna neznámou nenávistí a touhou najít způsob, jakým se vyléčí její kletba.', 855, 2),
(4, 'Eryn', 'bruh', 83, 4, 'Mladý elf na cestách po světě. Už od 20 let ho zaujala existence bohů a historie světa. Během jeho cesty přes Skatashian byl přepaden místním kmenem, před kterým byl zachráněn andělem lásky jménem Iroxid. Chvíli spolu cestovali za stejným cílem, přičemž Eryn nabyl spojení s bohyní Lásky. Po dobrodružné cestě s Iroxidem se rozloučili a cestovali po svých osách.', 349, 2),
(5, 'skibidi', 'toiletest', 8, 10, 'bruh skibidi toilet', 310, 2),
(6, 'Jerome', 'omegyat', 26, 2, 'Původem vesničan. Bez hladu, vyrostl s dobře vyvinutým tělem. Po nehodě v lese a následné smrti ho vzkřísil čaroděj. Díky čarodeji se naučil pár užitečných kouzel. Aby dokončil své vzkříšení, hledá mocné kameny které umí spravit duši dopořádku...', 6330, 2),
(7, 'Griuf', 'bruh', 21, 3, 'A lizard demi human on his way to discover the world', 6250, 2),
(8, 'Phera', 'uwu', 183, 6, 'yeah!', 1745, 3),
(9, 'test', 'test', 10, 4, 'charakter na testování', 200, 2);

-- --------------------------------------------------------

--
-- Table structure for table `character_calendar`
--

CREATE TABLE `character_calendar` (
  `character_id` int UNSIGNED NOT NULL,
  `calendar_id` int UNSIGNED NOT NULL,
  `available` tinyint UNSIGNED NOT NULL,
  `note` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `character_image`
--

CREATE TABLE `character_image` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `image` mediumblob NOT NULL,
  `description` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `character_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `character_magic`
--

CREATE TABLE `character_magic` (
  `character_id` int UNSIGNED NOT NULL,
  `magic_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `complexity` int NOT NULL,
  `fail_rate` int UNSIGNED NOT NULL,
  `cast_time` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `character_magic`
--

INSERT INTO `character_magic` (`character_id`, `magic_name`, `complexity`, `fail_rate`, `cast_time`) VALUES
(2, 'Artus', 4, 45, 1),
(2, 'Chaos effect', 5, 30, 1),
(2, 'Chaos enhance', 5, 0, 0),
(2, 'Disarm', 1, 12, 0),
(2, 'Hide object', 3, 8, 1),
(2, 'Inspect', 3, 30, 3),
(2, 'Life steal', 4, 0, 2),
(2, 'Rip and Tear', 4, 40, 1),
(3, 'Brimstone skin', 4, 0, 0),
(3, 'Critical amp', 2, 33, 0),
(3, 'Curse projectile', 0, 10, 1),
(3, 'Fact', 5, 7, 1),
(3, 'Grant resistance', 2, 13, 2),
(3, 'Inspect', 3, 19, 3),
(3, 'Life steal', 4, 12, 2),
(3, 'Pain inflict', 3, 1, 1),
(3, 'Platform', 2, 5, 0),
(3, 'Touch of death', 5, 5, 1),
(3, 'Truth detection', 4, 15, 1),
(3, 'Wilting rose', 5, 11, 1),
(4, 'Ability boost', 3, 0, 1),
(4, 'Artus', 4, 40, 1),
(4, 'Basic healing', 1, 0, 1),
(4, 'Basic Telepathy', 2, 8, 0),
(4, 'Basic understanding', 1, 10, 0),
(4, 'Charm', 4, 47, 1),
(4, 'Endure', 3, 15, 0),
(4, 'Fact', 5, 15, 1),
(4, 'Form Golem', 6, 15, 3),
(4, 'Grant resistance', 2, 1, 2),
(4, 'Heal', 5, 15, 3),
(4, 'Hide object', 3, 0, 1),
(4, 'Inspect', 3, 33, 3),
(4, 'Orb of shielding', 2, 0, 1),
(4, 'Prepared invocation', -1, 0, 3),
(4, 'Re-Routing', 1, 7, 0),
(4, 'Rebound', 0, 48, 0),
(4, 'Shortened invocation', 1, 15, -1),
(4, 'Sparkbolt', 2, 0, 1),
(4, 'Spell Decompression', -1, 20, 1),
(4, 'Truth detection', 4, 18, 1),
(5, 'Life steal', 7, 50, 2),
(5, 'Magic upscale', 3533, 33, 3533),
(6, 'Charm', 3, 70, 1),
(7, 'Hide object', 3, 20, 0),
(8, 'Communication network', 5, 10, 2),
(8, 'Static thrust', 4, 30, 0),
(9, 'Ability boost', 18, 25, 1);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `type_id` int UNSIGNED NOT NULL,
  `amount` int UNSIGNED NOT NULL,
  `charges` int UNSIGNED NOT NULL,
  `charges_max` int UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb3_unicode_ci,
  `is_deleted` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `is_favourite` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `is_equipped` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `character_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `name`, `type_id`, `amount`, `charges`, `charges_max`, `description`, `is_deleted`, `is_favourite`, `is_equipped`, `character_id`) VALUES
(1, 'Prsten pozornosti', 7, 1, 0, 0, 'Vibruje při detekci nebezpečí vůci nositeli prstene', 0, 1, 1, 2),
(2, 'Gladiátor', 2, 1, 0, 0, 'Meč, který zvyšuje sílu nárazu o 50%. Soulbinded', 0, 0, 1, 2),
(3, 'Prsten váhy', 7, 1, 0, 0, 'Jakýkoliv objek držený v ruce, na které prsten leží, je 5x těžší pro všechny, kromě vlastníka prstene', 0, 1, 1, 2),
(4, 'Zbroj vzdušných triků', 4, 1, 7, 10, 'Zbroj, pomocí které vlastník může dělat pohyby bez pevného povrchu o který by byla potřeba se opřít', 0, 0, 1, 2),
(5, 'Róbě morového doktora', 4, 1, 0, 0, 'Oblečení s vizáží morových doktorů ze středověké Evropy', 0, 1, 0, 2),
(6, 'Kožené rukavice', 6, 1, 0, 0, 'Kožené rukavice', 0, 0, 0, 2),
(7, 'Maska morového doktora', 5, 1, 0, 0, 'Maska s vizáží morových doktorů ze středověké Evropy. Obsahuje ornamenty pro lepší vizi ve tmě.', 0, 1, 0, 2),
(8, 'Meč transformace', 2, 1, 0, 20, 'Původně meč který využíval kameny elementů, avšak po vstřebání křišťálu existence ztratil tento název. Po každém poškození živé bytosti absorbuje kámen na hrušce esenci a po dostatečném nabití se může transformovat na jakýkoliv tvar. Soulbinded ', 0, 0, 1, 2),
(9, 'Meč chaosu', 2, 1, 5, 5, 'Meč který napodobuje sílu bohyně chaosu. Ignoruje většinu štítů a rozbíjí magii, jakoby byla fyzický objekt. Soulbinded', 0, 0, 1, 2),
(10, 'Prsten posunu', 7, 1, 3, 3, 'Posune fyzický objekt 5 metrů od nositele prstenu. Má 3 použití za souboj.', 0, 1, 1, 2),
(11, 'Prsten přisunutí', 7, 1, 3, 3, 'Přisune fyzický objekt 5 metrů k nositeli prstene. Má 3 použití za souboj.', 0, 1, 1, 2),
(12, 'Prsten odpuštění', 7, 1, 0, 0, 'Když nositel tohoto prstene selže ve vyvolávání kouzla, efekty selhání neproběhnou, avšak prsten se rozbije.', 0, 1, 1, 2),
(13, 'Odznak Gisonia', 7, 1, 0, 0, 'Odznak za hrdinské činy v království Gisonie, přidělen králem Nicholasem.', 1, 0, 0, 2),
(14, 'Odznak gisonia', 7, 1, 0, 0, 'Odznak za hrdinské činy v království Gisonie, přidělen králem Nicholasem.', 1, 0, 0, 2),
(15, 'Odznak respektu Gisonia', 7, 1, 0, 0, 'Odznak za hrdinské činy v království Gisonie, přidělen králem Nicholasem.', 0, 1, 1, 2),
(16, 'nožík', 2, 1, 0, 0, 'Běžný malý nožík', 0, 0, 0, 2),
(17, 'Lektvar regenerace', 9, 3, 4, 5, 'Zrychluje regenerace. Časté používání oslabuje tělo.', 0, 1, 0, 2),
(18, 'Šperky', 1, 3, 0, 0, 'Šperky z pokladnice původního Abzhiánu.', 1, 0, 0, 2),
(19, 'Batůžek', 8, 1, 0, 0, 'Malý batoh', 0, 0, 1, 2),
(20, 'Křišťál existence', 11, 4, 0, 0, 'Křišťál držící sílu existence (původně se jmenoval křišťál transformace)', 0, 0, 0, 2),
(21, 'Křišťál chaosu', 11, 14, 0, 0, 'Křišťál držící sílu chaosu', 0, 0, 0, 2),
(22, 'Kus zdi', 1, 1, 0, 0, 'zeď ??? (Občas se podivně kroutí)', 1, 0, 0, 2),
(23, 'Náhrdelník záchrany', 7, 1, 3, 3, 'Náhrdelník chránící postavu před jistou smrtí.', 0, 1, 1, 2),
(24, 'Luk a šípy', 2, 1, 20, 20, 'Základní luk který používá základní šípy.', 0, 1, 1, 3),
(25, 'Prsten odpuštění', 7, 1, 0, 0, 'Když nositel tohoto prstene selže ve vyvolávání kouzla, efekty selhání neproběhnou, avšak prsten se rozbije.', 0, 1, 1, 3),
(26, 'Prsten nenávisti', 7, 1, 0, 0, 'Prsten, který umožňuje nositeli používat magii nenávisti o jeden řád víš. ( 1 hate magic)', 0, 1, 1, 3),
(27, 'Křišťál řádu', 11, 1, 0, 0, 'Křišťál držící sílu řádu', 0, 0, 0, 3),
(28, 'Smlouva Chaosu', 10, 1, 0, 0, 'Síla chaosu tebou prochází. ( 2 chaos magic)', 1, 1, 0, 2),
(29, 'Smlouva nenávisti', 10, 1, 0, 0, 'Síla nenávisti skrz tebe prochází. ( 1 hate magic)', 0, 1, 0, 3),
(30, 'Krátký meč', 2, 1, 0, 0, 'Krátký meč. Toť vše :P', 1, 0, 1, 4),
(31, 'Jednoduché náčiní', 1, 1, 0, 0, 'Náčiní obsahuje jednoduché nástroje. (nevim jaký přesně, kdyžtak se mě zeptej, jestli tam je zrovna to co potřebuješ)', 1, 0, 0, 4),
(32, 'Šipky', 2, 1, 8, 8, 'Jednoduché házecí šipky. Malá ofenzivní hodnota. (a Eryn házet zas tak neumí)', 1, 0, 1, 4),
(33, 'Jednoduchý plášť', 4, 1, 0, 0, 'Jednoduchý plášť. Přidává malou hodnotu ochrany před řezným útokem.', 0, 0, 1, 4),
(34, 'Smlouva Chaosu', 1, 1, 0, 0, 'Síla chaosu tebou prochází. ( 2 chaos magic)', 1, 0, 0, 2),
(35, 'Smlouva Chaosu', 1, 1, 0, 0, 'Síla chaosu tebou prochází. ( 2 chaos magic)', 1, 0, 0, 2),
(36, 'Kniha Life Steal', 1, 1, 0, 0, 'Life steal goes brrr', 1, 0, 0, 2),
(37, 'Kámen co mě má rád', 1, 1, 0, 0, '(spadl mi na hlavu)', 0, 0, 0, 2),
(38, 'Granát Statiky', 2, 4, 1, 3, 'Granát který po aktivaci zastaví pohyb 1 metr okolo sebe. Každý granát má 3 použití.', 0, 0, 0, 2),
(39, 'Prsten odpuštění', 7, 1, 0, 0, 'Když nositel tohoto prstene selže ve vyvolávání kouzla, efekty selhání neproběhnou, avšak prsten se rozbije.', 1, 0, 0, 4),
(40, 'Džbán ', 9, 1, 0, 20, 'Pivo', 0, 0, 0, 2),
(41, 'Krystaly Existence', 11, 6, 0, 0, 'Krystaly nesoucí sílu Existence. Jerome tyto kameny hledá po celém světě, aby navrátil svou duši dopořádku. Proto potřebuje 9 krystalů.', 0, 0, 0, 6),
(42, 'Kladivo Řádu', 2, 1, 0, 6, 'Kladivo nesoucí sílu Řádu. Jerome objevil toto kladivo v zrezlém stavu, avšak později objevil jeho pravou sílu.', 0, 1, 1, 6),
(43, 'Jednoduchá zbroj', 4, 1, 0, 0, 'Jednoduchá plátěná zbroj. (z nějakýho důvodu má postříkaný kalhoty ??)', 0, 1, 1, 6),
(44, 'Zdobená dýka', 2, 1, 0, 0, 'Nádherná dýka s mnoha dekoracemi, avšak lehce tupá a neefektivní při souboji.', 0, 0, 0, 6),
(45, 'Lano', 1, 2, 0, 0, 'Jednoduché lano s průřezem 2cm a s délkou 4m.', 0, 0, 0, 6),
(46, 'Louč', 1, 1, 4, 4, 'Jednoduchá louč. Jeden charge vydrží 1h.', 0, 0, 0, 6),
(47, 'Leguán', 10, 1, 47, 200, 'Milovaná loď všech Leguánů. Kdo na ní stojí, tomu pepík stojí.', 0, 1, 0, 6),
(48, 'testing testing', 2, 1, 90, 90, 'aisjdfhopaiusdhcapsiodf', 1, 0, 0, 1),
(49, 'bruhis', 2, 1, 3, 3, 'apisdbcassss', 1, 0, 0, 1),
(50, '1/4 Gertúda', 9, 1, 0, 1, 'Asi zadní pravá noha idk', 1, 0, 0, 2),
(51, 'Sušený maťo a chleba', 9, 1, 9, 15, 'Mňam mňam ', 0, 0, 0, 2),
(52, 'Kniha Fariusovi zápisky o Chermetě', 1, 1, 0, 0, 'Fariusovi zápisky, přečteno', 1, 0, 0, 4),
(53, 'Kniha God complex', 1, 1, 0, 0, 'Kniha o God Complexu', 1, 0, 0, 4),
(54, 'Kniha o prvním andělovi ', 1, 1, 0, 0, 'PRVNÍ FUKNIG ANDĚL ', 1, 0, 0, 4),
(55, 'Kniha o Voidu', 1, 1, 0, 0, 'Void', 1, 0, 0, 4),
(56, 'Kniha práce s dušemi pro blbečky ', 1, 1, 0, 0, 'Jak pracovat s duší\nInstrukce ke přístroji v jeskyni lží', 1, 0, 0, 4),
(57, 'Domácí Pálenka', 9, 1, 8, 10, '70% překvapivě sladká, rodinná tradiční, lehce kyselá', 0, 0, 0, 2),
(58, 'Krystal lásky', 11, 1, 4, 4, 'Krystal lásky', 1, 0, 0, 2),
(59, 'Křišťál lásky', 11, 1, 0, 0, 'Odměna za kytky pro Arlu', 0, 0, 0, 3),
(60, 'Performance enhance lektvar', 9, 4, 3, 5, '-//-', 0, 0, 0, 2),
(61, 'Pálivec', 9, 1, 6, 20, 'Chlast ze zemí démonů', 0, 0, 0, 2),
(62, 'Likér', 9, 1, 9, 15, 'Idk', 0, 0, 0, 2),
(63, 'bruh', 2, 5, 7, 5, 'aoisdhcbaipsdfafdadfasdfawe bruh', 1, 0, 1, 5),
(64, 'Kubák', 5, 1, 78, 78, 'Twink', 1, 0, 0, 5),
(65, 'Váza s parazitem', 1, 1, 1, 1, 'Parazit kterého Oscar a Griuf našli v královské hrobce, původně patřil andělovi Phera.', 0, 0, 0, 7),
(66, 'Medvědí zbroj', 4, 1, 0, 0, 'Zbroj z kůže kamennitého medvěda (kterého uškvařila Nizen)', 0, 1, 1, 7),
(67, 'Dračí roh', 11, 1, 0, 0, 'Roh z draka. Takto samostatně působí jako extra magický kruh, ale dá se zpracovat do formy zbraně/náčiní.', 0, 0, 0, 7),
(68, 'Scroll of return', 1, 1, 1, 3, 'Vrátí uživatele a blízké bytosti na předem nastavené místo. Aktuálně nastaveno na Dračí křišťál.', 0, 0, 0, 7),
(69, 'Odznak respektu Gisonia', 7, 1, 0, 0, 'Za hrdinský čin pro aktuálního krále Nicolase byl Griuf odměněn a označen jako vážená osoba v Gisonii.', 0, 0, 0, 7),
(70, 'Kopí vzdušných triků', 2, 1, 0, 0, 'Pozlacené kopí s možností různých manévru i bez kontaktu s uživatelem, umí se vrátit k uživateli pouhou myšlenkou.', 0, 1, 1, 7),
(71, 'Elfí dýka', 2, 1, 0, 0, 'Jednoduchá dýka z tvrdé ocele. Čepel má lehce zelenou barvu.', 0, 0, 0, 7),
(72, 'Dýka hniloby', 2, 1, 9, 12, 'Dýka která při kontaktu s organickou hmotou začne hmotu rozkládat. Jed se musí doplňovat.', 0, 1, 1, 7),
(73, 'Lektvar regenerace', 9, 1, 5, 5, 'Po konzumaci vyléčí lehké až střední rány.', 0, 0, 0, 7),
(74, 'Boty hbitosti', 4, 1, 3, 3, 'Boty které manipulují vzduch okolo a tím uživateli umožňují nečekaný pohyb jako například druhý skok ve vzduchu. Efekt lze použít 3x za souboj.', 0, 1, 1, 7),
(75, 'Křišťál existence', 11, 5, 0, 0, 'Křišťál který v sobě drží sílu existence.', 0, 0, 0, 7),
(76, 'Maska světelného výbuchu', 5, 1, 2, 2, 'Při aktivaci se na vteřinu maska rozzáří oslepujícím světlem. Světlo uživatele neoslepí tolik jako bytosti před uživatelem. Efekt lze použít 2x za souboj.', 0, 0, 0, 7),
(77, 'Smoke-bomb', 2, 1, 2, 2, 'Při aktivaci vypustí plyn v okolí 5m. Efekt lze použít 2x za souboj', 0, 1, 0, 7),
(78, 'Time-distort bomb', 2, 1, 1, 1, 'Znetvoří čas pro veškerý prostor v okolí 100 metrů kromě uživatele na 5 sekund. Efekt lze použít jednou za souboj (nebo jednou za hodinu)', 0, 0, 0, 7),
(79, 'Klíč dračí kovadliny', 10, 1, 0, 0, 'Klíč, který otevírá komnaty s dračí kovadlinou. Ta se nachází někde v Drakii.', 0, 0, 0, 7),
(80, 'Tesáky Lži', 2, 1, 5, 5, 'Dva tesáky, jeden kratší, jeden delší. Umožňují uživateli vyměnit pozici tesáků mezi sebou, nebo vyměnit pozici uživatele s jedním z tesáků.', 0, 1, 1, 7),
(81, 'Lektvar kruhové amplitudy', 9, 1, 5, 5, 'Při konzumaci uživatel dostává dočasný magický kruh navíc (efekt vyprchá při použití magie, max dva kruhy navíc)', 0, 0, 0, 7),
(82, 'Kilo zlata', 11, 30, 0, 0, 'Zlato z pokladnice původního Abhziánu', 1, 0, 0, 8),
(83, 'Křišťál chaosu', 11, 1, 0, 0, 'Oscar díky tomu může se svým mečem Chaosu zjistit moji polohu', 1, 0, 0, 3),
(84, 'Kr. Meč', 2, 1, 0, 0, 'z dračí oceli,  5 jednorázových kruhů za boj', 0, 0, 1, 4),
(85, 'Mythrilový plášť', 4, 1, 0, 0, 'Plášť z mythrilu', 0, 0, 1, 2),
(86, 'Právé chodidlo prvního anděla', 1, 1, 0, 0, 'Právé jako z jeho pravé nohy (získáno v Dragónii po poražení prvního anděla)', 0, 0, 0, 4),
(87, '10l dračí krve', 11, 1, 0, 0, 'Dračí krev na lék proti zrychlujícím kruhům; od dračího krále', 0, 0, 0, 3),
(88, 'Jedový šíp', 2, 1, 38, 40, 'Šípy s jedem z Olsinbelu', 0, 0, 0, 3),
(89, 'Léčivé bylinky', 9, 1, 5, 5, 'Zaství jednoduchý jed, nebo středně závažný (záleží na dávce)', 0, 0, 0, 3),
(90, 'Nos z krtkoberana', 10, 1, 1, 1, '-//-', 1, 0, 0, 2),
(91, 'Rozdrcená hlava krtkoberana dospělého ', 10, 1, 1, 1, '-//-', 1, 0, 0, 2),
(92, 'Hlava mláděte krtkoberana', 1, 1, 1, 1, '-//-', 1, 0, 0, 2),
(93, 'Test item', 10, 1, 10, 10, 'Test item for the test character', 0, 0, 0, 9),
(94, 'item2', 2, 1, 100, 100, 'example 2', 0, 0, 0, 9),
(95, 'Neznámý alkohol', 9, 3, 20, 20, 'Neznámý', 0, 0, 0, 2),
(96, 'Neznámí nástroj ', 1, 4, 0, 0, 'Neznámí magický nástroj (obsahuje speciální kov, lze extrahovat)', 0, 0, 0, 4),
(97, 'XXX', 1, 1, 3, 3, 'XXX test', 0, 0, 0, 9),
(98, 'Neznámé ovoce', 9, 1, 7, 7, 'Jídlo z domu na ostrově s golemy', 0, 0, 0, 3),
(99, 'Neznámé ovoce', 9, 6, 0, 0, 'Z ostrova kde jsme hledali alchimistu pro fária', 0, 0, 0, 4),
(100, 'Kus ostrovního kristalu', 10, 1, 1, 1, '-//-', 0, 0, 0, 2),
(101, 'Ovoce z ostrova', 9, 5, 1, 1, '-//-', 0, 0, 0, 2),
(102, 'Zásoby kůže ', 11, 1, 1, 1, '-//-', 0, 0, 0, 2),
(103, 'Čarodějův zašifrovaný deník', 10, 1, 1, 1, 'Deník z jeskyně čaroděje, kde jsem spadla do toho kotle a zmutovala', 0, 0, 0, 3),
(104, 'Knížka na magitech pokročilá', 1, 1, 9, 10, 'Knížka od Faria na magitach', 0, 0, 0, 4),
(105, 'Magitech knížka začáteční', 1, 1, 10, 10, 'Z Gualdlanu, zakoupená (70)', 0, 0, 0, 4),
(106, 'kniha na šerm základní', 1, 1, 10, 10, 'kniha na šerm z Boury, \"kradená\" (zaplatil jsem za ní 40 mun ale oni o tom neví XD) [vrácená, už jí nemám u sebe]', 0, 0, 0, 4),
(107, 'Cocatin', 9, 1, 14, 20, 'Něco jako nikotin s kokainem', 0, 0, 0, 2),
(108, 'Kompas za Merlinem', 10, 1, 1, 1, 'Kompas, který ukazuje směr za kupcem Merlinem', 0, 0, 0, 2),
(109, 'I.D.', 10, 1, 0, 0, 'Občanka (můžu si půjčovat knížky v knihovně :))', 0, 0, 0, 3),
(110, 'Kniha o lukostřelbě', 10, 1, 10, 10, 'Pokročilá úroveň', 0, 0, 0, 3),
(111, 'Knížka Disarm', 10, 1, 10, 10, '-//-', 0, 0, 0, 2),
(112, 'Kniha o Fact', 10, 1, 0, 10, 'Kniha', 0, 0, 0, 3),
(113, 'Kniha o Inspect', 10, 1, 0, 10, 'Kniha', 0, 0, 0, 3),
(114, 'Kniha o Paralyse', 10, 1, 0, 10, 'Kniha', 0, 0, 0, 3),
(115, 'Kniha o Pain inflict', 10, 1, 0, 10, 'Kniha', 0, 0, 0, 3),
(116, 'Kůže z kamenného medvěda ', 11, 1, 0, 0, '3 na 4 metry čtvereční kůže polovina využita', 0, 0, 0, 2),
(117, 'Kůže z kamenných medviďat', 11, 1, 0, 0, '6', 0, 0, 0, 2),
(118, 'Pozůstatky z vlků', 11, 5, 0, 0, 'Kůže, drápy, zuby', 0, 0, 0, 3),
(119, 'Červené pruhy stromu', 11, 8, 0, 0, '-//-', 1, 0, 0, 2),
(120, 'Kůže ježko-prasete', 11, 2, 0, 0, 'Kůže na zbroj', 1, 0, 0, 3),
(121, 'Kovy z golemů', 11, 20, 0, 0, '-//-', 0, 0, 0, 2),
(122, 'Pavučiny', 11, 5, 0, 0, '-//-', 0, 0, 0, 2),
(123, 'Měšťanská tunika', 4, 1, 0, 0, '-//-', 0, 0, 1, 2),
(124, 'Kápě s krajkou', 4, 1, 0, 0, '-//-', 0, 0, 1, 2),
(125, 'Krystal stvoření', 11, 9, 0, 0, '-//-', 0, 0, 0, 2),
(126, 'Krystal nenávisti', 11, 1, 0, 0, '7x', 1, 0, 0, 3),
(127, 'úlomek dračího krystalu', 11, 1, 0, 0, 'z drákie, random úlomek od boje s prvním andělem', 1, 0, 0, 4),
(128, 'lehká zbroj', 4, 1, 0, 0, 'z medvědí kůže a pavučin pavouků a dračích šupin, Imunity (magick), ability boost', 0, 0, 1, 4),
(129, 'Luk enchantovaný', 2, 1, 0, 0, 'Ray of none\nParalyse\nWilting Rose\nCurse projectile\nDisarm', 0, 0, 0, 3),
(130, 'Krystal nenávisti', 11, 1, 0, 0, 'Od b. Nenávisti. Nebezpečný! Nikdo kromě mě se nesmí dotknout!', 0, 0, 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `magic`
--

CREATE TABLE `magic` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `origin` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `complexity` int NOT NULL,
  `fail_rate` int UNSIGNED NOT NULL,
  `cast_time` int NOT NULL,
  `rules` text COLLATE utf8mb3_unicode_ci,
  `effects` text COLLATE utf8mb3_unicode_ci,
  `limits` text COLLATE utf8mb3_unicode_ci,
  `tags` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `other` text COLLATE utf8mb3_unicode_ci,
  `is_mod` tinyint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `magic`
--

INSERT INTO `magic` (`id`, `name`, `origin`, `complexity`, `fail_rate`, `cast_time`, `rules`, `effects`, `limits`, `tags`, `other`, `is_mod`) VALUES
(1, 'Ability boost', 'Love', 3, 25, 1, '-', '- Boosts ability of any target ally', '- lasts for 3 rounds', '- #static-spell \r\n- #Advanced-concept\r\n- #magic-system-1', '-', 0),
(2, 'Artus', 'Existence', 4, 50, 1, '- Can only grow limbs specific to your race', '- Gain another limb of your choosing', '- max two times the amount of limbs specific to your race', '- #dynamic-spell \r\n- #Hard-concept\r\n- #skill-posibility \r\n- #magic-system-1', '- Upon fail voids all new limbs', 0),
(3, 'Basic healing', 'Love', 1, 25, 1, '- Only works with direct contact', '- Repairs broken tissue\n- Stops up to moderate bleeding', '- Cannot create tissue (can only reconnect, ex. cuts or broken bones)', '- #static-spell\n- #Advanced-concept \n- #skill-posibility \n- #magic-system-1', '- cannot be used on yourself (no Eryn, not even with rerouting)', 0),
(4, 'Basic Telepathy', 'Truth', 2, 10, 0, '- requires direct line of sight', '- telepathic communication between two beings', '- 1 km range\r\n- both beings need to speak the same language', '- #static-spell \r\n- #Intermediate-concept \r\n- #magic-system-1', '- works for up to an hour\r\n- Doesn\'t require focus', 0),
(5, 'Basic understanding', 'Truth', 1, 25, 0, '- the more you know the being, the more you understand', '- Understand the intentions of another being', '-', '- #static-spell \r\n- #Advanced-concept\r\n- #magic-system-1', '-', 0),
(6, 'Brimstone skin', 'Hate', 4, 25, 0, '-', '- Anyone who touches the user receives burn-like pain and even injury with enough contact\r\n- Works through equipment and physical ranged attacks\r\n- Effect lasts for 3 rounds', '- Damage doesn\'t work through magic attacks', '- #static-spell \r\n- #Advanced-concept \r\n- #skill-posibility \r\n- #magic-system-1', '- Upon fail paralyzes user for a round', 0),
(7, 'Chains of Order', 'Order', 6, 50, 2, '- Needs solid matter near target', '- Chains a target to the ground or any solid surface (wall or roof)\r\n- Targets movements are severely limited', '- Chains can be dispelled with 8 circles', '- #static-spell \r\n- #Advanced-concept \r\n- #magic-system-1', '- effect lasts for 5 rounds', 0),
(8, 'Chains of sea', 'Order', 3, 25, 1, '- Needs solid matter near target\r\n- Needs direct line of sight', '- Chains a target to the ground or any solid surface (wall or roof)\r\n- Targets movements are somewhat limited', '- Chains can be broken with enough force\r\n- Chains can be dispelled with 5 circles', '- #dynamic-spell \r\n- #Advanced-concept\r\n- #magic-system-1', '- Effect lasts for 2 rounds', 0),
(9, 'Chaos effect', 'Chaos', 6, 50, 1, '-', '- Changes the die that should be rolled to a random die\n- example: should you roll for an attack (d20), you can choose to cast this spell and roll with a d6, which determines the die you then HAVE to use for said attack (can result with you rolling with a d4 or a d100 for an attack)\n- after successfully casting, you cannot use the original die (so that there are only 6 dice to choose from, and the roll then makes sense)', '-', '- #static-spell \n- #Advanced-concept \n- #magic-system-1', '- Can be used AFTER the original roll, which will replace the original value, however, the failrate doubles', 0),
(10, 'Chaos enhance', 'Chaos', 5, 50, 0, '- Can be cast after any roll', '- Performs another random roll (with the same die)\r\n- lower half decreases luck, upper half increases it', '- can only be activated once per roll', '- #static-spell \r\n- #Hard-concept \r\n- #skill-posibility \r\n- #magic-system-1', '- If the final value is 0 or less, the caster falls unconscious \r\n- example of luck change with a d20:\r\n\r\n| d20 roll | luck value |\r\n| -------- | ---------- |\r\n| 1        | -10        |\r\n| 2        | -9         |\r\n| 3        | -8         |\r\n| 4        | -7         |\r\n| 5        | -6         |\r\n| 6        | -5         |\r\n| 7        | -4         |\r\n| 8        | -3         |\r\n| 9        | -2         |\r\n| 10       | -1         |\r\n| 11       | +1         |\r\n| 12       | +2         |\r\n| 13       | +3         |\r\n| 14       | +4         |\r\n| 15       | +5         |\r\n| 16       | +6         |\r\n| 17       | +7         |\r\n| 18       | +8         |\r\n| 19       | +9         |\r\n| 20       | +10        |', 0),
(11, 'Charm', 'Love', 4, 75, 1, '- both targets must be within 5 meters', '- Enhances ones affection towards another\r\n- Victim doesn\'t want to:\r\n	- injure the other\r\n	- defy the other\r\n- victim will try to help the other\r\n- lasts for a day', '- Doesn\'t work on individuals with strong willpower or either high or extremely low inteligence\r\n- Victim wont perform extreme tasks', '- #static-spell \r\n- #Master-concept \r\n- #magic-system-1', '- Upon fail disables this magic for a day\r\n- both targets are chosen by the caster', 0),
(12, 'Communication network', 'Truth', 5, 25, 2, '- All targets need a direct line of sight when casting', '- Free communication throughout the entire party', '- Stops working immediately when the caster falls unconscious\r\n- works for up to a day', '- #static-spell \r\n- #Advanced-concept \r\n- #skill-posibility \r\n- #magic-system-1', '- Caster can keep the connection indefinitely by casting again even without direct line of sight\r\n- doesn\'t require focus', 0),
(13, 'Copy spell', 'Lie', 0, 10, 0, '- Needs at least one less complexity than the targeted spell', '- Creates a weaker version of the targeted spell', '- works up to 7th tier complexity spells', '- #static-spell \r\n- #Intermediate-concept \r\n- #magic-system-1', '- Upon fail causes the caster to suffer the fail effects of targeted spell', 0),
(14, 'Create Elemental', 'Creation', 7, 10, 1, '-', '- Creates an elemental from basic elements \r\n- Elemental will follow commands from the caster', '- Doesn\'t have a consciousness \r\n- Up to 10 elementals may be formed by the caster', '- #dynamic-spell \r\n- #Master-concept \r\n- #magic-system-1', '- Elemental can cast up to ten 4 tier spells\r\n- Elemental will perish upon casting all of their spells', 0),
(15, 'Create Matter', 'Creation', 5, 5, 1, '-', '- creates matter the size of a cubic decimeter', '- Only basic matter can be created (dirt, stone, water...), however the limit is lessened with every upscale', '- #dynamic-spell \r\n- #Basic-concept \r\n- #magic-system-1', '-', 0),
(16, 'Create Seedling', 'Creation', 8, 95, 20, '- Needs a target vessel that can hold a soul', '- Forms a magic circle seed', '-', '- #static-spell\r\n- #Impossible-concept\r\n- #magic-system-1', '- The seed can take years to grow into a fully functional circle\r\n- Alternatively, the seed can receive a huge burst of energy (comparable to 10 circles), in which case, the circle is slightly corrupted', 0),
(17, 'Create Vessel', 'Creation', 9, 95, 50, '- depending on the size and complexity of the body, the cast time can change', '- Creates an organic body with the ability to hold a soul', '-', '- #dynamic-spell\r\n- #Impossible-concept\r\n- #magic-system-1', '- The body will function for a while, but shuts down after a few hours, unless it receives a soul', 0),
(18, 'Curse projectile', 'Hate', 2, 10, 1, '-', '- Inflicts pain to the target and light burns\r\n- Ignores armor', '- Doesn\'t affect beings with 5 or more circles', '- #dynamic-spell \r\n- #Intermediate-concept \r\n- #magic-system-1', '-', 0),
(19, 'Dead world illusion', 'Lie', 5, 50, 2, '- Requires eye contact with the target (at least once during cast time)', '- Creates an illusion of a fake world, where all living beings die on the spot\r\n- Effect lasts indefinitely', '- If target realizes they\'re in a fake world the effect only lasts up to 1 round', '- #static-spell \r\n- #Hard-concept \r\n- #skill-posibility \r\n- #magic-system-1', '- Upon fail disables this magic targets the caster', 0),
(20, 'Endure', 'Existence', 3, 25, 0, '- requires focus for the duration of the effect (but caster doesn\'t suffer consequences of losing focus)', '- Makes caster somewhat invulnerable (most physical attacks don\'t work and some magic too)\r\n- Paralyzes caster\r\n- Effect lasts for 3 rounds, but can be undone by losing focus', '- Caster needs to be on stable ground to keep focus for this spell', '- #static-spell \r\n- #Advanced-concept \r\n- #skill-posibility \r\n- #magic-system-1', '- Upon fail makes caster dizzy', 0),
(21, 'Fact', 'Truth', 5, 50, 1, '-', '- Figure out a desired fact', '- Can only be cast once a day\r\n- Not omniscient', '- #static-spell \r\n- #Hard-concept \r\n- #magic-system-1', '- Upon fail disables this magic for a day', 0),
(22, 'Familiar command', 'Love', 5, 10, 0, '- Needs an allied familiar as a target', '- Make a familiar perform one active magic for you\r\n- All of the magics effects apply to the familiar instead of you', '- Familiar needs to have enough magic circles (or suffers the consequences)\r\n- Caster has less control over the magic', '- #static-spell \r\n- #Intermediate-concept \r\n- #skill-posibility \r\n- #magic-system-1', '- Upon fail knocks the familiar unconscious', 0),
(23, 'Fireball', 'Creation', 3, 10, 1, '- starting point of the projectile cannot be inside solid or liquid matter', '- Creates a ball of fire that can be thrown', '- throwing distance depends on the strength of the caster', '- #dynamic-spell \r\n- #Intermediate-concept \r\n- #magic-system-1', '- Upon fail explodes in hand', 0),
(24, 'Form Bullet', 'Creation', 4, 5, 1, '- Needs material from the environment', '- Form a bullet from rock, ice, or any matter around\r\n- The bullet will be the size of around a cubic centimeter', '-', '- #dynamic-spell \r\n- #Basic-concept \r\n- #magic-system-1', '- cast time can be longer, which will cause the bullet to be bigger, faster and denser\r\n- upon fail, erupts in a small explosion', 0),
(25, 'Form Golem', 'Creation', 6, 20, 3, '- Needs material from the environment', '- Creates a golem out of solid matter\r\n- Golem will obey basic commands from the caster', '- Can be made only with basic solid matter\r\n- Crumbles after 10 minutes \r\n- Golem has a very simple mind\r\n- Up to 10 golems may be formed by the caster', '- #dynamic-spell \r\n- #Hard-concept \r\n- #magic-system-1', '-', 0),
(26, 'Hide object', 'Lie', 3, 10, 1, '- Requires direct contact with target', '- Makes object/being almost invisible', '- can only be cast once per round', '- #static-spell \r\n- #Hard-concept \r\n- #magic-system-1', '- Can be cast on the caster', 0),
(27, 'Inspect', 'Truth', 3, 50, 3, '-', '- Find out more information about something in your field of view', '- what you learn is slightly limited by your current knowledge', '- #static-spell \r\n- #Hard-concept\r\n- #magic-system-1', '-', 0),
(28, 'Jitter', 'Chaos', 3, 25, 1, '- Needs direct contact to the target during casting', '- makes the targeted being have uneven and difficult movement\r\n- depending on the strength of the target, may cause extreme spasms\r\n- effect lasts for 5 rounds', '- If target has enough strength or magic rezistence, there is no effect', '- #static-spell \r\n- #Advanced-concept \r\n- #magic-system-1', '- Upon fail, the caster becomes the target\r\n- Can be cast on inanimate objects', 0),
(29, 'Life steal', 'Existence', 4, 50, 2, '- needs direct contact with target (or works through weapons)', '- Gain as 10% vitality of the damage dealt\r\n- lasts for 10 rounds after cast', '- Both target and caster needs to be conscious\r\n- doesn\'t stack', '- #static-spell \r\n- #Hard-concept \r\n- #skill-posibility \r\n- #magic-system-1', '- Upon fail gives intense pain', 0),
(30, 'Mind control', 'Order', 5, 50, 2, '- Doesn\'t work for long distances', '- Control the mind of a target\r\n- Can perform magic while in control', '- Effect lasts 5 rounds, or until target is severely damaged\r\n- Doesn\'t work on strong willed targets', '- #static-spell \r\n- #Hard-concept \r\n- #magic-system-1', '- Upon fail disables this magic for a day', 0),
(31, 'Orb of shielding', 'Order', 2, 10, 1, '- needs a target that is to be shielded', '- creates a sphere made up of shielding matter that blocks most attacks', '- withstands around 50 kg of force', '- #static-spell \n- #Intermediate-concept \n- #magic-system-1', '-', 0),
(32, 'Pain inflict', 'Hate', 3, 20, 1, '- Caster needs direct line of sight to the body of the target', '- Inflicts pain on to target', '- Only works on physical bodies\r\n- Doesn\'t work on powerful enemies or just enrages them\r\n- Doesn\'t work on covered areas', '- #static-spell \r\n- #Advanced-concept \r\n- #skill-posibility\r\n- #magic-system-1', '- Upon fail targets the caster\r\n- Targeted area can be very specific', 0),
(33, 'Paralyse', 'Hate', 4, 25, 2, '- Requires direct contact with the target\r\n- Doesn\'t need that much focus', '- Stops movement of both caster and target\r\n- Effect indefinitely until cancelled by caster', '- doesn\'t stop magic', '- #static-spell \r\n- #Advanced-concept\r\n- #magic-system-1', '- Upon fail paralyzes caster for a round', 0),
(34, 'Platform', 'Creation', 2, 10, 0, '- needs direct line of sight', '- Summons a 2D platform\r\n- effect lasts for 2 rounds', '- Cannot be summoned inside solid matter\r\n- only 2 can be activated per round\r\n- only strong enough to withstand the weight of a lighter person (around 60 kg)', '- #dynamic-spell\r\n- #Intermediate-concept \r\n- #magic-system-1', '-', 0),
(35, 'Raise wall', 'Order', 4, 10, 1, '- needs to be activated on a stable surface', '- raises a wall out of a solid surface', '- can be raised in the radius of 20m away from the caster', '- #dynamic-spell \r\n- #Basic-concept \r\n- #magic-system-1', '-', 0),
(36, 'Rebound', 'Lie', 0, 75, 0, '- Requires one less complexity of the targeted spell', '- Take control of another spell', '- Doesn\'t work on some spells', '- #static-spell\r\n- #Master-concept\r\n- #casting-exchange\r\n- #magic-system-1', '- Targeted spell can be your own (possible to redirect spells)', 0),
(37, 'Skip', 'Existence', 5, 40, 1, '- Needs direct line of sight', '- Teleports a targeted object/being\r\n- Caster can target itself', '- Range is 10m from the original position', '- #static-spell \r\n- #Master-concept\r\n- #skill-posibility \r\n- #magic-system-1', '-', 0),
(38, 'Spark', 'Creation', 1, 1, 0, '- Within direct line of sight of 5m', '- Creates a spark\r\n- lasts for a round', '- Cannot be created inside solid matter', '- #dynamic-spell \r\n- #Trivial-concept\r\n- #magic-system-1', '-', 0),
(39, 'Sparkbolt', 'Creation', 2, 5, 1, '-', '- Fires a bolt of lightning\r\n- Upon hit hinders the movement of the target', '- Cannot be summoned inside solid matter', '- #dynamic-spell\r\n- #Basic-concept\r\n- #magic-system-1', '-', 0),
(40, 'Touch of death', 'Hate', 5, 50, 1, '-', '- floating hand made of red ice quickly creeps up to the target\r\n- upon contact with any living creature kills it by slowly freezing it from within', '- ice will follow for up to 15 meters', '- #dynamic-spell \r\n- #Hard-concept\r\n- #magic-system-1', '- spawns 5 meters above target (or closer if area above is obstructed)\r\n- remains until all ice is completely melted', 0),
(41, 'Truth detection', 'Truth', 4, 25, 1, '- Used on one sentence per cast', '- Detects if a person is lying or not', '- Doesn\'t work on individuals with contact to the god of lies', '- #static-spell\r\n- #Advanced-concept\r\n- #skill-posibility \r\n- #magic-system-1', '- Can be used to disspell some illusion magic', 0),
(42, 'Freeze charge', 'Creation', 1, 10, 0, '-', '- Area around casted magic starts freezing\r\n- Extinguishes fire\r\n- Sometimes slows down enemies hit with the spell', '-', '- #dynamic-mod \r\n- #Intermediate-concept \r\n- #casting-exchange\r\n- #magic-system-1', '-', 1),
(43, 'Homing', 'Origin', 2, 25, 0, '-', '- Magic tries to travel in the direction of the target', '- Effect either fades after 3 rounds or needs active focus', '- #dynamic-mod\r\n- #Advanced-concept\r\n- #casting-exchange \r\n- #skill-posibility \r\n- #magic-system-1', '-', 1),
(44, 'Magic downscale', 'Origin', -1, 0, 1, '- can be stacked', '- decreases the effect of a spell, depending on the spell', '-', '- #Basic-concept \r\n- #universal-mod \r\n- #magic-system-1', '-', 1),
(45, 'Magic upscale', 'Origin', 1, 0, 1, '- can be stacked', '- Increases the effect of a spell, depending on the spell', '-', '- #universal-mod\r\n- #Intermediate-concept\r\n- #magic-system-1', '- Doubles the fail rate of the modified magic', 1),
(46, 'Mass addition', 'Existence', 1, 25, 0, '- can be stacked', '- Adds mass to your spell\r\n- Projectiles become heavier and caster receives more knockback', '-', '- #dynamic-mod \r\n- #Advanced-concept \r\n- #casting-exchange\r\n- #skill-posibility \r\n- #magic-system-1', '-', 1),
(47, 'Prepared invocation', 'Origin', -1, 10, 3, '- CANNOT be stacked', '- Decreases the required spell complexity\r\n- Requires longer cast time', '- complexity cannot be less than 1', '- #universal-mod \r\n- #Intermediate-concept \r\n- #magic-system-1', '-', 1),
(48, 'Re-Routing', 'Existence', 1, 10, 0, '- Your magic circle count must be higher than the targeted spell', '- Changes the target or direction of a spell while the spell is active\n- Can be activated multiple times during the spells lifetime', '-', '- #dynamic-mod\n- #Intermediate-concept\n- #casting-exchange\n- #magic-system-1', '- The targeted spell can be modified (as if you are recasting that spell in the position of the target)', 1),
(49, 'Shortened invocation', 'Origin', 1, 25, -1, '- can be stacked', '- shortens the cast time\r\n- increases complexity', '- final cast time cannot go under 0', '- #universal-mod\r\n- #Advanced-concept\r\n- #magic-system-1', '-', 1),
(50, 'Speed up', 'Existence', 1, 10, 0, '- can be stacked', '- Speeds up projectile spells (and maybe some more)', '- doesn\'t work well on spells that do not move', '- #dynamic-mod\r\n- #Intermediate-concept\r\n- #skill-posibility\r\n- #magic-system-1', '-', 1),
(51, 'Spell Compression', 'Existence', 1, 25, -1, '-', '- Compresses the spell but amplifies the effect', '- Has no effect on certain spells', '- #dynamic-mod \r\n- #Advanced-concept\r\n- #magic-system-1', '-', 1),
(52, 'Spell Decompression', 'Existence', -1, 25, 1, '-', '- Decompresses the spell but reduces the effect\r\n- Gives bigger AOE (area of effect)', '- Has no effect on certain spells', '- #dynamic-mod\r\n- #Advanced-concept \r\n- #magic-system-1', '-', 1),
(53, 'Damage mirror', 'Hate', 5, 60, 3, '- Requires a sample of the targeted being (eg. blood)\n- Requires direct line of sight for the damage reflection', '- Reflects all physical damage onto target (caster receives no damage)\n- Creates a crystal floating next to the caster, through which the damage reflects', '- The effect stops the moment the crystal breaks\n- Only one crystal per fight', '- #dynamic-spell\n- #skill-posibility\n- #magic-system-1', '- The crystal is somewhat brittle, even a child could destroy it', 0),
(54, 'Magic degradation', 'Chaos', 5, 40, 0, '- While this magic is a mod, its complexity is counted separately (doesnt add to the complexity of the active magic)', '- Degrades the \"rules\" of any magic\n- Caster rolls a d4, which determines if the degradation goes in their favor, or against', '- The rules still have to follow the lower rules of Latika', '- #universal-mod\n- #skill-posibility\n- #magic-system-1', '- Upon utter fail angers the Truth keepers', 1),
(55, 'Appraisal', 'Truth', 6, 25, 10, '- Caster needs a guess at least at what the object is\n- Requires direct contact', '- Gives the caster deeper understanding about an object\n- The effect gives quite detailed information', '- ', '#static-spell\n#magic-system-1', '- Upon critical success, caster recieves history of the object', 0),
(56, 'Latika Manipulation', 'Origin', 2147483647, 0, 0, '- this spell is incompatible with circles', '- Allows the user to shape the tree', '- Most users can shape just one Latika at once', '- #origin-spell\n- #system-0', '- usage is not recommended to the inexperienced with \"gardening\"', 0),
(57, 'Basic shield', 'Order', 1, 10, 1, '- ', '- Creates a desired 2D shape of shielding matter blocking most attacks', '- withstands around 20 kg of force', '#dynamic-spell\n#skill-possibility\n#magic-system-1', '- somewhat useless, as it is quite weak', 0),
(58, 'Attract object', 'Order', 2, 40, 1, '- Needs dirct line of sight to the target\n- At most 10 meters', '- Brings an object closer to the caster\n- Generaly in the direction of the casters hands', '- Doesnt work on heavy objects', '#static-spell\n#skill-posibility\n#magic-system-1', '- ', 0),
(59, 'Grant resistance', 'Love', 2, 25, 2, '- needs direct contact', '- Grants a resistance to a targeted being\n- resistances include: elemental (fire, water...), physical (blunt, slash...), psychic...', '- creatures can only have 3 resistances at once (otherwise a random resistance is replaced)', '#static-spell\n#magic-system-1', '- The more specific a resistance is, the stronger it is (blunt damage resistance is stronger then overall physical)', 0),
(60, 'Heal', 'Love', 5, 75, 3, '- Needs direct contact for full effect (but not needed)\n- For continuous healing needs focus', '- Heals a targeted being', '- cannot create complex tissue', '#static-spell\n#magic-system-1', '- ', 0),
(61, 'Disarm', 'Chaos', 1, 50, 0, '- Requires direct line of sight', '- Disarms an object from a targeted being', '- Can only be used once per turn', '#static-spell\n#skill-possibility\n#magic-system-1', '- Essentially forces the targets muscles to misfire', 0),
(62, 'Critical amp', 'Chaos', 2, 50, 0, '-', '- Forces the attack to attempt hitting a weak spot', '- Doesnt guarantee a critical success or even a hit in the first place', '#static-spell\n#skill-possibility\n#magic-system-1', '- Affects the next attack', 0),
(63, 'Rip and Tear', 'Chaos', 4, 50, 1, '-', '- Gives a dynamic spell a bit more lifetime\n- Anything the spell touches [scratches] and [gnaws] at anything it comes into contact with', '- Effect lasts for upto 10 rounds or until the spell expires', '#dynamic-mod\n#skill-possibility\n#magic-system-1', '- Can be cast on a spell that already finished casting', 1),
(64, 'Immunity', 'Love', 6, 75, 3, '- Requires direct line of sight to the target\n- Self casting immunity takes double cast time', '- Targeted being recieves full immunity to a certain type of damage', '- The immunity cannot be across a broad range like physical damage immunity, however, blunt damage is permitted', '#static-spell\n#skill-possibility\n#magic-system-1', '-', 0),
(65, 'Cracked Quality', 'Hate', 7, 50, 2, '- Learning this spell requires more effort', '- Damages the rules of Latika for about a day\n- The caster chooses which rule to [damage]', '- Spell cannot target a rule which the caster doesnt comprehend', '#static-spell\n#magic-system-1', '- Upon fail angers the Truth keepers', 0),
(66, 'Wilting rose', 'Hate', 5, 33, 1, '- ', '- Shoots rose petals in the direction of sight\n- Any petal that comes in contact with flesh starts growing into the flesh and rotting it ', '- Doesnt work through thick clothing or armor', '#dynamic-spell\n#projectile-spell\n#magic-system-1', '- Can change to spiritual petals when 2 more complexity is used, which works on souls and spiritual objects', 0),
(67, 'Substituting chances', 'Chaos', 6, 15, 0, '- ', '- force the target to re-roll their die', '- ', '#static-spell\n#magic-system-1', '- can be multicast with chaos-effect and chaos-enhance', 0),
(68, 'Ray of none', 'Hate', 4, 40, 1, '- d20 for accuracy', '- Everything that touches this beam loses feeling and movement in that place\n- Every magic upscale changes the effect slightly', '- The beam penetrates at most 3 cm of matter\n- The beam lasts at most 5 ms\n- The maximum distance is 10 m', '#dynamic-spell\n#magic-system-1', '- the beam is 2 cm in diameter\n- effect upon magic upscale (you can choose as many effects as there are upscales):\n(higher penetration [10cm])\n(beam bending [up to 3 times])\n(beam destroys matter)\n(beam lasts til next round)\n(beam splitting [2 beams])', 0),
(69, 'Additional chance', 'Love', 5, 75, 0, '- ', '- Targeted being will play as if they had another round worth of time, while the time they spend doing that still amounts to one round', '- Too much successful use at once may anger the Truth keepers', '#static-spell\n#magic-system-1', '- Can be cast upon self', 0),
(70, 'Peaceful sleep', 'Love', 4, 40, 2, '- The complexity has to be at least one less than the targets amount of magic circles\n- Caster needs to be in direct contact with the head or neck of the target', '- Puts the targeted being into shallow sleep', '- ', '#static-spell\n#skill-possibility\n#magic-system-1', '- If the complexity is high enough, the target enters deep sleep', 0),
(71, 'Static thrust', 'Chaos', 4, 35, 0, '- ', '- Aligns the particles around two objects to thrust them as if [magnetically] towards each other', '- cannot work inside organic matter, it can, however, work around it', '#dynamic-spell\n#skill-posibility\n#magic-system-1', '- ', 0),
(72, 'Distant cast', 'Existence', 5, 25, 3, '- ', '- Makes the magic act as if it was cast at a distant location', '- max 20 m distance', '#universal-mod[for-now]\n#magic-system-1', '- ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `character_id` int UNSIGNED NOT NULL,
  `refresh_inventory` int UNSIGNED NOT NULL DEFAULT '30000',
  `refresh_magic` int UNSIGNED NOT NULL DEFAULT '30000',
  `show_message` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Admin'),
(3, 'Champion'),
(4, 'NPC'),
(2, 'Player');

-- --------------------------------------------------------

--
-- Table structure for table `special_item`
--

CREATE TABLE `special_item` (
  `inventory_id` int UNSIGNED NOT NULL,
  `enchantment` varchar(300) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `enchantment_eq_only` tinyint DEFAULT NULL,
  `blessing` varchar(150) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `blessing_eq_only` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`id`, `name`) VALUES
(7, 'accessory'),
(4, 'armor'),
(8, 'bag'),
(9, 'consumable'),
(6, 'gloves'),
(5, 'headwear'),
(10, 'key item'),
(11, 'material'),
(1, 'misc'),
(3, 'shield'),
(2, 'weapon');

-- --------------------------------------------------------

--
-- Table structure for table `wiki`
--

CREATE TABLE `wiki` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `content` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `tags` varchar(350) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '#unfinished',
  `access` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `exceptions` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `wiki`
--

INSERT INTO `wiki` (`id`, `name`, `content`, `tags`, `access`, `exceptions`) VALUES
(19, 'Last Time', '<h1>Nicholas Quest</h1>\n\n<h2>Cesta do dungeonu pod královstvím Gisonie</h2>\n<p>Maru zůstává v přístavu a čeká na příchod ostatních.<br>\nFifa šel pro loď.<br>\nIvan a Billy šli do královské hrobky <a href=\'?s=United kingdom of Gisonia\'>Gisonie</a>. Co všechno prožijí v hrobce je pouze na nich.(potkali <a href=\'?s=Phera\'>Pheru</a> lol)</p>\n\n<h2>Korunace Nicholase</h2>\n<p><a href=\'?s=Griuf\'>Griuf</a> a <a href=\'?s=Oscar\'>Oscar</a> úspěšně korunovali <a href=\'?s=Nicholas\'>Nicholase</a> na krále <a href=\'?s=United kingdom of Gisonia\'>Gisonie</a>. Teď se vrací do přístavu kde budou čekat na <a href=\'?s=Jerome\'>Jeroma</a></p>\n\n<h1>God\'s descent Quest</h1>\n\n<h2>1. státní převrat</h2>\n<p><a href=\'?s=Griuf\'>Griuf</a> a <a href=\'?s=Oscar\'>Oscar</a> procestovali stát <a href=\'?s=Pedia\'>Pedia</a> a zavraždili jejího panovníka. Oscar úspěšně uchvátil <a href=\'?s=Phera\'>Pheru</a> svým charizmatem (ještě jsme v tu chvíli neměli kostky, ale kdyby jo, hodil by 11/d12 damn). Teď dorazili do hlavního města <a href=\'?s=Abhzian empire\'>Abhzian empire</a> a plánují osvobodit bohyni chaosu a navázat s ní (pro Oscara) a ještě s bohem lži (pro Griufa) kontakt.</p>\n\n<h2>Rodinný nákup a počáteční útok</h2>\n<p><a href=\'?s=Griuf\'>Griuf</a> a <a href=\'?s=Oscar\'>Oscar</a> dojeli do hlavního města <a href=\'?s=Abhzian empire\'>Abhzianu</a> a nakoupili na aukci černého trhu. Na trhu nechali všechny jejich peníze. Poté se pokoušeli vtrhnout do sultánova paláce, kde Griufovi se to úspěšně povedlo a Oscar teď běží na pláž útočit na vojsko. V tu chvíli začali z oceánu útočit vojska <a href=\'?s=United kingdom of Gisona\'>Království Gisonie</a>.</p>\n\n<h2>Chaos v Abhziánu</h2>\n<p><a href=\'?s=Griuf\'>Griuf</a> a <a href=\'?s=Oscar\'>Oscar</a> následně zaútočili na sultána který nad nimi zvítězil a oni se vrátili k mostu. Následně přijíždí <a href=\'?s=Nizen\'>Nizen</a> a <a href=\'?s=Jerome\'>Jerome</a> s královskou flotilou. Následně po tom co Jerome a Nizen projdou okolo <a href=\'?s=Phera\'>Phery</a> a <a href=\'?s=Heidi\'>Heidi</a> se po dlouhé době všichni setkají pod mostem hlavního města <a href=\'?s=Abhzian empire\'>Abhzianu</a>.</p>\n\n<h2>Sultán Solimán</h2>\n<p>Všichni naši hrdinové úspěšně porazili <a href=\'?s=Cinar\'>sultána</a> a <a href=\'?s=Oscar\'>Oscar</a> osvobodil <a href=\'?s=Bazella\'>bohyni chaosu</a> ze zajetí, avšak je zmaten, jelikož bohyně chaosu mu nedala žádné přesné informace. Ostatní tři mezitím vybrali pokladnu a ukořistili si nové zbraně ze zbrojnice. Pro Oscara se možná naskytnou informace u <a href=\'?s=Phera\'>Phery</a>.</p>\n\n<h2>Cesta do Drákie</h2>\n<p><a href=\'?s=Oscar\'>Oscar</a>, <a href=\'?s=Griuf\'>Griuf</a> a <a href=\'?s=Nizen\'>Nizen</a> vyrazili na cestu směrem do <a href=\'?s=Dracia\'>Drakie</a>. Oscar, aby splnil quest, Griuf, aby otevřel starodávnou kovadlinu a Nizen, aby se naučila magii. Oscar si mezitím opravil meč gladiátor. Nakonec potkali otroka, kterého už viděli na své cestě jednou... (na černém trhu)</p>\n\n<h2>Božský sestup</h2>\n<p><a href=\'?s=Oscar\'>Oscar</a> a <a href=\'?s=Griuf\'>Griuf</a> spojili síly a společně zahájili rituál pro <a href=\'?s=Bazella\'>bohyni chaosu</a>. Po dlouhém a těžkém boji s <a href=\'?s=Thrumborian\'>Thrumboriánem</a> se konečně podařilo dvojici monstrum porazit a následně rituál dokončit. Avšak nečekali následky svých činů a každého individuálně postihla božská odplata. (účastnili se i Nizen a Greneha, ale celou dobu spaly takže nic nedělali)</p>\n\n<h1>Jerome a jeho individuální dračák (tři roky pozadu)</h1>\n<p><a href=\'?s=Jerome\'>Jerome</a>, který společně s <a href=\'?s=Nicholas\'>Nicolasem</a> přijíždí zpět do <a href=\'?s=United kingdom of Gisona\'>Gisonie</a>, začal vyslýchat a mučit radu starších.</p>\n<p>Jerome začal prozkoumávat dungeon v <a href=\'?s=Abhzian empire\'>Abhzianu</a> a přitom zjistil funkci svého nového kladiva. Následně vyvolal <a href=\'?s=Cornelius\'>boha pravdy</a> a vyptával se na pár otázek. Poté jeho cesta dungeonem pokračovala.</p>\n<p>Jerome po průzkumu dungeonu vyšel dále na svou cestu. Avšak cesta byla rychle zastavena příchodem <a href=\'?s=Despair disease\'>hordou monster</a>, které zmenšili počet členů o polovinu. Nakonec vyšli z boje jako vítězové, ale ztráty se nedaly ignorovat, proto zamířili do hlavního města.</p>\n\n<h1>God\'s aftermath</h1>\n\n<h2>Oscarovo nešťastné probuzení</h2>\n<p><a href=\'?s=Oscar\'>Oscar</a> se po incidentu probouzí uprostřed pouště s <a href=\'?s=Phera\'>Pherou</a> v bezvědomí. Plný paniky se ji snaží probrat a málem po neúspěšném kouzlu upadne do bezvědomí také (naštěstí měl failsafe ring). Nakonec ho napadne použít krystal chaosu který měl v inventáři (pašák, tleskám, to ani mě nenapadlo) a Phera se naštěstí probouzí. Společně s Pherou se tedy vydali na cestu hledat <a href=\'?s=Bazella\'>bohyni chaosu</a> poté, co jim neodpovídala na jejich kontakt. </p>\n\n<h2>Griufovo nebezpečné probuzení</h2>\n<p><a href=\'?s=Griuf\'>Griuf</a>, který se probouzí ve sklepení, se ocitne ve vážném nebezpečí od <a href=\'?s=Lydia\'>bohyně nenávisti</a> a ihned běží směrem do <a href=\'?s=Shia\'>Shii</a>, kde se setkává se zmrzačeným <a href=\'?s=Oscar\'>Oscarem</a>. Oscar totiž těsně před tím potkal <a href=\'?s=Bazella\'>bohyni chaosu</a> (společně s <a href=\'?s=Phera\'>Pherou</a>), avšak nebylo to šťastné setkání a bohyni rozzuřil. Následně se dozvěděl, že Phera pomalu umírá bez síly chaosu. Proto je teď jeho účelem ji zachránit.</p>\n\n<h1>Dungeon of Lies</h1>\n\n<h2>Záchrana Phery (poprvé) a vstup do dungeonu</h2>\n<p>Skupina se setkává v městečku Wakyuen (<a href=\'?s=Shia\'>Shia</a>) a jejich dalším úkolem je zachránit <a href=\'?s=Phera\'>Pheru</a>. Proto hrdinové cestují do <a href=\'?s=Olsinbel\'>Olsinbelu</a> za <a href=\'?s=Aria\'>bohyní lásky</a> aby se smilovala nad ztraceným andělem. Putování jim ztížila <a href=\'?s=Bazella\'>bohyně chaosu</a>, která aktivovala <a href=\'?s=Deity roulette\'>dny bohů</a>. Naštěstí se jejich prosba bohyni lásky naplnila a proto pokračovali v jejich cestě. Dalším cílem bylo posílit se, což pro ně znamenala cesta do blízkého dungeonu, který byl překvapivě jednoduchý, až na to, že neví, co je doopravdy čeká... (btw <a href=\'?s=Griuf\'>Griufa</a> nechali v nějakym random městě)</p>\n\n<h2>Divná podlaha (začátek devíti-hodinového sessionu)</h2>\n<p><a href=\'?s=Oscar\'>Oscar</a>, <a href=\'?s=Eryn\'>Eryn</a> a <a href=\'?s=Greneha\'>Greneha</a> pokračují na ve své cestě s cílem zastavení <a href=\'?s=Deity roulette\'>dnů bohů</a>. V dungeonu ve kterém minule ukončili svou cestu si Eryn všiml, že podlaha po jejich nohama je překvapivě křehká. Následně Eryn vystřelil hmotnou hlínu (Form Bullet & Spell Decompression & Mass addition) na podlahu, která se po tíze hlíny rozdrtila a svrhla skupinu do hlubin. </p>\n\n<h2>Farius a první anděl</h2>\n<p>V tu chvíli, všichni zmatení, dopadli do jednoho ze vstupů Labyrintu <a href=\'?s=Farius\'>Faria</a> (Also Greneha spadla první a za ní následovali Oscar a Eryn, který na ní spadli lol). Následně procházeli skrz labyrint, kde objevili <a href=\"?s=Titanshellica\">Skořapice Titánské</a> a následně i samotného Faria. Farius skupinu chvíli poklidně provází skrz jeho labyrint, avšak v tu chvíli co přijde Phera je Farius zaskočen a zároveň potěšen, že po dlouhé době konečně potkal anděla. Přitom, co se Farius snaží využít Pheru jako materiál pro vzkříšení <a href=\'?s=The First Angels\'>tajemné loutky</a> visící v jeho hlavní místnosti. Skupina se tomuto snaží zabránit, až nakonec z veliké signatury magie se do místnosti protrhá <a href=\'?s=Bazella\'>bohyně chaosu</a>, která rozerve Faria zevnitř. Když nastane chvilka klidu, bohyni zaujme ležící loutka uprostřed místnosti a loutku vzkřísí samotná bohyně. Skupina pohlíží na chaos probíhající před jejich očima a s hrůzou přihlíží na <a href=\'?s=Bazella\'>bohyni bez hlavy</a> stojící vedle loutky. </p>\n\n<h1>Chaos Festival</h1>\n\n<h2>Útěk z dungeonu a konec dnů bohů</h2>\n<p>Naštěstí se jejich zkáze vyhnuli díky <a href=\'?s=Aria\'>bohyni lásky</a>, která je vyhodila z labyrintu na okraj <a href=\'?s=Dracia\'>Drakie</a>. <a href=\'?s=Bazella\'>Bohyně Chaosu</a>, už nežije. Naše skupina využila jejich polohy a ihned směřovali do centra Drakie s plánem zničit <a href=\'?s=Deity roulette\'>dny bohů</a>. Oscara zaskočí to, že jeho <a href=\'?s=Chaos Magic\'>magie chaosu</a> stále funguje, avšak v tu chvíli ho tento fakt nezastavuje. Po nějaké době zápasení s <a href=\'?s=Dragon\'>draky</a> (also <a href=\'?s=Eryn\'>Eryn</a>, který zápasí se svými pocity k drakům lol) se do centra Drakie dostali a také generátor dnů bohů zničili. Následoval útěk před drakem královským, kterého naštěstí přesvědčili, aby je nechal být (někdo hodil 12/d12 wow). Po dalším úspěšném questu začal Oscar zkoumat své stále fungující spojení s magií chaosu a pokusil se kontaktovat svou (tehdejší) bohyni. </p>\n\n<h2>Oscarovo dobrodružství ve voidu</h2>\n<p>Ocitl se v <a href=\'?s=Void\'>temné nicotě</a> kde v dálce viděl různé <a href=\'?s=Siive\'>rojnice světla</a>, které se přibližovali. Jak se rojnice přibližovali, <a href=\'?s=Oscar\'>Oscar</a> zůstával na míste (debil) a přestože cítil z hloubky svého těla že je ve velkém nebezpečí a že by měl spirituální kontakt ihned přerušit, nehnul se ani krok (DEBIL). Následně ho rojnice obklopila (DEBIIIIL) a začala požírat jeho duši (DEBIL DEBILNÍ VAROVAL JSEM HO TŘIKRÁT). <a href=\'?s=Phera\'>Phera</a> která toto postihla z reality ihned vešla do kontaktu s Oscarem a (bohužel neefektivně) bránila obě jejich duše před rojnicí. Oscar zběsile a v bolestech zvolal jméno <a href=\'?s=Victor\'>existence</a>, který jakoby bez zamyšlení Pheru a Oscara přenesl na <a href=\'?s=World Bridge\'>Most</a>. </p>\n\n<h2>Greneha a bohyně nenávisti</h2>\n<p>Oba dva teď umírající a v bolestech leželi na <a href=\'?s=World Bridge\'>chladné bílé podlaze nicoty</a>, přičemž <a href=\'?s=Victor\'>bůh existence</a> mumlal tichá slova zmatku, jakoby si Phery a Oscara nevšimnul. Mezitím Greneha se snahou pomoci svým společníkům začala kontakt s <a href=\'?s=Lydia\'>bohyní Nenávisti</a>, kde s bohyní měla krátký dialog (spíše monolog ze strany Nenávisti). Bohyně nenávisti, která kvůli její povaze utlumila smysly a vyvolala nenávistné myšlenky v mysli Grenehy, přičemž Greneha následně začala útočit na Eryna. Po chvíli se Greneha uklidnila a s bohyní nenávisti se domluvila, že bohyně nenávisti pomůže ztraceným duším na <a href=\'?s=World Bridge\'>Mostu</a>.</p>\n\n<h2>Návrat do dungeonu (konec devíti-hodinového sessionu)</h2>\n<p>Na <a href=\'?s=World Bridge\'>Mostu</a> se za chvíli ocitla <a href=\'?s=Lydia\'>bohyně nenávisti</a> a <a href=\'?s=Victor\'>boha existence</a> požádala o propuštění <a href=\'?s=Phera\'>Phery</a> a <a href=\'?s=Oscar\'>Oscara</a>, což tak poté učinil. Oscar se úspěšně vrátil do reality, avšak Phera se bohužel neprobrala. Skupina hledala možnost jak Pheru probrat a zjistili, že skořápka její duše pukla a teď Phera pomalu umírá (znova :| ). Jelikož v labyrintu <a href=\'?s=Farius\'>Faria</a> se nacházeli nástroje pro úpravu duše se vydali zpět do labyrintu. Skupina se znovu nachází v labyrintu kde hledá způsob jakým by se mohla Phera vyléčit, avšak v tu dobu už odbyla <strong>9.</strong> hodina našeho DnD setkání a byl jsem absolutně neschopen cokoliv popisovat či vymýšlet.</p>\n\n<h1>Dungeon of Lies pt 2</h1>\n\n<h2>Hlubší průzkum</h2>\n<p><a href=\'?s=Oscar\'>Oscar</a>, <a href=\'?s=Greneha\'>Greneha</a>, <a href=\'?s=Eryn\'>Eryn</a> a <a href=\'?s=Phera\'>Phera</a> (v bezvědomí) prozkomávají dungeon, dokud nenašli skryté dveře. Poté co se uspěšně dostali to skrytých komnat, objevili <a href=\'?s=Farius\'>Fariovy</a> další projekty které souviseli s <a href=\'?s=Chermeta\'>chermetou</a>. Procházeli kolem různých místností s monstry a jinými Fariovy výtvory, hlavičku bez tělíčka a nekolika znetvořených humanoidních živých bytostí, avšak bez naděje v jejich očích. Omylem aktivovali past, která je do komnat uzavřela a zároveň odkryla jinou místnost, plnou <a href=\'?s=Chwerr\'>chwerů</a>. Po dlouhém zápasu naštěstí nikdo nestratil svůj život, avšak Eryn si omylem zmrazil nohy skrz na skrz. Poté objevili přístroj, který umožňuje komunikaci smrtelníků s <a href=\'?s=Void\'>neprostorem</a> a proto se rozhodli spolu s Pherou vstoupit a Pheru \"opravit\". (Eryn jediný zůstal v normálním světě)</p>\n\n<h2>Prostor neprostor</h2>\n<p>Skupina se ocitne v <a href=\'?s=Void\'>neprostoru</a>, kde následně potkají <a href=\'?s=Farius\'>Fariovu</a> duši a společně s ním hledají fragmenty <a href=\'?s=Soul\'>duší</a>, kterými následně opravovali skořápky Oscara a Phery. V neprostoru proběhlo několik soubojů s <a href=\'?s=Siive\'>rojnicemi</a>, které pomocí týmové práce bez větších problémů překonali. Nakonec se rozhodli spojit síli s Fariem a slíbili mu nové tělo, s tím, že jim pomůže vyřešit problém <a href=\'?s=The First Angels\'>prvního anděla</a>. Farius je před jejich odchodem varuje, že anděl během 15 dnů začne opravdu ničit a poté odhaduje, že bude trvat 5 let, než vymizí veškerý život, stejně jako tehdy před 3300 lety. Skupina se poté vrací do reality a odchází si odpočinout do nejbližšího města.</p>\n\n<h2>Krčmářští válečníci no. 2</h2>\n<p>Po dlouhodobém zápasení s veškerým nadpřirozeným se naši hrdinové uchylují k ještě důležitějšímu poslání. Po cestě potkali malou skupinku banditů, se kterou diplomaticky dohodli volný průchod přes hranice (všechny je zabili) a pokračovali ke svému cíli. Už v tu chvíli co Oscar vešel do místní krčmy bylo vidět, že městečko pozbývá naděje pro budoucnost, což je nepřípustné a proti jeho principům. (odehrává se ve státu <a href=\'?s=Chikia\'>Chikia</a>)</p>\n<p>Spousta věcí se tehdejší večer stala. Oscarovi se podařilo vyhrát kolem pěti soutěží, Greneha měla svou první přepíječku a Eryn měl velice neklidnou noc. I přes spálené oči a nos od silné pálenky byly Oscar i Greneha vítězi ve všech soutěžích, nacož Greneha dala Oscarovi facku (už si nepamatuju proč, ale hodila 20/d20 :O), pobíhala po krčmě, narazila do stolu a zkolabovala, mezitím Oscar pil dál. Další den ráno už celé město mělo nový nádech života (až na Oscara a Grenehu, ty měli kocovinu jako prase). Rozhodli se pomoct místnímu páru se sběrem říčních kytek, přičemž Oscar se v lovu zlepšoval a Greneha napodobovala poleno cestující po proudu.</p>\n\n<h1>Farius Quest</h1>\n\n<h2>Bohyně tvoření a Erynovy problémy</h2>\n<p>Poté se hrdinové vydali na cestu za <a href=\'?s=Angel\'>andělem</a> tvoření. Dojeli lodí až do <a href=\'?s=Wantinpiq\'>Wantinpiqu</a>, kde potkali <a href=\'?s=Aulenna\'>bohyni tvoření</a>, se kterou poklidně domluvili její pomoc. Do jejich skupiny se tedy přidal nový anděl Dinas, avšak ne všechno proběhlo hladce. Eryn totiž zakryl (haha, koho kryl), že byl z Wantinpiqu vyhoštěn a teď ho uvěznili za jeho hříchy z minulosti. Tady končí náš další session.</p>\n\n<h2>Dynamická věznice Wantinpiqu</h2>\n<p>Poté co hrdinové zjistí, že Eryn byl uvězněn, ho jdou z vězení vysvobodit. Jelikož nechtějí, aby <a href=\'wiki.php?s=Dynas\'>Dynas</a> věděl, že Eryn je hledaný, Oscar hrdinsky odláká jeho pozornost k nejbližšímu stromu, což jim dá dostatek času, aby vězení prohledali a Eryna zachránili. Následuje další Oscarův hrdinský čin, čímž je omámení místní stráže jeho vzácným alkoholem, což jim umožní volný vstup do věznice. Ačkoliv byl vstup jednoduchý, hrdinové zjišťují, že průzkum tak jednoduchý nebude.</p>\n<p>Eryn se probouzí ve věznici s chladnou hliněnou podlahou, kde rostou houby a plíseň i sem tam nějaká zakrslá rostlina. Zdraví ho démon, jeho spolubydlící. Povídá mu, že už se několikrát pokoušel utéct, ale že všechny jeho pokusy byly marné. Přestože dveře od vězení jsou otevřené dokořán a stráže nikde v dohledu, není žádná jasná cesta ven. Chodby se totiž mění jako bludiště. Eryn nachází ještě spoustu spících nebo mrtvých vězňů a ani jeden nedává ani náznaky o útěk. I démon, se kterým promlouval, tu trčí 20 let.</p>\n<p>Oscar, Greneha a Phera postupně schází hlouběji a hlouběji. Cestou prochází okolo prázdných cel. Jejich cesta do hlubin doprovází konstantní šum komplexních mechanizmů. Až konečně dojdou do 4. patra, nachází bytelnější věznice a v nich trpaslíky. Cestují dále</p>\n<p>Konečně zpozorují Eryna, avšak na druhé straně kulaté prohlubně do hlubin věznic. Domlouvají se, jak to Eryna dostat ven a Oscar si mezitím jde nabít meč transformace (jde zabít pár trpaslíků ve věznici). Eryn opatrně prochází na schodech, které rostou kolem prohlubně. Jelikož Eryn má nutkání jít spíš hlouběji a né se dostat pryč, proto Greneha vyrazí za ním. Eryn se jí pokusí zastavit magií, avšak to aktivuje ochranný mechanismus a schody začnou vybuchovat. Toto následuje hromada násilí mezi Erynem a Grenehou.</p>\n<p>Mezitím Oscar běží nahoru za stráží a vede ho zpět dolů a přitom nadává na mechanismus vězení. V dálce je slyšet praskání bariér a hlasité zuření Grenehy, která je přemožena sílou nenávisti.</p>\n<ul>\n<li>Greneha komunikuje s bohyní nenávisti</li>\n<li>Eryn se brání před Grenehou</li>\n<li>Oscar táhne stále opilého strážníka dolů</li>\n<li>Phera chilluje i guess</li>\n</ul>\n<p>Nakonec se Greneha probudí z omámení nenávistí a uvědomuje si, že má zlámané ruce z útoků na Eryna, kterého málem zabila, naštěstí má Eryn pouze zlámané nohy a smrti se vyhnul. Jelikož se teď všichni nachází v 9. patře, Oscara napadne se z vězení vydolovat s pomocí meče Chaosu. Poté se tedy  všichni probojovali přes ochranné golemy a vytrhali si cestu z vězení a z <a href=\'?s=Wantinpiq\'>Wantinpiqu</a>.</p>\n\n<h2>Bodybuilding with Dynas</h2>\n<p>Po krátké domluvě s trpaslíky se jim podaří dostat se pomalu ale jistě až do <a href=\'wiki.php?s=Olsinbel\'>Olsinbelu</a>, avšak nemohli cestovat přímo přes Darii, jelikož celý stát je uzavřen od ostatních a nepřijímá imigranty.</p>\n\n<h1>Souboj s prvním andělem</h1>\n\n<h2>Příprava</h2>\n<p></p>\n\n<h2>Souboj samotný</h2>\n<p></p>\n\n<h2>Oslava</h2>\n<p></p>\n\n<h1>Farius Quest 2, Electric Boogaloo</h1>\n\n<h2>Cesta do labyrintu feat. Bohyně lásky</h2>\n<p></p>\n\n<h2>Diskuze s Fariem</h2>\n<p></p>\n\n<h2>Cesta za alchemistou</h2>\n<p></p>\n\n<h2>Objevování staré civilizace</h2>\n<p></p>\n\n<h2>Dlouhý puťák a nečekaná tvář znovu v dohledu</h2>\n<p></p>', '#a#info#unfinished', 2, ';'),
(20, 'Titanshellica', '<h1>Information:</h1>\n<ul>\n<li>Main location: Underground (everywhere)</li>\n<li>Status: Thriving</li>\n<li>Intelligence: Low (hivemind medium)</li>\n<li>Magic Circles: 3</li>\n<li>Magic type: None</li>\n<li>Lifespan: 5 years</li>\n</ul>\n<h2>Extra info:</h2>\n<ul>\n<li>Prehistoric species (before NG)</li>\n<li>Titanshellica queens have higher intelligence, but lower move speed</li>\n</ul>\n<h1>Description</h1>\n<p>Underground living creature of massive sizes. While their living environment is deep underground where rock is as solid as pure steel, they posses immense power because of their diet consisting on pure energy.</p>\n<p>As the Titanshellica evolved, it reached large sizes. An average worker Titanshellica 4-4-40 meters, while larger individuals like a queen reaches up to 20-20-500 meters.</p>\n<p>Despite their large size, worker Titanshellicas can move at speeds comparable to a healthy horse.</p>\n<p>Their digestive system (which consists of a large flesh tube throughout their entire body) breaks down most materials into pure energy. The longer the Titanshellica is, the purer the energy crystal their digestive system outputs.</p>\n<p>(A Titanshellica appears similar to a crossbreed of an ant, centipede and a pillbug with a tube like digestive system through their center)</p>\n\n<h1>History</h1>', '#unfinished#species', 1, ';Oscar;Eryn;Greneha;'),
(25, 'Magic System', '<div><h1>Základní informace</h1>\n<p>Pro každe kouzlo se hází d100 (což je d10 a d100). Aby se kouzlo aktivovalo, musí být hod větší než \"Fail rate\" kouzla.</p>\n<p>Kritické selhání pro d100 považuji cokoliv pod 5%</p>\n<h1 data-heading=\"Magické kruhy\" dir=\"auto\">Magické kruhy</h1>\n<p dir=\"auto\">Magický kruh (MK) je spirituální objekt který umožňuje funkci magie. Pro aktivaci magie potřeba stejný nebo větší počet MK než je komplexita magie.<br>\nMagické kruhy se také dají použít pro aktivaci předpřipravených magických obvodů. Je možné aktivovat stejný počet obvodů jako je počet kruhů (<em>nepočítají se kruhy, které zrovna aktivují magii</em>).</p>\n<h1 data-heading=\"Druhy magie\" dir=\"auto\">Druhy magie</h1>\n<h2 data-heading=\"Aktivní magie\" dir=\"auto\">Aktivní magie</h2>\n<p dir=\"auto\">Magie se kategorizuje jako aktivní, pokud je schopná samostatně utvořit efekt. Je možné aktivovat pouze jednu aktivní magii najednou (<em>pokud to nemění jiné pravidlo</em>).</p>\n<h3 data-heading=\"Vlastnosti aktivní magie\" dir=\"auto\">Vlastnosti aktivní magie</h3>\n<p dir=\"auto\">(Zvýrazněné údaje jsou nejdůležitější)</p>\n<h5 data-heading=\"__Komplexita__\" dir=\"auto\"><strong>Komplexita</strong></h5>\n<ul>\n<li dir=\"auto\"><strong>určuje kolik MK je potřeba pro aktivaci magie</strong></li>\n<li dir=\"auto\">dá se aktivovat i magie s větší komplexitou, než je MK, ale při a po aktivaci to má své vedlejší efekty\n<ul>\n<li dir=\"auto\"> 1 = bolest při aktivaci & tato magie se tento den už nedá aktivovat</li>\n<li dir=\"auto\"> 2 = extrémní bolest při aktivaci & žádná magie se tento den už nedá aktivovat</li>\n<li dir=\"auto\"> 3 = ztráta vědomí a extrémní bolest při aktivaci & rozbití magických kruhů (počet podle hodu kostkou)</li>\n<li dir=\"auto\"> 4 = krvácení a všechny předchozí efekty při aktivaci & uživatel magie zemře na místě</li>\n</ul>\n</li>\n<li dir=\"auto\">od 5. komplexity je magie viditelná už od začátku vyvolávání</li>\n</ul>\n<h5 data-heading=\"Původ\" dir=\"auto\">Původ</h5>\n<ul>\n<li dir=\"auto\">Z kterého boha tato magie pochází</li>\n<li dir=\"auto\">Někdo může mít výhody, pokud má kontakt s určitým bohem </li>\n</ul>\n<h5 data-heading=\"__Vyvolávací čas__\" dir=\"auto\"><strong>Vyvolávací čas</strong></h5>\n<ul>\n<li dir=\"auto\"><strong>čas mezi začátkem aktivace a koncem aktivace</strong> (konec aktivace = magie začne svůj efekt)</li>\n<li dir=\"auto\">pokud u kouzla není specifikován, znamená to, že vyvolávací čas trvá jedno kolo\n<ul>\n<li dir=\"auto\">jedno kolo znamená, že na začátku kola začne aktivace a končí na konci kol všech ostatních (příklad: začneš aktivaci, ale mezitím je na řadě protivník a stihne tě probodnout)</li>\n</ul>\n</li>\n<li dir=\"auto\"><strong>Při vyvolávacím čase se musí uživatel soustředit na magii, proto nemůže dělat nic moc jiného</strong>\n<ul>\n<li dir=\"auto\">pokud uživatel ztratí soustředění, nemůže používat magii na další tři kola</li>\n</ul>\n</li>\n</ul>\n<h5 data-heading=\"__Šance neúspěchu__\" dir=\"auto\"><strong>Šance neúspěchu</strong></h5>\n<ul>\n<li dir=\"auto\"><strong>Šance, že kouzlo neuspěje</strong></li>\n<li dir=\"auto\">Pokud kouzlo neuspěje, postava ztrácí schopnost používat magii na počet kol, který je určen podle komplexity dané magie\n<ul>\n<li dir=\"auto\">příklad efektu při neúspěchu: <span class=\"internal-link\">Basic healing</span>, které má komplexitu 2, znemožní postavě používat magii na 2 kola</li>\n<li dir=\"auto\">může mít i jiné efekty</li>\n</ul>\n</li>\n<li dir=\"auto\"><strong>Tato šance se dá snížit trénováním této magie</strong></li>\n</ul>\n<h5 data-heading=\"Další možné vlastnosti:\" dir=\"auto\">Další možné vlastnosti:</h5>\n<ul>\n<li dir=\"auto\">Udržování magie i po aktivaci</li>\n<li dir=\"auto\">Vyžadované oběti nebo objekty potřebné pro aktivaci</li>\n</ul>\n<h2 data-heading=\"Modifikační magie\" dir=\"auto\">Modifikační magie</h2>\n<p dir=\"auto\">Magie se kategorizuje jako modifikační, pokud po svém vyvolání potřebuje aspoň jednu aktivní magii k dosažení aktivace. Modifikuje efekt aktivní magie a podle svých vlastností mění komplexitu a vyvolávací čas.<br>\nNa rozdíl od aktivní magie je možné aktivovat neomezený počet modifikací za jeden tah.</p>\n<h1 data-heading=\"Shrnutí:\" dir=\"auto\">Shrnutí:</h1>\n<ul>\n<li dir=\"auto\">Každý tvor má vnitřní magické kruhy, které umí zpracovávat magii.</li>\n<li dir=\"auto\">Každé aktivní kouzlo má své základní vlastnosti: \n<ul>\n<li dir=\"auto\">počet vyžadovaných MK (komplexita)</li>\n<li dir=\"auto\">vyvolávací čas (pokud není specifikováno, tak je to jedno kolo)</li>\n<li dir=\"auto\">šance neúspěchu</li>\n<li dir=\"auto\">Každé aktivní kouzlo <strong>může</strong> mít ještě své unikátní vlastnosti</li>\n</ul>\n</li>\n<li dir=\"auto\">Modifikační kouzla potřebují aktivní kouzlo pro jakýkoliv efekt</li>\n<li dir=\"auto\">Modifikační kouzla upravují chování a vlastnosti příslušného aktivního kouzla</li>\n<li dir=\"auto\"><strong>všechno může být výjimkou z těchto pravidel, pokud má magie své vlastní pravidla</strong></li>\n</ul>\n<h1 data-heading=\"Další informace\" dir=\"auto\">Další informace</h1>\n<h2 data-heading=\"Tagy\" dir=\"auto\">Tagy</h2>\n<h3 data-heading=\"Komplexity slovně (nedůležité)\" dir=\"auto\">Komplexity slovně (nedůležité)</h3>\n<ol>\n<li dir=\"auto\"><span class=\"tag\">#Beginner-level</span></li>\n<li dir=\"auto\"><span class=\"tag\">#Novice-level</span></li>\n<li dir=\"auto\"><span class=\"tag\">#Creature-level</span></li>\n<li dir=\"auto\"><span class=\"tag\">#Mortal-level</span></li>\n<li dir=\"auto\"><span class=\"tag\">#Sage-level</span></li>\n<li dir=\"auto\"><span class=\"tag\">#Ritual-level</span></li>\n<li dir=\"auto\"><span class=\"tag\">#Angel-level</span></li>\n<li dir=\"auto\"><span class=\"tag\">#Dragon-level</span></li>\n<li dir=\"auto\"><span class=\"tag\">#Kantra-level</span></li>\n<li dir=\"auto\"><span class=\"tag\">#Spirit-level</span></li>\n<li dir=\"auto\"><span class=\"tag\">#God-level</span></li>\n</ol>\n<h3 data-heading=\"Šance neúspěchu slovně (nedůležité)\" dir=\"auto\">Šance neúspěchu slovně (nedůležité)</h3>\n<ul>\n<li dir=\"auto\">1% = <span class=\"tag\">#Trivial-concept</span></li>\n<li dir=\"auto\">5% = <span class=\"tag\">#Basic-concept</span></li>\n<li dir=\"auto\">10% = <span class=\"tag\">#Intermediate-concept</span></li>\n<li dir=\"auto\">25% = <span class=\"tag\">#Advanced-concept</span></li>\n<li dir=\"auto\">50% = <span class=\"tag\">#Hard-concept</span></li>\n<li dir=\"auto\">75% = <span class=\"tag\">#Master-concept</span></li>\n<li dir=\"auto\">100% = <span class=\"tag\">#Impossible-concept</span></li>\n</ul>\n<h3 data-heading=\"Všechna magie\" dir=\"auto\">Všechna magie</h3>\n<ul>\n<li dir=\"auto\"><span class=\"tag\">#magic-system-x</span>\n<ul>\n<li dir=\"auto\">tohle můžete ignorovat, je to pouze informace pro mě</li>\n</ul>\n</li>\n<li dir=\"auto\"><span class=\"tag\">#skill-posibility</span>\n<ul>\n<li dir=\"auto\">Tato magie může být naučena do takové úrovně, že nemá potřebu používat MK, šanci neúspěchu a její vyvolávací čas je instantní</li>\n</ul>\n</li>\n</ul>\n<h3 data-heading=\"Aktivní magie\" dir=\"auto\">Aktivní magie</h3>\n<ul>\n<li dir=\"auto\"><span class=\"tag\">#static-spell</span>\n<ul>\n<li dir=\"auto\">nemá žádný pohyb a nepůsobí na ni reálná hmota</li>\n<li dir=\"auto\">hlavně magie která vytváří nějaký efekt (například healing)</li>\n</ul>\n</li>\n<li dir=\"auto\"><span class=\"tag\">#dynamic-spell</span>\n<ul>\n<li dir=\"auto\">má svou vlastní hmotu a působí na ni gravitace a všechno možné ostatní (zdi atd.)</li>\n<li dir=\"auto\">např. magické projektily</li>\n</ul>\n</li>\n</ul>\n<h3 data-heading=\"Modifikační magie\" dir=\"auto\">Modifikační magie</h3>\n<ul>\n<li dir=\"auto\"><span class=\"tag\">#static-mod</span>\n<ul>\n<li dir=\"auto\">může měnit efekty pouze u <span class=\"tag\">#static-spell</span></li>\n</ul>\n</li>\n<li dir=\"auto\"><span class=\"tag\">#dynamic-mod</span>\n<ul>\n<li dir=\"auto\">může měnit efekty pouze u <span class=\"tag\">#dynamic-spell</span></li>\n</ul>\n</li>\n<li dir=\"auto\"><span class=\"tag\">#universal-mod</span>\n<ul>\n<li dir=\"auto\">může měnit efekty vší magie</li>\n</ul>\n</li>\n<li dir=\"auto\"></li>\n</ul></div>', '#a#info#magic#unfinished', 4, ';'),
(26, 'Admin Other', '<h1>NEZAPOMÍNAT NA:</h1>\n<ul>\n<li>prsten pozornosti</li>\n<li>prsten odpuštění</li>\n<li>připomínat charge</li>\n<li>náhrdelník záchrany</li>\n<li>anděl stvoření cestuje s partou</li>\n<li>PHERA DOPÍČI FURT NA TU TÝPKU ZAPOMÍNÁM</li>\n</ul>\n\n<h1>Příště:</h1>\n<ul>\n<li>v \"last time\" není doplněný jméno anděla tvoření</li>\n</ul>', '#z', 1, ';'),
(27, 'Farius', '<h1 data-heading=\"Information:\" dir=\"auto\">Information:</h1>\n<ul>\n<li>Race: <a href=\"?s=Karran\">Karran</a></li>\n<li>Status: dead</li>\n<li>Intelligence: High</li>\n<li>Magic Circles: 6</li>\n<li>Magic type: <a href=\'?s=Lie Magic\'>Lies</a></li>\n<li>Alignment: Chaotic Neutral</li>\n<li>Year born: 2940 WR</li>\n</ul>\n<h1>Description</h1>\n<p>A <a href=\"?s=Karran\">Karran</a> man of a smaller deformed statue. With a slurred speech due to his life underground without any sentient contact and his successful attempts at prolonging his life, this being has gone somewhat mad. He was about 130 cm tall and his left side of the body appeared to be \"sliding\" off, this once attractive mage previously regarded as the great mage of <a href=\"?s=Olsinbel\">Olsinbel</a>, has deformed into an unrecognizable creature. His thoughts are constantly filled with magic and creature research and <a href=\"?s=Aria\">Aria</a>.</p>\n<h1>History</h1>\n<p>Before his death, he was a caretaker of a large <a href=\"?s=Titanshellica\">Titanshellica</a> colony and a researcher of <a href=\"?s=The First Angels\">the first angels</a>.</p>\n<p>About 300 years ago, when the <a href=\'?s=New Gods\'>new gods</a> appeared, he was the being left behind.</p>\n<p>Unfortunately, Farius passed soon after attempting to sacrifice <a href=\'?s=Phrea\'>Phera</a> as a material for reviving one of the <a href=\'?s=The First Angels\'>first angels</a> and being discovered by the <a href=\'?s=Bazella\'>goddess of chaos</a>.</p>\n<p>Even after death, Farius met the party in the <a href=\'wiki.php?s=Void\'>void</a> as a <a href=\'wiki.php?s=Soul\'>soul</a>.</p>', '#character', 1, ';Oscar;Eryn;Greneha;'),
(28, 'KDnD', '<h1>Welcome to the wiki!</h1>\n<h2>Current year: 303 NG [3303 WR]</h2>\n<p>Most of it is in english but some of it is czech. Its easier for my monkey brain, deal with it (pokud tohle ještě jednou někdo zmíní tak dostane hemoroidy, a pokud to zmíní Adam Zeman tak ho pls vyfoťte, nemá to rád)</p>\n<p>This wiki is always in progress and always updating :)</p>\n<h3>Important links:</h3>\n<ul>\n<li><a href=\"?s=Last Time\">(almost) All previous sessions</a></li>\n<li><a href=\"?s=Magic System\">Magic System</a></li>\n</ul>\n<h2>Rolls:</h2>\n<p>Attack: d20<br>\nPersuasion: d12<br>\nMagic: d10 & d100<br>\nPerception: d8<br>\nOther: d6 or d4 </p>\n<h2>Wiki searching</h2>\nOn desktop, you just type into the textfield, this by default searches the names of the lore, but you can also search by their tags by clicking on the button next to it (the button either says \"name\" or \"tags\").<br>\nOn mobile, the process is the same, however, you have to first open the search window by clicking on the spyglass in the top right (clicking it again will hide the search window).\n<p>Also, if you try to access lore that is considered a spoiler to your character, you will meet <strong>my</strong> goddess.</p>\n<h3>The Lore list</h3>\n<p>On the right side of the screen is the lore list (on mobile, it\'s in the search button on the top right). With the lore list, you can search the wiki pages by name or tag.</p>\n<p>The lore names can appear in three colors:</p>\n<ul>\n<li><strong>White</strong> - you and everyone in your group (Admin, Player, Champion, NPC. You\'re most likely a Player) view this lore</li>\n<li><strong>Blue</strong> - your group can\'t normally view this lore, but <strong>you</strong> specifically are allowed. Usually happens when your character discovers some new information, but doesn\'t tell the others</li>\n<li><strong>Red</strong> - this contains spoilers or something that your character doesn\'t know</li>\n</ul>\n<h3>Common lore tags:</h3>\n<ul>\n<li>#species - all types of beings on the planet, including sentient beings, animals, plants etc.</li>\n<li>#magic - lore about magic (duh)</li>\n<li>#character - all characters in the game, includes players</li>\n<li>#a, #z - all these are there just to appear higher on the list (the wiki list first sorts by tags, then by name)</li>\n<li>#admin - dont worry about it</li>\n<li>#unfinished - this one is just for me as a reminder that the lore isn\'t done</li>\n</ul>\n<p>There are gonna be more, but some aren\'t as frequent (like #info), so im not gonna include them in this list</p>\n<h1>Admin stuff</h1>\nIf you aren\'t an admin, these links <strong>shouldn\'t</strong> work for you\n<ul>\n<li><a href=\'?s=Next Time\'>Next Time</a></li>\n<li><a href=\'?s=Ideas\'>Ideas</a></li>\n<li><a href=\'?s=Admin Shortcuts\'>shortcuts</a></li>\n<li><a href=\'?s=Admin Other\'>other</a></li>\n</ul>', '#a#info', 4, ';'),
(30, 'Admin Shortcuts', '<h1>Global shortcuts</h1>\n<ul>\n<li>ctrl E - switches edit mode</li>\n</ul>\n<h1>Wiki shortcuts</h1>\n<ul>\n<li>ctrl ENTER - attempts to overwrite or save the opened lore</li>\n<li>ctrl K - attempts to place an internal link onto the selected text</li>\n<li>ctrl , - attempts to make paired html tags form the selected text (or the text in whitch the cursor is)</li>\n</ul>', '#z', 1, ';'),
(31, 'Template Character', '<h1>Information:</h1>\n<ul>\n<li>Race: <a href=\"wiki.php?s=\"></a></li>\n<li>Status: </li>\n<li>Intelligence: </li>\n<li>Magic Circles: </li>\n<li>Magic type: </li>\n<li>Alignment: </li>\n<li>Year born: </li>\n</ul>\n<h2>Extra info:</h2>\n<ul>\n<li></li>\n</ul>\n<h1>Description</h1>\n\n<h1>History</h1>\n', '#z#template', 1, ';'),
(33, 'Oscar', '<h1>Information:</h1>\n<ul>\n<li>Race: <a href=\"https://en.wikipedia.org/wiki/Human\">Human</a></li>\n<li>Status: alive</li>\n<li>Intelligence: medium</li>\n<li>Magic Circles: 3 & 2 Chaos</li>\n<li>Magic type: <a href=\'wiki.php?s=Chaos Magic\'>Chaos</a></li>\n<li>Alignment: Chaotic Good</li>\n<li>Year born: 279 NG</li>\n</ul>\n<h2>Extra info:</h2>\n<ul>\n<li>Contact with the <a href=\'wiki.php?s=Bazella\'>goddess of chaos</a>... or is it really that simple?</li>\n</ul>\n\n<h1>Description</h1>\n<p>Son of a fisherman, Oscar grew up admiring the warriors in stories he heard in his youth. He stands 169 cm tall and his build is sleek but muscular. While he doesnt have any training in swordsmanship, he developed his own style, which on its own is inferior to other sword styles, however, Oscar compensates this inferiority by brute strength alone. As he grew up in a warm area of the world in the (now collapsed) <a href=\'wiki.php?s=Republic of Dou\'>Republic of Dou</a>, [insert visual description later here, ask Oscar himself how he looks lol]. His hands have burn scars from the attack that went down in his village. </p>\n<p>Despite all the tragedies in his life, Oscar boasts an energetic personality, the ability to bring upon a joyous party and a deep affection towards stone walls and other stable architecture.</p>\n\n<h1>History</h1>\n<p>Born in the <a href=\'wiki.php?s=Republic of Dou\'>Republic of Dou</a>, where he spent most of his life, up until his 20th birthday.</p>\n<p>During his 20th birthday, pirates landed on the island to steal the treasure hidden in his village (not many people even knew this treasure existed) and murdered everyone except Oscar, who was at that time fishing alone. This started his journey across the world.</p>\n<p>On his journey, he met many friends, and later even a <a href=\'wiki.php?s=Phera\'>lover</a>. However, not everything goes well on his journey.</p>', '#character#player#unfinished', 2, ';'),
(34, 'Chaos Magic', '<h1>Description</h1>\n<p>Chaos magic is one of the 8 main categories of magic, it is commonly used in northern <a href=\'?s=Rophon\'>Rophon continent</a>.<br>\nThis magic is born from the desire to bring upon disorder and make such randomness obey. As such, its use is focused on disrupting objects, souls and luck itself.</p>\n\n<h1>Characteristic</h1>\n<p>The color in which this power usually appers in is scarlet red. When harnessing the power of chaos, all magic (except for other chaos magic) around it seems to fail or break down more often than usuall. This makes chaos a good machup against most defensive magic, as well as breaking other dynamic spells and even some static spells. Chaos magic trully is a universal magic disruptor.</p>\n<h2>Penalty</h2>\n<p>Unless the user has contact with the power itself, or has been training the specific magic for an extended amount of time, all magic above 4th tier will hit the user with a penalty. The penalty consists of rolling a d8, which determines which other powers penalty to choose from.</p>\n', '#magic-type', 1, ';Oscar;'),
(35, 'Ideas', '<h1>General Ideas</h1>\n\n<h1>Lore Ideas</h1>\n<h2>The original gods</h2>\n<ul>\n<li>eventually, 4 of the 5 gods split into the magic 8 powers (Creation, Existence, Order and Chaos primary powers, then Love, Lies, Hate and Truth as secondary)</li>\n</ul>\n\n<h2>Magic drawbacks</h2>\n<ul>\n<li>all magic above a certain level has drawbacks</li>\n<li>drawbacks happen unless the user is prepared in some way (like contact with the power itself)</li>\n<ul>\n<li>Creation: growing certain basic elements from the skin</li>\n<li>Truth: forgetting some facts</li>\n<li>Order: Permanent chains of order are cast on the user</li>\n<li>Love: cannot tell friend from foe</li>\n<li>Hate: Soul rot</li>\n<li>Existance: erasing oneself</li>\n<li>Lie: decieving the world comes with angering the Truth-keepers</li>\n<li>Chaos: a drawback from any other type of magic</li>\n</ul>\n</ul>\n\n<h2>The stars</h2>\n<ul>\n<s><li>All being and matter formed from the sun, which is visible even in the void</li></s>\n<s><li>The sun is actually a huge Magic Sphere (Origin), contrary to the magic circles, it is all powerful and can do everything</li></s>\n<li>There is no sun until further notice lmao</li>\n<li>The stars are just leftover magic souls that split from Origin after its corruption</li>\n<li>Each one of them contain their wills, however, some form clusters, which create a combined will, resulting in the 8 main magic types/origins</li>\n</ul>\n\n<h2>soul space distortion</h2>\n<ul>\n<li>every soul distorts the space around it in the spiritual dimension</li>\n<li>amount of distortion depends on the might of the soul, thats why the new gods basically cut themselves from everything else in the void and don\'t need a shell, as they create a border of space distortion around themselves</li>\n<li>when a weak being is in close proximity to a powerful being, the begin to receive symptoms of soul impact (name subject to change) (real world: fear, nausea, vomiting, loss of consciousness, physical damage to the body, death. void: ring fluctuation, shell cracking, ring damage, complete dissipation.). The weaker being may experience visual input both from the real world and the void</li>\n</ul>\n\n<h2>Lost kingdom</h2>\n<ul>\n<li>somewhere on the map is another smaller continent</li>\n<li>once, there was an entire kingdom, the most powerful in the world, with a powerful royal family</li>\n<li>the royal family then went on to become the second generation of new gods, unfortunately, they failed (something, or messed up something) soon after ascending, which resulted in complete obliteration of the islands intelligent life</li>\n<li>now, only ruins remain, and maybe some descendants</li>\n<li>The continent is swarming with protection automatons, that guard the territory (there are only animals on the continent, sentient life). Overgrown ruins. The continent was hidden through illusion magic, but the first angel destroyed it accidentally while passing through.</li>\n<li>The kingdom is a 1 city island the size of a continent that is protected by several layers of unbreakable shields (with only some gateways), which will close the players inside the continent.</li>\n</ul>\n\n<h2>Parasites behind the soul</h2>\n<ul>\n<li>An entity that (when latched onto a soul) always feels like its behind you (although it isnt there).</li>\n<li>Only visible in the void</li>\n</ul>\n\n<h2><strong>HOOLY SHIT, dimentions are all just a layer of a 4-dimentional TREE trunk</strong></h2>\n<ul>\n<li>Each dimension acts as a ring that is a part of the ring layer (of the trunk) ((LETOKRUHY LOL)), and travels up the trunk (passage of time)</li>\n<li>While i call it a trunk, it is 4-dimentional, thus each slice of the trunk should rather be called a sphere, and this sphere has gravity :O</li>\n<li>This sphere consists of layers, each one being a dimention (a rostou z prostředka jako letokruhy :D)</li>\n<li>Due to the fact that \"gravity\" is present, it is much easier to fall towards the core of the tree (dimentions closer to the core), rather then out</li>\n<li>The frequently mentioned void is just the dimention membrane layer above (containing all of the stars, also a membrane is not a full layer, more like a protective \"membrane\" between layers. Membranes are stronger than layers)</li>\n<li>This fucking tree idea can have so many cool shit happen :O (like cutting a branch, thus the branch dying while a new one takes its place, possibly changing events)</li>\n<li>the dimension just below (maybe above, that would make more sense) this world is full of \"actors\". Actors are enslaved beings similar to humans and can communicate with beings of this world. There are limited amounts of actors and most are sleeping. \"Acting\" and helping the higher beings is all they know</li>\n</ul>\n\n<h2>Truth keepers</h2>\n<ul>\n<li>Basically the immune system of Latika (the tree)</li>\n<li>Arrive every time someone messes with how reality is supposed to work</li>\n<li>As these creatures are from Latika itself, they are somewhat 4 dimensional</li>\n<li>They can be killed (it is hard), upon death drops a Latika clot</li>\n</ul>\n\n<h2>The types of intelligence</h2>\n<ul>\n<li>There are two types of souls, however, only one type has the capacity to hold real emotions</li>\n<li>Both types are the same in theory, but the distinction is in the souls development (I am making a comparison to language models and the difference between chatgpt and neuro-sama)</li>\n</ul>\n\n<h2>Source of reincarnation and fate</h2>\n<ul>\n<li>At the core of each soul is an endless battle of will and despair.</li>\n<li>The battle lasts until despair overtakes the will of the host, the possibility of the will winning is almost none, as despair grows and multiplies from its endless supply (core of Latika).</li>\n<li>An example of visible despair are the Siive. They are large clusters of despair that tear through the souls shell.</li>\n<li>One reason for the shells existence is to limit the amount of despair the soul receives.</li>\n<li>the will is a representation of a beings own magic and, well, their will. It also represents the inner battle spirit.</li>\n<li>There are many things that attract despair</li>\n<li>There is a concept of *Persistent Command*. This concept describes beings, which leave the commander of their will eligible for reincarnation, as the commander can rebuild a new soul</li>\n</ul>\n\n<h1>Story Ideas</h1>\n\n<h2>death of the first angel and the new gods</h2>\n<ul>\n<li>all gods perish (except hate) when fighting the first angel</li>\n<li>due to her grief and gaining extreme power, hate goes into hibernation inside the dragon crystal</li>\n<li>another problem arises, hate is spreading (also all dragons die, overall, so much death :3)</li>\n</ul>\n', '#z', 1, ';'),
(36, 'Next Time', '<h1>Greneha backstory labyrinth</h1>\n<p>They find a hidden door in the labyrinth of lies (if they try to leave, they will hear a faint knock)</p>\n<p>inside are multiple rooms</p>\n<ul>\n<li>main room containing chermeta (the substance that mutates humans)</li>\n<li>MANY rooms with enemies (beastmen, sludges and other stuff)</li>\n<li>so many rooms it gives oscar ptsd</li>\n<li>room with a soul tinkerer somewhere along the way (all of them accidentally enter)</li>\n</ul>\n<h1>Void various fun</h1>\n<ul>\n<li>každý dostane roli a jednu kostku pár životu (improv ftw)</li>\n<li>několik rojnic, also potkají znovu Faria</li>\n<li>když mu řeknou něco co se mu bude líbit, pomůže jim</li>\n<li>Jejich duše musí putovat po areálu, a nacházet zbytky duší které nejdou, nebo dostanou z rojnic</li>\n</ul>\n<h1>Battle against the first angel</h1>\n<p>The angel is after the ring</p>\n\n<h1>Eryn escape:</h1>\n<ul>\n<li></li>\n</ul>\n\n\n\n<h1>The Enveloping fog of Chaos</h1>\n<h2>Mention at the start</h2>\n<ul>\n<li>The goddess knows about <a href=\'wiki.php?s=Farius\'>farius</a> (BIG PROBLEM, VERY BAD)</li>\n</ul>\n\n<h2>Their options</h2>\n<ul>\n<li>The party is confronted by the Goddesses remnants in the fog (inside the GC prototype)</li>\n<li>Based on what they say and do, they may go through two lines</li>\n<li>Ver1: The goddess will let them go peacefully and she destroys the god complex prototype</li>\n<li>Ver2: They enrage the goddess</li>\n<li>Ver3: They slay the weakened goddess</li>\n</ul>\n\n<h3>Ver1</h3>\n<p>The goddess leaves\n<ul>\n<li>GC proto. is destroyed</li>\n<li>God of lies finds out about farius</li>\n</ul>\n</p>\n\n<p>When they come out of the GC, they talk to Taras</p>\n<p>they start their way back (they have very little time so they must hurry back to farius an take him back to the island lol)</p>\n<p>In the island, they are more or less hidden (they need to hide Farius in the pipes)</p>\n<p>they can explore the island</p>\n<p>the gods may visit them (if they anger the god of lies/existence) they are all sent to the maze (like the backrooms)</p>\n\n<h3>Ver2</h3>\n<p>They escape from the goddess (from inside the GC) and meet up with Taras. He will help them with temporary stalling the goddess, however, this will activate extreme lockdown inside the whole island, cutting them from the rest of the world</p>\n\n<p>They can roam through the island and they need to kill the goddess before they can leave</p>\n\n<h3>Ver3</h3>\n<p>Dunno how, but an option for sure</p>\n<p>their plan proceeds as planned lol</p>', '#b#info', 1, ';'),
(40, 'Phera', '<h1>Information:</h1>\n<ul>\n<li>Race: <a href=\"wiki.php?s=Angel\">Chaos Angel</a></li>\n<li>Status: Alive (but always dying for some reason)</li>\n<li>Intelligence: medium</li>\n<li>Magic Circles: 6 & 1 Love</li>\n<li>Magic type: <a href=\'wiki.php?s=Love Magic\'>Love</a> (previously <a href=\'wiki.php?s=Chaos Magic\'>Chaos</a>)</li>\n<li>Alignment: Chaotic Good</li>\n<li>Year born: 120 NG</li>\n</ul>\n\n<h1>Description</h1>\n<p>Born of chaos, she came to life with the purpose of freeing the <a href=\'wiki.php?s=New Gods\'>new gods</a> from the <a href=\'wiki.php?s=Void\'>void</a>. She stands 170 cm tall and has a somewhat slender build closely mimicking a human woman. Her hair resembles silver silk with a hint of red and her skin is as pale as white marble. Phera doesn\'t speak, unless necessary, which fits her overall calm demeanor. There are only a few things Phera is interested in. She is quite fond of magic, <a href=\'wiki.php?s=Bazella\'>her creator</a> and recently <a href=\'wiki.php?s=Oscar\'>Oscar</a>. Though she is interested in magic, her cast time is slow compared to others, on the other hand, her control over magic is near perfect, making her very adept at forming magic tools and complex magic but, more of a hindrance in battle (she is also somewhat of a scaredy-cat).</p>\n\n<h1>History</h1>\n\n<p>In her first moments, she attempted to free the new gods from the void. Though she has a knack for magic, her inability for combat restricted her from begining the freeing ritual, so she secluded herself in a dungeon in shame</p>\n\n<p>For a long time, Phera researched small creatures capable of parasitic behaviour and later successfully created the species of <a href=\'wiki.php?s=Chwerr\'>chwerr</a>. Upon this creation, she released this creature all over <a href=\'wiki.php?s=United kingdom of Gisonia\'>Gisonia</a>.</p>\n\n<p>While this <a href=\'wiki.php?s=Chwerr\'>creature</a> wreaked havoc upon Gisonia, she continued her reasearch of the new gods seal unsuccessfully, searching for a way to release the gods without the need for combat with the <a href=\'wiki.php?s=Thrumborian\'>Thrumborians</a>.</p>\n\n<p>Later, she met the party of <a href=\'wiki.php?s=Oscar\'>Oscar</a> and <a href=\'wiki.php?s=Griuf\'>Griuf</a>. While she originally planned to fight against these heroes, they struck a deal that if she tells them about <a href=\'wiki.php?s=Chaos Magic\'>chaos magic</a> and about <a href=\'wiki.php?s=Bazella\'>her goddess</a>, they\'ll help her with her quest.</p>\n\n<p>Thus, Phera sets off with the two on a grand adventure.</p>', '#character', 2, ';'),
(41, 'Eryn', '<h1>Information:</h1>\n<ul>\n<li>Race: <a href=\"wiki.php?s=Elf\">Elf</a></li>\n<li>Status: Alive</li>\n<li>Intelligence: Medium</li>\n<li>Magic Circles: 4 & 2 Love</li>\n<li>Magic type: Love</li>\n<li>Alignment: Lawful Good</li>\n<li>Year born: 220 NG</li>\n</ul>\n<h2>Extra info:</h2>\n<ul>\n<li>Contact with the <a href=\'wiki.php?s=Aria\'>goddess of love</a></li>\n</ul>\n<h1>Description</h1>\n<p>A young elf traveling the world. Born of high status in the <a href=\'wiki.php?s=Wantipiq\'>land of elves</a>, Eryn was interested in history as far as he remembers thanks to the influence of his late grandfather. Though he is of elven heritage, Eryn isn\'t as tall or slender as his peers. Though his strength is not to be messed with, Eryn lacks any sense of weapon use and prefers magic or his own trusty fists.</p>\n<h1>History</h1>\n', '#character#player#unfinished', 2, ';');
INSERT INTO `wiki` (`id`, `name`, `content`, `tags`, `access`, `exceptions`) VALUES
(42, 'Greneha', '<h1>Information:</h1>\n<ul>\n<li>Race: <a href=\"wiki.php?s=Human\">Hum</a> <a href=\'wiki.php?s=Chermeta\'>an?</a></li>\n<li>Status: Alive</li>\n<li>Intelligence: medium</li>\n<li>Magic Circles: 4 & 2 hate</li>\n<li>Magic type: <a href=\'wiki.php?s=Hate Magic\'>Hate</a></li>\n<li>Alignment: True Good</li>\n<li>Year born: 282 NG</li>\n</ul>\n<h2>Extra info:</h2>\n<ul>\n<li>unusual contact with the <a href=\'wiki.php?s=Lydia\'>goddess of hate</a></li>\n</ul>\n<h1>Description</h1>\n<p>[musim ještě přepsat]</p>\n<h1>History</h1>\n\n<h1>Original Backstory [TODO: rewrite]</h1>\n<ul>\n<li>Žila s rodiči na kraji lesa, táta byl lovec a předával jí řemeslo.</li>\n<li>O kus dál si v jeskyni zařídil magickou laboratoř fantasy ekvivalent šíleného vědce -> temný mág soustředící se na lektvary.</li>\n<li>Greneha se tam jednou ze zvědavosti zatoulala (i když to rodiče zakazovali), když byl mág zrovna pryč.</li>\n<li>Tam spadla do fantasy ekvivalentu radioaktivní tekutiny a teď je cosi tosi mutant.</li>\n<li>Mág ji našel, z kotle s tekutionou vylovil a jinými lektvary ji zachránil život, který by ji jinak vzala otrava. Měl možnost namíchat jí takový lektvar, díky kterému by neměla skoro žádné následky, ale záměrně to neudělal, aby ji mohl využít jako pokusný subjekt a chtěl si ji nadále u sebe nechat na další pokusy.</li>\n<li>Greneze se po pár dnech podařilo utéct a vrátila se domů.</li>\n<li>Rodiče se ofc nejdříve lekli, co se jim to stalo s dcerou, ale hlavně byli rádi, že se jim vrátila</li>\n<li>Informace o události se dostaly do blízké vesnice, kam chodila Grenehy rodina nakupovat a prodávat úlovky, rychle se rozšířily a pokřivily a od té doby se ji vesničané stranili a báli. Kvůli nepřirozené barvě očí ji obviňovali z paktování se s démony (nebo něco na ten způsob).</li>\n<li>Naučila se vystačit si sama a většinu času trávila sama. Dál se učila od otce lovit a osvojila si lukostřelbu a znalost bylinek.</li>\n<li>Když jí bylo 15 jednou narazila na roztomilého malého zatím nedospěléjo potkánka a [zde si doplň lore accurate způsob jak ze zvířete udělat familiára, bcs já nemám tucha]. A tak se k ní dostal Regis. Stali se z nich velcí kámoši a velkou část času Greneha trávila tím, že ho cvičila.</li>\n<li>V 18, po dalším nepříjemné návštěvě vesnice (nechtěli ji prodat zeleninu, prej že se paktuje s démony nebo nějaká taková sračka), si řekla, že toho už má dost a rozhodla se vydat zpět do jeskyně a přinutit mága, aby ji vrátil do normálu.</li>\n<li>Jeskyně byla prázdná a mág pryč. Zbylo po něm jen pár poloprázdných a prázdných sklenic s lektvary a jeden deník.</li>\n<li>Greneha lektvary radši nechala být, ale deník si vzala. Jenže byl v cizím jazyce/zašifrovaný a tak se rozhodla vyrazit do světa s cílem rozluštit deník a najít temného mága.</li>\n<li>Putování po porozumění deníku a mágovi ji nakonec zavedlo do knihovny, kde potkala zbytek party…</li>\n</ul>', '#character#player#unfinished', 2, ';'),
(45, 'Template State', '<h1>Information:</h1>\n<ul>\n<li>Main race: <a href=\"?s=\"></a></li>\n<li>Year established: </li>\n<li>Year fallen: </li>\n<li>Wealth: </li>\n<li>Population: </li>\n<li>Focus: </li>\n<li>Government: </li>\n<li>Continent: <a href=\'?s=\'></a></li>\n</ul>\n<h2>Extra info:</h2>\n<ul>\n<li></li>\n</ul>\n<h1>Description</h1>\n\n<h1>History</h1>\n', '#z#template', 1, ';'),
(46, 'United kingdom of Gisonia', '<h1>Information:</h1>\n<ul>\n<li>Main race: <a href=\"?s=Human\">Human</a></li>\n<li>Year established: </li>\n<li>Year fallen: </li>\n<li>Wealth: medium-low</li>\n<li>Population: medium</li>\n<li>Focus: Trade and state stability</li>\n<li>Government: Monarchy</li>\n<li>Continent: <a href=\'?s=Edora Continent\'>Edora</a></li>\n</ul>\n<h2>Extra info:</h2>\n<ul>\n<li>Current leader: <a href=\'wiki.php?s=Nicholas\'>Nicholas</a></li>\n</ul>\n<h1>Description</h1>\n<p>One of the most powerful states in the Edora continent. Currently owns the land of (now fallen) <a href=\'wiki.php?s=Abhzian empire\'>Abhzian</a> and <a href=\'wiki.php?s=Pedia\'>Pedia</a>. While it had many issues and turbulations with succession during its existance, it is the oldest stable monarchy in the world.</p>\n\n<h1>History</h1>\n\n<ul>List of leaders:\n<li>Many records of leaders missing due to the memory wipe</li>\n<li>First recorded king of the land is <a href=\'wiki.php?s=Victor\'>Victor the wise</a>.</li>\n<li>Many others here</li>\n<li><a href=\'wiki.php?s=Nicholas\'>Nicholas</a></li>\n</ul>\n\n<p>Earliest records in hitory point to its creation in the year 1937 WR. However, not much is known before the 3rd generation of <a href=\'wiki.php?s=New gods\'>new gods</a>.</p>\n\n<p>During the last few years, unrest around the throne grew, as the next leader in line was <a href=\'wiki.php?s=Nicholas\'>Nicholas</a> the half elf and an ilegitemate child of the previous king. During this time, Nicholas attempted escape almost unsuccessfully, when suddenly, <a href=\'wiki.php?s=Oscar\'>Oscar</a>, <a href=\'wiki.php?s=Griuf\'>Griuf</a> and <a href=\'wiki.php?s=Jerome\'>Jerome</a> helped him. With their help, Nicholas successfully ascended to the throne and executed the previous councelor.</p>', '#state#unfinished', 1, ';Oscar;Griuf;Eryn;Jerome;'),
(49, 'Template Species', '<h1>Information:</h1>\n<ul>\n<li>Main location: </li>\n<li>Status: </li>\n<li>Intelligence: </li>\n<li>Magic Circles: </li>\n<li>Magic type: </li>\n<li>Lifespan: </li>\n</ul>\n<h2>Extra info:</h2>\n<ul>\n<li></li>\n</ul>\n<h1>Description</h1>\n\n<h1>History</h1>\n', '#z#template', 1, ';'),
(50, 'Chwerr', '<h1>Information:</h1>\n<ul>\n<li>Main location: <a href=\'wiki.php?s=Edora Continent\'>Edora</a></li>\n<li>Status: Endangered</li>\n<li>Intelligence: Low (medium hivemind)</li>\n<li>Magic Circles: 2</li>\n<li>Magic type: <a href=\'wiki.php?s=Hate Magic\'>Hate</a></li>\n<li>Lifespan: 30 days</li>\n</ul>\n<h2>Extra info:</h2>\n<ul>\n<li>Created by <a href=\'wiki.php?s=Phera\'>Phera</a></li>\n</ul>\n<h1>Description</h1>\n<p>Small parasitic creatures with a simple mind. They were created with the intention of infecting the <a href=\'wiki.php?s=Thrumborian\'>thrumborians</a> for easier manipulation during the gods release ritual. They are small lumps of meat and nerves (with no bones) of around 7cm in radius with 4 small tenticles. These creatures search for the nearest sentient creature and meld into their tissue. When connected to a creature, they can (to a certain extent) control the mind of the host. They sometimes try to activate magic with the hosts circles, when they feel threatened.</p>\n<h1>History</h1>\n<p>Originally, these creatures were simple parasites of livestock and small mammals.</p>\n<p>Later, they were improved upon by <a href=\'wiki.php?s=Phera\'>Phera</a> in the year 250 NG</p>\n<p>These creatures stayed in Pheras dungeon until 299 NG (except for a few that escaped)</p>', '#species', 2, ';'),
(55, 'Griuf', '<h1>Information:</h1>\n<ul>\n<li>Race: <a href=\"?s=Demihuman\">Demihuman (lizzard)</a></li>\n<li>Status: Alive</li>\n<li>Intelligence: Low (Wanted to say high in combat but then I remembered the dungeon in gisonia...)</li>\n<li>Magic Circles: 3</li>\n<li>Magic type: <a href=\'wiki.php?s=Lie Magic\'>Lies</a></li>\n<li>Alignment: True Neutral</li>\n<li>Year born: 282 NG</li>\n</ul>\n<h2>Extra info:</h2>\n<ul>\n<li></li>\n</ul>\n<h1>Description</h1>\n\n<h1>History</h1>\n', '#character#player#unfinished', 2, ';'),
(59, 'Nicholas', '<h1>Information:</h1>\n<ul>\n<li>Race: <a href=\'wiki.php?s=Human\'>Half</a> <a href=\"wiki.php?s=Elf\">elf</a></li>\n<li>Status: Alive</li>\n<li>Intelligence: High</li>\n<li>Magic Circles: 3</li>\n<li>Magic type: <a href=\'wiki.php?s=Creation Magic\'>Creation</a></li>\n<li>Alignment: Lawful good</li>\n<li>Year born: 265 NG</li>\n</ul>\n<h2>Extra info: </h2>\n<ul>\n<li>Current king of <a href=\'wiki.php?s=United kingdom of Gisonia\'>Gisonia</a></li>\n</ul>\n<h1>Description</h1>\n<p>A weak willed half-elf with the blood of royals from the elven kingdom and the kingdom of Gisonia. Though he is weak willed, he isn\'t to be trifled with when it comes to strategy or mind games. As a warrior, Nicholas is useless, however as a leader, he can wipe nations off the map with little effort.</p>\n\n<h1>History</h1>\n<p>Nicholas was born in the land of Gisonia and immediately hidden from sight, as mixing races in the Edora continent was considered taboo back then.</p>\n\n<p>He stayed hidden with his elven mother for most of his life. When his mother passed, he had to escape from his chambers.</p>\n\n<p>Later, when escaping from Gisonias counselor and the guards, he met our party of heroes, which helped him ascend to the throne.</p>\n\n<p>After claiming the throne, Nicholas led an invasion to the <a href=\'wiki.php?s=Abhzian empire\'>Abhzian empire</a>, which ended successfully.</p>', '#character', 2, ';'),
(60, 'Angel', '<h1>Information:</h1>\n<ul>\n<li>Main location: none</li>\n<li>Status: Rare</li>\n<li>Intelligence: High</li>\n<li>Magic Circles: 7</li>\n<li>Magic type: All</li>\n<li>Lifespan: Indefinite</li>\n</ul>\n<h2>Extra info:</h2>\n<ul>\n<li>Angels require a direct source of one of the world powers (depending on the angel)</li>\n<li>Born artificially</li>\n</ul>\n\n<h1>Description</h1>\n<p>This species isnt born naturally, rather created by the holders of the world powers. When an angel is born, it resembles a simple mannequin with bird-like wings and simple fatial features. Once an angel gets exposed to natural beings for a long enough time, the angel starts to mimic that being mostly in their appearance, but also in their behaviour to some degree. Thus, angels have no clear distinction compared to other species.</p>\n\n<h1>History</h1>\n<p>SPOILERS SPOILERS SPOILERS and thus their angels are created</p>\n\n<p>SPOILERS SPOILERS SPOILERS SPOILERS</p>\n\n<p>The third generation of new gods create the current angels.</p>', '#species#partial', 1, ';Eryn;Oscar;Greneha;'),
(66, 'The First Angels', '<h1>Information:</h1>\n<ul>\n<li>Main location: none</li>\n<li>Status: Extinct</li>\n<li>Intelligence: Low (except when in survival behaviour)</li>\n<li>Magic Circles: <a href=\'wiki.php?s=Soul of Origin\'>Sphere</a></li>\n<li>Magic type: Primal</li>\n<li>Lifespan: 15 days</li>\n</ul>\n<h2>Extra info:</h2>\n<ul>\n<li>Once only one day of their life remains (or when severely threatened), they enter into survival behaviour</li>\n</ul>\n\n<h1>Description</h1>\n<p>Similar to current day <a href=\'wiki.php?s=Angel\'>angels</a> in appearance, these beings are the shells of the original life.</p>\n\n<h1>History</h1>\n', '#species#unfinished', 1, ';Eryn;'),
(68, 'Soul', '<h1>Description</h1>\n<p>Every being alive has a soul made of at least three parts</p>\n\n<h2>Shell</h2>\n<p>A protective layer wrapping around the magic circles of a soul. Its main purpose is to act as a shield against the <a href=\'wiki.php?s=Siive\'>siive</a> in the membrane of this dimension. The shell emits a slight glow an is almost completely transparent, it acts as if it was made from fabric. When the shell is damaged, rips appear on the surface with frayed edges.</p>\n\n<h2>Outer core</h2>\n<p>The outer core is composed of the magic circles. This part is responsible for magic invocation and activation. The circles are spinning (most of the time) and they ussually weave through eachother. The circles only interact (physically-like) with the shell.</p>\n\n<h2>Inner core</h2>\n<p>The inner core contains the essence of the being, which consists of the mind and ego of a being. It appears as a flame in the center of the soul.</p>\n\n<h1>Function</h1>\n\n\n<h2>Shell</h2>\n\n\n<h2>Outer core</h2>\n\n\n<h2>Inner core</h2>\n\n\n<h1>Properties of a soul</h1>\n\n<h2>Soul distortion</h2>\n<p></p>\n\n\n<h1>Exceptions</h1>\n', '#magic#unfinished', 1, ';Eryn;'),
(72, 'Love Magic', '<h1>Description</h1>\n<p></p>\n\n<h1>Characteristics</h1>\n<p></p>\n<h2>Penalty</h2>\n<p></p>', '#magic-type#unfinished', 1, ';Eryn;'),
(74, 'Lie Magic', '<h1>Description</h1>\n<p></p>\n\n<h1>Characteristics</h1>\n<p></p>\n<h2>Penalty</h2>\n<p></p>', '#magic-type#unfinished', 1, ';'),
(75, 'Human', '<p>A regular human.... thats it.</p>\n<br>\n<br>\n<br>\n<br>\n<br>\n<br>\n<br>\n<br>\n<p>what more do you want?</p>', '#species', 4, ';'),
(76, 'Chermeta', '<h1>Description</h1>\n\n<h1>Characteristics</h1>\n\n<h1>History</h1>\n', '#material#unfinished', 1, ';'),
(77, 'Lydia', '<h1>Information:</h1>\n<ul>\n<li>Race: <a href=\"wiki.php?s=Demihuman\">Demihuman ([some animal idk])</a></li>\n<li>Status: Alive</li>\n<li>Intelligence: High</li>\n<li>Magic Circles: 10 & 1 Hate</li>\n<li>Magic type: <a href=\'wiki.php?s=Hate Magic\'>Hate</a></li>\n<li>Alignment: Neutral Evil</li>\n<li>Year born: 2486 WR</li>\n</ul>\n<h2>Extra info:</h2>\n<ul>\n<li>Current godess of Hate</li>\n</ul>\n<h1>Description</h1>\n\n<h1>History</h1>\n', '#character#new-god-gen3#unfinished', 1, ';Greneha;'),
(80, 'Bazella', '<h1>Information:</h1>\n<ul>\n<li>Race: <a href=\"wiki.php?s=Human\">Human</a></li>\n<li>Status: Alive???</li>\n<li>Intelligence: Medium (cunning)</li>\n<li>Magic Circles: 10 & 1 chaos</li>\n<li>Magic type: <a href=\'wiki.php?s=Chaos Magic\'>Chaos Magic</a></li>\n<li>Alignment: Chaotic Evil</li>\n<li>Year born: 2970 WR</li>\n</ul>\n<h2>Extra info:</h2>\n<ul>\n<li><strong>Was</strong> the current generations goddess of chaos</li>\n</ul>\n<h1>Description</h1>\n<p>Born in poverty, she struggled to survive on a day to day basis. While growing up in the <a href=\'wiki.php?s=Abhzian empire\'>Abhzian empire</a>, she learned that in a world where no law in a dictatorship exists, one mustn\'t trust no other being. Bazella later found herself as the emperors concubine, yet with her strong personality, her influence across the country grew stronger and stronger. She was a beautiful woman, standind 157 cm tall with a figure all men throughout the country sought after. With scarlet red hair and hazelnut skin, her beauty at the center of the land had no competition.</p>\n\n<h1>History</h1>\n<p>Born in the <a href=\'wiki.php?s=Abhzian empire\'>Abhzian empire</a>.</p>\n\n<p>Later found herself as the emperors concubine.</p>\n\n<p>One day, when Bazella had enough of the emperors antics, she snuck into his room and ripped apart the emperor with just a kitchen knife, but later wasnt found guilty due to her cunning personality.</p>\n\n<p>Later went on to ascend as the 3rd generation of Chaos.</p>\n\n<p>Unfortunately, Bazella later passed on during her attempt to ressurect one of <a href=\'wiki.php?s=The First Angels\'>the first angels</a>, along with her soul.</p>\n\n<p>However, by pure chance, she was ressurected (thought to be impossible) by <a href=\'wiki.php?s=Oscar\'>Oscar</a>. By taking the pure crystal of chaos from her corpse and throwing it into a prototype of the *o* ***pl**, her soul was rebuilt from scratch.</p>', '#character#new-god-gen3', 1, ';Oscar;Phera;'),
(81, 'New gods', '- new gods start with 1 circle, and they gain more, as they age <br>\n- they appear far apart in an empty new world, yet they can peek into the physical world occasionally. So they have very scarce interaction with \"sentient beings\" <br>\n- possibly the after-game for this dnd <br>\n- maybe someone creates one by accident (as anyone can become a new God in right conditions)', '#lore#unfinished', 1, ';'),
(85, 'Oscars vision', '<h1>Vidíš stonek...</h1>\n<p>Vidíš čerstvé květy...</p>\n<p>Vidíš před a po...</p>\n<p>Vidíš živiny i hnilobu...</p>\n<p>Vidíš plody a vidíš škůdce...</p>\n<br>\n<br>\n<br>\n<br>\n<br>\n<br>\n<br>\n<p>Vidíš strom, co začíná i končí a v jeho vnitřku vidíš oko, které kouká do tvé duše...</p>\n\n<br>\n<br>\n<br>\n<br>\n<br>\n<p>Vidíš letokruhy stromu, které ukrývají vesmíry... a vidíš oko, které na tebe zírá...</p>\n\n<br>\n<br>\n<br>\n<br>\n<br>\n<br>\n<p>Vidíš čas, který protéká žilami stromu, který pulzuje každou sekundou, a který vytéká z konečků vetví...</p>\n\n<br>\n<br>\n<br>\n<br>\n<p>... a vidíš oko, které sténá...</p>\n\n<br>\n<br>\n<br>\n<br>\n<br>\n<p>Najednou vidíš, jak se strom roztáčí mezi několik dimenzí, který tvá mysl nezvládá pobírat... a tím tvá vize končí...</p>', '#Lore', 2, ';'),
(87, 'Taras Mura', '<h1>Information:</h1>\n<ul>\n<li>Race: <a href=\"wiki.php?s=\"></a></li>\n<li>Status: </li>\n<li>Intelligence: </li>\n<li>Magic Circles: </li>\n<li>Magic type: </li>\n<li>Alignment: </li>\n<li>Year born: </li>\n</ul>\n<h2>Extra info:</h2>\n<ul>\n<li></li>\n</ul>\n<h1>Description</h1>\n\n<h1>History</h1>\n', '#character#unfinished', 2, ';'),
(90, 'Fun facts', '<h1>Fun facts!</h1>\n<h2>Random</h2>\n<ul>\n<li>Phera was originally supposed to be called Ferra, however, Oscar wrote down Phera instead in some of his notes, and then I thought it was better, so I kept it this way.</li>\n</ul>\n<h2>Lore</h2>\n<ul>\n<li>Phera was supposed to be an early boss fighting against Oscar, Jerome, Nizen and Griuf</li>\n</ul>\n<h2>System</h2>\n<ul>\n<li></li>\n</ul>', '#a#info#unfinished', 2, ';');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `calendar`
--
ALTER TABLE `calendar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `date_UNIQUE` (`date`);

--
-- Indexes for table `character`
--
ALTER TABLE `character`
  ADD PRIMARY KEY (`id`,`role_id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD KEY `character_role1_idx` (`role_id`);

--
-- Indexes for table `character_calendar`
--
ALTER TABLE `character_calendar`
  ADD PRIMARY KEY (`character_id`,`calendar_id`),
  ADD KEY `character_calendar_calendar1_idx` (`calendar_id`),
  ADD KEY `character_calendar_character1_idx` (`character_id`);

--
-- Indexes for table `character_image`
--
ALTER TABLE `character_image`
  ADD PRIMARY KEY (`id`,`character_id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `character_image_character1_idx` (`character_id`);

--
-- Indexes for table `character_magic`
--
ALTER TABLE `character_magic`
  ADD PRIMARY KEY (`character_id`,`magic_name`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`,`type_id`,`character_id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `inventory_type1_idx` (`type_id`),
  ADD KEY `inventory_character1_idx` (`character_id`);

--
-- Indexes for table `magic`
--
ALTER TABLE `magic`
  ADD PRIMARY KEY (`id`,`name`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`character_id`),
  ADD UNIQUE KEY `character_id_UNIQUE` (`character_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `special_item`
--
ALTER TABLE `special_item`
  ADD PRIMARY KEY (`inventory_id`),
  ADD UNIQUE KEY `inventory_id_UNIQUE` (`inventory_id`),
  ADD KEY `special_item_inventory1_idx` (`inventory_id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `wiki`
--
ALTER TABLE `wiki`
  ADD PRIMARY KEY (`id`,`name`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `calendar`
--
ALTER TABLE `calendar`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `character`
--
ALTER TABLE `character`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `character_image`
--
ALTER TABLE `character_image`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `magic`
--
ALTER TABLE `magic`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `wiki`
--
ALTER TABLE `wiki`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `character`
--
ALTER TABLE `character`
  ADD CONSTRAINT `character_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Constraints for table `character_calendar`
--
ALTER TABLE `character_calendar`
  ADD CONSTRAINT `character_calendar_calendar1` FOREIGN KEY (`calendar_id`) REFERENCES `calendar` (`id`),
  ADD CONSTRAINT `character_calendar_character1` FOREIGN KEY (`character_id`) REFERENCES `character` (`id`);

--
-- Constraints for table `character_image`
--
ALTER TABLE `character_image`
  ADD CONSTRAINT `character_image_character1` FOREIGN KEY (`character_id`) REFERENCES `character` (`id`);

--
-- Constraints for table `character_magic`
--
ALTER TABLE `character_magic`
  ADD CONSTRAINT `character_magic_character1` FOREIGN KEY (`character_id`) REFERENCES `character` (`id`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_character1` FOREIGN KEY (`character_id`) REFERENCES `character` (`id`),
  ADD CONSTRAINT `inventory_type1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`);

--
-- Constraints for table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_character1` FOREIGN KEY (`character_id`) REFERENCES `character` (`id`);

--
-- Constraints for table `special_item`
--
ALTER TABLE `special_item`
  ADD CONSTRAINT `special_item_inventory1` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
