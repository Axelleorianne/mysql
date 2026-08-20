
create table Registration (
regCode int auto_increment primary key ,
regDate date,
courseCode varchar(7),
studentId int ,
constraint fk_coursecode foreign key (courseCode) references course(courseCode),
constraint fk_studentid foreign key (studentId) references learners(studentId)
);

alter table registration 
add fee_paid int;

alter table payments
drop constraint fkstudid;

alter table payments
drop column studentId;

alter table payments
add column regCode int;

alter table payments
add constraint fk_regcode foreign key (regCode) 
references  registration(regCode);





create database school_db;
use school_db;

CREATE TABLE `course` (
  `courseCode` varchar(7) NOT NULL,
  `courseName` varchar(100) NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `Fees` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`courseCode`, `courseName`, `duration`, `Fees`) VALUES
('BSCIT1', 'BACHELOR OF SCIENCE IN IT 1', 4, NULL),
('BSCIT2', 'BACHELOR OF SCIENCE IN IT 2', 4, NULL);

--
-- Triggers `course`
--
DELIMITER $$
CREATE TRIGGER `trgIncrTotCourses` BEFORE INSERT ON `course` FOR EACH ROW begin
	declare totCourses int;
    select count(*) into totCourses from course;
    if totCourses > 0 then
		update CourseStats set NoCOurses = NoCOurses + 1;
	else
    insert into CourseStats values(1);
    end if;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `coursestats`
--

CREATE TABLE `coursestats` (
  `NoCOurses` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coursestats`
--

INSERT INTO `coursestats` (`NoCOurses`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `indextable`
--

CREATE TABLE `indextable` (
  `Idex_Id` int(11) NOT NULL,
  `indexName` varchar(30) NOT NULL,
  `indexDate` date NOT NULL,
  `indexDesc` varchar(100) DEFAULT NULL
) ;

--
-- Dumping data for table `indextable`
--

INSERT INTO `indextable` (`Idex_Id`, `indexName`, `indexDate`, `indexDesc`) VALUES
(1, 'CUstomerID', '2026-03-03', 'Clustered'),
(2, 'OrderiD', '0000-00-00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `learners`
--

CREATE TABLE `learners` (
  `studentId` int(11) NOT NULL,
  `studentFullName` varchar(100) DEFAULT NULL,
  `studentMiddleName` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `phone` char(10) DEFAULT NULL,
  `courseCode` varchar(7) DEFAULT NULL,
  `Nationality` varchar(100) DEFAULT 'Nigeria'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `paymentid` int NOT NULL,
  `paymentdate` date NOT NULL,
  `Amount` int NOT NULL CHECK (`Amount` > 100000),
  `regCode` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwindex`
-- (See below for the actual view)
--
CREATE TABLE `vwindex` (
`idex_ID` int(11)
,`indexname` varchar(30)
,`indexdate` date
,`indexdesc` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwindextable`
-- (See below for the actual view)
--
CREATE TABLE `vwindextable` (
`idex_ID` int(11)
,`indexname` varchar(30)
,`indexdate` date
);

-- --------------------------------------------------------

--
-- Structure for view `vwindex`
--
DROP TABLE IF EXISTS `vwindex`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwindex`  AS SELECT `indextable`.`Idex_Id` AS `idex_ID`, `indextable`.`indexName` AS `indexname`, `indextable`.`indexDate` AS `indexdate`, `indextable`.`indexDesc` AS `indexdesc` FROM `indextable` ;

-- --------------------------------------------------------

--
-- Structure for view `vwindextable`
--
DROP TABLE IF EXISTS `vwindextable`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwindextable`  AS SELECT `indextable`.`Idex_Id` AS `idex_ID`, `indextable`.`indexName` AS `indexname`, `indextable`.`indexDate` AS `indexdate` FROM `indextable` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`courseCode`),
  ADD UNIQUE KEY `unq_cname` (`courseName`),
  ADD KEY `idxCourseName` (`courseName`);

--
-- Indexes for table `indextable`
--
ALTER TABLE `indextable`
  ADD PRIMARY KEY (`Idex_Id`),
  ADD KEY `idxidx` (`indexDate`,`indexName`);

--
-- Indexes for table `learners`
--
ALTER TABLE `registration`
  ADD KEY `fkregCode` (`regCode`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`paymentid`),
  ADD KEY `fkStudId` (`StudentID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `indextable`
--
ALTER TABLE `indextable`
  MODIFY `Idex_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `paymentid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `learners`
--
ALTER TABLE `learners`
  ADD CONSTRAINT `fkCourseCode` FOREIGN KEY (`courseCode`) REFERENCES `course` (`courseCode`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fkStudId` FOREIGN KEY (`StudentID`) REFERENCES `learners` (`studentId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



