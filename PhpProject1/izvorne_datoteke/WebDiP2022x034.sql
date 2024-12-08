-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 12, 2023 at 10:31 PM
-- Server version: 5.5.62-0+deb8u1
-- PHP Version: 7.2.25-1+0~20191128.32+debian8~1.gbp108445

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `WebDiP2022x034`
--

-- --------------------------------------------------------

--
-- Table structure for table `dnevnik`
--

CREATE TABLE `dnevnik` (
  `id` int(11) NOT NULL,
  `datum_vrijeme` datetime NOT NULL,
  `radnja` text NOT NULL,
  `upit` text NOT NULL,
  `korisnik_id` int(11) NOT NULL,
  `tip_id` int(11) NOT NULL,
  `action` text,
  `query` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dnevnik`
--

INSERT INTO `dnevnik` (`id`, `datum_vrijeme`, `radnja`, `upit`, `korisnik_id`, `tip_id`, `action`, `query`) VALUES
(1, '2023-03-22 12:29:23', 'autentikacija.html', 'SELECT korisnicko_ime, lozinka FROM korisnik WHERE id=6;', 6, 1, 'autentikacija.html', 'SELECT username, password FROM korisnik WHERE id=6;'),
(2, '2023-03-10 14:26:46', 'autentikacija.html', 'SELECT korisnicko_ime, lozinka FROM korisnik WHERE id=5;', 5, 1, 'autentikacija.html', 'SELECT username, password FROM korisnik WHERE id=5;'),
(3, '2023-03-23 21:18:00', 'autentikacija.html', 'SELECT korisnicko_ime, lozinka FROM korisnik WHERE id=4;', 4, 1, 'autentikacija.html', 'SELECT username, password FROM korisnik WHERE id=4;'),
(4, '2023-03-29 10:55:51', 'autentikacija.html', 'SELECT korisnicko_ime, lozinka FROM korisnik WHERE id=9;', 9, 4, 'autentikacija.html', 'SELECT username, password FROM korisnik WHERE id=9;'),
(5, '2023-03-13 15:00:00', 'autentikacija.html', 'SELECT korisnicko_ime, lozinka FROM korisnik WHERE id=10;', 10, 4, 'autentikacija.html', 'SELECT username, password FROM korisnik WHERE id=10;'),
(6, '2023-02-05 12:00:29', 'popis.html', 'SELECT * FROM proizvod;', 1, 2, 'popis.html', 'SELECT * FROM proizvod;'),
(7, '2022-12-20 13:24:00', 'popis.html', 'SELECT * FROM proizvod;', 1, 2, 'popis.html', 'SELECT * FROM proizvod;'),
(8, '2023-01-13 20:40:00', 'obrazac.html', 'SELECT * FROM kampanja;', 11, 3, 'obrazac.html', 'SELECT * FROM kampanja;'),
(9, '2022-10-13 16:33:00', 'obrazac.html', 'SELECT * FROM kampanja;', 12, 3, 'obrazac.html', 'SELECT * FROM kampanja;'),
(10, '2023-03-06 22:00:00', 'popis.html', 'SELECT * FROM kampanja;', 2, 2, 'popis.html', 'SELECT * FROM kampanja;'),
(202, '2023-06-06 18:49:10', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `epizek` AND `lozinka`= `123456`', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `epizek` AND `lozinka`= `123456`'),
(222, '2023-06-08 10:09:28', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `epizek` AND `lozinka`= `123456`', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `epizek` AND `lozinka`= `123456`'),
(223, '2023-06-08 10:09:28', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`epizek`', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`epizek`'),
(224, '2023-06-08 11:35:21', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `epizek` AND `lozinka`= `123456`', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `epizek` AND `lozinka`= `123456`'),
(225, '2023-06-08 11:35:21', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`epizek`', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`epizek`'),
(226, '2023-06-08 11:40:14', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `epizek` AND `lozinka`= `123456`', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `epizek` AND `lozinka`= `123456`'),
(227, '2023-06-08 11:40:14', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`epizek`', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`epizek`'),
(228, '2023-06-08 11:40:14', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `epizek` AND `lozinka`= `123456`', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `epizek` AND `lozinka`= `123456`'),
(229, '2023-06-08 11:40:14', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`epizek`', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`epizek`'),
(230, '2023-06-08 11:50:34', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `epizek` AND `lozinka`= `123456`', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `epizek` AND `lozinka`= `123456`'),
(231, '2023-06-08 11:50:34', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`epizek`', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`epizek`'),
(232, '2023-06-08 12:15:25', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `epizek` AND `lozinka`= `123456`', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `epizek` AND `lozinka`= `123456`'),
(233, '2023-06-08 12:15:25', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`epizek`', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`epizek`'),
(234, '2023-06-08 12:48:59', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `llukic` AND `lozinka`= `8877`', 5, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `llukic` AND `lozinka`= `8877`'),
(235, '2023-06-08 12:48:59', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `llukic` AND `lozinka`= `8877`', 5, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `llukic` AND `lozinka`= `8877`'),
(236, '2023-06-08 12:48:59', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`llukic`', 5, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`llukic`'),
(237, '2023-06-08 12:50:57', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `llukic` AND `lozinka`= `8877`', 5, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `llukic` AND `lozinka`= `8877`'),
(238, '2023-06-08 12:50:57', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`llukic`', 5, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`llukic`'),
(239, '2023-06-08 12:51:40', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `epizek` AND `lozinka`= `123456`', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `epizek` AND `lozinka`= `123456`'),
(240, '2023-06-08 12:51:40', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`epizek`', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`epizek`'),
(241, '2023-06-08 12:52:32', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `llukic` AND `lozinka`= `8877`', 5, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `llukic` AND `lozinka`= `8877`'),
(242, '2023-06-08 12:52:32', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`llukic`', 5, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`llukic`'),
(243, '2023-06-08 12:56:34', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `epizek` AND `lozinka`= `123456`', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `epizek` AND `lozinka`= `123456`'),
(244, '2023-06-08 12:56:34', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`epizek`', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`epizek`'),
(245, '2023-06-08 13:16:12', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `llukic` AND `lozinka`= `8877`', 5, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `llukic` AND `lozinka`= `8877`'),
(246, '2023-06-08 13:16:12', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`llukic`', 5, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`llukic`'),
(247, '2023-06-08 13:16:45', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `aantic` AND `lozinka`= `1234`', 2, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `aantic` AND `lozinka`= `1234`'),
(248, '2023-06-08 13:16:45', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`aantic`', 2, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`aantic`'),
(249, '2023-06-08 13:16:57', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `epizek` AND `lozinka`= `123456`', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `epizek` AND `lozinka`= `123456`'),
(250, '2023-06-08 13:16:57', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`epizek`', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`epizek`'),
(251, '2023-06-08 13:17:34', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `llukic` AND `lozinka`= `8877`', 5, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `llukic` AND `lozinka`= `8877`'),
(252, '2023-06-08 13:17:34', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`llukic`', 5, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`llukic`'),
(253, '2023-06-08 13:18:52', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `mmarkic` AND `lozinka`= `2468`', 3, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `mmarkic` AND `lozinka`= `2468`'),
(254, '2023-06-08 13:18:52', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`mmarkic`', 3, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`mmarkic`'),
(255, '2023-06-08 13:19:33', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `epizek` AND `lozinka`= `123456`', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `epizek` AND `lozinka`= `123456`'),
(256, '2023-06-08 13:19:33', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`epizek`', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`epizek`'),
(257, '2023-06-08 13:20:32', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `epizek` AND `lozinka`= `123456`', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `epizek` AND `lozinka`= `123456`'),
(258, '2023-06-08 13:20:32', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`epizek`', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`epizek`'),
(259, '2023-06-08 13:23:03', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `epizek` AND `lozinka`= `123456`', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `epizek` AND `lozinka`= `123456`'),
(260, '2023-06-08 13:23:03', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`epizek`', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`epizek`'),
(261, '2023-06-08 18:26:05', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `epizek` AND `lozinka`= `123456`', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `epizek` AND `lozinka`= `123456`'),
(262, '2023-06-08 18:26:05', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`epizek`', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`epizek`'),
(263, '2023-06-08 18:26:28', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `mmarkic` AND `lozinka`= `2468`', 3, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `mmarkic` AND `lozinka`= `2468`'),
(264, '2023-06-08 18:26:28', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`mmarkic`', 3, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`mmarkic`'),
(265, '2023-06-08 18:26:56', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `epizek` AND `lozinka`= `123456`', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `epizek` AND `lozinka`= `123456`'),
(266, '2023-06-08 18:26:56', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`epizek`', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime=`epizek`'),
(267, '2023-06-08 18:27:12', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `mmarkic` AND `lozinka`= `123456`', 3, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= `mmarkic` AND `lozinka`= `123456`'),
(268, '2023-06-08 18:27:12', 'prijava.php', 'UPDATE korisnik SET broj_unosa = broj_unosa + 1 WHERE korisnicko_ime=`mmarkic`', 3, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = broj_unosa + 1 WHERE korisnicko_ime=`mmarkic`'),
(476, '2023-06-12 14:27:35', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?'),
(477, '2023-06-12 14:27:35', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?'),
(478, '2023-06-12 14:35:12', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?'),
(479, '2023-06-12 14:35:12', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?'),
(480, '2023-06-12 14:42:08', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?'),
(481, '2023-06-12 14:42:08', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?'),
(482, '2023-06-12 15:01:20', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?'),
(483, '2023-06-12 15:01:20', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?'),
(484, '2023-06-12 15:02:18', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?'),
(485, '2023-06-12 15:02:18', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?'),
(486, '2023-06-12 15:11:34', 'kreiraj_proizvod.php', 'INSERT INTO proizvod(`naziv`,`opis`,`slika`,`kolicina`,`cijena`,`status_proizvoda`,`bodovi`,`korisnik_id`,`uvijeti_i_cijena_id`,`name`,`description`,`picture`) values(`traka za tr?anje`,`TRAKA ZA TR?ANJE T540C - 16 KM/H, 45?125 CM`,``,`5`,`500`,`1`,`290`,`3`,`1`,`traka za tr?anje`,`TRAKA ZA TR?ANJE T540C - 16 KM/H, 45?125 CM`,``);', 1, 2, 'kreiraj_proizvod.php', 'INSERT INTO proizvod(`naziv`,`opis`,`slika`,`kolicina`,`cijena`,`status_proizvoda`,`bodovi`,`korisnik_id`,`uvijeti_i_cijena_id`,`name`,`description`,`picture`) values(`traka za tr?anje`,`TRAKA ZA TR?ANJE T540C - 16 KM/H, 45?125 CM`,``,`5`,`500`,`1`,`290`,`3`,`1`,`traka za tr?anje`,`TRAKA ZA TR?ANJE T540C - 16 KM/H, 45?125 CM`,``);'),
(487, '2023-06-12 15:16:17', 'kreiraj_proizvod.php', 'INSERT INTO proizvod(`naziv`,`opis`,`slika`,`kolicina`,`cijena`,`status_proizvoda`,`bodovi`,`korisnik_id`,`uvijeti_i_cijena_id`,`name`,`description`,`picture`) values(`Vesla?ki ergometar`,`VESLA?KI ERGOMETAR D PM5 CONCEPT 2`,``,`8`,`530`,`1`,`400`,`2`,`1`,`Vesla?ki ergometar`,`VESLA?KI ERGOMETAR D PM5 CONCEPT 2`,``);', 1, 2, 'kreiraj_proizvod.php', 'INSERT INTO proizvod(`naziv`,`opis`,`slika`,`kolicina`,`cijena`,`status_proizvoda`,`bodovi`,`korisnik_id`,`uvijeti_i_cijena_id`,`name`,`description`,`picture`) values(`Vesla?ki ergometar`,`VESLA?KI ERGOMETAR D PM5 CONCEPT 2`,``,`8`,`530`,`1`,`400`,`2`,`1`,`Vesla?ki ergometar`,`VESLA?KI ERGOMETAR D PM5 CONCEPT 2`,``);'),
(488, '2023-06-12 15:24:21', 'kreiraj_proizvod.php', 'INSERT INTO proizvod(`naziv`,`opis`,`slika`,`kolicina`,`cijena`,`status_proizvoda`,`bodovi`,`korisnik_id`,`uvijeti_i_cijena_id`,`name`,`description`,`picture`) values(`sup`,`SUP na napuhavanje X100 11` za po?etnike plavi`,``,`9`,`290`,`1`,`140`,`2`,`7`,`sup`,`SUP na napuhavanje X100 11` za po?etnike plavi`,``);', 1, 2, 'kreiraj_proizvod.php', 'INSERT INTO proizvod(`naziv`,`opis`,`slika`,`kolicina`,`cijena`,`status_proizvoda`,`bodovi`,`korisnik_id`,`uvijeti_i_cijena_id`,`name`,`description`,`picture`) values(`sup`,`SUP na napuhavanje X100 11` za po?etnike plavi`,``,`9`,`290`,`1`,`140`,`2`,`7`,`sup`,`SUP na napuhavanje X100 11` za po?etnike plavi`,``);'),
(489, '2023-06-12 15:28:53', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?'),
(490, '2023-06-12 15:28:53', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?'),
(491, '2023-06-12 15:30:51', 'kreiraj_proizvod.php', 'INSERT INTO proizvod(`naziv`,`opis`,`slika`,`kolicina`,`cijena`,`status_proizvoda`,`bodovi`,`korisnik_id`,`uvijeti_i_cijena_id`,`name`,`description`,`picture`) values(`sup`,`SUP na napuhavanje X100 11 za po?etnike plavi`,``,`8`,`290`,`1`,`120`,`2`,`7`,`sup`,`SUP na napuhavanje X100 11 za po?etnike plavi`,``);', 1, 2, 'kreiraj_proizvod.php', 'INSERT INTO proizvod(`naziv`,`opis`,`slika`,`kolicina`,`cijena`,`status_proizvoda`,`bodovi`,`korisnik_id`,`uvijeti_i_cijena_id`,`name`,`description`,`picture`) values(`sup`,`SUP na napuhavanje X100 11 za po?etnike plavi`,``,`8`,`290`,`1`,`120`,`2`,`7`,`sup`,`SUP na napuhavanje X100 11 za po?etnike plavi`,``);'),
(492, '2023-06-12 15:34:42', 'kreiraj_proizvod.php', 'INSERT INTO proizvod(`naziv`,`opis`,`slika`,`kolicina`,`cijena`,`status_proizvoda`,`bodovi`,`korisnik_id`,`uvijeti_i_cijena_id`,`name`,`description`,`picture`) values(`jakna`,`planinarenje`,``,`10`,`200`,`1`,`300`,`2`,`7`,`jakna`,`planinarenje`,``);', 1, 2, 'kreiraj_proizvod.php', 'INSERT INTO proizvod(`naziv`,`opis`,`slika`,`kolicina`,`cijena`,`status_proizvoda`,`bodovi`,`korisnik_id`,`uvijeti_i_cijena_id`,`name`,`description`,`picture`) values(`jakna`,`planinarenje`,``,`10`,`200`,`1`,`300`,`2`,`7`,`jakna`,`planinarenje`,``);'),
(493, '2023-06-12 15:41:29', 'kreiraj_proizvod.php', 'INSERT INTO proizvod(`naziv`,`opis`,`slika`,`kolicina`,`cijena`,`status_proizvoda`,`bodovi`,`korisnik_id`,`uvijeti_i_cijena_id`,`name`,`description`,`picture`) values(`reket za tenis`,`Teniski reket TR100 za odrasle crni`,`multimedija/reket_tenis.jpg`,`15`,`13`,`1`,`5`,`3`,`6`,`reket za tenis`,`Teniski reket TR100 za odrasle crni`,`multimedija/reket_tenis.jpg`);', 1, 2, 'kreiraj_proizvod.php', 'INSERT INTO proizvod(`naziv`,`opis`,`slika`,`kolicina`,`cijena`,`status_proizvoda`,`bodovi`,`korisnik_id`,`uvijeti_i_cijena_id`,`name`,`description`,`picture`) values(`reket za tenis`,`Teniski reket TR100 za odrasle crni`,`multimedija/reket_tenis.jpg`,`15`,`13`,`1`,`5`,`3`,`6`,`reket za tenis`,`Teniski reket TR100 za odrasle crni`,`multimedija/reket_tenis.jpg`);'),
(494, '2023-06-12 15:45:25', 'kreiraj_proizvod.php', 'INSERT INTO proizvod(`naziv`,`opis`,`slika`,`kolicina`,`cijena`,`status_proizvoda`,`bodovi`,`korisnik_id`,`uvijeti_i_cijena_id`,`name`,`description`,`picture`) values(`meta za pikado`,`Elektroni?ka meta za pikado ED110`,`multimedija/pikado_meta.jpg`,`27`,`25`,`1`,`13`,`2`,`5`,`meta za pikado`,`Elektroni?ka meta za pikado ED110`,`multimedija/pikado_meta.jpg`);', 1, 2, 'kreiraj_proizvod.php', 'INSERT INTO proizvod(`naziv`,`opis`,`slika`,`kolicina`,`cijena`,`status_proizvoda`,`bodovi`,`korisnik_id`,`uvijeti_i_cijena_id`,`name`,`description`,`picture`) values(`meta za pikado`,`Elektroni?ka meta za pikado ED110`,`multimedija/pikado_meta.jpg`,`27`,`25`,`1`,`13`,`2`,`5`,`meta za pikado`,`Elektroni?ka meta za pikado ED110`,`multimedija/pikado_meta.jpg`);'),
(495, '2023-06-12 15:48:00', 'kreiraj_proizvod.php', 'INSERT INTO proizvod(`naziv`,`opis`,`slika`,`kolicina`,`cijena`,`status_proizvoda`,`bodovi`,`korisnik_id`,`uvijeti_i_cijena_id`,`name`,`description`,`picture`) values(`stol za biljar`,`Stol za biljar BT 700 US`,`multimedija/stol_biljar.jpg`,`4`,`670`,`1`,`500`,`2`,`1`,`stol za biljar`,`Stol za biljar BT 700 US`,`multimedija/stol_biljar.jpg`);', 1, 2, 'kreiraj_proizvod.php', 'INSERT INTO proizvod(`naziv`,`opis`,`slika`,`kolicina`,`cijena`,`status_proizvoda`,`bodovi`,`korisnik_id`,`uvijeti_i_cijena_id`,`name`,`description`,`picture`) values(`stol za biljar`,`Stol za biljar BT 700 US`,`multimedija/stol_biljar.jpg`,`4`,`670`,`1`,`500`,`2`,`1`,`stol za biljar`,`Stol za biljar BT 700 US`,`multimedija/stol_biljar.jpg`);'),
(496, '2023-06-12 15:53:02', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?'),
(497, '2023-06-12 15:53:02', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?'),
(498, '2023-06-12 15:57:32', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?'),
(499, '2023-06-12 15:57:32', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?'),
(500, '2023-06-12 16:00:45', 'kreiraj_proizvod.php', 'INSERT INTO proizvod(`naziv`,`opis`,`slika`,`kolicina`,`cijena`,`status_proizvoda`,`bodovi`,`korisnik_id`,`uvijeti_i_cijena_id`,`name`,`description`,`picture`) values(`palice za golf`,`SET PALICA ZA GOLF WILSON ULTRA XD ZA DEŠNJAKINJE`,`multimedija/palice_golf.jpg`,`7`,`514`,`1`,`299`,`2`,`1`,`palice za golf`,`SET PALICA ZA GOLF WILSON ULTRA XD ZA DEŠNJAKINJE`,`multimedija/palice_golf.jpg`);', 1, 2, 'kreiraj_proizvod.php', 'INSERT INTO proizvod(`naziv`,`opis`,`slika`,`kolicina`,`cijena`,`status_proizvoda`,`bodovi`,`korisnik_id`,`uvijeti_i_cijena_id`,`name`,`description`,`picture`) values(`palice za golf`,`SET PALICA ZA GOLF WILSON ULTRA XD ZA DEŠNJAKINJE`,`multimedija/palice_golf.jpg`,`7`,`514`,`1`,`299`,`2`,`1`,`palice za golf`,`SET PALICA ZA GOLF WILSON ULTRA XD ZA DEŠNJAKINJE`,`multimedija/palice_golf.jpg`);'),
(501, '2023-06-12 16:08:03', 'kreiraj_proizvod.php', 'INSERT INTO proizvod(`naziv`,`opis`,`slika`,`kolicina`,`cijena`,`status_proizvoda`,`bodovi`,`korisnik_id`,`uvijeti_i_cijena_id`,`name`,`description`,`picture`) values(`povodac za konja`,`ULAR I POVODAC ZA KONJA I PONIJA COMFORT TAMNOBORDO CRVENI-TAMNOPLAVI`,`multimedija/ular_i_povodac.jpg`,`3`,`20`,`1`,`10`,`3`,`6`,`povodac za konja`,`ULAR I POVODAC ZA KONJA I PONIJA COMFORT TAMNOBORDO CRVENI-TAMNOPLAVI`,`multimedija/ular_i_povodac.jpg`);', 1, 2, 'kreiraj_proizvod.php', 'INSERT INTO proizvod(`naziv`,`opis`,`slika`,`kolicina`,`cijena`,`status_proizvoda`,`bodovi`,`korisnik_id`,`uvijeti_i_cijena_id`,`name`,`description`,`picture`) values(`povodac za konja`,`ULAR I POVODAC ZA KONJA I PONIJA COMFORT TAMNOBORDO CRVENI-TAMNOPLAVI`,`multimedija/ular_i_povodac.jpg`,`3`,`20`,`1`,`10`,`3`,`6`,`povodac za konja`,`ULAR I POVODAC ZA KONJA I PONIJA COMFORT TAMNOBORDO CRVENI-TAMNOPLAVI`,`multimedija/ular_i_povodac.jpg`);'),
(502, '2023-06-12 16:11:08', 'kreiraj_proizvod.php', 'INSERT INTO proizvod(`naziv`,`opis`,`slika`,`kolicina`,`cijena`,`status_proizvoda`,`bodovi`,`korisnik_id`,`uvijeti_i_cijena_id`,`name`,`description`,`picture`) values(`lova?ki nož`,`LOVA?KI NOŽ AXIS 85 V2 8,5 CM SKLOPIVI CRNI`,`multimedija/lovacki_noz.jpg`,`15`,`16`,`1`,`5`,`2`,`1`,`lova?ki nož`,`LOVA?KI NOŽ AXIS 85 V2 8,5 CM SKLOPIVI CRNI`,`multimedija/lovacki_noz.jpg`);', 1, 2, 'kreiraj_proizvod.php', 'INSERT INTO proizvod(`naziv`,`opis`,`slika`,`kolicina`,`cijena`,`status_proizvoda`,`bodovi`,`korisnik_id`,`uvijeti_i_cijena_id`,`name`,`description`,`picture`) values(`lova?ki nož`,`LOVA?KI NOŽ AXIS 85 V2 8,5 CM SKLOPIVI CRNI`,`multimedija/lovacki_noz.jpg`,`15`,`16`,`1`,`5`,`2`,`1`,`lova?ki nož`,`LOVA?KI NOŽ AXIS 85 V2 8,5 CM SKLOPIVI CRNI`,`multimedija/lovacki_noz.jpg`);'),
(503, '2023-06-12 16:14:32', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?'),
(504, '2023-06-12 16:14:32', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?'),
(505, '2023-06-12 16:20:54', 'definiraj_uvijete.php', 'INSERT INTO uvijeti_i_cijena(`bodovi`,`cijena`) values(`15`,`200`);', 1, 2, 'definiraj_uvijete.php', 'INSERT INTO uvijeti_i_cijena(`bodovi`,`cijena`) values(`15`,`200`);'),
(506, '2023-06-12 16:20:54', 'definiraj_uvijete.php', 'UPDATE proizvod SET uvijeti_i_cijena_id=`11` WHERE id=`2`', 1, 2, 'definiraj_uvijete.php', 'UPDATE proizvod SET uvijeti_i_cijena_id=`11` WHERE id=`2`'),
(507, '2023-06-12 16:28:00', 'kupi_proizvod.php', 'INSERT INTO kupi_proizvod(`cijena_proizvoda`,`korisnik_id`,`proizvod_id`) values(`15`,`1`,`3`);', 1, 2, 'kupi_proizvod.php', 'INSERT INTO kupi_proizvod(`cijena_proizvoda`,`korisnik_id`,`proizvod_id`) values(`15`,`1`,`3`);'),
(508, '2023-06-12 16:28:00', 'kupi_proizvod.php', 'UPDATE proizvod SET kolicina = kolicina - 1 WHERE id=`3`', 1, 2, 'kupi_proizvod.php', 'UPDATE proizvod SET kolicina = kolicina - 1 WHERE id=`3`'),
(509, '2023-06-12 16:28:00', 'kupi_proizvod.php', 'UPDATE proizvod SET status_proizvoda = 0 WHERE kolicina = 0', 1, 2, 'kupi_proizvod.php', 'UPDATE proizvod SET status_proizvoda = 0 WHERE kolicina = 0'),
(510, '2023-06-12 16:28:00', 'kupi_proizvod.php', 'UPDATE profil SET bodovi = bodovi + `15` WHERE profil.korisnik_id = `1`', 1, 2, 'kupi_proizvod.php', 'UPDATE profil SET bodovi = bodovi + `15` WHERE profil.korisnik_id = `1`'),
(511, '2023-06-12 16:28:20', 'kupi_proizvod.php', 'INSERT INTO kupi_proizvod(`cijena_proizvoda`,`korisnik_id`,`proizvod_id`) values(`15`,`1`,`3`);', 1, 2, 'kupi_proizvod.php', 'INSERT INTO kupi_proizvod(`cijena_proizvoda`,`korisnik_id`,`proizvod_id`) values(`15`,`1`,`3`);'),
(512, '2023-06-12 16:28:20', 'kupi_proizvod.php', 'UPDATE proizvod SET kolicina = kolicina - 1 WHERE id=`3`', 1, 2, 'kupi_proizvod.php', 'UPDATE proizvod SET kolicina = kolicina - 1 WHERE id=`3`'),
(513, '2023-06-12 16:28:20', 'kupi_proizvod.php', 'UPDATE proizvod SET status_proizvoda = 0 WHERE kolicina = 0', 1, 2, 'kupi_proizvod.php', 'UPDATE proizvod SET status_proizvoda = 0 WHERE kolicina = 0'),
(514, '2023-06-12 16:28:20', 'kupi_proizvod.php', 'UPDATE profil SET bodovi = bodovi + `15` WHERE profil.korisnik_id = `1`', 1, 2, 'kupi_proizvod.php', 'UPDATE profil SET bodovi = bodovi + `15` WHERE profil.korisnik_id = `1`'),
(515, '2023-06-12 16:29:08', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?', 2, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?'),
(516, '2023-06-12 16:29:08', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?', 2, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?'),
(517, '2023-06-12 16:29:30', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?', 2, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?'),
(518, '2023-06-12 16:29:30', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?', 2, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?'),
(519, '2023-06-12 16:32:28', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?', 2, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?'),
(520, '2023-06-12 16:32:28', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?', 2, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?'),
(521, '2023-06-12 16:33:09', 'kupi_proizvod.php', 'INSERT INTO kupi_proizvod(`cijena_proizvoda`,`korisnik_id`,`proizvod_id`) values(`49`,`2`,`8`);', 2, 2, 'kupi_proizvod.php', 'INSERT INTO kupi_proizvod(`cijena_proizvoda`,`korisnik_id`,`proizvod_id`) values(`49`,`2`,`8`);'),
(522, '2023-06-12 16:33:09', 'kupi_proizvod.php', 'UPDATE proizvod SET kolicina = kolicina - 1 WHERE id=`8`', 2, 2, 'kupi_proizvod.php', 'UPDATE proizvod SET kolicina = kolicina - 1 WHERE id=`8`'),
(523, '2023-06-12 16:33:09', 'kupi_proizvod.php', 'UPDATE proizvod SET status_proizvoda = 0 WHERE kolicina = 0', 2, 2, 'kupi_proizvod.php', 'UPDATE proizvod SET status_proizvoda = 0 WHERE kolicina = 0'),
(524, '2023-06-12 16:33:09', 'kupi_proizvod.php', 'UPDATE profil SET bodovi = bodovi + `25` WHERE profil.korisnik_id = `2`', 2, 2, 'kupi_proizvod.php', 'UPDATE profil SET bodovi = bodovi + `25` WHERE profil.korisnik_id = `2`'),
(525, '2023-06-12 16:33:13', 'kupi_proizvod.php', 'INSERT INTO kupi_proizvod(`cijena_proizvoda`,`korisnik_id`,`proizvod_id`) values(`49`,`2`,`8`);', 2, 2, 'kupi_proizvod.php', 'INSERT INTO kupi_proizvod(`cijena_proizvoda`,`korisnik_id`,`proizvod_id`) values(`49`,`2`,`8`);'),
(526, '2023-06-12 16:33:13', 'kupi_proizvod.php', 'UPDATE proizvod SET kolicina = kolicina - 1 WHERE id=`8`', 2, 2, 'kupi_proizvod.php', 'UPDATE proizvod SET kolicina = kolicina - 1 WHERE id=`8`'),
(527, '2023-06-12 16:33:13', 'kupi_proizvod.php', 'UPDATE proizvod SET status_proizvoda = 0 WHERE kolicina = 0', 2, 2, 'kupi_proizvod.php', 'UPDATE proizvod SET status_proizvoda = 0 WHERE kolicina = 0'),
(528, '2023-06-12 16:33:13', 'kupi_proizvod.php', 'UPDATE profil SET bodovi = bodovi + `25` WHERE profil.korisnik_id = `2`', 2, 2, 'kupi_proizvod.php', 'UPDATE profil SET bodovi = bodovi + `25` WHERE profil.korisnik_id = `2`'),
(529, '2023-06-12 16:33:54', 'kupi_proizvod.php', 'INSERT INTO kupi_proizvod(`cijena_proizvoda`,`korisnik_id`,`proizvod_id`) values(`369`,`2`,`7`);', 2, 2, 'kupi_proizvod.php', 'INSERT INTO kupi_proizvod(`cijena_proizvoda`,`korisnik_id`,`proizvod_id`) values(`369`,`2`,`7`);'),
(530, '2023-06-12 16:33:54', 'kupi_proizvod.php', 'UPDATE proizvod SET kolicina = kolicina - 1 WHERE id=`7`', 2, 2, 'kupi_proizvod.php', 'UPDATE proizvod SET kolicina = kolicina - 1 WHERE id=`7`'),
(531, '2023-06-12 16:33:54', 'kupi_proizvod.php', 'UPDATE proizvod SET status_proizvoda = 0 WHERE kolicina = 0', 2, 2, 'kupi_proizvod.php', 'UPDATE proizvod SET status_proizvoda = 0 WHERE kolicina = 0'),
(532, '2023-06-12 16:33:54', 'kupi_proizvod.php', 'UPDATE profil SET bodovi = bodovi + `50` WHERE profil.korisnik_id = `2`', 2, 2, 'kupi_proizvod.php', 'UPDATE profil SET bodovi = bodovi + `50` WHERE profil.korisnik_id = `2`'),
(533, '2023-06-12 16:33:59', 'kupi_proizvod.php', 'INSERT INTO kupi_proizvod(`cijena_proizvoda`,`korisnik_id`,`proizvod_id`) values(`369`,`2`,`7`);', 2, 2, 'kupi_proizvod.php', 'INSERT INTO kupi_proizvod(`cijena_proizvoda`,`korisnik_id`,`proizvod_id`) values(`369`,`2`,`7`);'),
(534, '2023-06-12 16:33:59', 'kupi_proizvod.php', 'UPDATE proizvod SET kolicina = kolicina - 1 WHERE id=`7`', 2, 2, 'kupi_proizvod.php', 'UPDATE proizvod SET kolicina = kolicina - 1 WHERE id=`7`'),
(535, '2023-06-12 16:33:59', 'kupi_proizvod.php', 'UPDATE proizvod SET status_proizvoda = 0 WHERE kolicina = 0', 2, 2, 'kupi_proizvod.php', 'UPDATE proizvod SET status_proizvoda = 0 WHERE kolicina = 0'),
(536, '2023-06-12 16:33:59', 'kupi_proizvod.php', 'UPDATE profil SET bodovi = bodovi + `50` WHERE profil.korisnik_id = `2`', 2, 2, 'kupi_proizvod.php', 'UPDATE profil SET bodovi = bodovi + `50` WHERE profil.korisnik_id = `2`'),
(537, '2023-06-12 16:34:56', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?', 4, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?'),
(538, '2023-06-12 16:34:56', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?', 4, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?'),
(539, '2023-06-12 16:35:46', 'kupi_proizvod.php', 'INSERT INTO kupi_proizvod(`bodovi`,`korisnik_id`,`proizvod_id`) values(`39`,`4`,`8`);', 4, 2, 'kupi_proizvod.php', 'INSERT INTO kupi_proizvod(`bodovi`,`korisnik_id`,`proizvod_id`) values(`39`,`4`,`8`);'),
(540, '2023-06-12 16:35:46', 'kupi_proizvod.php', 'UPDATE proizvod SET kolicina = kolicina - 1 WHERE id=`8`', 4, 2, 'kupi_proizvod.php', 'UPDATE proizvod SET kolicina = kolicina - 1 WHERE id=`8`'),
(541, '2023-06-12 16:35:46', 'kupi_proizvod.php', 'UPDATE profil SET bodovi = bodovi - `85` WHERE profil.korisnik_id = `4`', 4, 2, 'kupi_proizvod.php', 'UPDATE profil SET bodovi = bodovi - `85` WHERE profil.korisnik_id = `4`'),
(542, '2023-06-12 16:36:05', 'kupi_proizvod.php', 'INSERT INTO kupi_proizvod(`bodovi`,`korisnik_id`,`proizvod_id`) values(`7`,`4`,`3`);', 4, 2, 'kupi_proizvod.php', 'INSERT INTO kupi_proizvod(`bodovi`,`korisnik_id`,`proizvod_id`) values(`7`,`4`,`3`);'),
(543, '2023-06-12 16:36:05', 'kupi_proizvod.php', 'UPDATE proizvod SET kolicina = kolicina - 1 WHERE id=`3`', 4, 2, 'kupi_proizvod.php', 'UPDATE proizvod SET kolicina = kolicina - 1 WHERE id=`3`'),
(544, '2023-06-12 16:36:05', 'kupi_proizvod.php', 'UPDATE profil SET bodovi = bodovi - `50` WHERE profil.korisnik_id = `4`', 4, 2, 'kupi_proizvod.php', 'UPDATE profil SET bodovi = bodovi - `50` WHERE profil.korisnik_id = `4`'),
(545, '2023-06-12 16:36:52', 'kupi_proizvod.php', 'INSERT INTO kupi_proizvod(`cijena_proizvoda`,`korisnik_id`,`proizvod_id`) values(`49`,`4`,`8`);', 4, 2, 'kupi_proizvod.php', 'INSERT INTO kupi_proizvod(`cijena_proizvoda`,`korisnik_id`,`proizvod_id`) values(`49`,`4`,`8`);'),
(546, '2023-06-12 16:36:52', 'kupi_proizvod.php', 'UPDATE proizvod SET kolicina = kolicina - 1 WHERE id=`8`', 4, 2, 'kupi_proizvod.php', 'UPDATE proizvod SET kolicina = kolicina - 1 WHERE id=`8`'),
(547, '2023-06-12 16:36:52', 'kupi_proizvod.php', 'UPDATE proizvod SET status_proizvoda = 0 WHERE kolicina = 0', 4, 2, 'kupi_proizvod.php', 'UPDATE proizvod SET status_proizvoda = 0 WHERE kolicina = 0'),
(548, '2023-06-12 16:36:52', 'kupi_proizvod.php', 'UPDATE profil SET bodovi = bodovi + `25` WHERE profil.korisnik_id = `4`', 4, 2, 'kupi_proizvod.php', 'UPDATE profil SET bodovi = bodovi + `25` WHERE profil.korisnik_id = `4`'),
(549, '2023-06-12 16:36:55', 'kupi_proizvod.php', 'INSERT INTO kupi_proizvod(`cijena_proizvoda`,`korisnik_id`,`proizvod_id`) values(`49`,`4`,`8`);', 4, 2, 'kupi_proizvod.php', 'INSERT INTO kupi_proizvod(`cijena_proizvoda`,`korisnik_id`,`proizvod_id`) values(`49`,`4`,`8`);'),
(550, '2023-06-12 16:36:55', 'kupi_proizvod.php', 'UPDATE proizvod SET kolicina = kolicina - 1 WHERE id=`8`', 4, 2, 'kupi_proizvod.php', 'UPDATE proizvod SET kolicina = kolicina - 1 WHERE id=`8`'),
(551, '2023-06-12 16:36:55', 'kupi_proizvod.php', 'UPDATE proizvod SET status_proizvoda = 0 WHERE kolicina = 0', 4, 2, 'kupi_proizvod.php', 'UPDATE proizvod SET status_proizvoda = 0 WHERE kolicina = 0'),
(552, '2023-06-12 16:36:55', 'kupi_proizvod.php', 'UPDATE profil SET bodovi = bodovi + `25` WHERE profil.korisnik_id = `4`', 4, 2, 'kupi_proizvod.php', 'UPDATE profil SET bodovi = bodovi + `25` WHERE profil.korisnik_id = `4`'),
(553, '2023-06-12 16:37:33', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?'),
(554, '2023-06-12 16:37:33', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?'),
(555, '2023-06-12 16:39:41', 'konfiguracija_aplikacije.php', 'INSERT INTO `konfiguracija_aplikacije` (`id`, `trajanje_kolacica`, `broj_redaka_za_stanicenje`, `trajanje_sesije`, `broj_neuspjesnih_prijava`, `status_konfiguracije`, `configuration_status`) VALUES (NULL, `21:39`, `3`, `16:42`, `4`, `normalno`, `normal`);', 1, 2, 'konfiguracija_aplikacije.php', 'INSERT INTO `konfiguracija_aplikacije` (`id`, `trajanje_kolacica`, `broj_redaka_za_stanicenje`, `trajanje_sesije`, `broj_neuspjesnih_prijava`, `status_konfiguracije`, `configuration_status`) VALUES (NULL, `21:39`, `3`, `16:42`, `4`, `normalno`, `normal`);'),
(556, '2023-06-12 16:40:17', 'konfiguracija_aplikacije.php', 'INSERT INTO `konfiguracija_aplikacije` (`id`, `trajanje_kolacica`, `broj_redaka_za_stanicenje`, `trajanje_sesije`, `broj_neuspjesnih_prijava`, `status_konfiguracije`, `configuration_status`) VALUES (NULL, `19:46`, `5`, `11:44`, `6`, `normalno`, `normal`);', 1, 2, 'konfiguracija_aplikacije.php', 'INSERT INTO `konfiguracija_aplikacije` (`id`, `trajanje_kolacica`, `broj_redaka_za_stanicenje`, `trajanje_sesije`, `broj_neuspjesnih_prijava`, `status_konfiguracije`, `configuration_status`) VALUES (NULL, `19:46`, `5`, `11:44`, `6`, `normalno`, `normal`);'),
(557, '2023-06-12 16:41:12', 'konfiguracija_aplikacije.php', 'INSERT INTO `konfiguracija_aplikacije` (`id`, `trajanje_kolacica`, `broj_redaka_za_stanicenje`, `trajanje_sesije`, `broj_neuspjesnih_prijava`, `status_konfiguracije`, `configuration_status`) VALUES (NULL, `21:40`, `2`, `19:47`, `7`, `normalno`, `normal`);', 1, 2, 'konfiguracija_aplikacije.php', 'INSERT INTO `konfiguracija_aplikacije` (`id`, `trajanje_kolacica`, `broj_redaka_za_stanicenje`, `trajanje_sesije`, `broj_neuspjesnih_prijava`, `status_konfiguracije`, `configuration_status`) VALUES (NULL, `21:40`, `2`, `19:47`, `7`, `normalno`, `normal`);'),
(558, '2023-06-12 16:49:52', 'kreiraj_kampanju.php', 'INSERT INTO kampanja_has_proizvod(`kampanja_id`,`proizvod_id`) values(`9`,``);', 1, 2, 'kreiraj_kampanju.php', 'INSERT INTO kampanja_has_proizvod(`kampanja_id`,`proizvod_id`) values(`9`,``);'),
(559, '2023-06-12 16:51:11', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?', 2, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?'),
(560, '2023-06-12 16:51:11', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?', 2, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?'),
(561, '2023-06-12 16:54:34', 'kreiraj_kampanju.php', 'INSERT INTO kampanja(`naziv`,`opis`,`datum_vrijeme_pocetka`,`datum_vrijeme_zavrsetka`,`name`,`description`) values(`rasprodaja`,`sva lovacka oprema u pola cijene`,`2023-06-12T16:54`,`2023-08-31T16:54`,`rasprodaja`,`sva lovacka oprema u pola cijene`);', 2, 2, 'kreiraj_kampanju.php', 'INSERT INTO kampanja(`naziv`,`opis`,`datum_vrijeme_pocetka`,`datum_vrijeme_zavrsetka`,`name`,`description`) values(`rasprodaja`,`sva lovacka oprema u pola cijene`,`2023-06-12T16:54`,`2023-08-31T16:54`,`rasprodaja`,`sva lovacka oprema u pola cijene`);'),
(562, '2023-06-12 16:55:48', 'kreiraj_kampanju.php', 'INSERT INTO kampanja(`naziv`,`opis`,`datum_vrijeme_pocetka`,`datum_vrijeme_zavrsetka`,`name`,`description`) values(`novo`,`nova oprema za sportove preciznosti`,`2023-06-01T16:55`,`2023-07-12T16:55`,`novo`,`nova oprema za sportove preciznosti`);', 2, 2, 'kreiraj_kampanju.php', 'INSERT INTO kampanja(`naziv`,`opis`,`datum_vrijeme_pocetka`,`datum_vrijeme_zavrsetka`,`name`,`description`) values(`novo`,`nova oprema za sportove preciznosti`,`2023-06-01T16:55`,`2023-07-12T16:55`,`novo`,`nova oprema za sportove preciznosti`);'),
(563, '2023-06-12 16:56:24', 'kreiraj_kampanju.php', 'INSERT INTO kampanja(`naziv`,`opis`,`datum_vrijeme_pocetka`,`datum_vrijeme_zavrsetka`,`name`,`description`) values(`rasprodaja`,`30% popusta na sup`,`2023-05-24T16:56`,`2023-06-29T16:56`,`rasprodaja`,`30% popusta na sup`);', 2, 2, 'kreiraj_kampanju.php', 'INSERT INTO kampanja(`naziv`,`opis`,`datum_vrijeme_pocetka`,`datum_vrijeme_zavrsetka`,`name`,`description`) values(`rasprodaja`,`30% popusta na sup`,`2023-05-24T16:56`,`2023-06-29T16:56`,`rasprodaja`,`30% popusta na sup`);'),
(564, '2023-06-12 17:22:49', 'kreiraj_kampanju.php', 'INSERT INTO kampanja_has_proizvod(`kampanja_id`,`proizvod_id`) values(`11`,`21`);', 2, 2, 'kreiraj_kampanju.php', 'INSERT INTO kampanja_has_proizvod(`kampanja_id`,`proizvod_id`) values(`11`,`21`);'),
(565, '2023-06-12 17:23:46', 'kreiraj_kampanju.php', 'INSERT INTO kampanja_has_proizvod(`kampanja_id`,`proizvod_id`) values(`17`,`13`);', 2, 2, 'kreiraj_kampanju.php', 'INSERT INTO kampanja_has_proizvod(`kampanja_id`,`proizvod_id`) values(`17`,`13`);'),
(566, '2023-06-12 17:24:31', 'kreiraj_kampanju.php', 'INSERT INTO kampanja_has_proizvod(`kampanja_id`,`proizvod_id`) values(`13`,`14`);', 2, 2, 'kreiraj_kampanju.php', 'INSERT INTO kampanja_has_proizvod(`kampanja_id`,`proizvod_id`) values(`13`,`14`);'),
(567, '2023-06-12 17:24:57', 'kreiraj_kampanju.php', 'INSERT INTO kampanja_has_proizvod(`kampanja_id`,`proizvod_id`) values(`12`,`17`);', 2, 2, 'kreiraj_kampanju.php', 'INSERT INTO kampanja_has_proizvod(`kampanja_id`,`proizvod_id`) values(`12`,`17`);'),
(568, '2023-06-12 17:25:33', 'kreiraj_kampanju.php', 'INSERT INTO kampanja_has_proizvod(`kampanja_id`,`proizvod_id`) values(`15`,`15`);', 2, 2, 'kreiraj_kampanju.php', 'INSERT INTO kampanja_has_proizvod(`kampanja_id`,`proizvod_id`) values(`15`,`15`);'),
(569, '2023-06-12 17:26:01', 'kreiraj_kampanju.php', 'INSERT INTO kampanja_has_proizvod(`kampanja_id`,`proizvod_id`) values(`20`,`18`);', 2, 2, 'kreiraj_kampanju.php', 'INSERT INTO kampanja_has_proizvod(`kampanja_id`,`proizvod_id`) values(`20`,`18`);'),
(570, '2023-06-12 17:26:12', 'kreiraj_kampanju.php', 'INSERT INTO kampanja_has_proizvod(`kampanja_id`,`proizvod_id`) values(`18`,`19`);', 2, 2, 'kreiraj_kampanju.php', 'INSERT INTO kampanja_has_proizvod(`kampanja_id`,`proizvod_id`) values(`18`,`19`);'),
(571, '2023-06-12 17:26:37', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?', 3, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?'),
(572, '2023-06-12 17:26:37', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?', 3, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?'),
(573, '2023-06-12 17:27:51', 'kreiraj_kampanju.php', 'INSERT INTO kampanja_has_proizvod(`kampanja_id`,`proizvod_id`) values(`16`,`12`);', 3, 2, 'kreiraj_kampanju.php', 'INSERT INTO kampanja_has_proizvod(`kampanja_id`,`proizvod_id`) values(`16`,`12`);'),
(574, '2023-06-12 17:28:06', 'kreiraj_kampanju.php', 'INSERT INTO kampanja_has_proizvod(`kampanja_id`,`proizvod_id`) values(`19`,`16`);', 3, 2, 'kreiraj_kampanju.php', 'INSERT INTO kampanja_has_proizvod(`kampanja_id`,`proizvod_id`) values(`19`,`16`);'),
(575, '2023-06-12 17:28:22', 'kreiraj_kampanju.php', 'INSERT INTO kampanja_has_proizvod(`kampanja_id`,`proizvod_id`) values(`14`,`20`);', 3, 2, 'kreiraj_kampanju.php', 'INSERT INTO kampanja_has_proizvod(`kampanja_id`,`proizvod_id`) values(`14`,`20`);'),
(576, '2023-06-12 17:29:11', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?'),
(577, '2023-06-12 17:29:11', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?'),
(578, '2023-06-12 21:13:59', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?'),
(579, '2023-06-12 21:13:59', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?'),
(580, '2023-06-12 21:32:27', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?'),
(581, '2023-06-12 21:32:27', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?'),
(582, '2023-06-12 21:34:53', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?'),
(583, '2023-06-12 21:34:53', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?'),
(584, '2023-06-12 21:37:58', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?'),
(585, '2023-06-12 21:37:58', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?'),
(586, '2023-06-12 21:51:25', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?'),
(587, '2023-06-12 21:51:25', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?'),
(588, '2023-06-12 21:53:40', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?'),
(589, '2023-06-12 21:53:40', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?'),
(590, '2023-06-12 21:58:09', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?'),
(591, '2023-06-12 21:58:09', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?'),
(592, '2023-06-12 22:01:05', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?'),
(593, '2023-06-12 22:01:05', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?'),
(594, '2023-06-12 22:02:02', 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?', 1, 1, 'prijava.php', 'SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?'),
(595, '2023-06-12 22:02:02', 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?', 1, 2, 'prijava.php', 'UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?');

-- --------------------------------------------------------

--
-- Table structure for table `kampanja`
--

CREATE TABLE `kampanja` (
  `id` int(11) NOT NULL,
  `naziv` varchar(45) NOT NULL,
  `opis` varchar(100) CHARACTER SET utf8 NOT NULL,
  `datum_vrijeme_pocetka` datetime NOT NULL,
  `datum_vrijeme_zavrsetka` datetime NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kampanja`
--

INSERT INTO `kampanja` (`id`, `naziv`, `opis`, `datum_vrijeme_pocetka`, `datum_vrijeme_zavrsetka`, `name`, `description`) VALUES
(1, 'novo', 'Nova sportska oprema za skijanje', '2023-01-31 21:35:37', '2023-03-16 11:24:24', 'new', 'New sports gear for skiing'),
(2, 'rasprodaja', '15% popusta na opremu za kampiranje', '2023-05-01 00:00:00', '2023-09-14 00:00:00', 'sale', '15% discount on camping gear'),
(3, 'staro za novo', 'Ako donesete staru sportsku opremu u bilo koju od poslovnica dobivate 30% popusta na sljedecu kupnju', '2023-04-27 08:20:34', '2023-11-01 00:24:25', 'old for new', 'If you bring your old sports gear in one of our stores you get 30% off on your next purchase '),
(4, 'posebna ponuda', 'Za kupnju iznad 30 eura svaki kupac osvaja mjesec dana besplatnog clanstva u teretani', '2023-02-08 00:00:00', '2023-03-28 00:00:00', 'special offer', 'For purchase above 30 euros each customer wins a free one-month gym membership'),
(5, 'novo', 'Nova oprema za boks', '2023-03-08 00:00:00', '2023-03-29 00:00:00', 'new', 'New boxing gear'),
(6, 'rasprodaja', '20% popusta na sve prostirke za jogu', '2023-02-05 00:00:00', '2023-03-11 00:00:00', 'sale', '20% off on all yoga mats'),
(7, 'rabljeno', 'Najpovoljnija ponuda rabljenih bicikla', '2023-03-01 00:00:00', '2023-06-29 00:00:00', 'used', 'The best offer of used bicycles'),
(8, 'ekskluzivna ponuda', 'Boksacka vreca marke OUTSHOCK samo u nasim ducanima', '2023-03-08 10:27:16', '2023-03-29 02:22:18', 'exclusive offer', 'OUTSHOCK brand boxing bag only in our stores'),
(9, 'rasprodaja', 'do 50% popusta na svu planinarsku opremu', '2023-06-10 12:32:34', '2023-09-01 00:00:00', 'sale', 'up to 50% discount on all hiking equipment'),
(10, 'rasprodaja', '30% popusta na svu opremu za penjanje', '2023-06-29 00:00:00', '2023-07-17 00:00:00', 'sale', '30% discount on all climbing equipment'),
(11, 'rasprodaja', 'sva lovacka oprema u pola cijene', '2023-06-12 16:54:00', '2023-08-31 16:54:00', 'rasprodaja', 'sva lovacka oprema u pola cijene'),
(12, 'novo', 'nova oprema za sportove preciznosti', '2023-06-01 16:55:00', '2023-07-12 16:55:00', 'novo', 'nova oprema za sportove preciznosti'),
(13, 'rasprodaja', '30% popusta na sup', '2023-05-24 16:56:00', '2023-06-29 16:56:00', 'rasprodaja', '30% popusta na sup'),
(14, 'novo', 'jahacka oprema', '2023-06-28 00:00:00', '2023-08-31 00:00:00', 'novo', 'jahacka oprema'),
(15, 'staro za novo', 'donesite staru planinarsku opremu i dobivate 50% pospusta na novu', '2023-03-26 00:00:00', '2023-05-01 00:00:00', 'staro za novo', 'donesite staru planinarsku opremu i dobivate 50% pospusta na novu'),
(16, 'rasprodaja', '10% popusta na sve trake za trćanje', '2023-06-01 00:00:00', '2023-06-24 00:00:00', 'rasprodaja', '10% popusta na sve trake za trćanje'),
(17, 'novo', 'Veslaćki ergometar samo u našim dućanima', '2023-06-04 00:00:00', '2023-07-04 00:00:00', 'novo', 'Vesla?ki ergometar samo u našim dućanima'),
(18, 'novo', 'nove palice za golf', '2023-06-30 00:00:00', '2023-07-31 00:00:00', 'novo', 'nove palice za golf'),
(19, 'rasprodaja', '30% popusta na svu opremu za tenis', '2023-06-06 00:00:00', '2023-07-20 00:00:00', 'rasprodaja', '30% popusta na svu opremu za tenis'),
(20, 'novo', 'stol za biljar', '2023-06-01 00:00:00', '2023-07-09 00:00:00', 'novo', 'stol za biljar');

-- --------------------------------------------------------

--
-- Table structure for table `kampanja_has_proizvod`
--

CREATE TABLE `kampanja_has_proizvod` (
  `kampanja_id` int(11) NOT NULL,
  `proizvod_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kampanja_has_proizvod`
--

INSERT INTO `kampanja_has_proizvod` (`kampanja_id`, `proizvod_id`) VALUES
(1, 1),
(2, 2),
(2, 3),
(8, 4),
(5, 5),
(6, 6),
(7, 7),
(9, 8),
(9, 9),
(10, 10),
(16, 12),
(17, 13),
(13, 14),
(15, 15),
(19, 16),
(12, 17),
(20, 18),
(18, 19),
(14, 20),
(11, 21);

-- --------------------------------------------------------

--
-- Table structure for table `konfiguracija_aplikacije`
--

CREATE TABLE `konfiguracija_aplikacije` (
  `id` int(11) NOT NULL,
  `trajanje_kolacica` time NOT NULL,
  `broj_redaka_za_stanicenje` int(11) NOT NULL,
  `trajanje_sesije` time NOT NULL,
  `broj_neuspjesnih_prijava` int(11) NOT NULL,
  `status_konfiguracije` varchar(45) NOT NULL,
  `configuration_status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `konfiguracija_aplikacije`
--

INSERT INTO `konfiguracija_aplikacije` (`id`, `trajanje_kolacica`, `broj_redaka_za_stanicenje`, `trajanje_sesije`, `broj_neuspjesnih_prijava`, `status_konfiguracije`, `configuration_status`) VALUES
(1, '16:25:39', 6, '11:30:26', 1, 'izmjena', 'edit'),
(2, '21:22:30', 7, '10:20:50', 5, 'normalno', 'normal'),
(3, '11:22:30', 5, '01:22:30', 3, 'normalno', 'normal'),
(4, '08:35:31', 8, '14:19:23', 2, 'normalno', 'normal'),
(5, '10:25:27', 7, '06:00:30', 8, 'izmjena', 'edit'),
(6, '10:00:38', 10, '05:20:19', 6, 'izmjena', 'edit'),
(7, '00:23:24', 10, '18:23:26', 2, 'normalno', 'normal'),
(8, '21:26:26', 5, '12:28:24', 5, 'normalno', 'normal'),
(9, '05:23:24', 3, '02:27:27', 5, 'izmjena', 'edit'),
(10, '09:38:36', 9, '11:27:30', 5, 'normalno', 'normal'),
(12, '11:31:00', 5, '12:00:30', 7, 'normalno', 'normal'),
(13, '11:31:00', 5, '12:00:30', 7, 'normalno', 'normal'),
(14, '02:23:00', 7, '00:00:00', 5, 'normalno', 'normal'),
(15, '08:23:00', 7, '00:00:00', 6, 'normalno', 'normal'),
(16, '02:25:00', 7, '10:28:00', 5, 'normalno', 'normal'),
(17, '02:27:00', 8, '10:31:00', 3, 'normalno', 'normal'),
(18, '21:39:00', 3, '16:42:00', 4, 'normalno', 'normal'),
(19, '19:46:00', 5, '11:44:00', 6, 'normalno', 'normal'),
(20, '21:40:00', 2, '19:47:00', 7, 'normalno', 'normal');

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `id` int(11) NOT NULL,
  `korisnicko_ime` varchar(50) NOT NULL,
  `ime_i_prezime` varchar(50) CHARACTER SET utf8 NOT NULL,
  `lozinka` varchar(50) NOT NULL,
  `email` varchar(45) NOT NULL,
  `datum_vrijeme_registracije` datetime NOT NULL,
  `uvijet_koristenja` char(1) DEFAULT NULL,
  `broj_unosa` int(11) NOT NULL,
  `status_racuna` tinyint(4) NOT NULL,
  `aktivacijski_kod` varchar(7) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `tip_id` int(11) NOT NULL,
  `lozinka_sha256` char(64) NOT NULL,
  `sol` char(64) NOT NULL,
  `konfiguracija_aplikacije_id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `name_and_surname` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `terms_of_use` char(1) DEFAULT NULL,
  `password_sha256` char(64) DEFAULT NULL,
  `activation_code` varchar(7) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id`, `korisnicko_ime`, `ime_i_prezime`, `lozinka`, `email`, `datum_vrijeme_registracije`, `uvijet_koristenja`, `broj_unosa`, `status_racuna`, `aktivacijski_kod`, `tip_id`, `lozinka_sha256`, `sol`, `konfiguracija_aplikacije_id`, `username`, `name_and_surname`, `password`, `terms_of_use`, `password_sha256`, `activation_code`) VALUES
(1, 'epizek', 'Elena Pizek', '123456', 'epizek@foi.hr', '2023-03-08 00:00:00', 'P', 0, 1, '1234ABC', 1, '070a83dbca329f0a6a213edb1288ccce4832b2bab0871740eb40ec577eba92e8', 'b397b8593e6c0f43526fe04b8e47b780', 1, 'epizek', 'Elena Pizek', '123456', 'A', '070a83dbca329f0a6a213edb1288ccce4832b2bab0871740eb40ec577eba92e8', '1234ABC'),
(2, 'aantic', 'Ante Antić', '1234', 'aantic@foi.hr', '2023-03-22 10:24:24', 'P', 0, 1, '1234ACB', 2, '06dfdad8f3100d95e0b904cabe61460de0909313f34d183620ff33e139e82695', '533f68d0ce8a9915c000fe88465f7c68', 2, 'aantic', 'Ante Antić', '1234', 'A', '06dfdad8f3100d95e0b904cabe61460de0909313f34d183620ff33e139e82695', '1234ACB'),
(3, 'mmarkic', 'Marko Markić', '2468', 'mmarkic@foi.hr', '2023-03-22 06:47:00', 'P', 0, 1, '1234BAC', 2, '1aa11c5ad0960e79fa8fed87f8c84c7d5fcfea5b093ca4eb88a45e7e52db6880', 'f5b6b3d345c7827d9c26ba65c5c18245', 3, 'mmarkic', 'Marko Markić', '2468', 'A', '1aa11c5ad0960e79fa8fed87f8c84c7d5fcfea5b093ca4eb88a45e7e52db6880', '1234BAC'),
(4, 'iivic', 'Iva Ivić', '9876', 'iivic@foi.hr', '2023-03-13 06:43:00', 'P', 0, 1, '1234BCA', 3, '6cf83b8a136a3f1095b039f2f8e7ba94b4e592afb7adec2c2d3248a75021c89c', '3b4ff7c3ec42b7acfbe1864456330d36', 4, 'iivic', 'Iva Ivić', '9876', 'A', '6cf83b8a136a3f1095b039f2f8e7ba94b4e592afb7adec2c2d3248a75021c89c', '1234BCA'),
(5, 'llukic', 'Luka Lukić', '8877', 'llukic@foi.hr', '2023-03-16 20:11:00', 'P', 0, 1, '1234CAB', 3, '249ab8cb4d30d9218da9223930546f2509732581af49bf5795459dcca673bd9d', '66c2af89178b0dc3ffd41f56e7cd6f86', 5, 'llukic', 'Luka Lukić', '8877', 'A', '249ab8cb4d30d9218da9223930546f2509732581af49bf5795459dcca673bd9d', '1234CAB'),
(6, 'ffranic', 'Franka Franić', '1122', 'ffranic@foi.hr', '2023-03-21 12:20:54', 'P', 7, 1, '1234CBA', 3, 'd390d4d0deac0a1d113b0a039ef6bffedf6b4224c0fe1b87b6c162ca519c1f94', '47621de67b30e40aeb7181ccccb474bc', 6, 'ffranic', 'Franka Franić', '1122', 'A', 'd390d4d0deac0a1d113b0a039ef6bffedf6b4224c0fe1b87b6c162ca519c1f94', '1234CBA'),
(7, 'ggogic', 'Goga Gogić', '2244', 'ggogic@foi.hr', '2023-03-14 18:17:41', 'P', 1, 1, '1234AAB', 3, 'e7f7ae47fcae8e5ef2a46ab5862f775f09045fa7df24e61095593f939c35e86c', '724cf145269c3359e567bc3b689e2442', 7, 'ggogic', 'Goga Gogić', '2244', 'A', 'e7f7ae47fcae8e5ef2a46ab5862f775f09045fa7df24e61095593f939c35e86c', '1234AAB'),
(8, 'bbaric', 'Barica Barić', '7722', 'bbaric@foi.hr', '2023-03-31 19:26:46', 'P', 2, 1, '1234ABA', 3, '1d337abf2ce0b877c17e5a318410c1378f9de58e0364b64cc2c658ee59f872a0', '1a6ba39ed9da7d1c26f9191c4406a238', 8, 'bbaric', 'Barica Barić', '7722', 'A', '1d337abf2ce0b877c17e5a318410c1378f9de58e0364b64cc2c658ee59f872a0', '1234ABA'),
(9, 'kklaric', 'Klara Klarić', '6644', 'kklaric@foi.hr', '2023-03-28 00:00:00', 'P', 4, 0, '1234BAA', 4, '69e0039185866624da5d8776162436b42361aa5f698de833da8dcaf36835d8a1', '7d67293e10ef444c364703df0f6078c4', 9, 'kklaric', 'Klara Klarić', '6644', 'A', '69e0039185866624da5d8776162436b42361aa5f698de833da8dcaf36835d8a1', '1234BAA'),
(10, 'ddragic', 'Dragan Dragić', '5873', 'ddragic@foi.hr', '2023-03-07 13:20:00', 'P', 6, 0, '1234ABB', 4, 'e6b14ebb59f2d7f6806b0e9cc2c4b960cc2cf471c98e857e9a78eb5470a2ddab', '6836c7ed3dffd1957486d6592a137cb4', 10, 'ddragic', 'Dragan Dragić', '5873', 'A', 'e6b14ebb59f2d7f6806b0e9cc2c4b960cc2cf471c98e857e9a78eb5470a2ddab', '1234ABB'),
(11, 'nnedic', 'Neda Nedić', 'EmMl8eNaocybXUJPO2FY', 'nnedic@foi.hr', '2023-03-09 10:00:25', 'P', 2, 1, '1234BAB', 3, '3c84535093cd07e6893165413be40e7689379c03aa3122871d9587b66745852c', 'a4f2078cd1174fcb17d3501519724a6d', 3, 'nnedic', 'Neda Nedić', 'EmMl8eNaocybXUJPO2FY', 'A', '3c84535093cd07e6893165413be40e7689379c03aa3122871d9587b66745852c', '1234BAB'),
(12, 'hhorvat', 'Hrvoje Horvat', 'Sv3AdRJHlnIzErYaWhk8', 'hhorvat@foi.hr', '2023-03-17 18:00:25', 'P', 5, 1, '1234BBA', 3, 'd3efa7c90af4500e64c4e50e4e939c2cff700871109ad93005beb8342fe5f05f', '3b045c963ad9d5a7aa65a5bb50d5b7e4', 6, 'hhorvat', 'Hrvoje Horvat', 'Sv3AdRJHlnIzErYaWhk8', 'A', 'd3efa7c90af4500e64c4e50e4e939c2cff700871109ad93005beb8342fe5f05f', '1234BBA'),
(38, 'bbrankecc', 'Brankec', '123456789ElenaPP', 'epizek@foi.hr', '2023-06-08 17:36:45', 'P', 0, 1, '8FNO4W2', 3, '15e42c1283449fe7c1afdea4097f83ec40f9a1dd392334545df900ec83885669', 'd03ef13095d04db24595a3b6cc65f39b', 2, 'bbrankecc', 'Brankec', '123456789ElenaPP', 'A', '15e42c1283449fe7c1afdea4097f83ec40f9a1dd392334545df900ec83885669', '8FNO4W2'),
(40, 'kkarlic', 'Karlo Karlic', 'elena17eelena17E', 'epizek@foi.hr', '2023-06-11 17:59:38', 'P', 0, 0, '02CJMOD', 3, '4d0aa06a6515a4886e07ffb4b7e962fa9e91786ad2640cc278c927d6328d04d4', 'b48dd6139b062ff75987b52d5923a4db', 2, 'kkarlic', 'Karlo Karlic', 'elena17eelena17E', 'A', '4d0aa06a6515a4886e07ffb4b7e962fa9e91786ad2640cc278c927d6328d04d4', '02CJMOD'),
(41, 'ellll', 'Probno Vrijeme', '123456789elenaPP', 'epizek@foi.hr', '2023-06-11 20:04:12', 'P', 0, 1, 'GZ2XBSD', 3, 'f1fc0fd609fc2f956f967fad14141558a7be282ded0bd6cb2361cffcf4d7de25', '8ca529660c31f98b45a92bf5596217eb', 2, 'ellll', 'Probno Vrijeme', '123456789elenaPP', 'A', 'f1fc0fd609fc2f956f967fad14141558a7be282ded0bd6cb2361cffcf4d7de25', 'GZ2XBSD');

-- --------------------------------------------------------

--
-- Table structure for table `kupi_proizvod`
--

CREATE TABLE `kupi_proizvod` (
  `id` int(11) NOT NULL,
  `cijena_proizvoda` int(11) DEFAULT NULL,
  `bodovi` int(11) DEFAULT NULL,
  `korisnik_id` int(11) NOT NULL,
  `proizvod_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kupi_proizvod`
--

INSERT INTO `kupi_proizvod` (`id`, `cijena_proizvoda`, `bodovi`, `korisnik_id`, `proizvod_id`) VALUES
(1, 515, NULL, 2, 1),
(2, NULL, 50, 3, 3),
(3, NULL, 100, 4, 4),
(4, 10, NULL, 5, 6),
(5, 369, NULL, 6, 7),
(6, NULL, 85, 7, 8),
(7, 25, NULL, 8, 10),
(8, 15, NULL, 11, 3),
(9, 25, NULL, 12, 10),
(10, NULL, 40, 1, 6),
(11, 15, NULL, 1, 3),
(12, 15, NULL, 1, 3),
(13, 49, NULL, 2, 8),
(14, 49, NULL, 2, 8),
(15, 369, NULL, 2, 7),
(16, 369, NULL, 2, 7),
(17, NULL, 39, 4, 8),
(18, NULL, 7, 4, 3),
(19, 49, NULL, 4, 8),
(20, 49, NULL, 4, 8);

-- --------------------------------------------------------

--
-- Table structure for table `profil`
--

CREATE TABLE `profil` (
  `id` int(11) NOT NULL,
  `slika` varchar(45) NOT NULL,
  `nadimak` varchar(45) NOT NULL,
  `bodovi` int(11) NOT NULL,
  `korisnik_id` int(11) NOT NULL,
  `picture` varchar(45) DEFAULT NULL,
  `nickname` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profil`
--

INSERT INTO `profil` (`id`, `slika`, `nadimak`, `bodovi`, `korisnik_id`, `picture`, `nickname`) VALUES
(1, 'multimedija/osobna.jpg', 'Leni', 230, 1, 'multimedija/osobna.jpg', 'Leni'),
(2, 'multimedija/ankica.jpg', 'Ankica', 340, 2, 'multimedija/ankica.jpg', 'Ankica'),
(3, 'multimedija/markec.jpg', 'Markec', 172, 3, 'multimedija/markec.jpg', 'Markec'),
(4, 'multimedija/ivek.jpeg', 'Ivek', 35, 4, 'multimedija/ivek.jpeg', 'Ivek'),
(5, 'multimedija/luce.jpg', 'Luce', 99, 5, 'multimedija/luce.jpg', 'Luce'),
(6, 'multimedija/franjo.jpg', 'Franjo', 160, 6, 'multimedija/franjo.jpg', 'Franjo'),
(7, 'multimedija/goga.jpeg', 'Goga', 90, 7, 'multimedija/goga.jpeg', 'Goga'),
(8, 'multimedija/barica.jpg', 'Barica', 159, 8, 'multimedija/barica.jpg', 'Barica'),
(9, 'multimedija/ned.jpeg', 'Ned', 144, 11, 'multimedija/ned.jpeg', 'Ned'),
(10, 'multimedija/hrva.jpg', 'Hrva', 112, 12, 'multimedija/hrva.jpg', 'Hrva');

-- --------------------------------------------------------

--
-- Table structure for table `proizvod`
--

CREATE TABLE `proizvod` (
  `id` int(11) NOT NULL,
  `naziv` varchar(45) CHARACTER SET utf8 NOT NULL,
  `opis` varchar(100) CHARACTER SET utf8 NOT NULL,
  `slika` varchar(45) NOT NULL,
  `kolicina` int(11) NOT NULL,
  `cijena` int(11) NOT NULL,
  `status_proizvoda` tinyint(4) NOT NULL,
  `bodovi` int(11) NOT NULL,
  `korisnik_id` int(11) NOT NULL,
  `uvijeti_i_cijena_id` int(11) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `picture` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `proizvod`
--

INSERT INTO `proizvod` (`id`, `naziv`, `opis`, `slika`, `kolicina`, `cijena`, `status_proizvoda`, `bodovi`, `korisnik_id`, `uvijeti_i_cijena_id`, `name`, `description`, `picture`) VALUES
(1, 'skije', 'skije s vezovima mu', 'multimedija/skije.jpg', 15, 515, 1, 300, 2, 1, 'skis', 'ROSSIGNOL men\'s binding ski', 'multimedija/skije.png'),
(2, 'šator', 'Šator za kampiranje MH100 za 2 osobe', 'multimedija/sator.jpeg', 0, 31, 0, 21, 2, 11, 'tent', 'camping tent MH100 for 2 people', 'multimedija/sator.jpeg'),
(3, 'vreca za spavanje', 'vreca za spavanje Arpenaz 20', 'multimedija/vreca.jpg', 14, 15, 1, 7, 2, 3, 'sleeping bag', 'sleeping bag Arpenaz 20', 'multimedija/vreca.jpg'),
(4, 'boksacka vreca', 'boksacka vreca na napumpavanje 100 samonosiva', 'multimedija/vreca_boks.jpg', 5, 77, 1, 67, 2, 4, 'punching bag', 'inflatable punching bag 100 self-supporting', 'multimedija/vreca_boks.jpg'),
(5, 'boksacke rukavice', 'boksacke rukavice 120 za treniranje', 'multimedija/rukavice_boks.jpeg', 0, 22, 0, 12, 2, 5, 'boxing gloves', 'boxing gloves 120 for training', 'multimedija/rukavice_boks.jpeg'),
(6, 'prostirka za jogu', 'prostirka za laganu jogu Essential 185 cm tamnozelena', 'multimedija/prostirka.jpg', 12, 10, 1, 1, 3, 6, 'yoga mat', 'essential light yoga mat 185 cm dark green', 'multimedija/prostirka.jpg'),
(7, 'brdski bicikl', 'brdski bicikl ST 120 27,5" crno-plavi', 'multimedija/bicikl.jpg', 1, 369, 1, 169, 3, 7, 'mountain bike', 'mountain bike ST 120 27.5" black and blue', 'multimedija/bicikl.jpg'),
(8, 'cipele za planinarenje', 'cipele za planinarenje MH500 MID vodootporne mu', 'multimedija/cipele.jpg', 0, 49, 0, 39, 3, 8, 'hiking shoes', 'hiking shoes MH500 MID waterproof men\'s gray', 'multimedija/cipele.jpg'),
(9, 'ruksak za planinarenje', 'ruksak za planinarenje MH500 30 l plavi', 'multimedija/ruksak.png', 0, 61, 0, 51, 3, 9, 'backpack for hiking ', 'backpack for hiking MH500 30 l blue', 'multimedija/ruksak.png'),
(10, 'rukavice za penjanje', 'rukavice za penjanje Via Ferrata za odrasle', 'multimedija/rukavice.jpeg', 8, 25, 1, 15, 3, 10, 'climbing gloves', 'Via Ferrata climbing gloves for adults', 'multimedija/rukavice.jpeg'),
(12, 'traka za trćanje', 'TRAKA ZA TRĆANJE T540C - 16 KM/H, 45?125 CM', 'multimedija/traka.jpeg', 5, 500, 1, 290, 3, 1, 'traka za trćanje', 'TRAKA ZA TRĆANJE T540C - 16 KM/H, 45?125 CM', 'multimedija/traka.jpeg'),
(13, 'Veslački ergometar', 'VESLAČKI ERGOMETAR D PM5 CONCEPT 2', 'multimedija/veslanje.jpg', 8, 530, 1, 400, 2, 1, 'Veslački ergometar', 'VESLAČKI ERGOMETAR D PM5 CONCEPT 2', 'multimedija/veslanje.jpg'),
(14, 'sup', 'SUP na napuhavanje X100 11 za početnike plavi', 'multimedija/sup.jpeg', 8, 290, 1, 120, 2, 7, 'sup', 'SUP na napuhavanje X100 11 za početnike plavi', ''),
(15, 'jakna', 'Jakna za planinarenje Raincut 1/2 Zip vjetrootporna vodoodbojna ženska plava', 'multimedija/jakna_planinarenje.jpeg', 10, 200, 1, 300, 2, 7, 'jakna', 'Jakna za planinarenje Raincut 1/2 Zip vjetrootporna vodoodbojna ženska plava', 'multimedija/jakna_planinarenje.jpeg'),
(16, 'reket za tenis', 'Teniski reket TR100 za odrasle crni', 'multimedija/reket_tenis.jpg', 15, 13, 1, 5, 3, 6, 'reket za tenis', 'Teniski reket TR100 za odrasle crni', 'multimedija/reket_tenis.jpg'),
(17, 'meta za pikado', 'Elektronička meta za pikado ED110', 'multimedija/pikado_meta.jpg', 27, 25, 1, 13, 2, 5, 'meta za pikado', 'Elektronička meta za pikado ED110', 'multimedija/pikado_meta.jpg'),
(18, 'stol za biljar', 'Stol za biljar BT 700 US', 'multimedija/stol_biljar.jpg', 4, 670, 1, 500, 2, 1, 'stol za biljar', 'Stol za biljar BT 700 US', 'multimedija/stol_biljar.jpg'),
(19, 'palice za golf', 'SET PALICA ZA GOLF WILSON ULTRA XD ZA DEŠNJAKINJE', 'multimedija/palice_golf.jpg', 7, 514, 1, 299, 2, 1, 'palice za golf', 'SET PALICA ZA GOLF WILSON ULTRA XD ZA DEŠNJAKINJE', 'multimedija/palice_golf.jpg'),
(20, 'povodac za konja', 'ULAR I POVODAC ZA KONJA I PONIJA COMFORT TAMNOBORDO CRVENI-TAMNOPLAVI', 'multimedija/ular_i_povodac.jpg', 3, 20, 1, 10, 3, 6, 'povodac za konja', 'ULAR I POVODAC ZA KONJA I PONIJA COMFORT TAMNOBORDO CRVENI-TAMNOPLAVI', 'multimedija/ular_i_povodac.jpg'),
(21, 'lovački nož', 'LOVAČKI NOŽ AXIS 85 V2 8,5 CM SKLOPIVI CRNI', 'multimedija/lovacki_noz.jpg', 15, 16, 1, 5, 2, 1, 'lovački nož', 'LOVAČKI NOŽ AXIS 85 V2 8,5 CM SKLOPIVI CRNI', 'multimedija/lovacki_noz.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tip_korisnika`
--

CREATE TABLE `tip_korisnika` (
  `id` int(11) NOT NULL,
  `naziv` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tip_korisnika`
--

INSERT INTO `tip_korisnika` (`id`, `naziv`, `name`) VALUES
(1, 'Administrator', 'Admin'),
(2, 'Moderator', 'Moderator'),
(3, 'Registrirani_korisnik', 'Registered_user'),
(4, 'Neregistrirani korisnik', 'Unregistered_user');

-- --------------------------------------------------------

--
-- Table structure for table `tip_radnje`
--

CREATE TABLE `tip_radnje` (
  `id` int(11) NOT NULL,
  `naziv` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tip_radnje`
--

INSERT INTO `tip_radnje` (`id`, `naziv`, `name`) VALUES
(1, 'prijava/odjava', 'sign in/sign out'),
(2, 'rad s bazom', 'work with database'),
(3, 'ostale radnje', 'other work'),
(4, 'registracija', 'registration');

-- --------------------------------------------------------

--
-- Table structure for table `uvijeti_i_cijena`
--

CREATE TABLE `uvijeti_i_cijena` (
  `id` int(11) NOT NULL,
  `bodovi` int(11) NOT NULL,
  `cijena` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uvijeti_i_cijena`
--

INSERT INTO `uvijeti_i_cijena` (`id`, `bodovi`, `cijena`) VALUES
(1, 80, 180),
(2, 20, 70),
(3, 15, 50),
(4, 30, 100),
(5, 17, 60),
(6, 13, 40),
(7, 50, 150),
(8, 25, 85),
(9, 27, 90),
(10, 18, 65),
(11, 15, 200),
(12, 20, 80),
(13, 80, 300),
(14, 70, 250),
(15, 100, 200),
(16, 17, 117),
(17, 25, 125),
(18, 55, 155),
(19, 140, 240),
(20, 250, 350),
(21, 189, 289);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dnevnik`
--
ALTER TABLE `dnevnik`
  ADD PRIMARY KEY (`id`,`korisnik_id`,`tip_id`),
  ADD KEY `fk_dnevnik_korisnik1_idx` (`korisnik_id`),
  ADD KEY `fk_dnevnik_tip1_idx` (`tip_id`);

--
-- Indexes for table `kampanja`
--
ALTER TABLE `kampanja`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kampanja_has_proizvod`
--
ALTER TABLE `kampanja_has_proizvod`
  ADD PRIMARY KEY (`kampanja_id`,`proizvod_id`),
  ADD KEY `fk_kampanja_has_proizvod_proizvod1_idx` (`proizvod_id`),
  ADD KEY `fk_kampanja_has_proizvod_kampanja1_idx` (`kampanja_id`);

--
-- Indexes for table `konfiguracija_aplikacije`
--
ALTER TABLE `konfiguracija_aplikacije`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_korisnik_tip_idx` (`tip_id`),
  ADD KEY `fk_korisnik_konfiguracija_aplikacije1_idx` (`konfiguracija_aplikacije_id`);

--
-- Indexes for table `kupi_proizvod`
--
ALTER TABLE `kupi_proizvod`
  ADD PRIMARY KEY (`id`,`korisnik_id`,`proizvod_id`),
  ADD KEY `fk_kupi_proizvod_korisnik1_idx` (`korisnik_id`),
  ADD KEY `fk_kupi_proizvod_proizvod1_idx` (`proizvod_id`);

--
-- Indexes for table `profil`
--
ALTER TABLE `profil`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_profil_korisnik1_idx` (`korisnik_id`);

--
-- Indexes for table `proizvod`
--
ALTER TABLE `proizvod`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_proizvod_korisnik1_idx` (`korisnik_id`),
  ADD KEY `fk_proizvod_uvijeti_i_cijena1_idx` (`uvijeti_i_cijena_id`);

--
-- Indexes for table `tip_korisnika`
--
ALTER TABLE `tip_korisnika`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tip_radnje`
--
ALTER TABLE `tip_radnje`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uvijeti_i_cijena`
--
ALTER TABLE `uvijeti_i_cijena`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dnevnik`
--
ALTER TABLE `dnevnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=596;
--
-- AUTO_INCREMENT for table `kampanja`
--
ALTER TABLE `kampanja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `konfiguracija_aplikacije`
--
ALTER TABLE `konfiguracija_aplikacije`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `kupi_proizvod`
--
ALTER TABLE `kupi_proizvod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `profil`
--
ALTER TABLE `profil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `proizvod`
--
ALTER TABLE `proizvod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `tip_korisnika`
--
ALTER TABLE `tip_korisnika`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tip_radnje`
--
ALTER TABLE `tip_radnje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `uvijeti_i_cijena`
--
ALTER TABLE `uvijeti_i_cijena`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `dnevnik`
--
ALTER TABLE `dnevnik`
  ADD CONSTRAINT `fk_dnevnik_korisnik1` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnik` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_dnevnik_tip1` FOREIGN KEY (`tip_id`) REFERENCES `tip_radnje` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `kampanja_has_proizvod`
--
ALTER TABLE `kampanja_has_proizvod`
  ADD CONSTRAINT `fk_kampanja_has_proizvod_kampanja1` FOREIGN KEY (`kampanja_id`) REFERENCES `kampanja` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_kampanja_has_proizvod_proizvod1` FOREIGN KEY (`proizvod_id`) REFERENCES `proizvod` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD CONSTRAINT `fk_korisnik_konfiguracija_aplikacije1` FOREIGN KEY (`konfiguracija_aplikacije_id`) REFERENCES `konfiguracija_aplikacije` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_korisnik_tip` FOREIGN KEY (`tip_id`) REFERENCES `tip_korisnika` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `kupi_proizvod`
--
ALTER TABLE `kupi_proizvod`
  ADD CONSTRAINT `fk_kupi_proizvod_korisnik1` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnik` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_kupi_proizvod_proizvod1` FOREIGN KEY (`proizvod_id`) REFERENCES `proizvod` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `profil`
--
ALTER TABLE `profil`
  ADD CONSTRAINT `fk_profil_korisnik1` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnik` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `proizvod`
--
ALTER TABLE `proizvod`
  ADD CONSTRAINT `fk_proizvod_korisnik1` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnik` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proizvod_uvijeti_i_cijena1` FOREIGN KEY (`uvijeti_i_cijena_id`) REFERENCES `uvijeti_i_cijena` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
