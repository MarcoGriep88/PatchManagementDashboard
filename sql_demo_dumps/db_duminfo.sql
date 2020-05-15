-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 08. Mai 2020 um 11:33
-- Server-Version: 10.1.8-MariaDB
-- PHP-Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `db_duminfo`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `duminfos`
--

CREATE TABLE `duminfos` (
  `id` int(10) UNSIGNED NOT NULL,
  `Hostname` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Driver` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `UpgradeVersion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `duminfos`
--

INSERT INTO `duminfos` (`id`, `Hostname`, `Driver`, `UpgradeVersion`, `created_at`, `updated_at`) VALUES
(1, 'WBIT0044', 'Intel(R) Rapid Storage Technology', '15.9.3.1026-A', '2020-05-07 12:52:18', '2020-05-07 12:52:18'),
(2, 'WBIT0044', 'Intel(R) Wireless LAN WiFi Driver', '20.70.12.5', '2020-05-07 12:52:18', '2020-05-07 12:52:18'),
(3, 'WBIT0044', 'Intel(R) Display Driver 64bit Edition', '26.20.100.7263', '2020-05-07 12:52:19', '2020-05-07 12:52:19'),
(4, 'WBIT0044', 'Fujitsu System Extension Utility', '4.0.2.5', '2020-05-07 12:52:19', '2020-05-07 12:52:19'),
(5, 'WBIT0044', 'Pointing Device Utility Assistant Module', '4.0.0.0', '2020-05-07 12:52:19', '2020-05-07 12:52:19'),
(6, 'WBIT0044', 'ELAN Pointing Device Filter Driver (64bit Edition)', '27.12.1.1', '2020-05-07 12:52:19', '2020-05-07 12:52:19'),
(7, 'WBIT0044', 'Intel(R) I217/I218/l219 Network Connection', '12.17.8.9', '2020-05-07 12:52:20', '2020-05-07 12:52:20'),
(8, 'WBIT0044', 'FUJ02E3 Device Driver', '4.0.2.5', '2020-05-07 12:52:20', '2020-05-07 12:52:20'),
(9, 'WBIT0044', 'Fujitsu FUJ0420', '2.0.0.0', '2020-05-07 12:52:20', '2020-05-07 12:52:20'),
(10, 'WBIT0044', 'Intel(R) Active Management Technology Driver', '11.7.0.1067', '2020-05-07 12:52:20', '2020-05-07 12:52:20'),
(11, 'WBIT0044', 'Intel(R) Bluetooth Driver', '21.40.0.1', '2020-05-07 12:52:20', '2020-05-07 12:52:20'),
(12, 'WBIT0044', 'Intel(R) Chipset Device Software', '10.1.1.45', '2020-05-07 12:52:21', '2020-05-07 12:52:21'),
(13, 'WBIT0044', 'Intel(R) Serial IO Driver', '30.100.1823.1', '2020-05-07 12:52:21', '2020-05-07 12:52:21'),
(14, 'WBIT0044', 'BayHub OZ621/OZ777 Memory Card Driver', '3.4.00.116', '2020-05-07 12:52:21', '2020-05-07 12:52:21');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2020_05_07_124151_d_u_m_info', 1);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `duminfos`
--
ALTER TABLE `duminfos`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `duminfos`
--
ALTER TABLE `duminfos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT für Tabelle `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
