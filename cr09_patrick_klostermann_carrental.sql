-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 16, 2018 at 04:51 PM
-- Server version: 5.7.22-0ubuntu0.16.04.1
-- PHP Version: 7.1.18-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_patrick_klostermann_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `additional_charges`
--

CREATE TABLE `additional_charges` (
  `add_charge_id` int(11) NOT NULL,
  `fk_re_condition_id` int(11) DEFAULT NULL,
  `charge_sum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `additional_charges`
--

INSERT INTO `additional_charges` (`add_charge_id`, `fk_re_condition_id`, `charge_sum`) VALUES
(1, 1, 2154),
(2, 1, 7895),
(3, 1, 4521),
(4, 1, 3654);

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `street` varchar(70) DEFAULT NULL,
  `street_nr` int(11) DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `city` varchar(70) DEFAULT NULL,
  `country` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `street`, `street_nr`, `zip`, `city`, `country`) VALUES
(1, 'mainstreet', 5, 4512, 'hugecity', 'bigcountry'),
(2, 'secondstreet', 8, 8954, 'blob', 'countdry'),
(3, 'thierdstreet', 4, 3645, 'beachcity', 'beachland'),
(4, 'fourthstreet', 33, 1278, 'hallcity', 'halllands'),
(5, 'fithstreet', 6, 3674, 'wastecity', 'borderlands');

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `brand` enum('Audi','BMW','Opel','Porsche','VW','Seat','Skoda','Renault','Mazda') DEFAULT NULL,
  `class` enum('Compact','Truck','SUV','Van','Premium','Convertible','Hybrid','Electric','Sporty') DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`car_id`, `brand`, `class`, `price`) VALUES
(1, 'Opel', 'Convertible', '250'),
(2, 'Seat', 'Compact', '180'),
(3, 'Mazda', 'Hybrid', '370'),
(4, 'Porsche', 'Premium', '289');

-- --------------------------------------------------------

--
-- Table structure for table `car_location`
--

CREATE TABLE `car_location` (
  `location_id` int(11) NOT NULL,
  `fk_address_id` int(11) DEFAULT NULL,
  `fk_start_location` int(255) DEFAULT NULL,
  `fk_return_location` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car_location`
--

INSERT INTO `car_location` (`location_id`, `fk_address_id`, `fk_start_location`, `fk_return_location`) VALUES
(1, 1, 1, 3),
(2, 2, 3, 1),
(3, 3, 4, 2),
(4, 4, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `fk_address_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `fk_address_id`, `name`) VALUES
(1, 1, 'CarRent01'),
(2, 2, 'CarRent02'),
(3, 3, 'CarRent03'),
(4, 4, 'CarRent04');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `fk_person_id` int(11) DEFAULT NULL,
  `fk_license_id` int(11) DEFAULT NULL,
  `fk_invoice_id` int(11) DEFAULT NULL,
  `fk_reservation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `fk_person_id`, `fk_license_id`, `fk_invoice_id`, `fk_reservation_id`) VALUES
(1, 3, 1, 1, 1),
(2, 4, 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_rent_id` int(11) DEFAULT NULL,
  `fk_add_charge_id` int(11) DEFAULT NULL,
  `inv_date` date DEFAULT NULL,
  `inv_sum` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `fk_customer_id`, `fk_rent_id`, `fk_add_charge_id`, `inv_date`, `inv_sum`) VALUES
(1, 1, 2, 3, '2018-05-12', '3125'),
(2, 2, 1, 4, '2018-12-08', '5484');

-- --------------------------------------------------------

--
-- Table structure for table `license`
--

CREATE TABLE `license` (
  `license_id` int(11) NOT NULL,
  `fk_person_id` int(11) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `car_type` enum('A','B','C','D','E','F') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `license`
--

INSERT INTO `license` (`license_id`, `fk_person_id`, `issue_date`, `car_type`) VALUES
(1, 1, '1989-05-12', 'A'),
(2, 2, '2005-10-04', 'B'),
(3, 3, '1970-04-08', 'C'),
(4, 4, '2004-12-01', 'D'),
(5, 5, '2010-05-13', 'B'),
(6, 6, '2000-01-06', 'A'),
(7, 1, '1989-05-12', 'A'),
(8, 2, '2005-10-04', 'B'),
(9, 3, '1970-04-08', 'C'),
(10, 4, '2004-12-01', 'D'),
(11, 5, '2010-05-13', 'B'),
(12, 6, '2000-01-06', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `parts`
--

CREATE TABLE `parts` (
  `parts_id` int(11) NOT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `auto_body` varchar(255) DEFAULT NULL,
  `tires` enum('flat','pumped','low pressure') DEFAULT NULL,
  `fuel` varchar(255) DEFAULT NULL,
  `km` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parts`
--

INSERT INTO `parts` (`parts_id`, `fk_car_id`, `auto_body`, `tires`, `fuel`, `km`) VALUES
(1, 1, 'scratches', 'flat', '50%', '254135'),
(2, 2, 'no issues', 'pumped', '100%', '889135'),
(3, 3, 'dirty', 'low pressure', '80%', '1548'),
(4, 4, 'no issues', 'pumped', '60%', '985542');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `person_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gender` enum('female','male') DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`person_id`, `first_name`, `last_name`, `gender`, `photo`) VALUES
(1, 'Margit', 'Kampitsch', 'female', 'img/margit.jpg'),
(2, 'Mark', 'Schwarz', 'male', 'img/mark.jpg'),
(3, 'Johannes', 'Brillmann', 'male', 'img/johannes.jpg'),
(4, 'Halei', 'Thunder', 'female', 'img/halei.jpg'),
(5, 'Denis', 'Schuele', 'male', 'img/denis.jpg'),
(6, 'Patrick', 'Klostermann', 'male', 'img/patrick.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `rental`
--

CREATE TABLE `rental` (
  `rent_id` int(11) NOT NULL,
  `fk_re_condition_id` int(11) DEFAULT NULL,
  `fk_start_condition_id` int(11) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fk_location_id` int(11) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rental`
--

INSERT INTO `rental` (`rent_id`, `fk_re_condition_id`, `fk_start_condition_id`, `fk_car_id`, `fk_location_id`, `fk_customer_id`, `from_date`, `to_date`) VALUES
(1, 1, 2, 3, 4, 1, '2018-05-04', '2018-05-04'),
(2, 2, 3, 4, 3, 2, '2018-07-01', '2018-07-02'),
(3, 1, 2, 3, 4, 1, '2018-08-09', '2018-08-12'),
(4, 1, 2, 3, 4, 1, '2017-09-12', '2017-10-05');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `from_date`, `to_date`) VALUES
(1, '2018-05-06', '2018-05-10'),
(2, '2018-12-04', '2018-12-12'),
(3, '2018-05-23', '2018-05-30'),
(4, '2018-08-01', '2018-08-15');

-- --------------------------------------------------------

--
-- Table structure for table `return_condition`
--

CREATE TABLE `return_condition` (
  `return_condition_id` int(11) NOT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fk_parts_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `return_condition`
--

INSERT INTO `return_condition` (`return_condition_id`, `fk_car_id`, `fk_parts_id`) VALUES
(1, 1, 3),
(2, 2, 4),
(3, 3, 1),
(4, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `fk_license_id` int(11) DEFAULT NULL,
  `fk_person_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `fk_license_id`, `fk_person_id`) VALUES
(1, 5, 1),
(2, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `start_condition`
--

CREATE TABLE `start_condition` (
  `start_condition_id` int(11) NOT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fk_parts_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `start_condition`
--

INSERT INTO `start_condition` (`start_condition_id`, `fk_car_id`, `fk_parts_id`) VALUES
(1, 1, 4),
(2, 2, 3),
(3, 3, 2),
(4, 4, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additional_charges`
--
ALTER TABLE `additional_charges`
  ADD PRIMARY KEY (`add_charge_id`),
  ADD KEY `fk_re_condition_id` (`fk_re_condition_id`);

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`);

--
-- Indexes for table `car_location`
--
ALTER TABLE `car_location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `fk_address_id` (`fk_address_id`),
  ADD KEY `fk_return_location` (`fk_return_location`),
  ADD KEY `fk_start_location` (`fk_start_location`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`),
  ADD KEY `fk_address_id` (`fk_address_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_invoice_id` (`fk_invoice_id`),
  ADD KEY `fk_license_id` (`fk_license_id`),
  ADD KEY `fk_person_id` (`fk_person_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_add_charge_id` (`fk_add_charge_id`),
  ADD KEY `fk_rent_id` (`fk_rent_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indexes for table `license`
--
ALTER TABLE `license`
  ADD PRIMARY KEY (`license_id`),
  ADD KEY `fk_person_id` (`fk_person_id`);

--
-- Indexes for table `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`parts_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`person_id`);

--
-- Indexes for table `rental`
--
ALTER TABLE `rental`
  ADD PRIMARY KEY (`rent_id`),
  ADD KEY `fk_location_id` (`fk_location_id`),
  ADD KEY `fk_re_condition_id` (`fk_re_condition_id`),
  ADD KEY `fk_start_condition_id` (`fk_start_condition_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`);

--
-- Indexes for table `return_condition`
--
ALTER TABLE `return_condition`
  ADD PRIMARY KEY (`return_condition_id`),
  ADD KEY `fk_parts_id` (`fk_parts_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `fk_license_id` (`fk_license_id`),
  ADD KEY `fk_person_id` (`fk_person_id`);

--
-- Indexes for table `start_condition`
--
ALTER TABLE `start_condition`
  ADD PRIMARY KEY (`start_condition_id`),
  ADD KEY `fk_parts_id` (`fk_parts_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `additional_charges`
--
ALTER TABLE `additional_charges`
  MODIFY `add_charge_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `car_location`
--
ALTER TABLE `car_location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `license`
--
ALTER TABLE `license`
  MODIFY `license_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `parts`
--
ALTER TABLE `parts`
  MODIFY `parts_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `person_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rental`
--
ALTER TABLE `rental`
  MODIFY `rent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `return_condition`
--
ALTER TABLE `return_condition`
  MODIFY `return_condition_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `start_condition`
--
ALTER TABLE `start_condition`
  MODIFY `start_condition_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `additional_charges`
--
ALTER TABLE `additional_charges`
  ADD CONSTRAINT `additional_charges_ibfk_1` FOREIGN KEY (`fk_re_condition_id`) REFERENCES `return_condition` (`return_condition_id`);

--
-- Constraints for table `car_location`
--
ALTER TABLE `car_location`
  ADD CONSTRAINT `car_location_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `car_location_ibfk_2` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `car_location_ibfk_3` FOREIGN KEY (`fk_return_location`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `car_location_ibfk_4` FOREIGN KEY (`fk_start_location`) REFERENCES `address` (`address_id`);

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_invoice_id`) REFERENCES `invoice` (`invoice_id`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`fk_license_id`) REFERENCES `license` (`license_id`),
  ADD CONSTRAINT `customer_ibfk_3` FOREIGN KEY (`fk_person_id`) REFERENCES `person` (`person_id`),
  ADD CONSTRAINT `customer_ibfk_4` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservation` (`reservation_id`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_add_charge_id`) REFERENCES `additional_charges` (`add_charge_id`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`fk_add_charge_id`) REFERENCES `additional_charges` (`add_charge_id`),
  ADD CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`fk_rent_id`) REFERENCES `rental` (`rent_id`),
  ADD CONSTRAINT `invoice_ibfk_4` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `license`
--
ALTER TABLE `license`
  ADD CONSTRAINT `license_ibfk_1` FOREIGN KEY (`fk_person_id`) REFERENCES `person` (`person_id`);

--
-- Constraints for table `parts`
--
ALTER TABLE `parts`
  ADD CONSTRAINT `parts_ibfk_1` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`);

--
-- Constraints for table `rental`
--
ALTER TABLE `rental`
  ADD CONSTRAINT `rental_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `rental_ibfk_2` FOREIGN KEY (`fk_location_id`) REFERENCES `car_location` (`location_id`),
  ADD CONSTRAINT `rental_ibfk_3` FOREIGN KEY (`fk_re_condition_id`) REFERENCES `return_condition` (`return_condition_id`),
  ADD CONSTRAINT `rental_ibfk_4` FOREIGN KEY (`fk_start_condition_id`) REFERENCES `start_condition` (`start_condition_id`),
  ADD CONSTRAINT `rental_ibfk_5` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `rental_ibfk_6` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`);

--
-- Constraints for table `return_condition`
--
ALTER TABLE `return_condition`
  ADD CONSTRAINT `return_condition_ibfk_1` FOREIGN KEY (`fk_parts_id`) REFERENCES `parts` (`parts_id`),
  ADD CONSTRAINT `return_condition_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`fk_license_id`) REFERENCES `license` (`license_id`),
  ADD CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`fk_person_id`) REFERENCES `person` (`person_id`);

--
-- Constraints for table `start_condition`
--
ALTER TABLE `start_condition`
  ADD CONSTRAINT `start_condition_ibfk_1` FOREIGN KEY (`fk_parts_id`) REFERENCES `parts` (`parts_id`),
  ADD CONSTRAINT `start_condition_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
