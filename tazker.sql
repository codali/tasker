SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `tazker` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `tazker`;

DROP TABLE IF EXISTS `AssignmentDetailsTbl`;
CREATE TABLE IF NOT EXISTS `AssignmentDetailsTbl` (
  `Assignment_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Subject_Id` int(11) NOT NULL,
  `Class_Id` int(11) NOT NULL,
  `Topic` varchar(100) NOT NULL,
  `Body` text NOT NULL,
  `Lst_Date` date NOT NULL,
  `Allow_Late` tinyint(1) NOT NULL,
  PRIMARY KEY (`Assignment_Id`),
  KEY `fk_sbjct` (`Subject_Id`),
  KEY `fk_cls` (`Class_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `ASSIGN_DOCS`;
CREATE TABLE IF NOT EXISTS `ASSIGN_DOCS` (
  `Assignment_Id` int(11) NOT NULL,
  `Std_Id` int(11) NOT NULL,
  `File_Name` varchar(100) NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '0',
  `Score` int(11) NOT NULL DEFAULT '0',
  `Time` datetime NOT NULL,
  `lateSubmission` tinyint(1) NOT NULL,
  UNIQUE KEY `File_Name` (`File_Name`),
  KEY `fk_AssignmId` (`Assignment_Id`),
  KEY `fk_St` (`Std_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `ClassTbl`;
CREATE TABLE IF NOT EXISTS `ClassTbl` (
  `Class_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Dep_Id` int(11) NOT NULL,
  `Tutor_Id` int(11) DEFAULT NULL,
  `Semester` tinyint(1) NOT NULL,
  PRIMARY KEY (`Class_Id`),
  KEY `fk_Dep` (`Dep_Id`),
  KEY `fk_Tut` (`Tutor_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `DepartmentTbl`;
CREATE TABLE IF NOT EXISTS `DepartmentTbl` (
  `Dep_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Dep_Code` char(3) NOT NULL,
  `Dep_Name` varchar(30) NOT NULL,
  PRIMARY KEY (`Dep_Id`),
  UNIQUE KEY `Dep_Code` (`Dep_Code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `role` char(3) NOT NULL,
  UNIQUE KEY `ID` (`ID`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `StudentTbl`;
CREATE TABLE IF NOT EXISTS `StudentTbl` (
  `Std_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Std_Name` varchar(40) NOT NULL,
  `Class_ID` int(11) NOT NULL,
  `Dob` date NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(10) NOT NULL,
  `Guar_Name` varchar(50) NOT NULL,
  `Adm_Date` date NOT NULL,
  PRIMARY KEY (`Std_Id`),
  UNIQUE KEY `Email` (`Email`),
  KEY `fk_Class` (`Class_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `SubjectAllotTbl`;
CREATE TABLE IF NOT EXISTS `SubjectAllotTbl` (
  `Subject_Id` int(11) NOT NULL,
  `Teacher_Id` int(11) NOT NULL,
  KEY `fk_Subfkt` (`Subject_Id`),
  KEY `fk_ttt` (`Teacher_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `SubjectTbl`;
CREATE TABLE IF NOT EXISTS `SubjectTbl` (
  `Subject_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Subject_Code` int(11) NOT NULL,
  `Subject_Name` varchar(50) NOT NULL,
  `Periods_Week` int(11) NOT NULL,
  `Dep_Id` int(11) NOT NULL,
  `Semester` int(11) NOT NULL,
  PRIMARY KEY (`Subject_Id`),
  KEY `fk_DP` (`Dep_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `TeachersTbl`;
CREATE TABLE IF NOT EXISTS `TeachersTbl` (
  `Teacher_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Dep_Id` int(11) NOT NULL,
  `Tchr_Name` varchar(50) NOT NULL,
  `Email` varchar(60) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  PRIMARY KEY (`Teacher_Id`),
  UNIQUE KEY `Email` (`Email`),
  KEY `fk_Depar` (`Dep_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;


ALTER TABLE `AssignmentDetailsTbl`
  ADD CONSTRAINT `fk_cls` FOREIGN KEY (`Class_Id`) REFERENCES `ClassTbl` (`Class_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sbjct` FOREIGN KEY (`Subject_Id`) REFERENCES `SubjectTbl` (`Subject_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `ASSIGN_DOCS`
  ADD CONSTRAINT `fk_AssignmId` FOREIGN KEY (`Assignment_Id`) REFERENCES `AssignmentDetailsTbl` (`Assignment_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_St` FOREIGN KEY (`Std_Id`) REFERENCES `StudentTbl` (`Std_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `ClassTbl`
  ADD CONSTRAINT `fk_Dep` FOREIGN KEY (`Dep_Id`) REFERENCES `DepartmentTbl` (`Dep_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Tut` FOREIGN KEY (`Tutor_Id`) REFERENCES `TeachersTbl` (`Teacher_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `StudentTbl`
  ADD CONSTRAINT `fk_Class` FOREIGN KEY (`Class_ID`) REFERENCES `ClassTbl` (`Class_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `SubjectAllotTbl`
  ADD CONSTRAINT `fk_Subfkt` FOREIGN KEY (`Subject_Id`) REFERENCES `SubjectTbl` (`Subject_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ttt` FOREIGN KEY (`Teacher_Id`) REFERENCES `TeachersTbl` (`Teacher_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `SubjectTbl`
  ADD CONSTRAINT `fk_DP` FOREIGN KEY (`Dep_Id`) REFERENCES `DepartmentTbl` (`Dep_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `TeachersTbl`
  ADD CONSTRAINT `fk_Depar` FOREIGN KEY (`Dep_Id`) REFERENCES `DepartmentTbl` (`Dep_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
