  
  --Tables
  DROP TABLE Student CASCADE CONSTRAINT;
  CREATE TABLE Student 
  ( ID CHAR (10),
  Name VARCHAR2 (30), 
  DOB DATE,
  Email VARCHAR2 (75),
  CONSTRAINT STU_PK PRIMARY KEY (ID));
  
  
  DROP TABLE Payment CASCADE CONSTRAINT;
  CREATE TABLE Payment 
  ( PaymentID CHAR (5),
  st_ID CHAR (10), 
  paymentMethod VARCHAR2 (75),
  date_Of_Payment DATE,
  Amount CHAR (7),
  CONSTRAINT PAY_PK PRIMARY KEY (PaymentID),
  CONSTRAINT PAY_FK FOREIGN KEY (st_ID) REFERENCES Student (ID));
  
  
  DROP TABLE Placement_test CASCADE CONSTRAINT;
  CREATE TABLE Placement_test 
  ( PlacementID CHAR (3),
  loction VARCHAR2 (75),
  ID CHAR (10), 
  CONSTRAINT PLA_PK PRIMARY KEY (PlacementID),
  CONSTRAINT PLA_FK FOREIGN KEY (ID) REFERENCES Student (ID));
  
  
  DROP TABLE Course CASCADE CONSTRAINT;
  CREATE TABLE Course 
  ( code CHAR (5),
  Name VARCHAR2 (30), 
  price NUMBER (10),
  CONSTRAINT COU_PK PRIMARY KEY (code));
  
  
  DROP TABLE enrolled_by CASCADE CONSTRAINT;
  CREATE TABLE enrolled_by 
  ( ID CHAR (10), 
  code CHAR (5),
  CONSTRAINT ENR_FK1 FOREIGN KEY (ID) REFERENCES Student (ID),
  CONSTRAINT ENR_FK2 FOREIGN KEY (code) REFERENCES Course (code));
  
  
  
  DROP TABLE Teacher CASCADE CONSTRAINT;
  CREATE TABLE Teacher 
  ( ID CHAR (5),
  Name VARCHAR2 (30), 
  degree VARCHAR2 (30),
  Email_address VARCHAR2 (75),
  CONSTRAINT TEA_PK PRIMARY KEY (ID));
  
  
  DROP TABLE teachs CASCADE CONSTRAINT;
  CREATE TABLE teachs 
  ( ID CHAR (5), 
  code CHAR (5),
  CONSTRAINT TEA_FK1 FOREIGN KEY (ID) REFERENCES Teacher (ID),
  CONSTRAINT TEA_FK2 FOREIGN KEY (code) REFERENCES Course (code));
  
  
  --Insert rows
  
  INSERT INTO Student VALUES('S839572174','Sara','17-feb-2000','sara55@gmail.com');
  INSERT INTO Student VALUES('S987245562','Lama','07-jul-1997','la_25@yahoo.com');
  INSERT INTO Student VALUES('S683265641','Nada','15-dec-2003','nada03@hotmail.com');
  INSERT INTO Student VALUES('S436756721','Kalid','12-nov-2001','khh78@gmail.com');
  
  INSERT INTO Payment VALUES('07345','S683265641','VISA','05-oct-2020',330);
  INSERT INTO Payment VALUES('90436','S839572174','MADA','12-may-2021',660);
  INSERT INTO Payment VALUES('14563','S436756721','VISA','22-aug-2022',330);
  
  INSERT INTO Placement_test VALUES('D25','Riydh','S683265641');
  INSERT INTO Placement_test VALUES('D09','Riydh','S839572174');
  INSERT INTO Placement_test VALUES('D17','Riydh','S436756721');
  
  
  INSERT INTO Course VALUES('S1111','Silver',330);
  INSERT INTO Course VALUES('G2222','Gold',540);
  INSERT INTO Course VALUES('P3333','Platinum',660);
  
  
  INSERT INTO enrolled_by VALUES('S683265641','S1111');
  INSERT INTO enrolled_by VALUES('S839572174','P3333');
  INSERT INTO enrolled_by VALUES('S436756721','S1111');
  
  
  INSERT INTO Teacher VALUES('T2397','David','Master','David@gmail.com'); 
  INSERT INTO Teacher VALUES('T2524','Aditi','PhD','AditiSimia@yahoo.com');
  INSERT INTO Teacher VALUES('T2258','Corine','PhD','Corine@hotmail.com');
  INSERT INTO Teacher VALUES('T2467','Imane','master','imane@gmail.com');
  INSERT INTO Teacher VALUES('T2158','Jim','PhD','Jim@gmail.com');
  
  INSERT INTO teachs VALUES('T2397','P3333');
  INSERT INTO teachs VALUES('T2524','G2222');
  INSERT INTO teachs VALUES('T2258','P3333');
  INSERT INTO teachs VALUES('T2467','P3333');
  INSERT INTO teachs VALUES('T2158','S1111');
  
 
 
  
  
  -- Queries
  
  SELECT *
  FROM Course
  WHERE price > 350;
  
  
  SELECT ID,Name
  FROM Student 
  WHERE Name LIKE'%a';
 
  
  SELECT PaymentID , st_ID ,Amount
  FROM Payment
  WHERE paymentMethod ='VISA' OR date_Of_Payment >'01-jun-2021';
  
  
  select count (ID)
  from teacher
  where email_address like '%gmail%'; 
  
  
  select code, count(id)
  from teachs 
  where code='P3333'
  group by code;
  
  
  select code, min(price)
  from course
  group by code
  having min(price)<600
  order by min(price);
  
 
  
 
  
  
