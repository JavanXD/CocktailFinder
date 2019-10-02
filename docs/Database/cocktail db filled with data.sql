-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 02. Okt 2019 um 14:54
-- Server-Version: 5.5.64-MariaDB
-- PHP-Version: 7.1.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cocktail`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Cocktails`
--

CREATE TABLE `Cocktails` (
  `CocktailID` int(11) NOT NULL,
  `Name` char(55) NOT NULL,
  `Bewertung` int(11) NOT NULL,
  `Schwierigkeit` int(11) NOT NULL,
  `KategorieID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `Cocktails`
--

INSERT INTO `Cocktails` (`CocktailID`, `Name`, `Bewertung`, `Schwierigkeit`, `KategorieID`) VALUES
(1, 'Mojito', 0, 0, 0),
(2, 'Caipirinha', 0, 0, 0),
(3, 'Martini', 0, 0, 0),
(7, 'Tequila Sunrise', 0, 0, 0),
(13, 'Piña Colada', 0, 0, 0),
(16, 'Mai Tai', 0, 0, 0),
(17, 'Sex on the Beach', 0, 0, 0),
(18, 'Cuba Libre', 0, 0, 0),
(19, 'Long Island Ice Tea', 0, 0, 0),
(20, 'Cosmopolitan', 0, 0, 0),
(21, 'Frozen Daiquiri', 0, 0, 0),
(22, 'Margarita', 0, 0, 0),
(23, 'Bloody Mary', 0, 0, 0),
(24, 'Moscow Mule', 0, 0, 0),
(28, 'Bay Breeze', 0, 0, 0),
(29, 'Electric Lemonade', 0, 0, 0),
(30, 'Springtime Cooler', 0, 0, 0),
(31, 'Tom Collins', 0, 0, 0),
(32, 'Pink Rum', 0, 0, 0),
(33, 'Pineapple Fizz', 0, 0, 0),
(34, 'Lime Up', 0, 0, 0),
(35, 'Blue Hawaii', 0, 0, 0),
(36, 'Jalapa', 0, 0, 0),
(37, 'Mexicana', 0, 0, 0),
(38, 'Alamo Splash', 0, 0, 0),
(39, 'Sex on the Beach 2', 0, 0, 0),
(40, 'Honolulu', 0, 0, 0),
(41, 'Gin Tropical', 0, 0, 0),
(42, 'Alice Springs', 0, 0, 0),
(43, 'Lime on Ice', 0, 0, 0),
(44, 'Fiction', 0, 0, 0),
(45, 'Agent Jack', 0, 0, 0),
(46, 'Lynchburg Lemonade', 0, 0, 0),
(47, 'Malibu Bay Breeze', 0, 0, 0),
(49, 'Sun Berries', 0, 0, 0),
(50, 'Swimmingpool', 0, 0, 0),
(51, 'White Russian', 0, 0, 0),
(52, 'Sea Breeze', 0, 0, 0),
(53, 'Harvey Wallbanger', 0, 0, 0),
(54, 'Singapore Gin Sling', 0, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Kategorien`
--

CREATE TABLE `Kategorien` (
  `KategorieID` int(11) NOT NULL,
  `Titel` char(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `Kategorien`
--

INSERT INTO `Kategorien` (`KategorieID`, `Titel`) VALUES
(1, 'Longdrinks – Vodka'),
(2, 'Longdrinks – Weißer Rum'),
(3, 'Longdrinks – Tequila'),
(4, 'Longdrinks – Gin'),
(5, 'Longdrinks – Triple Sec'),
(6, 'Longdrinks – Whisky'),
(7, 'Longdrinks – Kokosnussrum'),
(8, 'Starke Longdrinks');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Kommentare`
--

CREATE TABLE `Kommentare` (
  `KommentarID` int(11) NOT NULL,
  `CocktailID` int(11) NOT NULL,
  `Kommentar` varchar(600) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `Kommentare`
--

INSERT INTO `Kommentare` (`KommentarID`, `CocktailID`, `Kommentar`) VALUES
(4, 7, 'Eiswürfel in ein Longdrinkglas geben, den Tequila dazu gießen und mit dem Orangensaft auffüllen.'),
(10, 13, 'Alle Zutaten im Shaker zusammen mit 3-4 Eiswürfeln schütteln.'),
(13, 16, 'Die Zutaten mit Eiswürfeln im Shaker kräftig schütteln, dann durch ein Barsieb ins Glas gießen und umrühren.'),
(14, 17, 'So verführerisch wie sein Name: Sex on the Beach.'),
(15, 18, 'Mit Cola auffüllen und dann Eis dazu geben.'),
(16, 19, 'Die Zutaten in ein großes Cocktailglas mit zerstoßenem Eis geben und kurz umrühren. Eiskalt servieren'),
(17, 20, 'Den Wodka, den Cranberrysaft, den Limettensaft, die Eiswürfel und den Cointreau/Triple Sec im Cocktailshaker schütteln.'),
(18, 21, 'Alle Zutaten werden im Mixer mit ca. einer halben Tasse zerstoßenem Eis gemixt.'),
(19, 22, 'Die Zutaten mit Eis bis auf das Salz in den Shaker geben und shaken, oder im Elektromixer zubereiten. In eine Cocktailschale mit Salzrand und evtl. einigen Eiswürfeln füllen.'),
(20, 23, 'Alle Zutaten mit einigen Eiswürfeln im Shaker kräftig mixen. In ein Longdrinkglas mit einigen Eiswürfeln abseihen.'),
(21, 24, 'Fülle einen Kupferbecher zur Hälfte mit Eiswürfeln, füge den Vodka hinzu, presse den Saft einer halben Limette über dem Glas aus und fülle alles mit Ginger Beer auf.'),
(25, 1, 'Die Limette in vier Stücke teilen, in ein Longdrinkglas geben, den Rohrzucker (möglichst fein gemahlenen verwenden) darüber streuen, die Minzeblätter beifügen und alles mit dem Stößel oder dem Barlöffel zerdrücken. Mit 4-5 EL zerstoßenem Eis, dem Rum und dem Sodawasser auffüllen und gut umrühren. Als Dekoration einen Pfefferminzzweig ins Glas geben. '),
(26, 2, 'Die halbe Limette wird in kleine Stücke (1/8) geschnitten und zusammen mit dem Zucker in einem stabilen Glas zerquetscht.\r\nAnschließend wird das Glas mit Crushed Ice aufgefüllt, der Cachaça hinzugegeben und umgerührt. '),
(27, 3, 'Eis in ein Rührglas oder den Becherteil des Shakers geben und Gin und Noilly Prat dazugeben. 30 Sekunden lang rühren.'),
(28, 28, 'Mit Eiswürfeln im Shaker gut schütteln und in ein Longdrinkglas auf einige Eiswürfel abseihen. Mit Früchten garnieren (Limetten)'),
(29, 29, 'Vodka, Zitronenlimonade und Eiswürfel im Shaker leicht vermischen. Im Longdrinkglas abseihen. Vorsichtig Blue Curacao hineinlaufen lassen. Zitronenscheibe für Dekoration.'),
(30, 30, 'Mit Eiswürfeln im Shaker gut schütteln und in ein Longdrinkglas auf einige Eiswürfel abseihen. Mit Früchten garnieren.'),
(31, 31, 'Alle Zutaten, außer Sodawasser im Shaker schütteln und mit Eiswürfel in Longdrinkglas abseihen. Anschließend dekorieren mit Zitronenscheiben.'),
(32, 32, 'Kräuterbitter mit Eiswürfel in Glas geben. Im Shaker die übrigen Zutaten vermischen. Limettenscheibe für Dekoration.'),
(33, 33, 'Die Zutaten ohne Sodawasser mit Eiswürfeln kräftig schütteln und in ein Longdrinkglas abseihen. Mit Sodawasser auffüllen.'),
(34, 34, 'Alle Zutaten in einem Longdrinkglas anrichten und mit Limettenscheibe dekorieren.'),
(35, 35, 'Alle Zutaten in einen Shaker mit Eis geben und gut mischen. In ein Longdrinkglas abseihen und mit Cocktailkirsche und Ananas dekorieren.'),
(36, 36, 'Alles in einen Shaker geben und gut mischen. Mit Limette dekorieren.'),
(37, 37, 'Tequila, Ananassaft und Eiswürfel in einem Shaker mischen und in ein Longdrinkglas abseihen. Grenadine hineinfließen lassen und mit Ananas und Cocktailkirsche dekorieren.'),
(38, 38, 'Alles außer Sodawasser mit Eiswürfel im Shaker mischen und in ein Longdrinkglas abseihen. Sodawasser zum Auffüllen dazugeben und mit Ananas und Orange dekorieren.'),
(39, 39, 'Alle Zutaten außer Cranberrysaft mit Eiswürfel im Shaker mischen und in ein Longdrinkglas abseihen. Cranberrysaft dazugeben und mit Orange dekorieren.'),
(40, 40, 'Gin, Orangensaft, Zitronensaft und Ananassaft im Shaker vermischen und in ein Longdrinkglas abseihen. Grenadine vorsichtig einschenken. Orangenscheibe für Dekoration.'),
(41, 41, 'Zutaten mit Eis shaken, und in ein Longdrinkglas abgießen. Orangenscheibe für Dekoration.'),
(42, 42, 'Alle Zutaten außer Wasser in den Shaker und mischen. In einem Longdrinkglas abseihen und mit Sodawasser auffüllen'),
(43, 43, 'In ein Old-Fashioned-Glas zwei Eiswürfel geben. Cointreau, Wasser und Zitronensaft mit dem Barlöffel leicht umrühren. Ein Zitronenstück über dem Glas auspressen und in den Drink geben.'),
(44, 44, 'Den Cointreau und die Säfte in ein Longdrinkglas mit Eiswürfeln geben und mit etwas Sodawasser auffüllen. Mit einer Orangenscheibe garnieren.'),
(45, 45, 'Alle Zutaten bis auf die Cola im Shaker mischen und in ein Longdrinkglas geben am Ende mit Cola auffüllen. Mit Zitronen und Limetten dekorieren.'),
(46, 46, 'Alle Zutaten bis auf die Zitronenlimonade im Shaker mischen und in ein Longdrinkglas geben am Ende mit Limo auffüllen. Mit Zitrone dekorieren.'),
(47, 47, 'Alle Zutaten im Shaker mit Eiswürfel mischen und in Longdrinkglas abseihen. Mit Ananas dekorieren.'),
(49, 49, 'Alle Zutaten (mit Himbeeren) in Shaker mit Eiswürfel gut mischen und in ein Longdrinkglas geben. Himbeeren zum Dekorieren.'),
(50, 50, 'Alle Zutaten mischen und in einem Longdrinkglas abseihen. Mit Orangenscheibe dekorieren.'),
(51, 51, 'Die Hälfte des Cocktails mit Eis füllen und Wodka, Tia Maria und Milch hinzufügen.'),
(52, 52, 'Die Zutaten gut verrühren und den Cocktail mit einer Limettenscheibe und Stohhalmen dekorieren.'),
(53, 53, 'Die Hälfte des Cocktail mit Eiswürfeln füllen. Wodka und Orangensaft im Cocktailshaker gut schütteln und über die Eiswürfel geben. Gieße zum Schluss den Galliano-Likör über drüber und dekoriere den Cocktail mit Orangenscheiben.'),
(54, 54, '4 - 6 Eiswürfel in den Cocktailshaker geben. Gieße den Zitronensaft und den Orangensaft, den Cherry Brandy und den Gin über das Eis und füge drei Tropfen des Angosturabitter hinzu. Schüttle das Ganze bis sich alles gut vermischt hat. Gib dann zwei frische Eiswürfel in ein gewölbtes Cocktailglas und oben drauf das Tafelwasser. Verziere den Cockteil mit einer Zitronenscheibe.');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Zutaten`
--

CREATE TABLE `Zutaten` (
  `ZutatID` int(11) NOT NULL,
  `Titel` char(55) NOT NULL,
  `KategorieID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `Zutaten`
--

INSERT INTO `Zutaten` (`ZutatID`, `Titel`, `KategorieID`) VALUES
(1, 'Rum braun', 0),
(2, 'Limettensaft', 0),
(3, 'frische Minze', 0),
(4, 'Zucker braun', 0),
(5, 'Sodawasser', 0),
(6, 'Limette(n)', 0),
(7, 'Zucker', 0),
(8, 'Cachaça', 0),
(13, 'Tequila weiß', 0),
(14, 'Orangensaft', 0),
(15, 'Grenadine', 0),
(17, 'Rum weiß', 0),
(18, 'Ananassaft', 0),
(19, 'Sahne', 0),
(20, 'Kokosnusssirup', 0),
(24, 'Zuckersirup', 0),
(25, 'Mandelsirup', 0),
(26, 'Cointreau/ Triple Sec', 0),
(27, 'Wodka', 0),
(28, 'Pfirsichlikör', 0),
(29, 'Cranberrysaft', 0),
(30, 'Cola', 0),
(31, 'Tequila', 0),
(32, 'Gin', 0),
(33, 'Salz', 0),
(34, 'Tomatensaft', 0),
(35, 'Tabasco', 0),
(36, 'Zitronensaft', 0),
(37, 'Pfeffer', 0),
(38, 'Ginger Beer', 0),
(39, 'Zitronenlimonade', 0),
(40, 'Blue Curacao', 0),
(41, 'Kräuterbitter', 0),
(42, 'Energydrink', 0),
(43, 'Slour Mix', 0),
(44, 'Maracujasaft', 0),
(45, 'Wasser', 0),
(46, 'Whisky', 0),
(47, 'Kokosnussrum', 0),
(48, 'Himbeersirup', 0),
(49, 'Malibu', 0),
(50, 'Tia Maria', 0),
(51, 'Milch', 0),
(52, 'Grapefruitsaft', 0),
(53, 'Galliano', 0),
(54, 'Cherry Brandy', 0),
(55, 'Angosturabitter', 0),
(56, 'Tafelwasser', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ZutatZuCocktail`
--

CREATE TABLE `ZutatZuCocktail` (
  `ZutatZuCocktailID` int(11) NOT NULL,
  `ZutatID` int(11) NOT NULL,
  `CocktailID` int(11) NOT NULL,
  `Menge` char(55) NOT NULL,
  `Reihenfolge` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `ZutatZuCocktail`
--

INSERT INTO `ZutatZuCocktail` (`ZutatZuCocktailID`, `ZutatID`, `CocktailID`, `Menge`, `Reihenfolge`) VALUES
(1, 1, 1, '5 cl', 0),
(2, 2, 1, '2,5 cl', 0),
(3, 3, 1, '6-8 Blätter', 0),
(4, 7, 1, '3 TL', 0),
(5, 5, 1, '4 cl', 0),
(6, 8, 2, '4-6 cl', 0),
(7, 7, 2, '3 TL', 0),
(17, 13, 7, '4 cl', 0),
(18, 14, 7, '15 cl', 1),
(19, 15, 7, '1 cl', 2),
(24, 17, 13, '4 cl', 0),
(25, 18, 13, '8 cl', 1),
(26, 19, 13, '2 cl', 2),
(27, 20, 13, '4 cl', 3),
(34, 17, 16, '6 cl', 0),
(35, 6, 16, '1', 1),
(36, 2, 16, '1 cl', 2),
(37, 24, 16, '1 cl', 3),
(38, 25, 16, '1 cl', 4),
(39, 26, 16, '2 cl', 5),
(40, 27, 17, '4 cl', 0),
(41, 28, 17, '2 cl', 1),
(42, 14, 17, '4 cl', 2),
(43, 29, 17, '4 cl', 3),
(44, 1, 18, '4 cl', 0),
(45, 6, 18, '1', 1),
(46, 4, 18, 'etwas', 2),
(47, 30, 18, 'Auffüllen mit', 3),
(48, 27, 19, '1,5 cl', 0),
(49, 17, 19, '1,5 cl', 1),
(50, 31, 19, '1,5 cl', 2),
(51, 32, 19, '1,5 cl', 3),
(52, 26, 19, '1,5 cl', 4),
(53, 2, 19, '2 cl', 5),
(54, 30, 19, '14 cl', 6),
(55, 27, 20, '2 cl', 0),
(56, 29, 20, '3 cl', 1),
(57, 2, 20, '2 cl', 2),
(58, 26, 20, '1 cl', 3),
(59, 2, 21, '3 cl', 0),
(60, 17, 21, '6 cl', 1),
(61, 7, 21, '1,5 EL', 2),
(62, 6, 21, '1', 3),
(63, 31, 22, '5 cl', 0),
(64, 26, 22, '3 cl', 1),
(65, 2, 22, '2 cl', 2),
(66, 33, 22, '1', 3),
(67, 27, 23, '5 cl', 0),
(68, 34, 23, '10 cl', 1),
(69, 35, 23, '1 Spritzer', 2),
(70, 36, 23, 'evtl.', 3),
(71, 33, 23, 'etwas', 4),
(72, 37, 23, 'etwas', 5),
(73, 27, 24, '4 cl', 0),
(74, 2, 24, '2 cl', 1),
(75, 38, 24, '15 cl', 2),
(76, 27, 28, '4 cl', 0),
(77, 29, 28, '9 cl', 1),
(78, 18, 28, '3 cl', 2),
(79, 27, 29, '4 cl', 0),
(80, 39, 29, '10 cl', 1),
(81, 40, 29, '2 Spritzer', 2),
(82, 27, 30, '5 cl', 0),
(83, 40, 30, '2 cl', 1),
(84, 14, 30, '8 cl', 2),
(85, 36, 30, '3 cl', 3),
(86, 24, 30, '1 cl', 4),
(87, 27, 31, '5 cl', 0),
(88, 36, 31, '3 cl', 1),
(89, 24, 31, '2 cl', 2),
(90, 5, 31, 'Auffüllen mit', 3),
(91, 17, 32, '5 cl', 0),
(92, 29, 32, '5 cl', 1),
(93, 41, 32, '2 Spritzer', 2),
(94, 5, 32, 'Auffüllen mit', 3),
(95, 17, 33, '5 cl', 0),
(96, 18, 33, '6 cl', 1),
(97, 24, 33, '2 cl', 2),
(98, 36, 33, '3 cl', 3),
(99, 5, 33, 'Auffüllen mit', 4),
(100, 17, 34, '5 cl', 0),
(101, 2, 34, '3 cl', 1),
(102, 42, 34, '12 cl', 2),
(103, 5, 34, 'Auffüllen mit', 3),
(104, 17, 35, '2 cl', 0),
(105, 27, 35, '2 cl', 1),
(106, 18, 35, '9 cl', 2),
(107, 43, 35, '3 cl', 3),
(108, 40, 35, '1,5 cl', 4),
(109, 31, 36, '4 cl', 0),
(110, 2, 36, '3 cl', 1),
(111, 44, 36, '6 cl', 2),
(112, 24, 36, '1 cl', 3),
(113, 31, 37, '5 cl', 0),
(114, 18, 37, '10 cl', 1),
(115, 15, 37, '1 cl', 2),
(116, 31, 38, '4 cl', 0),
(117, 14, 38, '4 cl', 1),
(118, 18, 38, '4 cl', 2),
(119, 2, 38, '2 cl', 3),
(120, 5, 38, 'Auffüllen mit', 4),
(121, 31, 39, '4 cl', 0),
(122, 28, 39, '2 cl', 1),
(123, 14, 39, 'etwas', 2),
(124, 29, 39, 'etwas', 3),
(125, 32, 40, '5 cl', 0),
(126, 36, 40, '4 cl', 1),
(127, 14, 40, '4 cl', 2),
(128, 18, 40, '4 cl', 3),
(129, 15, 40, '1 Spritzer', 4),
(130, 32, 41, '4 cl', 0),
(131, 36, 41, '3 cl', 1),
(132, 44, 41, '3 cl', 2),
(133, 14, 41, '3 cl', 3),
(134, 5, 41, 'Auffüllen mit', 4),
(135, 32, 42, '4 cl', 0),
(136, 41, 42, '1 Spritzer', 1),
(137, 15, 42, '1 Spritzer', 2),
(138, 14, 42, '4 cl', 3),
(139, 36, 42, '2 cl', 4),
(140, 5, 42, 'Auffüllen mit', 5),
(141, 26, 43, '5 cl', 0),
(142, 36, 43, '5 cl', 1),
(143, 45, 43, 'Auffüllen mit', 2),
(144, 26, 44, '5 cl', 0),
(145, 14, 44, '3 cl', 1),
(146, 36, 44, '3 cl', 2),
(147, 5, 44, 'Auffüllen mit', 3),
(148, 46, 45, '5 cl', 0),
(149, 26, 45, '2 cl', 1),
(150, 36, 45, '2 cl', 2),
(151, 30, 45, 'Auffüllen mit', 3),
(152, 46, 46, '3 cl', 0),
(153, 26, 46, '2 cl', 1),
(154, 43, 46, '3 cl', 2),
(155, 39, 46, 'Auffüllen mit', 3),
(156, 47, 47, '5 cl', 0),
(157, 29, 47, '6 cl', 1),
(158, 18, 47, '6 cl', 2),
(159, 47, 49, '5 cl', 0),
(160, 14, 49, '7 cl', 1),
(161, 48, 49, '1 cl', 2),
(162, 17, 50, '2 cl', 0),
(163, 27, 50, '2 cl', 1),
(164, 49, 50, '2 cl', 2),
(165, 14, 50, 'Auffüllen mit', 3),
(166, 40, 50, '1 Spritzer', 4),
(167, 27, 51, '4 cl', 0),
(168, 50, 51, '4 cl', 1),
(169, 51, 51, '4 cl', 2),
(170, 27, 52, '2 cl', 0),
(171, 29, 52, '3 cl', 1),
(172, 52, 52, '3 cl', 2),
(173, 27, 53, '2 cl', 0),
(174, 14, 53, '10 cl', 1),
(175, 53, 53, '1-2 Teelöffel', 2),
(176, 36, 54, '2 cl', 0),
(177, 14, 54, '2 cl', 1),
(178, 54, 54, '1 cl', 2),
(179, 55, 54, '3 Tropfen', 3),
(180, 56, 54, 'wenig', 4),
(181, 32, 54, '1.5 cl', 5);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `Cocktails`
--
ALTER TABLE `Cocktails`
  ADD PRIMARY KEY (`CocktailID`),
  ADD UNIQUE KEY `Name` (`Name`),
  ADD KEY `KommentarID` (`KategorieID`);

--
-- Indizes für die Tabelle `Kategorien`
--
ALTER TABLE `Kategorien`
  ADD PRIMARY KEY (`KategorieID`);

--
-- Indizes für die Tabelle `Kommentare`
--
ALTER TABLE `Kommentare`
  ADD PRIMARY KEY (`KommentarID`),
  ADD KEY `CocktailID` (`CocktailID`);

--
-- Indizes für die Tabelle `Zutaten`
--
ALTER TABLE `Zutaten`
  ADD PRIMARY KEY (`ZutatID`),
  ADD UNIQUE KEY `Titel` (`Titel`);

--
-- Indizes für die Tabelle `ZutatZuCocktail`
--
ALTER TABLE `ZutatZuCocktail`
  ADD PRIMARY KEY (`ZutatZuCocktailID`),
  ADD KEY `ZutatID` (`ZutatID`),
  ADD KEY `CocktailID` (`CocktailID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `Cocktails`
--
ALTER TABLE `Cocktails`
  MODIFY `CocktailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT für Tabelle `Kategorien`
--
ALTER TABLE `Kategorien`
  MODIFY `KategorieID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `Kommentare`
--
ALTER TABLE `Kommentare`
  MODIFY `KommentarID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT für Tabelle `Zutaten`
--
ALTER TABLE `Zutaten`
  MODIFY `ZutatID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT für Tabelle `ZutatZuCocktail`
--
ALTER TABLE `ZutatZuCocktail`
  MODIFY `ZutatZuCocktailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
