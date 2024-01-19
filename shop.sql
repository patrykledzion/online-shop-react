-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 19 Sty 2024, 20:11
-- Wersja serwera: 10.4.25-MariaDB
-- Wersja PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `shop`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cartitems`
--

CREATE TABLE `cartitems` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `subcategory` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `categories`
--

INSERT INTO `categories` (`id`, `subcategory`, `name`, `image`) VALUES
(1, NULL, 'ubrania', 'categories/clothes.png'),
(2, NULL, 'obuwie', 'categories/shoes.png'),
(3, NULL, 'akcesoria', 'categories/accessories.png'),
(4, NULL, 'meble', 'categories/furniture.png'),
(5, NULL, 'elektronika', 'categories/electronics.png'),
(6, NULL, 'książki i multimedia', 'categories/multimedia.png'),
(7, NULL, 'sport i rekreacja', 'categories/sport.png'),
(8, NULL, 'gry i zabawki', 'categories/games.png'),
(9, NULL, 'wyposażenie domu', 'categories/houseinventory.png'),
(10, NULL, 'motoryzacja', 'categories/cars.png'),
(11, NULL, 'biuro i szkoła', 'categories/office.png'),
(12, NULL, 'sztuka i arcydzieło', 'categories/art.png'),
(13, 1, 'ubrania męskie', NULL),
(14, 1, 'ubrania damskie', NULL),
(15, 1, 'ubrania dziecięce', NULL),
(17, 13, 'bluzy', NULL),
(18, 13, 'koszule', NULL),
(19, 13, 'spodnie', NULL),
(20, 13, 'bielizna', NULL),
(21, 13, 't-shirty i podkoszulki', NULL),
(22, 14, 'bluzy', NULL),
(23, 14, 'koszule', NULL),
(24, 14, 'spodnie', NULL),
(25, 14, 'bielizna', NULL),
(26, 14, 't-shirty i podkoszulki', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `connectfiltertotype`
--

CREATE TABLE `connectfiltertotype` (
  `id` int(11) NOT NULL,
  `filer_id` int(11) DEFAULT NULL,
  `filert_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `connectfiltertypetocategory`
--

CREATE TABLE `connectfiltertypetocategory` (
  `id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `connectfiltertypetocategory`
--

INSERT INTO `connectfiltertypetocategory` (`id`, `type_id`, `category_id`) VALUES
(1, 1, 1),
(2, 2, 17),
(3, 2, 18),
(4, 2, 21),
(5, 2, 22),
(6, 2, 23),
(7, 2, 26),
(8, 3, 19),
(9, 3, 24);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `connectphototoitem`
--

CREATE TABLE `connectphototoitem` (
  `id` int(11) NOT NULL,
  `file_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL COMMENT 'e.g. photo 1/5 '
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `connectphototoratings`
--

CREATE TABLE `connectphototoratings` (
  `id` int(11) NOT NULL,
  `file_id` int(11) DEFAULT NULL,
  `rating_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL COMMENT 'e.g. photo 1/5 '
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `files`
--

CREATE TABLE `files` (
  `id` int(11) DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `filters`
--

CREATE TABLE `filters` (
  `id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `filters`
--

INSERT INTO `filters` (`id`, `type_id`, `name`) VALUES
(1, 1, 'czerwony'),
(2, 1, 'zielony'),
(3, 1, 'czarny'),
(4, 1, 'biały'),
(5, 1, 'moro'),
(6, 1, 'żółty'),
(7, 1, 'pomarańczowy'),
(8, 1, 'kolorowy'),
(9, 1, 'brązowy'),
(10, 1, 'różowy'),
(11, 1, 'szary'),
(12, 2, 'krótki'),
(13, 2, 'długi'),
(14, 2, 'na ramiączka'),
(15, 3, 'krótkie'),
(16, 3, 'długie');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `filtertypes`
--

CREATE TABLE `filtertypes` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `opis` varchar(30) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `filtertypes`
--

INSERT INTO `filtertypes` (`id`, `name`, `opis`) VALUES
(1, 'kolor', 'kolor odzieży'),
(2, 'długość rękawa', 'długość rękawa dla odzieży'),
(3, 'długość nogawki', 'długość nogawki dla odzieży');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `itemdetails`
--

CREATE TABLE `itemdetails` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `itemdetails`
--

INSERT INTO `itemdetails` (`id`, `item_id`, `name`, `desc`) VALUES
(1, 1, 'aa', 'vv'),
(2, 2, 'Produkt testowy', 'testowy opis produktu'),
(3, 3, 'Przedmiot 1', 'opis przedmiotu 1');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orderaddresses`
--

CREATE TABLE `orderaddresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `street` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `order_address` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `target_type` int(11) DEFAULT NULL COMMENT 'user/product',
  `target_id` int(11) DEFAULT NULL,
  `from_user_id` int(11) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `shopitem`
--

CREATE TABLE `shopitem` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `shopitem`
--

INSERT INTO `shopitem` (`id`, `category_id`, `price`, `user_id`, `date`, `active`) VALUES
(1, 18, 17, 1, '2024-01-04 13:05:06', 0),
(2, 19, 21.37, 1, '2024-01-04 13:10:34', 0),
(3, 18, 69.69, 1, '2024-01-08 23:35:16', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `usercontactdetail`
--

CREATE TABLE `usercontactdetail` (
  `id` int(11) NOT NULL,
  `detail_type` int(11) DEFAULT NULL COMMENT 'phone number, street, city, ...',
  `details_id` int(11) DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `usercontactdetails`
--

CREATE TABLE `usercontactdetails` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `details_type` int(11) DEFAULT NULL COMMENT 'phone number, address'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `join_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `name`, `lastname`, `email`, `password`, `join_date`) VALUES
(1, 'Patryk', 'Kożuchowski', 'Patryk.Kożuchowski3@mail.pl', 'Kożuchowski', '2023-11-06 20:44:54'),
(2, 'Grażyna', 'Cebulion', 'Grażyna.Cebulion3@mail.pl', 'Cebulion', '2023-11-06 20:44:54'),
(3, 'Wioletta', 'Cebulion', 'Wioletta.Cebulion3@mail.pl', 'Cebulion', '2023-11-06 20:44:54'),
(4, 'Stanisław', 'Cebulion', 'Stanisław.Cebulion1@mail.pl', 'Cebulion', '2023-11-06 20:44:54'),
(5, 'Grażyna', 'Czubówny', 'Grażyna.Czubówny3@mail.pl', 'Czubówny', '2023-11-06 20:44:54'),
(6, 'Kamil', 'Aniger', 'Kamil.Aniger1@mail.pl', 'Aniger', '2023-11-06 20:44:54'),
(7, 'Regina', 'Aniger', 'Regina.Aniger0@mail.pl', 'Aniger', '2023-11-06 20:44:54'),
(8, 'Patryk', 'Nowak', 'Patryk.Nowak2@mail.pl', 'Nowak', '2023-11-06 20:44:54'),
(9, 'Wioletta', 'Kożuchowski', 'Wioletta.Kożuchowski1@mail.pl', 'Kożuchowski', '2023-11-06 20:44:54'),
(10, 'Ferdynant', 'Kowal', 'Ferdynant.Kowal2@mail.pl', 'Kowal', '2023-11-06 20:44:54'),
(11, 'Regina', 'Cycorek', 'Regina.Cycorek2@mail.pl', 'Cycorek', '2023-11-06 20:44:54'),
(12, 'Regina', 'Aniger', 'Regina.Aniger2@mail.pl', 'Aniger', '2023-11-06 20:44:54'),
(13, 'Patryk', 'Wiadrowicz', 'Patryk.Wiadrowicz2@mail.pl', 'Wiadrowicz', '2023-11-06 20:44:54'),
(14, 'Geralt', 'Aniger', 'Geralt.Aniger1@mail.pl', 'Aniger', '2023-11-06 20:44:54'),
(15, 'Kamil', 'Czubówny', 'Kamil.Czubówny0@mail.pl', 'Czubówny', '2023-11-06 20:44:54'),
(16, 'Stanisław', 'Kożuchowski', 'Stanisław.Kożuchowski1@mail.pl', 'Kożuchowski', '2023-11-06 20:44:54'),
(17, 'Wioletta', 'Aniger', 'Wioletta.Aniger0@mail.pl', 'Aniger', '2023-11-06 20:44:54'),
(18, 'Bogusław', 'Czubówny', 'Bogusław.Czubówny1@mail.pl', 'Czubówny', '2023-11-06 20:44:54'),
(19, 'Ferdynant', 'Cebulion', 'Ferdynant.Cebulion0@mail.pl', 'Cebulion', '2023-11-06 20:44:54'),
(20, 'Patryk', 'Aniger', 'Patryk.Aniger2@mail.pl', 'Aniger', '2023-11-06 20:44:54'),
(21, 'Grażyna', 'Kowalski', 'Grażyna.Kowalski3@mail.pl', 'Kowalski', '2023-11-06 20:44:54'),
(22, 'Geralt', 'Nowak', 'Geralt.Nowak1@mail.pl', 'Nowak', '2023-11-06 20:44:54'),
(23, 'Stanisław', 'Kowal', 'Stanisław.Kowal4@mail.pl', 'Kowal', '2023-11-06 20:44:54'),
(24, 'Regina', 'Hateemelowicz', 'Regina.Hateemelowicz2@mail.pl', 'Hateemelowicz', '2023-11-06 20:44:54'),
(25, 'Patryk', 'Cebulion', 'Patryk.Cebulion3@mail.pl', 'Cebulion', '2023-11-06 20:44:54'),
(26, 'Wioletta', 'Cebulion', 'Wioletta.Cebulion1@mail.pl', 'Cebulion', '2023-11-06 20:44:54'),
(27, 'Bogusław', 'Wiadrowicz', 'Bogusław.Wiadrowicz1@mail.pl', 'Wiadrowicz', '2023-11-06 20:44:54'),
(28, 'Regina', 'Kożuchowski', 'Regina.Kożuchowski4@mail.pl', 'Kożuchowski', '2023-11-06 20:44:54'),
(29, 'Bogusław', 'Wiadrowicz', 'Bogusław.Wiadrowicz3@mail.pl', 'Wiadrowicz', '2023-11-06 20:44:54'),
(30, 'Wioletta', 'Kowal', 'Wioletta.Kowal0@mail.pl', 'Kowal', '2023-11-06 20:44:54'),
(31, 'Stanisław', 'Cycorek', 'Stanisław.Cycorek1@mail.pl', 'Cycorek', '2023-11-06 20:44:54'),
(32, 'Patryk', 'Karolak', 'Patryk.Karolak0@mail.pl', 'Karolak', '2023-11-06 20:44:54'),
(33, 'Bogusław', 'Cycorek', 'Bogusław.Cycorek3@mail.pl', 'Cycorek', '2023-11-06 20:44:54'),
(34, 'Wioletta', 'Kowal', 'Wioletta.Kowal4@mail.pl', 'Kowal', '2023-11-06 20:44:54'),
(35, 'Kamil', 'Kożuchowski', 'Kamil.Kożuchowski2@mail.pl', 'Kożuchowski', '2023-11-06 20:44:54'),
(36, 'Ferdynant', 'Cebulion', 'Ferdynant.Cebulion3@mail.pl', 'Cebulion', '2023-11-06 20:44:54'),
(37, 'Patryk', 'Kowal', 'Patryk.Kowal0@mail.pl', 'Kowal', '2023-11-06 20:44:54'),
(38, 'Geralt', 'Cebulion', 'Geralt.Cebulion1@mail.pl', 'Cebulion', '2023-11-06 20:44:54'),
(39, 'Kamil', 'Wiadrowicz', 'Kamil.Wiadrowicz2@mail.pl', 'Wiadrowicz', '2023-11-06 20:44:54'),
(40, 'Wioletta', 'Karolak', 'Wioletta.Karolak0@mail.pl', 'Karolak', '2023-11-06 20:44:54'),
(41, 'Regina', 'Hateemelowicz', 'Regina.Hateemelowicz0@mail.pl', 'Hateemelowicz', '2023-11-06 20:44:54'),
(42, 'Geralt', 'Kowal', 'Geralt.Kowal2@mail.pl', 'Kowal', '2023-11-06 20:44:54'),
(43, 'Wioletta', 'Kowalski', 'Wioletta.Kowalski0@mail.pl', 'Kowalski', '2023-11-06 20:44:54'),
(44, 'Regina', 'Wiadrowicz', 'Regina.Wiadrowicz2@mail.pl', 'Wiadrowicz', '2023-11-06 20:44:54'),
(45, 'Kamil', 'Kowalski', 'Kamil.Kowalski0@mail.pl', 'Kowalski', '2023-11-06 20:44:54'),
(46, 'Grażyna', 'Czubówny', 'Grażyna.Czubówny0@mail.pl', 'Czubówny', '2023-11-06 20:44:54'),
(47, 'Regina', 'Kowalski', 'Regina.Kowalski0@mail.pl', 'Kowalski', '2023-11-06 20:44:54'),
(48, 'Wioletta', 'Wiadrowicz', 'Wioletta.Wiadrowicz2@mail.pl', 'Wiadrowicz', '2023-11-06 20:44:54'),
(49, 'Ferdynant', 'Cebulion', 'Ferdynant.Cebulion2@mail.pl', 'Cebulion', '2023-11-06 20:44:54'),
(50, 'Patryk', 'Hateemelowicz', 'Patryk.Hateemelowicz3@mail.pl', 'Hateemelowicz', '2023-11-06 20:44:54'),
(51, 'Geralt', 'Karolak', 'Geralt.Karolak1@mail.pl', 'Karolak', '2023-11-06 20:44:54'),
(52, 'Ferdynant', 'Nowak', 'Ferdynant.Nowak2@mail.pl', 'Nowak', '2023-11-06 20:44:54'),
(53, 'Regina', 'Nowak', 'Regina.Nowak0@mail.pl', 'Nowak', '2023-11-06 20:44:54'),
(54, 'Kamil', 'Cycorek', 'Kamil.Cycorek1@mail.pl', 'Cycorek', '2023-11-06 20:44:54'),
(55, 'Ferdynant', 'Kowalski', 'Ferdynant.Kowalski0@mail.pl', 'Kowalski', '2023-11-06 20:44:54'),
(56, 'Regina', 'Kowal', 'Regina.Kowal2@mail.pl', 'Kowal', '2023-11-06 20:44:54'),
(57, 'Bogusław', 'Kowal', 'Bogusław.Kowal3@mail.pl', 'Kowal', '2023-11-06 20:44:54'),
(58, 'Stanisław', 'Wiadrowicz', 'Stanisław.Wiadrowicz1@mail.pl', 'Wiadrowicz', '2023-11-06 20:44:54'),
(59, 'Regina', 'Kowalski', 'Regina.Kowalski4@mail.pl', 'Kowalski', '2023-11-06 20:44:54'),
(60, 'Bogusław', 'Kowalski', 'Bogusław.Kowalski4@mail.pl', 'Kowalski', '2023-11-06 20:44:54'),
(61, 'Stanisław', 'Kowalski', 'Stanisław.Kowalski1@mail.pl', 'Kowalski', '2023-11-06 20:44:54'),
(62, 'Wioletta', 'Kowalski', 'Wioletta.Kowalski2@mail.pl', 'Kowalski', '2023-11-06 20:44:54'),
(63, 'Regina', 'Karolak', 'Regina.Karolak2@mail.pl', 'Karolak', '2023-11-06 20:44:54'),
(64, 'Geralt', 'Kożuchowski', 'Geralt.Kożuchowski2@mail.pl', 'Kożuchowski', '2023-11-06 20:44:54'),
(65, 'Ferdynant', 'Karolak', 'Ferdynant.Karolak0@mail.pl', 'Karolak', '2023-11-06 20:44:54'),
(66, 'Ferdynant', 'Nowak', 'Ferdynant.Nowak0@mail.pl', 'Nowak', '2023-11-06 20:44:54'),
(67, 'Kamil', 'Aniger', 'Kamil.Aniger0@mail.pl', 'Aniger', '2023-11-06 20:44:54'),
(68, 'Grażyna', 'Aniger', 'Grażyna.Aniger0@mail.pl', 'Aniger', '2023-11-06 20:44:54'),
(69, 'Kamil', 'Hateemelowicz', 'Kamil.Hateemelowicz2@mail.pl', 'Hateemelowicz', '2023-11-06 20:44:54'),
(70, 'Grzegorz', 'Cebulion', 'Grzegorz.Cebulion4@mail.pl', 'Cebulion', '2023-11-06 20:44:54'),
(71, 'Patryk', 'Nowak', 'Patryk.Nowak1@mail.pl', 'Nowak', '2023-11-06 20:44:54'),
(72, 'Kamil', 'Kowal', 'Kamil.Kowal1@mail.pl', 'Kowal', '2023-11-06 20:44:54'),
(73, 'Regina', 'Nowak', 'Regina.Nowak4@mail.pl', 'Nowak', '2023-11-06 20:44:54'),
(74, 'Grzegorz', 'Nowak', 'Grzegorz.Nowak4@mail.pl', 'Nowak', '2023-11-06 20:44:54'),
(75, 'Regina', 'Kowal', 'Regina.Kowal0@mail.pl', 'Kowal', '2023-11-06 20:44:54'),
(76, 'Kamil', 'Kowalski', 'Kamil.Kowalski1@mail.pl', 'Kowalski', '2023-11-06 20:44:54'),
(77, 'Stanisław', 'Nowak', 'Stanisław.Nowak4@mail.pl', 'Nowak', '2023-11-06 20:44:54'),
(78, 'Patryk', 'Cebulion', 'Patryk.Cebulion1@mail.pl', 'Cebulion', '2023-11-06 20:44:54'),
(79, 'Wioletta', 'Karolak', 'Wioletta.Karolak2@mail.pl', 'Karolak', '2023-11-06 20:44:54'),
(80, 'Patryk', 'Hateemelowicz', 'Patryk.Hateemelowicz1@mail.pl', 'Hateemelowicz', '2023-11-06 20:44:54'),
(81, 'Patryk', 'Karolak', 'Patryk.Karolak2@mail.pl', 'Karolak', '2023-11-06 20:44:54'),
(82, 'Patryk', 'Karolak', 'Patryk.Karolak1@mail.pl', 'Karolak', '2023-11-06 20:44:54'),
(83, 'Hiacynt', 'Kowal', 'Hiacynt.Kowal3@mail.pl', 'Kowal', '2023-11-06 20:44:54'),
(84, 'Ferdynant', 'Kożuchowski', 'Ferdynant.Kożuchowski0@mail.pl', 'Kożuchowski', '2023-11-06 20:44:54'),
(85, 'Wioletta', 'Kożuchowski', 'Wioletta.Kożuchowski3@mail.pl', 'Kożuchowski', '2023-11-06 20:44:54'),
(86, 'Wioletta', 'Cebulion', 'Wioletta.Cebulion4@mail.pl', 'Cebulion', '2023-11-06 20:44:54'),
(87, 'Wioletta', 'Kowal', 'Wioletta.Kowal3@mail.pl', 'Kowal', '2023-11-06 20:44:54'),
(88, 'Kamil', 'Hateemelowicz', 'Kamil.Hateemelowicz0@mail.pl', 'Hateemelowicz', '2023-11-06 20:44:54'),
(89, 'Ferdynant', 'Kowal', 'Ferdynant.Kowal3@mail.pl', 'Kowal', '2023-11-06 20:44:54'),
(90, 'Grażyna', 'Nowak', 'Grażyna.Nowak3@mail.pl', 'Nowak', '2023-11-06 20:44:54'),
(91, 'Bogusław', 'Karolak', 'Bogusław.Karolak3@mail.pl', 'Karolak', '2023-11-06 20:44:54'),
(92, 'Stanisław', 'Cebulion', 'Stanisław.Cebulion4@mail.pl', 'Cebulion', '2023-11-06 20:44:54'),
(93, 'Hiacynt', 'Czubówny', 'Hiacynt.Czubówny4@mail.pl', 'Czubówny', '2023-11-06 20:44:54'),
(94, 'Patryk', 'Cycorek', 'Patryk.Cycorek3@mail.pl', 'Cycorek', '2023-11-06 20:44:54'),
(95, 'Bogusław', 'Cycorek', 'Bogusław.Cycorek1@mail.pl', 'Cycorek', '2023-11-06 20:44:54'),
(96, 'Grażyna', 'Kowalski', 'Grażyna.Kowalski0@mail.pl', 'Kowalski', '2023-11-06 20:44:54'),
(97, 'Hiacynt', 'Nowak', 'Hiacynt.Nowak3@mail.pl', 'Nowak', '2023-11-06 20:44:54'),
(98, 'Wioletta', 'Karolak', 'Wioletta.Karolak4@mail.pl', 'Karolak', '2023-11-06 20:44:54'),
(99, 'Grażyna', 'Cycorek', 'Grażyna.Cycorek3@mail.pl', 'Cycorek', '2023-11-06 20:44:54'),
(100, 'Patryk', 'Kowalski', 'Patryk.Kowalski3@mail.pl', 'Kowalski', '2023-11-06 20:44:54'),
(101, 'Stanisław', 'Kożuchowski', 'Stanisław.Kożuchowski4@mail.pl', 'Kożuchowski', '2023-11-06 20:44:54'),
(102, 'Wioletta', 'Karolak', 'Wioletta.Karolak1@mail.pl', 'Karolak', '2023-11-06 20:44:54'),
(103, 'Geralt', 'Cebulion', 'Geralt.Cebulion2@mail.pl', 'Cebulion', '2023-11-06 20:44:54'),
(104, 'Stanisław', 'Kowalski', 'Stanisław.Kowalski4@mail.pl', 'Kowalski', '2023-11-06 20:44:54'),
(105, 'Grażyna', 'Aniger', 'Grażyna.Aniger3@mail.pl', 'Aniger', '2023-11-06 20:44:54'),
(106, 'Wioletta', 'Cebulion', 'Wioletta.Cebulion2@mail.pl', 'Cebulion', '2023-11-06 20:44:54'),
(107, 'Wioletta', 'Nowak', 'Wioletta.Nowak2@mail.pl', 'Nowak', '2023-11-06 20:44:54'),
(108, 'Geralt', 'Nowak', 'Geralt.Nowak2@mail.pl', 'Nowak', '2023-11-06 20:44:54'),
(109, 'Regina', 'Kowal', 'Regina.Kowal4@mail.pl', 'Kowal', '2023-11-06 20:44:54'),
(110, 'Ferdynant', 'Cycorek', 'Ferdynant.Cycorek3@mail.pl', 'Cycorek', '2023-11-06 20:44:54'),
(111, 'Kamil', 'Nowak', 'Kamil.Nowak0@mail.pl', 'Nowak', '2023-11-06 20:44:54'),
(112, 'Patryk', 'Czubówny', 'Patryk.Czubówny1@mail.pl', 'Czubówny', '2023-11-06 20:44:54'),
(113, 'Wioletta', 'Aniger', 'Wioletta.Aniger3@mail.pl', 'Aniger', '2023-11-06 20:44:54'),
(114, 'Patryk', 'Kowal', 'Patryk.Kowal3@mail.pl', 'Kowal', '2023-11-06 20:44:54'),
(115, 'Bogusław', 'Kożuchowski', 'Bogusław.Kożuchowski1@mail.pl', 'Kożuchowski', '2023-11-06 20:44:54'),
(116, 'Wioletta', 'Karolak', 'Wioletta.Karolak3@mail.pl', 'Karolak', '2023-11-06 20:44:54'),
(117, 'Bogusław', 'Kożuchowski', 'Bogusław.Kożuchowski4@mail.pl', 'Kożuchowski', '2023-11-06 20:44:54'),
(118, 'Ferdynant', 'Kożuchowski', 'Ferdynant.Kożuchowski2@mail.pl', 'Kożuchowski', '2023-11-06 20:44:54'),
(119, 'Patryk', 'Czubówny', 'Patryk.Czubówny0@mail.pl', 'Czubówny', '2023-11-06 20:44:54'),
(120, 'Wioletta', 'Hateemelowicz', 'Wioletta.Hateemelowicz2@mail.pl', 'Hateemelowicz', '2023-11-06 20:44:54'),
(121, 'Geralt', 'Czubówny', 'Geralt.Czubówny2@mail.pl', 'Czubówny', '2023-11-06 20:44:54'),
(122, 'Hiacynt', 'Kowalski', 'Hiacynt.Kowalski3@mail.pl', 'Kowalski', '2023-11-06 20:44:54'),
(123, 'Bogusław', 'Aniger', 'Bogusław.Aniger1@mail.pl', 'Aniger', '2023-11-06 20:44:54'),
(124, 'Stanisław', 'Kowal', 'Stanisław.Kowal1@mail.pl', 'Kowal', '2023-11-06 20:44:54'),
(125, 'Ferdynant', 'Kożuchowski', 'Ferdynant.Kożuchowski3@mail.pl', 'Kożuchowski', '2023-11-06 20:44:54'),
(126, 'Kamil', 'Cebulion', 'Kamil.Cebulion2@mail.pl', 'Cebulion', '2023-11-06 20:44:54'),
(127, 'Ferdynant', 'Nowak', 'Ferdynant.Nowak3@mail.pl', 'Nowak', '2023-11-06 20:44:54'),
(128, 'Hiacynt', 'Wiadrowicz', 'Hiacynt.Wiadrowicz4@mail.pl', 'Wiadrowicz', '2023-11-06 20:44:54'),
(129, 'Grzegorz', 'Kowalski', 'Grzegorz.Kowalski4@mail.pl', 'Kowalski', '2023-11-06 20:44:54'),
(130, 'Kamil', 'Nowak', 'Kamil.Nowak2@mail.pl', 'Nowak', '2023-11-06 20:44:54'),
(131, 'Ferdynant', 'Karolak', 'Ferdynant.Karolak3@mail.pl', 'Karolak', '2023-11-06 20:44:54'),
(132, 'Kamil', 'Nowak', 'Kamil.Nowak1@mail.pl', 'Nowak', '2023-11-06 20:44:54'),
(133, 'Bogusław', 'Aniger', 'Bogusław.Aniger3@mail.pl', 'Aniger', '2023-11-06 20:44:54'),
(134, 'Hiacynt', 'Hateemelowicz', 'Hiacynt.Hateemelowicz3@mail.pl', 'Hateemelowicz', '2023-11-06 20:44:54'),
(135, 'Patryk', 'Kowalski', 'Patryk.Kowalski2@mail.pl', 'Kowalski', '2023-11-06 20:44:54'),
(136, 'Bogusław', 'Kowalski', 'Bogusław.Kowalski3@mail.pl', 'Kowalski', '2023-11-06 20:44:54'),
(137, 'Ferdynant', 'Karolak', 'Ferdynant.Karolak2@mail.pl', 'Karolak', '2023-11-06 20:44:54'),
(138, 'Bogusław', 'Kowal', 'Bogusław.Kowal1@mail.pl', 'Kowal', '2023-11-06 20:44:54'),
(139, 'Bogusław', 'Kowal', 'Bogusław.Kowal4@mail.pl', 'Kowal', '2023-11-06 20:44:54'),
(140, 'Patryk', 'Kowalski', 'Patryk.Kowalski0@mail.pl', 'Kowalski', '2023-11-06 20:44:54'),
(141, 'Patryk', 'Cycorek', 'Patryk.Cycorek1@mail.pl', 'Cycorek', '2023-11-06 20:44:54'),
(142, 'Patryk', 'Czubówny', 'Patryk.Czubówny2@mail.pl', 'Czubówny', '2023-11-06 20:44:54'),
(143, 'Ferdynant', 'Czubówny', 'Ferdynant.Czubówny2@mail.pl', 'Czubówny', '2023-11-06 20:44:54'),
(144, 'Kamil', 'Karolak', 'Kamil.Karolak2@mail.pl', 'Karolak', '2023-11-06 20:44:54'),
(145, 'Geralt', 'Hateemelowicz', 'Geralt.Hateemelowicz1@mail.pl', 'Hateemelowicz', '2023-11-06 20:44:54'),
(146, 'Kamil', 'Hateemelowicz', 'Kamil.Hateemelowicz1@mail.pl', 'Hateemelowicz', '2023-11-06 20:44:54'),
(147, 'Grzegorz', 'Hateemelowicz', 'Grzegorz.Hateemelowicz4@mail.pl', 'Hateemelowicz', '2023-11-06 20:44:54'),
(148, 'Geralt', 'Aniger', 'Geralt.Aniger2@mail.pl', 'Aniger', '2023-11-06 20:44:54'),
(149, 'Bogusław', 'Cebulion', 'Bogusław.Cebulion4@mail.pl', 'Cebulion', '2023-11-06 20:44:54'),
(150, 'Hiacynt', 'Karolak', 'Hiacynt.Karolak3@mail.pl', 'Karolak', '2023-11-06 20:44:54'),
(151, 'Bogusław', 'Nowak', 'Bogusław.Nowak4@mail.pl', 'Nowak', '2023-11-06 20:44:54'),
(152, 'Bogusław', 'Cycorek', 'Bogusław.Cycorek4@mail.pl', 'Cycorek', '2023-11-06 20:44:54'),
(153, 'Hiacynt', 'Cycorek', 'Hiacynt.Cycorek4@mail.pl', 'Cycorek', '2023-11-06 20:44:54'),
(154, 'Geralt', 'Kowalski', 'Geralt.Kowalski1@mail.pl', 'Kowalski', '2023-11-06 20:44:54'),
(155, 'Wioletta', 'Nowak', 'Wioletta.Nowak1@mail.pl', 'Nowak', '2023-11-06 20:44:54'),
(156, 'Hiacynt', 'Kowalski', 'Hiacynt.Kowalski4@mail.pl', 'Kowalski', '2023-11-06 20:44:54'),
(157, 'Hiacynt', 'Karolak', 'Hiacynt.Karolak4@mail.pl', 'Karolak', '2023-11-06 20:44:54'),
(158, 'Wioletta', 'Aniger', 'Wioletta.Aniger4@mail.pl', 'Aniger', '2023-11-06 20:44:54'),
(159, 'Regina', 'Karolak', 'Regina.Karolak4@mail.pl', 'Karolak', '2023-11-06 20:44:54'),
(160, 'Stanisław', 'Karolak', 'Stanisław.Karolak4@mail.pl', 'Karolak', '2023-11-06 20:44:54'),
(161, 'Wioletta', 'Hateemelowicz', 'Wioletta.Hateemelowicz1@mail.pl', 'Hateemelowicz', '2023-11-06 20:44:54'),
(162, 'Wioletta', 'Czubówny', 'Wioletta.Czubówny4@mail.pl', 'Czubówny', '2023-11-06 20:44:54'),
(163, 'Grażyna', 'Kożuchowski', 'Grażyna.Kożuchowski0@mail.pl', 'Kożuchowski', '2023-11-06 20:44:54'),
(164, 'Grażyna', 'Hateemelowicz', 'Grażyna.Hateemelowicz0@mail.pl', 'Hateemelowicz', '2023-11-06 20:44:54'),
(165, 'Kamil', 'Kożuchowski', 'Kamil.Kożuchowski0@mail.pl', 'Kożuchowski', '2023-11-06 20:44:54'),
(166, 'Wioletta', 'Nowak', 'Wioletta.Nowak4@mail.pl', 'Nowak', '2023-11-06 20:44:54'),
(167, 'Grzegorz', 'Czubówny', 'Grzegorz.Czubówny4@mail.pl', 'Czubówny', '2023-11-06 20:44:54'),
(168, 'Hiacynt', 'Wiadrowicz', 'Hiacynt.Wiadrowicz3@mail.pl', 'Wiadrowicz', '2023-11-06 20:44:54'),
(169, 'Grzegorz', 'Wiadrowicz', 'Grzegorz.Wiadrowicz4@mail.pl', 'Wiadrowicz', '2023-11-06 20:44:54'),
(170, 'Ferdynant', 'Hateemelowicz', 'Ferdynant.Hateemelowicz0@mail.pl', 'Hateemelowicz', '2023-11-06 20:44:54'),
(171, 'Regina', 'Kożuchowski', 'Regina.Kożuchowski0@mail.pl', 'Kożuchowski', '2023-11-06 20:44:54'),
(172, 'Regina', 'Czubówny', 'Regina.Czubówny4@mail.pl', 'Czubówny', '2023-11-06 20:44:54'),
(173, 'Hiacynt', 'Cebulion', 'Hiacynt.Cebulion4@mail.pl', 'Cebulion', '2023-11-06 20:44:54'),
(174, 'Wioletta', 'Kowalski', 'Wioletta.Kowalski1@mail.pl', 'Kowalski', '2023-11-06 20:44:54'),
(175, 'Patryk', 'Aniger', 'Patryk.Aniger0@mail.pl', 'Aniger', '2023-11-06 20:44:54'),
(176, 'Wioletta', 'Cycorek', 'Wioletta.Cycorek0@mail.pl', 'Cycorek', '2023-11-06 20:44:54'),
(177, 'Wioletta', 'Nowak', 'Wioletta.Nowak3@mail.pl', 'Nowak', '2023-11-06 20:44:54'),
(178, 'Patryk', 'Nowak', 'Patryk.Nowak0@mail.pl', 'Nowak', '2023-11-06 20:44:54'),
(179, 'Wioletta', 'Nowak', 'Wioletta.Nowak0@mail.pl', 'Nowak', '2023-11-06 20:44:54'),
(180, 'Grażyna', 'Karolak', 'Grażyna.Karolak0@mail.pl', 'Karolak', '2023-11-06 20:44:54');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `cartitems`
--
ALTER TABLE `cartitems`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `connectfiltertotype`
--
ALTER TABLE `connectfiltertotype`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `connectfiltertypetocategory`
--
ALTER TABLE `connectfiltertypetocategory`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `connectphototoitem`
--
ALTER TABLE `connectphototoitem`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `connectphototoratings`
--
ALTER TABLE `connectphototoratings`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `filters`
--
ALTER TABLE `filters`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `filtertypes`
--
ALTER TABLE `filtertypes`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `itemdetails`
--
ALTER TABLE `itemdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `orderaddresses`
--
ALTER TABLE `orderaddresses`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `shopitem`
--
ALTER TABLE `shopitem`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `usercontactdetail`
--
ALTER TABLE `usercontactdetail`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `usercontactdetails`
--
ALTER TABLE `usercontactdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT dla tabeli `connectfiltertypetocategory`
--
ALTER TABLE `connectfiltertypetocategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `filters`
--
ALTER TABLE `filters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT dla tabeli `filtertypes`
--
ALTER TABLE `filtertypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `itemdetails`
--
ALTER TABLE `itemdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
