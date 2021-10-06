-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Värd: 127.0.0.1
-- Tid vid skapande: 23 sep 2021 kl 14:24
-- Serverversion: 10.4.20-MariaDB
-- PHP-version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databas: `webbshop`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `kunder`
--

CREATE TABLE `kunder` (
  `customerid` int(10) UNSIGNED NOT NULL,
  `username` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  `firstname` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `lastname` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `adress` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `postnr` int(5) NOT NULL,
  `city` int(50) NOT NULL,
  `phone` varchar(15) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci COMMENT='fix ';

-- --------------------------------------------------------

--
-- Tabellstruktur `monniye`
--

CREATE TABLE `monniye` (
  `username` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  `emali` varchar(150) COLLATE utf8_swedish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `status` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumpning av Data i tabell `monniye`
--

INSERT INTO `monniye` (`username`, `emali`, `password`, `status`) VALUES
('Mrcool', 'mr.boss@cool.com', 'coolMr123', 0);

-- --------------------------------------------------------

--
-- Tabellstruktur `orders`
--

CREATE TABLE `orders` (
  `orderid` int(10) UNSIGNED NOT NULL,
  `productid` int(5) UNSIGNED NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `customerid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumpning av Data i tabell `orders`
--

INSERT INTO `orders` (`orderid`, `productid`, `amount`, `customerid`) VALUES
(1, 1, 12, 1);

-- --------------------------------------------------------

--
-- Tabellstruktur `products`
--

CREATE TABLE `products` (
  `productId` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `pris` int(20) UNSIGNED NOT NULL,
  `beskrivning` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  `bild` varchar(20) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumpning av Data i tabell `products`
--

INSERT INTO `products` (`productId`, `name`, `pris`, `beskrivning`, `bild`) VALUES
(1, 'Banan', 700, 'världens minst böjda', '');

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `kunder`
--
ALTER TABLE `kunder`
  ADD PRIMARY KEY (`customerid`),
  ADD KEY `username` (`username`),
  ADD KEY `firstname` (`firstname`),
  ADD KEY `lastname` (`lastname`);

--
-- Index för tabell `monniye`
--
ALTER TABLE `monniye`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `emali` (`emali`),
  ADD UNIQUE KEY `korv` (`username`),
  ADD KEY `password` (`password`);

--
-- Index för tabell `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderid`),
  ADD KEY `customerid` (`customerid`),
  ADD KEY `productid` (`productid`);

--
-- Index för tabell `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productId`);

--
-- AUTO_INCREMENT för dumpade tabeller
--

--
-- AUTO_INCREMENT för tabell `orders`
--
ALTER TABLE `orders`
  MODIFY `orderid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT för tabell `products`
--
ALTER TABLE `products`
  MODIFY `productId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restriktioner för dumpade tabeller
--

--
-- Restriktioner för tabell `kunder`
--
ALTER TABLE `kunder`
  ADD CONSTRAINT `kunder_ibfk_1` FOREIGN KEY (`username`) REFERENCES `monniye` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kunder_ibfk_2` FOREIGN KEY (`customerid`) REFERENCES `orders` (`customerid`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Restriktioner för tabell `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `products` (`productId`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
