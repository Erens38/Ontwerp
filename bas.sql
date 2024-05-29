-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 29 mei 2024 om 12:01
-- Serverversie: 10.4.32-MariaDB
-- PHP-versie: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bas`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `artikelen`
--

CREATE TABLE `artikelen` (
  `ArtikelID` int(11) NOT NULL,
  `Naam` varchar(100) DEFAULT NULL,
  `Prijs` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `artikelen`
--

INSERT INTO `artikelen` (`ArtikelID`, `Naam`, `Prijs`) VALUES
(1, 'Laptop', 999.99),
(2, 'Muis', 25.50),
(3, 'Toetsenbord', 45.00);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `klanten`
--

CREATE TABLE `klanten` (
  `KlantID` int(11) NOT NULL,
  `Voornaam` varchar(50) DEFAULT NULL,
  `Achternaam` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `klanten`
--

INSERT INTO `klanten` (`KlantID`, `Voornaam`, `Achternaam`, `Email`) VALUES
(1, 'Jan', 'Jansen', 'jan.jansen@example.com'),
(2, 'Piet', 'Pietersen', 'piet.pietersen@example.com'),
(3, 'Klaas', 'Klaassen', 'klaas.klaassen@example.com');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `verkooporderdetails`
--

CREATE TABLE `verkooporderdetails` (
  `OrderDetailID` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `ArtikelID` int(11) DEFAULT NULL,
  `Aantal` int(11) DEFAULT NULL,
  `Prijs` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `verkooporderdetails`
--

INSERT INTO `verkooporderdetails` (`OrderDetailID`, `OrderID`, `ArtikelID`, `Aantal`, `Prijs`) VALUES
(1, 1, 1, 1, 999.99),
(2, 1, 2, 2, 25.50),
(3, 2, 1, 1, 999.99),
(4, 3, 3, 1, 45.00);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `verkooporders`
--

CREATE TABLE `verkooporders` (
  `OrderID` int(11) NOT NULL,
  `KlantID` int(11) DEFAULT NULL,
  `OrderDatum` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `verkooporders`
--

INSERT INTO `verkooporders` (`OrderID`, `KlantID`, `OrderDatum`) VALUES
(1, 1, '2024-05-01'),
(2, 2, '2024-05-02'),
(3, 3, '2024-05-03');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `artikelen`
--
ALTER TABLE `artikelen`
  ADD PRIMARY KEY (`ArtikelID`);

--
-- Indexen voor tabel `klanten`
--
ALTER TABLE `klanten`
  ADD PRIMARY KEY (`KlantID`);

--
-- Indexen voor tabel `verkooporderdetails`
--
ALTER TABLE `verkooporderdetails`
  ADD PRIMARY KEY (`OrderDetailID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `ArtikelID` (`ArtikelID`);

--
-- Indexen voor tabel `verkooporders`
--
ALTER TABLE `verkooporders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `KlantID` (`KlantID`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `artikelen`
--
ALTER TABLE `artikelen`
  MODIFY `ArtikelID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `klanten`
--
ALTER TABLE `klanten`
  MODIFY `KlantID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `verkooporderdetails`
--
ALTER TABLE `verkooporderdetails`
  MODIFY `OrderDetailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `verkooporders`
--
ALTER TABLE `verkooporders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `verkooporderdetails`
--
ALTER TABLE `verkooporderdetails`
  ADD CONSTRAINT `verkooporderdetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `verkooporders` (`OrderID`),
  ADD CONSTRAINT `verkooporderdetails_ibfk_2` FOREIGN KEY (`ArtikelID`) REFERENCES `artikelen` (`ArtikelID`);

--
-- Beperkingen voor tabel `verkooporders`
--
ALTER TABLE `verkooporders`
  ADD CONSTRAINT `verkooporders_ibfk_1` FOREIGN KEY (`KlantID`) REFERENCES `klanten` (`KlantID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
