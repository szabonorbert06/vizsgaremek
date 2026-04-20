-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Ápr 20. 23:28
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `car_id` bigint(20) UNSIGNED NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `total_price` int(10) UNSIGNED NOT NULL,
  `status` enum('pending','confirmed','cancelled','completed') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `car_id`, `date_from`, `date_to`, `total_price`, `status`) VALUES
(1, 1, 1, '2026-04-21', '2026-04-25', 340000, 'cancelled'),
(2, 1, 2, '2026-04-14', '2026-04-15', 95000, 'completed'),
(3, 1, 1, '2026-04-30', '2026-05-07', 595000, 'pending'),
(8, 3, 1, '2026-04-20', '2026-04-28', 680000, 'cancelled'),
(9, 3, 1, '2026-04-20', '2026-04-23', 255000, 'completed');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cars`
--

CREATE TABLE `cars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_name` varchar(50) DEFAULT NULL,
  `model` varchar(100) NOT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `fuel` varchar(50) DEFAULT NULL,
  `transmission` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price_per_day` int(10) UNSIGNED NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT 1,
  `location_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `cars`
--

INSERT INTO `cars` (`id`, `brand_name`, `model`, `category_name`, `fuel`, `transmission`, `description`, `image`, `price_per_day`, `available`, `location_id`) VALUES
(1, 'BMW', 'M4 Competition', 'Sport', 'Benzin', 'Automata', 'Brutális teljesítmény és luxus találkozása a versenypályák hangulatával.', '/images/car1.jpg', 85000, 1, 1),
(2, 'Audi', 'RS6 Avant', 'Kombi', 'Benzin', 'Automata', 'A tökéletes családi autó, amely bárkit meglep az utakon.', '/images/car2.jpg', 95000, 1, 1),
(3, 'Mercedes', 'G63 AMG', 'SUV', 'Benzin', 'Automata', 'Státuszszimbólum és terepjáró egyben. Megállíthatatlan erő.', '/images/car3.jpg', 120000, 1, 1),
(4, 'Tesla', 'Model S Plaid', 'Sedan', 'Elektromos', 'Automata', 'Páratlan technológia és hihetetlen gyorsulás környezetbarát módon.', '/images/car4.jpg', 75000, 1, 1),
(5, 'Porsche', '911 GT3', 'Sport', 'Benzin', 'Automata', 'Minden idők egyik legprecízebb vezetési élményét nyújtó sportautója.', '/images/car5.jpg', 110000, 1, 1),
(6, 'Range Rover', 'Sport', 'SUV', 'Dízel', 'Automata', 'Angol elegancia, amely minden úton magabiztosságot sugároz.', '/images/car6.jpg', 65000, 1, 1),
(7, 'Ferrari', 'F8 Tributo', 'Supercar', 'Benzin', 'Automata', 'Az olasz mérnöki művészet és a sebesség iránti elkötelezettség csúcsa.', '/images/car7.jpg', 250000, 1, 1),
(8, 'Lamborghini', 'Urus', 'SUV', 'Benzin', 'Automata', 'A világ első szuper-SUV-ja, ami újraírja a fizika törvényeit.', '/images/car8.jpg', 180000, 1, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `locations`
--

INSERT INTO `locations` (`id`, `name`, `address`) VALUES
(1, 'Budapest', 'Budapest, Hungary');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(4, '2026_03_17_133248_create_personal_access_tokens_table', 1),
(5, '2026_04_14_164839_create_locations_table', 1),
(6, '2026_04_14_164841_create_cars_table', 1),
(7, '2026_04_14_164842_create_bookings_table', 1),
(8, '2026_04_14_164843_create_user_licenses_table', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(11, 'App\\Models\\User', 3, 'api-token', '7823228c1392b6bc3ca2b33dd5bd53447ef753d49766b6122820509de078629a', '[\"*\"]', '2026-04-15 10:19:49', NULL, '2026-04-15 09:46:26', '2026-04-15 10:19:49'),
(22, 'App\\Models\\User', 1, 'api-token', '00ae400e339232ac5f91e9579a7c1a38a42f6fc180a676f11885578ee13ce47d', '[\"*\"]', '2026-04-20 16:37:05', NULL, '2026-04-20 16:36:56', '2026-04-20 16:37:05');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password_hash`, `is_admin`, `remember_token`) VALUES
(1, 'Teszt Név', 'testmail@mail.com', '06701231234', '$2y$12$iu4CwdoQNl2ryF68F3E5auDOYSCEpaqzETxpnMoFwifajHcjxSrkm', 0, NULL),
(3, 'Admin', 'admin@admin.com', 'admin', '$2y$12$UtLQBb.L9Vxk.uaqV/hGQODhgJAPwx9JaYHuebXzPRx1i6wI4j27a', 1, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user_licenses`
--

CREATE TABLE `user_licenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `license_number` varchar(50) NOT NULL,
  `expiration_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `user_licenses`
--

INSERT INTO `user_licenses` (`id`, `user_id`, `license_number`, `expiration_date`) VALUES
(1, 1, 'AB12345', '2027-08-19'),
(3, 3, 'admin', '9999-12-30');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`),
  ADD KEY `bookings_car_id_foreign` (`car_id`);

--
-- A tábla indexei `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cars_location_id_foreign` (`location_id`);

--
-- A tábla indexei `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- A tábla indexei `user_licenses`
--
ALTER TABLE `user_licenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_licenses_user_id_foreign` (`user_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT a táblához `cars`
--
ALTER TABLE `cars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT a táblához `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `user_licenses`
--
ALTER TABLE `user_licenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_car_id_foreign` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL;

--
-- Megkötések a táblához `user_licenses`
--
ALTER TABLE `user_licenses`
  ADD CONSTRAINT `user_licenses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
