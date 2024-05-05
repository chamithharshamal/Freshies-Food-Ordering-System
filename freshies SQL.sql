-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2024 at 09:01 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `freshies`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`, `email`) VALUES
(1, 'Chamith', 'password123', 'chamith@gmail.com'),
(2, 'Nithma', 'securepass456', 'nithma@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `meals`
--

CREATE TABLE `meals` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meals`
--

INSERT INTO `meals` (`id`, `name`, `price`, `image`, `category`) VALUES
(1, 'String Hoppers', 150.00, 'images/cart/1.webp', 'Breakfast'),
(2, 'Sri Lankan Rice and Curry', 200.00, 'images/cart/2.webp', 'Breakfast'),
(3, 'Milk Rice', 150.00, 'images/cart/3.webp', 'Breakfast'),
(4, 'American Pancakes', 200.00, 'images/cart/4.webp', 'Breakfast'),
(5, 'Western Breakfast', 550.00, 'images/cart/5.webp', 'Breakfast'),
(6, 'Mutton Samosa', 60.00, 'images/cart/6.webp', 'Breakfast'),
(7, 'Savory Waffles', 420.00, 'images/cart/7.webp', 'Breakfast'),
(8, 'Chicken Burger', 450.00, 'images/cart/8.webp', 'Breakfast'),
(9, 'Vegetable Kottu', 400.00, 'images/cart/9.webp', 'Lunch'),
(10, 'Green Salad', 400.00, 'images/cart/10.webp', 'Lunch'),
(11, 'Chicken Fried Rice', 500.00, 'images/cart/11.webp', 'Lunch'),
(12, 'Seafood Nasigoreng', 680.00, 'images/cart/12.webp', 'Lunch'),
(13, 'Chicken Kottu', 450.00, 'images/cart/13.webp', 'Lunch'),
(14, 'Chicken Rotti', 300.00, 'images/cart/14.webp', 'Lunch'),
(15, 'Vegetable Soup', 320.00, 'images/cart/15.webp', 'Dinner'),
(16, 'Vegetable Fried Rice', 450.00, 'images/cart/16.webp', 'Dinner'),
(17, 'Mixed Fried Rice', 750.00, 'images/cart/17.webp', 'Dinner'),
(18, 'Club Sandwich', 450.00, 'images/cart/18.webp', 'Dinner'),
(19, 'Large Pizza', 2400.00, 'images/cart/19.webp', 'Dinner'),
(20, 'Doughnut', 100.00, 'images/cart/20.webp', 'Snack'),
(21, 'French Fries', 380.00, 'images/cart/21.webp', 'Snack'),
(22, 'Chicken Strips (6)', 380.00, 'images/cart/22.webp', 'Snack'),
(23, 'Chocolate Muffins', 200.00, 'images/cart/23.webp', 'Snack');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  `address` varchar(250) NOT NULL,
  `contact_number` varchar(250) NOT NULL,
  `total_price` varchar(250) NOT NULL,
  `payment_method` varchar(250) NOT NULL,
  `items` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `address`, `contact_number`, `total_price`, `payment_method`, `items`) VALUES
(26, 'Chamith Weerasinghe', 'Rathpaha, Kudagoda, Obadaella, Bandarawela', '0710765468', '740.0', 'Direct Bank Transfer', 'Mutton Samosa, Savory Waffles');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(450) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(100) NOT NULL,
  `image` varchar(450) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'Chamith Weerasingha', 'chweerasinghe619@gmail.com', 'Oppo1234'),
(2, 'Chamith Harshamal', 'chamithharshamal19@gmail.com', 'Ken123'),
(10, 'Denuka Nadeeranga', 'harshamalchamith@gmail.com', 'Apple123#'),
(11, 'Pinsara Kaushal', 'pinsara@gmail.com', 'Iphone123$'),
(13, 'Nimesh Tharusha', 'nimesh@gmail.com', 'Nimesh123$'),
(16, 'Supun Madushanka', 'supunm@gmail.com', 'Lucoms123#');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `meals`
--
ALTER TABLE `meals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `meals`
--
ALTER TABLE `meals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
