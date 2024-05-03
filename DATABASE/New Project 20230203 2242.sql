-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.22-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema dsas
--

CREATE DATABASE IF NOT EXISTS dsas;
USE dsas;

--
-- Definition of table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
CREATE TABLE `doctors` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `dob` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL,
  `ustatus` varchar(45) NOT NULL,
  `regtime` varchar(45) NOT NULL,
  `lastlog` varchar(45) default '0',
  `vparam` longtext NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctors`
--

/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;


--
-- Definition of table `mdatarequest`
--

DROP TABLE IF EXISTS `mdatarequest`;
CREATE TABLE `mdatarequest` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `dname` varchar(45) NOT NULL,
  `did` varchar(45) NOT NULL,
  `dmail` varchar(45) NOT NULL,
  `pid` varchar(45) NOT NULL,
  `pname` varchar(45) NOT NULL,
  `reqstatus` varchar(45) NOT NULL,
  `reqtime` varchar(45) NOT NULL,
  `dkey` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mdatarequest`
--

/*!40000 ALTER TABLE `mdatarequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdatarequest` ENABLE KEYS */;


--
-- Definition of table `medicalrecords`
--

DROP TABLE IF EXISTS `medicalrecords`;
CREATE TABLE `medicalrecords` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `pid` varchar(45) NOT NULL,
  `pname` longtext NOT NULL,
  `pmail` longtext NOT NULL,
  `pphone` longtext NOT NULL,
  `blood` longtext NOT NULL,
  `bp` longtext NOT NULL,
  `btemp` longtext NOT NULL,
  `pulserate` longtext NOT NULL,
  `uploaddate` longtext NOT NULL,
  `pmedications` longtext NOT NULL,
  `skey` varchar(45) NOT NULL,
  `patientdata` longblob NOT NULL,
  `docassign` varchar(45) NOT NULL default 'NO',
  `did` varchar(45) NOT NULL default 'NO',
  `dname` varchar(45) NOT NULL default 'NO',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicalrecords`
--

/*!40000 ALTER TABLE `medicalrecords` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicalrecords` ENABLE KEYS */;


--
-- Definition of table `patients`
--

DROP TABLE IF EXISTS `patients`;
CREATE TABLE `patients` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `dob` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL,
  `ustatus` varchar(45) NOT NULL,
  `regtime` varchar(45) NOT NULL,
  `lastlog` varchar(45) default '0',
  `vparam` longtext NOT NULL,
  `pid` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patients`
--

/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;


--
-- Definition of table `patientshare`
--

DROP TABLE IF EXISTS `patientshare`;
CREATE TABLE `patientshare` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `did` varchar(45) NOT NULL,
  `dname` varchar(45) NOT NULL,
  `sdid` varchar(45) NOT NULL,
  `sdname` varchar(45) NOT NULL,
  `sdmail` varchar(45) NOT NULL,
  `pid` varchar(45) NOT NULL,
  `reencfile` longblob NOT NULL,
  `dkey` varchar(45) NOT NULL,
  `rkey` varchar(45) NOT NULL,
  `time` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patientshare`
--

/*!40000 ALTER TABLE `patientshare` DISABLE KEYS */;
/*!40000 ALTER TABLE `patientshare` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
