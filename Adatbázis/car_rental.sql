-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Már 10. 13:23
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `car_rental`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `car_id` int(11) DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `status` enum('pending','confirmed','cancelled','completed') DEFAULT 'pending',
  `total_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `car_id`, `date_from`, `date_to`, `status`, `total_price`) VALUES
(1, 1, 1, '2025-05-01', '2025-05-05', 'confirmed', 240.00),
(2, 2, 3, '2025-06-10', '2025-06-15', 'pending', 120.00),
(3, 3, 5, '2025-07-01', '2025-07-03', 'completed', 360.00);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `model` varchar(100) DEFAULT NULL,
  `price_per_day` int(11) DEFAULT NULL,
  `available` tinyint(1) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `brand_name` varchar(50) DEFAULT NULL,
  `category_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `cars`
--

INSERT INTO `cars` (`id`, `model`, `price_per_day`, `available`, `location_id`, `brand_name`, `category_name`) VALUES
(1, 'X5', 25000, 1, 1, 'BMW', 'SUV'),
(2, '320i', 18000, 1, 2, 'BMW', 'Sedan'),
(3, 'A4', 19000, 1, 3, 'Audi', 'Sedan'),
(4, 'TT', 27000, 0, NULL, 'Audi', 'Coupe'),
(5, 'Supra', 30000, 1, NULL, 'Toyota', 'Sport'),
(6, 'GLC', 28000, 1, NULL, 'Mercedes', 'SUV'),
(7, 'Mustang Mach-E', 32000, 1, NULL, 'Ford', 'Electric');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `locations`
--

INSERT INTO `locations` (`id`, `name`, `address`) VALUES
(1, 'Downtown Branch', '123 Main St'),
(2, 'Airport Branch', 'Airport Terminal 1'),
(3, 'East Side Branch', '45 Riverside Ave');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `maintenance_records`
--

CREATE TABLE `maintenance_records` (
  `id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `cost` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `maintenance_records`
--

INSERT INTO `maintenance_records` (`id`, `car_id`, `description`, `date`, `cost`) VALUES
(1, 1, 'Oil change and filter replacement', '2025-01-10', 80.00),
(2, 2, 'Brake pad replacement', '2025-02-05', 150.00),
(3, 3, 'Tire rotation', '2025-02-20', 40.00);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password_hash`) VALUES
(1, 'Peter Kiss', 'peter.kiss@email.com', '+3612345678', 'hash123'),
(2, 'Anna Kovacs', 'anna.kovacs@email.com', '+3620123456', 'hash456'),
(3, 'David Nagy', 'david.nagy@email.com', NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user_licenses`
--

CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `license_number` varchar(50) NOT NULL,
  `expiration_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `user_licenses`
--

INSERT INTO `user_licenses` (`id`, `user_id`, `license_number`, `expiration_date`) VALUES
(1, 1, 'ABC123456', '2028-05-10'),
(2, 2, 'XYZ987654', '2027-11-22');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `car_id` (`car_id`);

--
-- A tábla indexei `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`location_id`);

--
-- A tábla indexei `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `maintenance_records`
--
ALTER TABLE `maintenance_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `car_id` (`car_id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `user_licenses`
--
ALTER TABLE `user_licenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `maintenance_records`
--
ALTER TABLE `maintenance_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `user_licenses`
--
ALTER TABLE `user_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`);

--
-- Megkötések a táblához `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_3` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`);

--
-- Megkötések a táblához `maintenance_records`
--
ALTER TABLE `maintenance_records`
  ADD CONSTRAINT `maintenance_records_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`);

--
-- Megkötések a táblához `user_licenses`
--
ALTER TABLE `user_licenses`
  ADD CONSTRAINT `user_licenses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
