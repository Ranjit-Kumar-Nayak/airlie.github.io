 -- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2017 at 04:09 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airline_reservation`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`Harry`@`localhost` PROCEDURE `GetFlightStatistics` (IN `j_date` DATE)  BEGIN
 select flight_no,departure_date,IFNULL(no_of_passengers, 0) as no_of_passengers,total_capacity from (
select f.flight_no,f.departure_date,sum(t.no_of_passengers) as no_of_passengers,j.total_capacity 
from flight_details f left join ticket_details t 
on t.booking_status='CONFIRMED' 
and t.flight_no=f.flight_no 
and f.departure_date=t.journey_date 
inner join jet_details j on j.jet_id=f.jet_id
group by flight_no,journey_date) k where departure_date=j_date;
 END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` varchar(20) NOT NULL,
  `pwd` varchar(30) DEFAULT NULL,
  `staff_id` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `pwd`, `staff_id`, `name`, `email`) VALUES
('roshan', 'passpass', '101', 'Harry Roshan', 'harryroshan1997@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` varchar(20) NOT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(35) DEFAULT NULL,
  `phone_no` varchar(15) DEFAULT NULL,
  `address` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `pwd`, `name`, `email`, `phone_no`, `address`) VALUES
('aadith', 'aadith007', 'aadith_name', 'aadith_email', '12345', 'aadith_address'),
('Apple', 'abhishek', 'Abhijeeth', 'gmail@gmail.com', '+9185564764', 'hgsjhgdjfdjdgf'),
('blah', 'blah blah', 'blah', 'blah@gmail.com', '993498570', 'blah'),
('charles', 'charles_pass', 'Charles', 'charles@gmail.com', '9090909090', 'Bangalore'),
('chirag008', 'chirag', 'Chirag G', 'chirag@gmail.com', '8080808080', 'Kuldlu Gate'),
('harryroshan', 'passpasshello', 'Harry Roshan', 'harryroshan1997@gmai', '9845713736', '#381, 1st E Main,');

-- --------------------------------------------------------

--
-- Table structure for table `flight_details`
--

CREATE TABLE `flight_details` (
  `flight_no` varchar(10) NOT NULL,
  `from_city` varchar(20) DEFAULT NULL,
  `to_city` varchar(20) DEFAULT NULL,
  `departure_date` date NOT NULL,
  `arrival_date` date DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `seats_economy` int(5) DEFAULT NULL,
  `seats_business` int(5) DEFAULT NULL,
  `price_economy` int(10) DEFAULT NULL,
  `price_business` int(10) DEFAULT NULL,
  `jet_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flight_details`
--

INSERT INTO `flight_details` (`flight_no`, `from_city`, `to_city`, `departure_date`, `arrival_date`, `departure_time`, `arrival_time`, `seats_economy`, `seats_business`, `price_economy`, `price_business`, `jet_id`) VALUES
('AA101', 'bangalore', 'mumbai', '2022-05-15', '2022-05-16', '21:00:00', '01:00:00', 195, 96, 5000, 7500, '10001'),
('AA102', 'chennai', 'mumbai', '2022-05-14', '2022-05-14', '10:00:00', '12:00:00', 200, 73, 2500, 3000, '10002'),
('AA103', 'bangalore', 'chennai', '2022-05-14', '2022-05-14', '17:00:00', '17:45:00', 150, 75, 1200, 1500, '10004'),
('AA104', 'bangalore', 'mysore', '2022-05-15', '2022-05-15', '09:00:00', '09:17:00', 37, 4, 500, 750, '10003'),
('AA106', 'mysore', 'hyderabad', '2022-05-16', '2022-05-16', '13:00:00', '14:00:00', 150, 75, 3000, 3750, '10004'),
('AA106', 'mysore', 'chennai', '2022-05-16', '2022-05-16', '13:00:00', '14:00:00', 150, 75, 3000, 3750, '10006'),
('AA107', 'bangalore', 'mysore', '2022-05-15', '2022-05-15', '09:00:00', '09:17:00', 37, 4, 500, 750, '10007'),
('AA108', 'bangalore', 'mysore', '2022-05-15', '2022-05-15', '09:00:00', '09:17:00', 37, 4, 500, 750, '10008'),
('AA109', 'bangalore', 'mysore', '2022-05-15', '2022-05-15', '09:00:00', '09:17:00', 37, 4, 500, 750, '10009'),




('AA110', 'mangalore', 'mysore', '2022-05-30', '2022-05-30', '09:00:00', '09:17:00', 37, 4, 500, 750, '10010'),
('AA111', 'mangalore', 'mysore', '2022-05-29', '2022-05-29', '09:00:00', '09:17:00', 37, 4, 500, 750, '10011'),
('AA112', 'mangalore', 'mysore', '2022-05-28', '2022-05-28', '09:00:00', '09:17:00', 37, 4, 500, 750, '10013'),
('AA113', 'mangalore', 'mysore', '2022-05-27', '2022-05-27', '09:00:00', '09:17:00', 37, 4, 500, 750, '10014'),
('AA114', 'mangalore', 'mysore', '2022-05-26', '2022-05-26', '09:00:00', '09:17:00', 37, 4, 500, 750, '10015'),
('AA115', 'mangalore', 'mysore', '2022-05-25', '2022-05-25', '09:00:00', '09:17:00', 37, 4, 500, 750, '10016'),
('AA116', 'mangalore', 'mysore', '2022-05-24', '2022-05-24', '09:00:00', '09:17:00', 37, 4, 500, 750, '10017'),
('AA117', 'mangalore', 'mysore', '2022-05-23', '2022-05-23', '09:00:00', '09:17:00', 37, 4, 500, 750, '10018'),
('AA118', 'mangalore', 'mysore', '2022-05-22', '2022-05-22', '09:00:00', '09:17:00', 37, 4, 500, 750, '10019'),
('AA119', 'mangalore', 'mysore', '2022-05-21', '2022-05-21', '09:00:00', '09:17:00', 37, 4, 500, 750, '10020'),
('AA120', 'mangalore', 'mysore', '2022-05-20', '2022-05-20', '09:00:00', '09:17:00', 37, 4, 500, 750, '10021'),
('AA121', 'mangalore', 'mysore', '2022-05-19', '2022-05-19', '09:00:00', '09:17:00', 37, 4, 500, 750, '10022'),
('AA122', 'mangalore', 'mysore', '2022-05-18', '2022-05-18', '09:00:00', '09:17:00', 37, 4, 500, 750, '10023'),
('AA123', 'mangalore', 'mysore', '2022-05-17', '2022-05-17', '09:00:00', '09:17:00', 37, 4, 500, 750, '10024'),
('AA124', 'mangalore', 'mysore', '2022-05-16', '2022-05-16', '09:00:00', '09:17:00', 37, 4, 500, 750, '10025'),


('AA125', 'chennai', 'mysore', '2022-05-30', '2022-05-30', '09:00:00', '09:17:00', 37, 4, 500, 750, '10010'),
('AA126', 'chennai', 'mysore', '2022-05-29', '2022-05-29', '09:00:00', '09:17:00', 37, 4, 500, 750, '10011'),
('AA127', 'chennai', 'mysore', '2022-05-28', '2022-05-28', '09:00:00', '09:17:00', 37, 4, 500, 750, '10013'),
('AA128', 'chennai', 'mysore', '2022-05-27', '2022-05-27', '09:00:00', '09:17:00', 37, 4, 500, 750, '10014'),
('AA129', 'chennai', 'mysore', '2022-05-26', '2022-05-26', '09:00:00', '09:17:00', 37, 4, 500, 750, '10015'),
('AA130', 'chennai', 'mysore', '2022-05-25', '2022-05-25', '09:00:00', '09:17:00', 37, 4, 500, 750, '10016'),
('AA131', 'chennai', 'mysore', '2022-05-24', '2022-05-24', '09:00:00', '09:17:00', 37, 4, 500, 750, '10017'),
('AA132', 'chennai', 'mysore', '2022-05-23', '2022-05-23', '09:00:00', '09:17:00', 37, 4, 500, 750, '10018'),
('AA133', 'chennai', 'mysore', '2022-05-22', '2022-05-22', '09:00:00', '09:17:00', 37, 4, 500, 750, '10019'),
('AA134', 'chennai', 'mysore', '2022-05-21', '2022-05-21', '09:00:00', '09:17:00', 37, 4, 500, 750, '10020'),
('AA135', 'chennai', 'mysore', '2022-05-20', '2022-05-20', '09:00:00', '09:17:00', 37, 4, 500, 750, '10021'),
('AA136', 'chennai', 'mysore', '2022-05-19', '2022-05-19', '09:00:00', '09:17:00', 37, 4, 500, 750, '10022'),
('AA137', 'chennai', 'mysore', '2022-05-18', '2022-05-18', '09:00:00', '09:17:00', 37, 4, 500, 750, '10023'),
('AA138', 'chennai', 'mysore', '2022-05-17', '2022-05-17', '09:00:00', '09:17:00', 37, 4, 500, 750, '10024'),
('AA139', 'chennai', 'mysore', '2022-05-16', '2022-05-16', '09:00:00', '09:17:00', 37, 4, 500, 750, '10025'),


('AA140', 'bbi', 'mysore', '2022-05-30', '2022-05-30', '09:00:00', '09:17:00', 37, 4, 500, 750, '10010'),
('AA141', 'bbi', 'mysore', '2022-05-29', '2022-05-29', '09:00:00', '09:17:00', 37, 4, 500, 750, '10011'),
('AA142', 'bbi', 'mysore', '2022-05-28', '2022-05-28', '09:00:00', '09:17:00', 37, 4, 500, 750, '10013'),
('AA143', 'bbi', 'mysore', '2022-05-27', '2022-05-27', '09:00:00', '09:17:00', 37, 4, 500, 750, '10014'),
('AA144', 'bbi', 'mysore', '2022-05-26', '2022-05-26', '09:00:00', '09:17:00', 37, 4, 500, 750, '10015'),
('AA145', 'bbi', 'mysore', '2022-05-25', '2022-05-25', '09:00:00', '09:17:00', 37, 4, 500, 750, '10016'),
('AA146', 'bbi', 'mysore', '2022-05-24', '2022-05-24', '09:00:00', '09:17:00', 37, 4, 500, 750, '10017'),
('AA147', 'bbi', 'mysore', '2022-05-23', '2022-05-23', '09:00:00', '09:17:00', 37, 4, 500, 750, '10018'),
('AA148', 'bbi', 'mysore', '2022-05-22', '2022-05-22', '09:00:00', '09:17:00', 37, 4, 500, 750, '10019'),
('AA149', 'bbi', 'mysore', '2022-05-21', '2022-05-21', '09:00:00', '09:17:00', 37, 4, 500, 750, '10020'),
('AA150', 'bbi', 'mysore', '2022-05-20', '2022-05-20', '09:00:00', '09:17:00', 37, 4, 500, 750, '10021'),
('AA151', 'bbi', 'mysore', '2022-05-19', '2022-05-19', '09:00:00', '09:17:00', 37, 4, 500, 750, '10022'),
('AA152', 'bbi', 'mysore', '2022-05-18', '2022-05-18', '09:00:00', '09:17:00', 37, 4, 500, 750, '10023'),
('AA153', 'bbi', 'mysore', '2022-05-17', '2022-05-17', '09:00:00', '09:17:00', 37, 4, 500, 750, '10024'),
('AA154', 'bbi', 'mysore', '2022-05-16', '2022-05-16', '09:00:00', '09:17:00', 37, 4, 500, 750, '10025'),


('AA155', 'mumbai', 'mysore', '2022-05-30', '2022-05-30', '09:00:00', '09:17:00', 37, 4, 500, 750, '10010'),
('AA156', 'mumbai', 'mysore', '2022-05-29', '2022-05-29', '09:00:00', '09:17:00', 37, 4, 500, 750, '10011'),
('AA157', 'mumbai', 'mysore', '2022-05-28', '2022-05-28', '09:00:00', '09:17:00', 37, 4, 500, 750, '10013'),
('AA158', 'mumbai', 'mysore', '2022-05-27', '2022-05-27', '09:00:00', '09:17:00', 37, 4, 500, 750, '10014'),
('AA159', 'mumbai', 'mysore', '2022-05-26', '2022-05-26', '09:00:00', '09:17:00', 37, 4, 500, 750, '10015'),
('AA160', 'mumbai', 'mysore', '2022-05-25', '2022-05-25', '09:00:00', '09:17:00', 37, 4, 500, 750, '10016'),
('AA161', 'mumbai', 'mysore', '2022-05-24', '2022-05-24', '09:00:00', '09:17:00', 37, 4, 500, 750, '10017'),
('AA162', 'mumbai', 'mysore', '2022-05-23', '2022-05-23', '09:00:00', '09:17:00', 37, 4, 500, 750, '10018'),
('AA163', 'mumbai', 'mysore', '2022-05-22', '2022-05-22', '09:00:00', '09:17:00', 37, 4, 500, 750, '10019'),
('AA164', 'mumbai', 'mysore', '2022-05-21', '2022-05-21', '09:00:00', '09:17:00', 37, 4, 500, 750, '10020'),
('AA165', 'mumbai', 'mysore', '2022-05-20', '2022-05-20', '09:00:00', '09:17:00', 37, 4, 500, 750, '10021'),
('AA166', 'mumbai', 'mysore', '2022-05-19', '2022-05-19', '09:00:00', '09:17:00', 37, 4, 500, 750, '10022'),
('AA167', 'mumbai', 'mysore', '2022-05-18', '2022-05-18', '09:00:00', '09:17:00', 37, 4, 500, 750, '10023'),
('AA168', 'mumbai', 'mysore', '2022-05-17', '2022-05-17', '09:00:00', '09:17:00', 37, 4, 500, 750, '10024'),
('AA169', 'mumbai', 'mysore', '2022-05-16', '2022-05-16', '09:00:00', '09:17:00', 37, 4, 500, 750, '10025'),


('AA170', 'hyderabad', 'mysore', '2022-05-30', '2022-05-30', '09:00:00', '09:17:00', 37, 4, 500, 750, '10010'),
('AA171', 'hyderabad', 'mysore', '2022-05-29', '2022-05-29', '09:00:00', '09:17:00', 37, 4, 500, 750, '10011'),
('AA172', 'hyderabad', 'mysore', '2022-05-28', '2022-05-28', '09:00:00', '09:17:00', 37, 4, 500, 750, '10013'),
('AA173', 'hyderabad', 'mysore', '2022-05-27', '2022-05-27', '09:00:00', '09:17:00', 37, 4, 500, 750, '10014'),
('AA174', 'hyderabad', 'mysore', '2022-05-26', '2022-05-26', '09:00:00', '09:17:00', 37, 4, 500, 750, '10015'),
('AA175', 'hyderabad', 'mysore', '2022-05-25', '2022-05-25', '09:00:00', '09:17:00', 37, 4, 500, 750, '10016'),
('AA176', 'hyderabad', 'mysore', '2022-05-24', '2022-05-24', '09:00:00', '09:17:00', 37, 4, 500, 750, '10017'),
('AA177', 'hyderabad', 'mysore', '2022-05-23', '2022-05-23', '09:00:00', '09:17:00', 37, 4, 500, 750, '10018'),
('AA178', 'hyderabad', 'mysore', '2022-05-22', '2022-05-22', '09:00:00', '09:17:00', 37, 4, 500, 750, '10019'),
('AA179', 'hyderabad', 'mysore', '2022-05-21', '2022-05-21', '09:00:00', '09:17:00', 37, 4, 500, 750, '10020'),
('AA180', 'hyderabad', 'mysore', '2022-05-20', '2022-05-20', '09:00:00', '09:17:00', 37, 4, 500, 750, '10021'),
('AA181', 'hyderabad', 'mysore', '2022-05-19', '2022-05-19', '09:00:00', '09:17:00', 37, 4, 500, 750, '10022'),
('AA182', 'hyderabad', 'mysore', '2022-05-18', '2022-05-18', '09:00:00', '09:17:00', 37, 4, 500, 750, '10023'),
('AA183', 'hyderabad', 'mysore', '2022-05-17', '2022-05-17', '09:00:00', '09:17:00', 37, 4, 500, 750, '10024'),
('AA184', 'hyderabad', 'mysore', '2022-05-16', '2022-05-16', '09:00:00', '09:17:00', 37, 4, 500, 750, '10025'),
















('AA185', 'hyderabad', 'mumbai', '2022-05-30', '2022-05-30', '09:00:00', '09:17:00', 37, 4, 500, 750, '10010'),
('AA186', 'hyderabad', 'mumbai', '2022-05-29', '2022-05-29', '09:00:00', '09:17:00', 37, 4, 500, 750, '10011'),
('AA187', 'hyderabad', 'mumbai', '2022-05-28', '2022-05-28', '09:00:00', '09:17:00', 37, 4, 500, 750, '10013'),
('AA188', 'hyderabad', 'mumbai', '2022-05-27', '2022-05-27', '09:00:00', '09:17:00', 37, 4, 500, 750, '10014'),
('AA189', 'hyderabad', 'mumbai', '2022-05-26', '2022-05-26', '09:00:00', '09:17:00', 37, 4, 500, 750, '10015'),
('AA190', 'hyderabad', 'mumbai', '2022-05-25', '2022-05-25', '09:00:00', '09:17:00', 37, 4, 500, 750, '10016'),
('AA191', 'hyderabad', 'mumbai', '2022-05-24', '2022-05-24', '09:00:00', '09:17:00', 37, 4, 500, 750, '10017'),
('AA192', 'hyderabad', 'mumbai', '2022-05-23', '2022-05-23', '09:00:00', '09:17:00', 37, 4, 500, 750, '10018'),
('AA193', 'hyderabad', 'mumbai', '2022-05-22', '2022-05-22', '09:00:00', '09:17:00', 37, 4, 500, 750, '10019'),
('AA194', 'hyderabad', 'mumbai', '2022-05-21', '2022-05-21', '09:00:00', '09:17:00', 37, 4, 500, 750, '10020'),
('AA195', 'hyderabad', 'mumbai', '2022-05-20', '2022-05-20', '09:00:00', '09:17:00', 37, 4, 500, 750, '10021'),
('AA196', 'hyderabad', 'mumbai', '2022-05-19', '2022-05-19', '09:00:00', '09:17:00', 37, 4, 500, 750, '10022'),
('AA197', 'hyderabad', 'mumbai', '2022-05-18', '2022-05-18', '09:00:00', '09:17:00', 37, 4, 500, 750, '10023'),
('AA198', 'hyderabad', 'mumbai', '2022-05-17', '2022-05-17', '09:00:00', '09:17:00', 37, 4, 500, 750, '10024'),
('AA199', 'hyderabad', 'mumbai', '2022-05-16', '2022-05-16', '09:00:00', '09:17:00', 37, 4, 500, 750, '10025'),


('AA200', 'mangalore', 'mumbai', '2022-05-30', '2022-05-30', '09:00:00', '09:17:00', 37, 4, 500, 750, '10010'),
('AA201', 'mangalore', 'mumbai', '2022-05-29', '2022-05-29', '09:00:00', '09:17:00', 37, 4, 500, 750, '10011'),
('AA202', 'mangalore', 'mumbai', '2022-05-28', '2022-05-28', '09:00:00', '09:17:00', 37, 4, 500, 750, '10013'),
('AA203', 'mangalore', 'mumbai', '2022-05-27', '2022-05-27', '09:00:00', '09:17:00', 37, 4, 500, 750, '10014'),
('AA204', 'mangalore', 'mumbai', '2022-05-26', '2022-05-26', '09:00:00', '09:17:00', 37, 4, 500, 750, '10015'),
('AA205', 'mangalore', 'mumbai', '2022-05-25', '2022-05-25', '09:00:00', '09:17:00', 37, 4, 500, 750, '10016'),
('AA206', 'mangalore', 'mumbai', '2022-05-24', '2022-05-24', '09:00:00', '09:17:00', 37, 4, 500, 750, '10017'),
('AA207', 'mangalore', 'mumbai', '2022-05-23', '2022-05-23', '09:00:00', '09:17:00', 37, 4, 500, 750, '10018'),
('AA208', 'mangalore', 'mumbai', '2022-05-22', '2022-05-22', '09:00:00', '09:17:00', 37, 4, 500, 750, '10019'),
('AA209', 'mangalore', 'mumbai', '2022-05-21', '2022-05-21', '09:00:00', '09:17:00', 37, 4, 500, 750, '10020'),
('AA210', 'mangalore', 'mumbai', '2022-05-20', '2022-05-20', '09:00:00', '09:17:00', 37, 4, 500, 750, '10021'),
('AA211', 'mangalore', 'mumbai', '2022-05-19', '2022-05-19', '09:00:00', '09:17:00', 37, 4, 500, 750, '10022'),
('AA222', 'mangalore', 'mumbai', '2022-05-18', '2022-05-18', '09:00:00', '09:17:00', 37, 4, 500, 750, '10023'),
('AA223', 'mangalore', 'mumbai', '2022-05-17', '2022-05-17', '09:00:00', '09:17:00', 37, 4, 500, 750, '10024'),
('AA224', 'mangalore', 'mumbai', '2022-05-16', '2022-05-16', '09:00:00', '09:17:00', 37, 4, 500, 750, '10025'),


('AA225', 'bbi', 'mumbai', '2022-05-30', '2022-05-30', '09:00:00', '09:17:00', 37, 4, 500, 750, '10010'),
('AA226', 'bbi', 'mumbai', '2022-05-29', '2022-05-29', '09:00:00', '09:17:00', 37, 4, 500, 750, '10011'),
('AA227', 'bbi', 'mumbai', '2022-05-28', '2022-05-28', '09:00:00', '09:17:00', 37, 4, 500, 750, '10013'),
('AA228', 'bbi', 'mumbai', '2022-05-27', '2022-05-27', '09:00:00', '09:17:00', 37, 4, 500, 750, '10014'),
('AA229', 'bbi', 'mumbai', '2022-05-26', '2022-05-26', '09:00:00', '09:17:00', 37, 4, 500, 750, '10015'),
('AA230', 'bbi', 'mumbai', '2022-05-25', '2022-05-25', '09:00:00', '09:17:00', 37, 4, 500, 750, '10016'),
('AA231', 'bbi', 'mumbai', '2022-05-24', '2022-05-24', '09:00:00', '09:17:00', 37, 4, 500, 750, '10017'),
('AA233', 'bbi', 'mumbai', '2022-05-23', '2022-05-23', '09:00:00', '09:17:00', 37, 4, 500, 750, '10018'),
('AA234', 'bbi', 'mumbai', '2022-05-22', '2022-05-22', '09:00:00', '09:17:00', 37, 4, 500, 750, '10019'),
('AA235', 'bbi', 'mumbai', '2022-05-21', '2022-05-21', '09:00:00', '09:17:00', 37, 4, 500, 750, '10020'),
('AA236', 'bbi', 'mumbai', '2022-05-20', '2022-05-20', '09:00:00', '09:17:00', 37, 4, 500, 750, '10021'),
('AA237', 'bbi', 'mumbai', '2022-05-19', '2022-05-19', '09:00:00', '09:17:00', 37, 4, 500, 750, '10022'),
('AA238', 'bbi', 'mumbai', '2022-05-18', '2022-05-18', '09:00:00', '09:17:00', 37, 4, 500, 750, '10023'),
('AA239', 'bbi', 'mumbai', '2022-05-17', '2022-05-17', '09:00:00', '09:17:00', 37, 4, 500, 750, '10024'),
('AA240', 'bbi', 'mumbai', '2022-05-16', '2022-05-16', '09:00:00', '09:17:00', 37, 4, 500, 750, '10025'),



('AA241', 'chennai', 'mumbai', '2022-05-30', '2022-05-30', '09:00:00', '09:17:00', 37, 4, 500, 750, '10010'),
('AA242', 'chennai', 'mumbai', '2022-05-29', '2022-05-29', '09:00:00', '09:17:00', 37, 4, 500, 750, '10011'),
('AA243', 'chennai', 'mumbai', '2022-05-28', '2022-05-28', '09:00:00', '09:17:00', 37, 4, 500, 750, '10013'),
('AA244', 'chennai', 'mumbai', '2022-05-27', '2022-05-27', '09:00:00', '09:17:00', 37, 4, 500, 750, '10014'),
('AA245', 'chennai', 'mumbai', '2022-05-26', '2022-05-26', '09:00:00', '09:17:00', 37, 4, 500, 750, '10015'),
('AA246', 'chennai', 'mumbai', '2022-05-25', '2022-05-25', '09:00:00', '09:17:00', 37, 4, 500, 750, '10016'),
('AA247', 'chennai', 'mumbai', '2022-05-24', '2022-05-24', '09:00:00', '09:17:00', 37, 4, 500, 750, '10017'),
('AA248', 'chennai', 'mumbai', '2022-05-23', '2022-05-23', '09:00:00', '09:17:00', 37, 4, 500, 750, '10018'),
('AA249', 'chennai', 'mumbai', '2022-05-22', '2022-05-22', '09:00:00', '09:17:00', 37, 4, 500, 750, '10019'),
('AA250', 'chennai', 'mumbai', '2022-05-21', '2022-05-21', '09:00:00', '09:17:00', 37, 4, 500, 750, '10020'),
('AA251', 'chennai', 'mumbai', '2022-05-20', '2022-05-20', '09:00:00', '09:17:00', 37, 4, 500, 750, '10021'),
('AA252', 'chennai', 'mumbai', '2022-05-19', '2022-05-19', '09:00:00', '09:17:00', 37, 4, 500, 750, '10022'),
('AA253', 'chennai', 'mumbai', '2022-05-18', '2022-05-18', '09:00:00', '09:17:00', 37, 4, 500, 750, '10023'),
('AA254', 'chennai', 'mumbai', '2022-05-17', '2022-05-17', '09:00:00', '09:17:00', 37, 4, 500, 750, '10024'),
('AA255', 'chennai', 'mumbai', '2022-05-16', '2022-05-16', '09:00:00', '09:17:00', 37, 4, 500, 750, '10025'),



('AA256', 'mysore', 'mumbai', '2022-05-30', '2022-05-30', '09:00:00', '09:17:00', 37, 4, 500, 750, '10010'),
('AA257', 'mysore', 'mumbai', '2022-05-29', '2022-05-29', '09:00:00', '09:17:00', 37, 4, 500, 750, '10011'),
('AA258', 'mysore', 'mumbai', '2022-05-28', '2022-05-28', '09:00:00', '09:17:00', 37, 4, 500, 750, '10013'),
('AA259', 'mysore', 'mumbai', '2022-05-27', '2022-05-27', '09:00:00', '09:17:00', 37, 4, 500, 750, '10014'),
('AA260', 'mysore', 'mumbai', '2022-05-26', '2022-05-26', '09:00:00', '09:17:00', 37, 4, 500, 750, '10015'),
('AA261', 'mysore', 'mumbai', '2022-05-25', '2022-05-25', '09:00:00', '09:17:00', 37, 4, 500, 750, '10016'),
('AA262', 'mysore', 'mumbai', '2022-05-24', '2022-05-24', '09:00:00', '09:17:00', 37, 4, 500, 750, '10017'),
('AA263', 'mysore', 'mumbai', '2022-05-23', '2022-05-23', '09:00:00', '09:17:00', 37, 4, 500, 750, '10018'),
('AA264', 'mysore', 'mumbai', '2022-05-22', '2022-05-22', '09:00:00', '09:17:00', 37, 4, 500, 750, '10019'),
('AA265', 'mysore', 'mumbai', '2022-05-21', '2022-05-21', '09:00:00', '09:17:00', 37, 4, 500, 750, '10020'),
('AA266', 'mysore', 'mumbai', '2022-05-20', '2022-05-20', '09:00:00', '09:17:00', 37, 4, 500, 750, '10021'),
('AA267', 'mysore', 'mumbai', '2022-05-19', '2022-05-19', '09:00:00', '09:17:00', 37, 4, 500, 750, '10022'),
('AA268', 'mysore', 'mumbai', '2022-05-18', '2022-05-18', '09:00:00', '09:17:00', 37, 4, 500, 750, '10023'),
('AA269', 'mysore', 'mumbai', '2022-05-17', '2022-05-17', '09:00:00', '09:17:00', 37, 4, 500, 750, '10024'),
('AA270', 'mysore', 'mumbai', '2022-05-16', '2022-05-16', '09:00:00', '09:17:00', 37, 4, 500, 750, '10025'),

;










--
-- Table structure for table `frequent_flier_details`
--

CREATE TABLE `frequent_flier_details` (
  `frequent_flier_no` varchar(20) NOT NULL,
  `customer_id` varchar(20) DEFAULT NULL,
  `mileage` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `frequent_flier_details`
--

INSERT INTO `frequent_flier_details` (`frequent_flier_no`, `customer_id`, `mileage`) VALUES
('10001000', 'aadith', 375),
('20002000', 'harryroshan', 150);

-- --------------------------------------------------------

--
-- Table structure for table `jet_details`
--

CREATE TABLE `jet_details` (
  `jet_id` varchar(10) NOT NULL,
  `jet_type` varchar(20) DEFAULT NULL,
  `total_capacity` int(5) DEFAULT NULL,
  `active` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jet_details`
--

INSERT INTO `jet_details` (`jet_id`, `jet_type`, `total_capacity`, `active`) VALUES
('10001', 'Dreamliner', 300, 'Yes'),
('10002', 'Airbus A380', 275, 'Yes'),
('10003', 'ATR', 50, 'Yes'),
('10004', 'Boeing 737', 225, 'Yes'),
('10007', 'Test_Model', 250, 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

CREATE TABLE `passengers` (
  `passenger_id` int(10) NOT NULL,
  `pnr` varchar(15) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `gender` varchar(8) DEFAULT NULL,
  `meal_choice` varchar(5) DEFAULT NULL,
  `frequent_flier_no` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passengers`
--

INSERT INTO `passengers` (`passenger_id`, `pnr`, `name`, `age`, `gender`, `meal_choice`, `frequent_flier_no`) VALUES
(1, '1669050', 'Harry Roshan', 20, 'male', 'yes', '20002000'),
(1, '2369143', 'blah', 20, 'male', 'yes', NULL),
(1, '3027167', 'aadith_name', 10, 'male', 'yes', NULL),
(1, '3773951', 'harry', 51, 'male', 'yes', NULL),
(1, '4797983', 'pass1', 34, 'male', 'yes', NULL),
(1, '5421865', 'pass1', 10, 'male', 'yes', NULL),
(1, '6980157', 'roshan', 20, 'male', 'yes', NULL),
(1, '8503285', 'aadith_name', 10, 'male', 'yes', '10001000'),
(2, '1669050', 'berti harry', 45, 'female', 'yes', NULL),
(2, '2369143', 'blah', 51, 'male', 'yes', NULL),
(2, '3027167', 'roshan', 20, 'male', 'yes', NULL),
(2, '3773951', 'berti', 42, 'female', 'yes', NULL),
(2, '4797983', 'Harry Roshan', 20, 'male', 'yes', '20002000'),
(2, '5421865', 'pass2', 20, 'female', 'yes', NULL),
(2, '6980157', 'aadith', 9, 'male', 'yes', NULL),
(2, '8503285', 'roshan_name', 20, 'male', 'yes', NULL),
(3, '1669050', 'aadith_name', 10, 'male', 'yes', NULL),
(3, '2369143', 'blah', 10, 'male', 'yes', NULL),
(3, '3773951', 'aadith', 11, 'male', 'yes', '10001000'),
(3, '4797983', 'aadith_name', 10, 'male', 'yes', '10001000'),
(3, '5421865', 'pass3', 30, 'male', 'yes', NULL),
(4, '2369143', 'blah', 42, 'female', 'yes', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE `payment_details` (
  `payment_id` varchar(20) NOT NULL,
  `pnr` varchar(15) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_amount` int(6) DEFAULT NULL,
  `payment_mode` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_details`
--

INSERT INTO `payment_details` (`payment_id`, `pnr`, `payment_date`, `payment_amount`, `payment_mode`) VALUES
('120000248', '4797983', '2017-11-25', 4200, 'credit card'),
('142539461', '3773951', '2017-11-25', 4050, 'credit card'),
('165125569', '8503285', '2017-11-25', 7500, 'net banking'),
('467972527', '2369143', '2017-11-26', 33400, 'debit card'),
('557778944', '6980157', '2017-11-26', 11700, 'credit card'),
('620041544', '1669050', '2017-11-25', 4800, 'debit card'),
('665360715', '5421865', '2017-11-28', 15750, 'net banking'),
('862686553', '3027167', '2017-11-25', 10700, 'debit card');

--
-- Triggers `payment_details`
--
DELIMITER $$
CREATE TRIGGER `update_ticket_after_payment` AFTER INSERT ON `payment_details` FOR EACH ROW UPDATE ticket_details
     SET booking_status='CONFIRMED', payment_id= NEW.payment_id
   WHERE pnr = NEW.pnr
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_details`
--

CREATE TABLE `ticket_details` (
  `pnr` varchar(15) NOT NULL,
  `date_of_reservation` date DEFAULT NULL,
  `flight_no` varchar(10) DEFAULT NULL,
  `journey_date` date DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  `booking_status` varchar(20) DEFAULT NULL,
  `no_of_passengers` int(5) DEFAULT NULL,
  `lounge_access` varchar(5) DEFAULT NULL,
  `priority_checkin` varchar(5) DEFAULT NULL,
  `insurance` varchar(5) DEFAULT NULL,
  `payment_id` varchar(20) DEFAULT NULL,
  `customer_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_details`
--

INSERT INTO `ticket_details` (`pnr`, `date_of_reservation`, `flight_no`, `journey_date`, `class`, `booking_status`, `no_of_passengers`, `lounge_access`, `priority_checkin`, `insurance`, `payment_id`, `customer_id`) VALUES
('1669050', '2017-11-25', 'AA104', '2017-12-04', 'business', 'CONFIRMED', 3, 'yes', 'yes', 'yes', '620041544', 'harryroshan'),
('2369143', '2017-11-26', 'AA101', '2017-12-01', 'business', 'CONFIRMED', 4, 'yes', 'yes', 'yes', '467972527', 'blah'),
('3027167', '2017-11-25', 'AA101', '2017-12-01', 'economy', 'CONFIRMED', 2, 'no', 'no', 'yes', '862686553', 'aadith'),
('3773951', '2017-11-25', 'AA104', '2017-12-04', 'economy', 'CONFIRMED', 3, 'yes', 'yes', 'yes', '142539461', 'aadith'),
('4797983', '2017-11-25', 'AA104', '2017-12-04', 'business', 'CONFIRMED', 3, 'yes', 'no', 'yes', '120000248', 'harryroshan'),
('5421865', '2017-11-28', 'AA101', '2017-12-01', 'economy', 'CONFIRMED', 3, 'no', 'no', 'no', '665360715', 'harryroshan'),
('6980157', '2017-11-26', 'AA101', '2017-12-01', 'economy', 'CANCELED', 2, 'yes', 'yes', 'yes', '557778944', 'aadith'),
('8503285', '2017-11-25', 'AA102', '2017-12-01', 'business', 'CONFIRMED', 2, 'yes', 'yes', 'no', '165125569', 'aadith');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `flight_details`
--
ALTER TABLE `flight_details`
  ADD PRIMARY KEY (`flight_no`,`departure_date`),
  ADD KEY `jet_id` (`jet_id`);

--
-- Indexes for table `frequent_flier_details`
--
ALTER TABLE `frequent_flier_details`
  ADD PRIMARY KEY (`frequent_flier_no`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `jet_details`
--
ALTER TABLE `jet_details`
  ADD PRIMARY KEY (`jet_id`);

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`passenger_id`,`pnr`),
  ADD KEY `pnr` (`pnr`),
  ADD KEY `frequent_flier_no` (`frequent_flier_no`);

--
-- Indexes for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `pnr` (`pnr`);

--
-- Indexes for table `ticket_details`
--
ALTER TABLE `ticket_details`
  ADD PRIMARY KEY (`pnr`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `journey_date` (`journey_date`),
  ADD KEY `flight_no` (`flight_no`),
  ADD KEY `flight_no_2` (`flight_no`,`journey_date`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `flight_details`
--
ALTER TABLE `flight_details`
  ADD CONSTRAINT `flight_details_ibfk_1` FOREIGN KEY (`jet_id`) REFERENCES `jet_details` (`jet_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `frequent_flier_details`
--
ALTER TABLE `frequent_flier_details`
  ADD CONSTRAINT `frequent_flier_details_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `passengers`
--
ALTER TABLE `passengers`
  ADD CONSTRAINT `passengers_ibfk_1` FOREIGN KEY (`pnr`) REFERENCES `ticket_details` (`pnr`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `passengers_ibfk_2` FOREIGN KEY (`frequent_flier_no`) REFERENCES `frequent_flier_details` (`frequent_flier_no`) ON UPDATE CASCADE;

--
-- Constraints for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD CONSTRAINT `payment_details_ibfk_1` FOREIGN KEY (`pnr`) REFERENCES `ticket_details` (`pnr`) ON UPDATE CASCADE;

--
-- Constraints for table `ticket_details`
--
ALTER TABLE `ticket_details`
  ADD CONSTRAINT `ticket_details_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_details_ibfk_3` FOREIGN KEY (`flight_no`,`journey_date`) REFERENCES `flight_details` (`flight_no`, `departure_date`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
