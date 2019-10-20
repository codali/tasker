DROP database tazker;
CREATE SCHEMA tazker;
use tazker;
CREATE TABLE tazker.DepartmentTbl(Dep_Id INT PRIMARY KEY NOT NULL auto_increment,
                                   Dep_Code CHAR(3) NOT NULL UNIQUE,
			           Dep_Name VARCHAR(30) NOT NULL);
CREATE TABLE  tazker.TeachersTbl(Teacher_Id INT NOT NULL PRIMARY KEY auto_increment,
                                  Dep_Id INT NOT NULL,
				  Tchr_Name VARCHAR(50) NOT NULL,
                                  Employee_No VARCHAR(20) UNIQUE NOT NULL,
                                  Email VARCHAR(60) NOT NULL UNIQUE,
                                  Phone VARCHAR(10) NOT NULL,
                                  CONSTRAINT fk_Depar FOREIGN KEY(Dep_Id)
                                  REFERENCES DepartmentTbl(ID)
                                  ON DELETE CASCADE
                                  ON UPDATE CASCADE);
                                  
CREATE TABLE tazker.ClassTbl(Class_Id INT PRIMARY KEY auto_increment NOT NULL,
                                  Dep_Id INT NOT NULL,
                                  Tutor_Id INT ,
                                  Semester TINYINT(1) NOT NULL,
                                  CONSTRAINT fk_Dep FOREIGN KEY(Dep_Id)
                                  REFERENCES department(ID)
                                  ON DELETE CASCADE
                                  ON UPDATE CASCADE,
                                  CONSTRAINT fk_Tut FOREIGN KEY(Tutor_Id)
                                  REFERENCES TeachersTbl(Teacher_Id)
                                  ON DELETE CASCADE
                                  ON UPDATE CASCADE);
CREATE TABLE tazker.StudentTbl(Std_Id INT NOT NULL PRIMARY KEY auto_increment,
                                  Std_Name VARCHAR(40) NOT NULL,
                                  Class_ID INT NOT NULL,
                                  Dep_ID INT NOT NULL,
                                  Dob DATE NOT NULL,
			          Email VARCHAR(100) UNIQUE,
                                  Phone VARCHAR(10) NOT NULL,
                                  Guar_Name VARCHAR(50) NOT NULL,
                                  Adm_Date DATE  NOT NULL,
                                  CONSTRAINT fk_Class FOREIGN KEY(Class_Id)
                                  REFERENCES ClassTbl(Class_Id)
                                  ON DELETE CASCADE
                                  ON UPDATE CASCADE)
			          ;
--			    
--CREATE TABLE tazker.RegisterTbl(Std_Id int NOT NULL UNIQUE,
  --                               Reg_No int NOT NULL UNIQUE,
    --                             CONSTRAINT fk_Std FOREIGN KEY(Std_Id)
      --                           REFERENCES StudentTbl(Std_Id)
        --                         ON DELETE CASCADE
          --                       ON UPDATE CASCADE)
		--	         ;
			         
			         
                          
CREATE TABLE tazker.SubjectTbl(
                                 Subject_Id INT NOT NULL PRIMARY KEY auto_increment,
                                 Subject_Code INT NOT NULL,
                                 Subject_Name VARCHAR(50) NOT NULL,
                                 Periods_Week INT NOT NULL,
                                 Dep_Id INT NOT NULL,
                                 Semester INT NOT NULL,
                                 CONSTRAINT fk_DP FOREIGN KEY (Dep_Id)
                                 REFERENCES department(ID)
                                 ON DELETE CASCADE
                                 ON UPDATE CASCADE)                                 
                                 ENGINE = INNODB;
CREATE TABLE tazker.SubjectAllotTbl(
                                        Subject_Id INT NOT NULL,
                                        Teacher_Id INT NOT NULL,
                                        CONSTRAINT fk_Subfkt FOREIGN KEY(Subject_Id)
                                        REFERENCES SubjectTbl(Subject_Id)
                                        ON DELETE CASCADE
                                        ON UPDATE CASCADE,
                                        CONSTRAINT fk_ttt FOREIGN KEY(Teacher_Id)
                                        REFERENCES TeachersTbl(Teacher_Id)
                                        ON DELETE CASCADE
                                        ON UPDATE CASCADE);                                       
                                        
                                  
CREATE TABLE tazker.AssignmentDetailsTbl (
                                  Assignment_Id INT NOT NULL PRIMARY KEY auto_increment, 
                                  Subject_Id INT NOT NULL,
                                  Class_Id INT NOT NULL,
                                  Topic VARCHAR(100) NOT NULL,
                                  Body TEXT(2000) NOT NULL,
                                  Lst_Date DATE NOT NULL,
                                  Allow_Late TINYINT(1) NOT NULL,
                                  CONSTRAINT fk_sbjct FOREIGN KEY (Subject_Id)
                                  REFERENCES SubjectTbl(Subject_Id)
                                  ON DELETE CASCADE
                                  ON UPDATE CASCADE,
                                  CONSTRAINT fk_cls FOREIGN KEY (Class_Id)
                                  REFERENCES ClassTbl(Class_Id)
                                  ON DELETE CASCADE
                                  ON UPDATE CASCADE)
                                  ENGINE = INNODB;
                                                                    
CREATE TABLE tazker.ASSIGN_DOCS (Assignment_Id INT NOT NULL,
                                  Std_Id INT NOT NULL,
                                  File_Name VARCHAR(100) NOT NULL UNIQUE,
                                  Status TINYINT(1) NOT NULL DEFAULT 0,
                                  Score INT NOT NULL DEFAULT 0,
                                  CONSTRAINT fk_AssignmId FOREIGN KEY(Assignment_Id)
                                  REFERENCES AssignmentDetailsTbl(Assignment_Id)
                                  ON DELETE CASCADE
                                  ON UPDATE CASCADE,
                                  CONSTRAINT fk_St FOREIGN KEY(Std_Id)
                                  REFERENCES StudentTbl(Std_Id)
                                  ON DELETE CASCADE
                                  ON UPDATE CASCADE)
                                  ENGINE = INNODB;

