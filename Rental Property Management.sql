SET PAGESIZE 500;
SET LINESIZE 1000;

DROP TABLE Properties;
DROP TABLE RentProperty;
DROP TABLE Contacts;
DROP TABLE Renter;
DROP TABLE Owner;
DROP TABLE Users;
DROP TABLE Login;

CREATE TABLE Login (
	usrId NUMBER(5),
	username VARCHAR(10),
	password VARCHAR(10),
	PRIMARY KEY (usrId)
    );

CREATE TABLE Users (
	nId NUMBER(5),
	name VARCHAR(20),
	phone VARCHAR(20),
	email varchar(20),
	usrId NUMBER(5),
	PRIMARY KEY (nId),
	FOREIGN KEY (usrId) REFERENCES Login(usrId) ON DELETE CASCADE
    );

CREATE TABLE Owner (
	ownerId NUMBER(5),
	bank_Account_No VARCHAR(20),
	address VARCHAR(20),
	nId NUMBER(5),
	name VARCHAR(20),
	phone VARCHAR(20),
	email varchar(20),
	usrId NUMBER(5),
	PRIMARY KEY (ownerId)	
	);

CREATE TABLE Renter (
	renterId NUMBER(5),
	age number(3),
	marital_Status VARCHAR(20),
	citizenship VARCHAR(20),
	nId NUMBER(5),
	name VARCHAR(20),
	phone VARCHAR(20),
	email varchar(20),
	usrId NUMBER(5),
	PRIMARY KEY (renterId)
	);

CREATE TABLE Contacts (
	ownerId NUMBER(5),
	renterId NUMBER(5),
	PRIMARY KEY (ownerId,renterId),
	FOREIGN KEY (ownerId) REFERENCES Owner(ownerId) ON DELETE CASCADE,
	FOREIGN KEY (renterId) REFERENCES Renter(renterId) ON DELETE CASCADE
	);

CREATE TABLE RentProperty (
	rentId NUMBER(5),
	contract_Time_yrs NUMBER(3),
	advancePayment NUMBER(5),
	PRIMARY KEY (rentId)
	);

CREATE TABLE Properties (
	pId NUMBER(5),
	address VARCHAR(20),
	area_sqft NUMBER(10),
	no_of_rooms NUMBER(3),
	floor NUMBER(2),
	rentAmount NUMBER(10),
	constructionYear NUMBER(4),
	ownerId NUMBER(5),
	renterId NUMBER(5),
	rentId NUMBER(5),
	PRIMARY KEY (pId),
	FOREIGN KEY (ownerId) REFERENCES Owner(ownerId) ON DELETE CASCADE,
	FOREIGN KEY (renterId) REFERENCES Renter(renterId) ON DELETE CASCADE,
	FOREIGN KEY (rentId) REFERENCES RentProperty(rentId) ON DELETE CASCADE
	);

INSERT INTO Login (usrId,username,password) VALUES (1,'mahin9','pMahin');
INSERT INTO Login (usrId,username,password) VALUES (2,'iftee8','pIftee');
INSERT INTO Login (usrId,username,password) VALUES (3,'rupok7','pRupok');
INSERT INTO Login (usrId,username,password) VALUES (4,'sadi6','pSadi');
INSERT INTO Login (usrId,username,password) VALUES (5,'tamim5','pTamim');
INSERT INTO Login (usrId,username,password) VALUES (6,'rishad4','pRishad');
INSERT INTO Login (usrId,username,password) VALUES (7,'arnob3','pArnob');
INSERT INTO Login (usrId,username,password) VALUES (8,'apon2','pApon');
INSERT INTO Login (usrId,username,password) VALUES (9,'alif1','pAlif');
INSERT INTO Login (usrId,username,password) VALUES (10,'shafin0','pShafin');

INSERT INTO Users (nId,name,phone,email,usrId) VALUES (10101,'Mahin','+880-1765-123123','mahin@gmail.com',1);
INSERT INTO Users (nId,name,phone,email,usrId) VALUES (10102,'Iftee','+880-1765-321321','iftee@gmail.com',2);
INSERT INTO Users (nId,name,phone,email,usrId) VALUES (10103,'Rupok','+880-1765-445566','rupok@gmail.com',3);
INSERT INTO Users (nId,name,phone,email,usrId) VALUES (10104,'Sadi','+880-1765-223344','sadi@gmail.com',4);
INSERT INTO Users (nId,name,phone,email,usrId) VALUES (10105,'Tamim','+880-1765-778899','tamim@gmail.com',5);
INSERT INTO Users (nId,name,phone,email,usrId) VALUES (10106,'Rishad','+880-1765-123456','rishad@gmail.com',6);
INSERT INTO Users (nId,name,phone,email,usrId) VALUES (10107,'Arnob','+880-1740-121121','arnob@gmail.com',7);
INSERT INTO Users (nId,name,phone,email,usrId) VALUES (10108,'Apon','+880-1740-123321','apon@gmail.com',8);
INSERT INTO Users (nId,name,phone,email,usrId) VALUES (10109,'Alif','+880-1740-101010','alif@gmail.com',9);
INSERT INTO Users (nId,name,phone,email,usrId) VALUES (10110,'Shafin','+880-1740-292929','shafin@gmail.com',10);

INSERT INTO Owner (ownerId,bank_Account_No,address,nId,name,phone,email,usrId) VALUES(4001,10004021871,'Dhaka',10101,'Mahin','+880-1765-123123','mahin@gmail.com',1);
INSERT INTO Owner (ownerId,bank_Account_No,address,nId,name,phone,email,usrId) VALUES(4002,10004021872,'Khulna',10102,'Iftee','+880-1765-321321','iftee@gmail.com',2);
INSERT INTO Owner (ownerId,bank_Account_No,address,nId,name,phone,email,usrId) VALUES(4003,10004021874,'Dhaka',10104,'Sadi','+880-1765-223344','sadi@gmail.com',4);
INSERT INTO Owner (ownerId,bank_Account_No,address,nId,name,phone,email,usrId) VALUES(4004,10004021877,'Chattogram',10107,'Arnob','+880-1740-121121','arnob@gmail.com',7);
INSERT INTO Owner (ownerId,bank_Account_No,address,nId,name,phone,email,usrId) VALUES(4005,10004021880,'Sylhet',10110,'Shafin','+880-1740-292929','shafin@gmail.com',10);

INSERT INTO Renter (renterId,age,marital_Status,citizenship,nId,name,phone,email,usrId) VALUES(7001,30,'Married','Bangladeshi',10103,'Rupok','+880-1765-445566','rupok@gmail.com',3);
INSERT INTO Renter (renterId,age,marital_Status,citizenship,nId,name,phone,email,usrId) VALUES(7002,40,'Married','Bangladeshi',10105,'Tamim','+880-1765-778899','tamim@gmail.com',5);
INSERT INTO Renter (renterId,age,marital_Status,citizenship,nId,name,phone,email,usrId) VALUES(7003,28,'Unmarried','Indian',10106,'Rishad','+880-1765-123456','rishad@gmail.com',6);
INSERT INTO Renter (renterId,age,marital_Status,citizenship,nId,name,phone,email,usrId) VALUES(7004,35,'Unmarried','Bangladeshi',10108,'Apon','+880-1740-123321','apon@gmail.com',8);
INSERT INTO Renter (renterId,age,marital_Status,citizenship,nId,name,phone,email,usrId) VALUES(7005,38,'Married','Pakistani',10109,'Alif','+880-1740-101010','alif@gmail.com',9);

INSERT INTO Contacts (ownerId,renterId) VALUES(4001,7003);
INSERT INTO Contacts (ownerId,renterId) VALUES(4003,7003);
INSERT INTO Contacts (ownerId,renterId) VALUES(4002,7002);
INSERT INTO Contacts (ownerId,renterId) VALUES(4003,7001);
INSERT INTO Contacts (ownerId,renterId) VALUES(4004,7005);
INSERT INTO Contacts (ownerId,renterId) VALUES(4005,7004);

INSERT INTO RentProperty (rentId,contract_Time_yrs,advancePayment) VALUES(9001,3,20000);
INSERT INTO RentProperty (rentId,contract_Time_yrs,advancePayment) VALUES(9002,2,25000);
INSERT INTO RentProperty (rentId,contract_Time_yrs,advancePayment) VALUES(9003,5,30000);
INSERT INTO RentProperty (rentId,contract_Time_yrs,advancePayment) VALUES(9004,2,20000);
INSERT INTO RentProperty (rentId,contract_Time_yrs,advancePayment) VALUES(9005,3,23000);

INSERT INTO Properties(pId,address,area_sqft,no_of_rooms,floor,rentAmount,constructionYear,ownerId,renterId,rentId) VALUES(301,'Dhaka',2100,5,5,25000,2012,4001,7003,9001);
INSERT INTO Properties(pId,address,area_sqft,no_of_rooms,floor,rentAmount,constructionYear,ownerId,renterId,rentId) VALUES(302,'Khulna',1600,4,3,15000,2010,4002,7002,9002);
INSERT INTO Properties(pId,address,area_sqft,no_of_rooms,floor,rentAmount,constructionYear,ownerId,renterId,rentId) VALUES(303,'Sylhet',2000,5,2,17000,2013,4003,7001,9003);
INSERT INTO Properties(pId,address,area_sqft,no_of_rooms,floor,rentAmount,constructionYear,ownerId,renterId,rentId) VALUES(304,'Chattogram',1800,4,3,21000,2008,4005,7001,9004);
INSERT INTO Properties(pId,address,area_sqft,no_of_rooms,floor,rentAmount,constructionYear,ownerId,renterId,rentId) VALUES(305,'Dhaka',1200,3,1,10000,2002,4005,7004,9005);
INSERT INTO Properties(pId,address,area_sqft,no_of_rooms,floor,rentAmount,constructionYear,ownerId) VALUES(306,'Faridpur',1350,3,1,13000,2004,4001);
INSERT INTO Properties(pId,address,area_sqft,no_of_rooms,floor,rentAmount,constructionYear,ownerId) VALUES(307,'Chattogram',1700,3,1,16000,2008,4003);
INSERT INTO Properties(pId,address,area_sqft,no_of_rooms,floor,rentAmount,constructionYear,ownerId) VALUES(308,'Dhaka',1800,3,1,20000,2006,4002);

select * from Login;
select * from Users;
select * from Owner;
select * from Renter;
select * from Contacts;
select * from RentProperty;
select * from Properties;


-------------------------------------------------------------------------------LAB 2 SQLs-------------------------------------------------------------------------------
DESC Login;
DESC Users;
DESC Owner;
DESC Renter;
DESC Contacts;
DESC RentProperty;
DESC Properties;

--- VIEW ---
CREATE OR REPLACE VIEW newOwner AS
SELECT name,email,nid FROM Owner;
SELECT * FROM newOwner;


--- ADDING A COULMN ON A TABLE ---
ALTER TABLE RentProperty ADD temp1 VARCHAR(10);
DESC RentProperty;

--- ADDING MULTIPLE COULMNS ON A TABLE ---
ALTER TABLE RentProperty ADD(
	temp2 VARCHAR(10),
	temp3 NUMBER(10)
);
DESC RentProperty;

--- MODIFYING A COULMN ON A TABLE ---
ALTER TABLE RentProperty MODIFY temp3 VARCHAR(10);
DESC RentProperty;

--- MODIFYING MULTIPLE COULMNS ON A TABLE ---
ALTER TABLE RentProperty MODIFY(
	temp1 INT,
	temp2 INT,
	temp3 INT
);
DESC RentProperty;

--- DROPPING A COULMN ON A TABLE ---
ALTER TABLE RentProperty DROP COLUMN temp1;
DESC RentProperty;

--- RENAMING A COULMN ON A TABLE ---
ALTER TABLE RentProperty RENAME COLUMN temp2 TO altered2;
DESC RentProperty;

--- DROPPING COLUMNS ON A TABLE ---
ALTER TABLE RentProperty DROP COLUMN altered2;
ALTER TABLE RentProperty DROP COLUMN temp3;
DESC RentProperty;

--- UPDATING COLUMN DATA ON A TABLE ---
UPDATE Owner SET address = 'Faridpur' WHERE name = 'Sadi';
SELECT * FROM Owner;

--- COMMITING DATA ---
COMMIT;

--- DELETING TUPLE FROM A TABLE ---
DELETE FROM Owner WHERE address = 'Faridpur';
SELECT * FROM Owner;

--- ROLLBACK ---
ROLLBACK;
SELECT * FROM Owner;


-------------------------------------------------------------------------------LAB 3 SQLs----------------------------------------------------------------------------

--- SELECT Clause ---
SELECT bank_Account_No, name, email, phone FROM Owner;

--- WHERE Clause ---
SELECT name,email,usrId FROM Renter WHERE marital_Status = 'Married';

--- GROUP BY clause ---
SELECT age FROM Renter WHERE marital_Status = 'Married' GROUP BY age;

--- HAVING Clause ---
SELECT age,name FROM Renter WHERE marital_Status = 'Married' GROUP BY age,name HAVING age<40;

--- ORDER BY Clause ---
SELECT area_sqft,no_of_rooms,rentAmount,ownerId,constructionYear FROM Properties WHERE constructionYear >= 2010 ORDER BY constructionYear;

--- ALL Clauses together ---
SELECT address,area_sqft,no_of_rooms,rentAmount 
FROM Properties WHERE constructionYear>=2010 
GROUP BY address,area_sqft,no_of_rooms,rentAmount 
HAVING rentAmount>15000 ORDER BY rentAmount;

--- DISTINCT Property ---
SELECT DISTINCT citizenship FROM Renter;

--- CALCULATED FIELDS ---
SELECT (rentAmount/100) FROM Properties;

--- CALCULATED FIELDS RENAMING ---
SELECT (rentAmount/100) AS Calculated_Rent FROM Properties;

--- Applying CONDITION ---
SELECT name,age FROM Renter WHERE age > 30;

--- RANGE SEARCH ---
SELECT area_sqft,no_of_rooms,rentId FROM Properties WHERE rentAmount BETWEEN 12000 AND 22000;
SELECT area_sqft,no_of_rooms,rentId FROM Properties WHERE rentAmount NOT BETWEEN 12000 AND 22000;

--- SET MEMBERSHIP ---
SELECT area_sqft,no_of_rooms,address FROM Properties WHERE rentAmount IN(15000,17000);
SELECT area_sqft,no_of_rooms,address FROM Properties WHERE rentAmount NOT IN(15000,17000);

--- ORDER BY MULTIPLE COLUMNS ---
SELECT area_sqft,no_of_rooms,rentAmount,ownerId,constructionYear FROM Properties ORDER BY constructionYear,rentAmount;

-------------------------------------------------------------------------------LAB 4 SQLs-------------------------------------------------------------------------------

--- AGGREGATE FUNCTIONS ---

--- COUNT ---
SELECT COUNT(*) FROM Users;

--- MAX ---
SELECT MAX(rentAmount) FROM Properties;

--- MIN ---
SELECT MIN(rentAmount) FROM Properties;

--- SUM ---
SELECT SUM(rentAmount) FROM Properties;

--- AVG ---
SELECT AVG(rentAmount) FROM Properties;

--- ALL TOGETHER ---
SELECT COUNT(area_sqft), SUM(area_sqft), AVG(area_sqft), MIN(area_sqft), MAX(area_sqft) FROM Properties;


-------------------------------------------------------------------------------LAB 5 SQLs-------------------------------------------------------------------------------

--- SUBQUERY OR NESTED QUERY ---
SELECT 	area_sqft,no_of_rooms,rentAmount
FROM Properties WHERE rentId IN(
	SELECT rentId FROM Properties 
	WHERE address = 'Dhaka');

INSERT INTO Owner(ownerId,nId,name,phone,email,usrId)
SELECT (select max(ownerId) from Owner)+1,nId,name,phone,email,usrId
FROM Renter WHERE usrId = 5;

SELECT ownerId,nId,name,phone,email,usrId FROM Owner;


--- UNION ALL OPERATION ---
SELECT name,phone,email 
FROM Owner
WHERE address = 'Dhaka'
UNION ALL
SELECT o.name,o.phone,o.email 
FROM Owner o
WHERE o.usrId IN (
	SELECT r.usrId 
	FROM Owner o, Renter r
	WHERE r.usrId = o.usrId
);

SELECT address 
FROM Owner
UNION ALL
SELECT address 
FROM Properties;

--- UNION OPERATION ---
SELECT address 
FROM Owner
UNION
SELECT address 
FROM Properties;

--- INTERSECT OPERATION ---
SELECT address 
FROM Owner
INTERSECT
SELECT address 
FROM Properties;

--- MINUS OPERATION ---
SELECT address 
FROM Owner
MINUS
SELECT address 
FROM Properties;

--- Precedence of Set Operators ---
SELECT ownerId
FROM Owner
UNION
SELECT ownerId
FROM Properties
INTERSECT
SELECT ownerId
FROM Properties p
WHERE p.address = 'Dhaka';

SELECT ownerId
FROM Owner
INTERSECT
SELECT ownerId
FROM Properties p
WHERE p.address = 'Dhaka'
UNION
SELECT ownerId
FROM Properties;


-------------------------------------------------------------------------------LAB 6 SQLs-------------------------------------------------------------------------------

--- JOIN ---
SELECT p.address,p.area_sqft,p.no_of_rooms,r.contract_Time_yrs,r.advancePayment
FROM Properties p JOIN RentProperty r
USING (rentId);

--- NATULAL join ---
SELECT p.address,p.area_sqft,p.no_of_rooms,r.contract_Time_yrs,r.advancePayment
FROM Properties p NATURAL JOIN RentProperty r;

--- CROSS JOIN ---
SELECT p.address,p.area_sqft,p.no_of_rooms,r.contract_Time_yrs,r.advancePayment
FROM Properties p CROSS JOIN RentProperty r;

--- INNER JOIN ---
SELECT p.address,p.area_sqft,p.no_of_rooms,r.contract_Time_yrs,r.advancePayment
FROM Properties p INNER JOIN RentProperty r
USING (rentId);

--- OUTER JOIN ---

--- LEFT OUTER JOIN ---
SELECT p.address,p.area_sqft,p.no_of_rooms,r.contract_Time_yrs,r.advancePayment
FROM Properties p LEFT OUTER JOIN RentProperty r
USING (rentId);

--- RIGHT OUTER JOIN ---
SELECT p.address,p.area_sqft,p.no_of_rooms,r.contract_Time_yrs,r.advancePayment
FROM Properties p RIGHT OUTER JOIN RentProperty r
USING (rentId);

--- FULL OUTER JOIN ---
SELECT p.address,p.area_sqft,p.no_of_rooms,r.contract_Time_yrs,r.advancePayment
FROM Properties p FULL OUTER JOIN RentProperty r
USING (rentId);

--- EQUI JOIN ---
SELECT rt.contract_Time_yrs, p.renterId
FROM RentProperty rt JOIN Properties p 
USING (rentId);

--- NON-EQUI JOIN ---
SELECT p.address, p.no_of_rooms, p.area_sqft, o.name, o.address
FROM Properties p JOIN Owner o
ON p.rentAmount BETWEEN 13000 AND 20000;

--- SELF JOINING ---
SELECT p.address, q.area_sqft
FROM Properties p JOIN Properties q
ON p.pId = q.pId;



-------------------------------------------------------------------------------LAB 7 SQLs-------------------------------------------------------------------------------

--- PL/SQL ---

--- find maximum rent amount from properties table ---
SET SERVEROUTPUT ON
DECLARE
	max_rent Properties.rentAmount%type;
BEGIN
    SELECT Max(RentAmount) INTO max_rent FROM Properties;
    DBMS_OUTPUT.PUT_LINE('The maximum rent amount is : '|| max_rent);
END;
/

--- find specific item and set a variable with value ---
SET SERVEROUTPUT ON
DECLARE
  	RenterName Renter.Name%type;
  	oId Owner.ownerId%type := 4003;
BEGIN
  	SELECT name INTO RenterName
  	FROM Renter, Properties
 	WHERE Renter.renterId = Properties.renterId
  	AND Properties.ownerId = oId;
  	DBMS_OUTPUT.PUT_LINE('Name of renter: ' || RenterName);
END;
/


--- PL SQL using condition check statement ---
SET SERVEROUTPUT ON
DECLARE
	initial_amount Properties.rentAmount%type;
	rt_name VARCHAR(100);
	discounted_amount Properties.rentAmount%type;
	
BEGIN
	rt_name := 'Tamim';
	SELECT rentAmount INTO initial_amount
	FROM Properties,Renter
	WHERE Properties.renterId = Renter.renterId AND Renter.name = rt_name;
	IF initial_amount <= 10000  THEN
		discounted_amount := initial_amount;
	ELSIF initial_amount > 10000 AND initial_amount <= 15000  THEN
		discounted_amount := initial_amount-(initial_amount*.10);
	ELSIF initial_amount > 15000 AND initial_amount <= 20000  THEN
		discounted_amount := initial_amount-(initial_amount*.25);
	ELSE
		discounted_amount := initial_amount-(initial_amount*.50);
		END IF;
 
DBMS_OUTPUT.PUT_LINE (rt_name || ' : Original rent amount: '|| initial_amount ||', Disounted rent amount: '|| ROUND(discounted_amount,2));
EXCEPTION
        WHEN others THEN
	    DBMS_OUTPUT.PUT_LINE (SQLERRM);
END;
/
SHOW errors


-------------------------------------------------------------------------------LAB 8 SQLs-------------------------------------------------------------------------------

--- PL/SQL Programming 2 ---

--- CURSOR ---

--- Using FOR loop to find first five users ---
SET SERVEROUTPUT ON
DECLARE
    CURSOR user_cur IS SELECT name, phone, email FROM Users;
    user_record user_cur%ROWTYPE;

BEGIN
OPEN user_cur;
    LOOP
        FETCH user_cur INTO user_record;
        EXIT WHEN user_cur%ROWCOUNT > 5;
      	DBMS_OUTPUT.PUT_LINE ('User name : ' || user_record.name || ', Email: ' || user_record.email || ', Phone: ' || user_record.phone);
      	END LOOP;
    CLOSE user_cur;   
END;
/


--- Using FOR LOOP to find a renter who pays rent amount > 20000 ---
SET SERVEROUTPUT ON
DECLARE
	CURSOR rtr_Cur IS SELECT rentAmount, renterId FROM Properties;
	rtr_record rtr_Cur%ROWTYPE;
	rtName Renter.name%type;
	rtAge Renter.age%type;
BEGIN
	OPEN rtr_cur;
	LOOP
		FETCH rtr_Cur INTO rtr_Record;
		EXIT WHEN rtr_cur%ROWCOUNT > 5;
		IF(rtr_Record.rentAmount > 20000) THEN
			EXIT;
			END IF;
		END LOOP;
		SELECT name INTO rtName FROM Renter WHERE Renter.renterId = rtr_Record.renterId;
		SELECT age INTO rtAge FROM Renter WHERE Renter.renterId = rtr_Record.renterId;
	DBMS_OUTPUT.PUT_LINE ('Renter name : ' || rtName || ', Age: ' || rtAge);
	CLOSE rtr_Cur;
END;
/


--- PL/SQL Procedures ---

--- Procedure to get Owner Id name and nid from from Property Id ---
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE getOwner IS
	PropId Properties.pId%type;
	OwName Owner.name%type;
	OwNid Owner.nid%type;
BEGIN
	PropId := 304;
	SELECT name INTO OwName FROM Owner
	WHERE Owner.ownerId IN (
		SELECT ownerId FROM Properties 
		WHERE Properties.pId = PropId
	);
	SELECT nid INTO OwNid FROM Owner
	WHERE Owner.ownerId IN(
		SELECT ownerId FROM Properties 
		WHERE Properties.pId = PropId
	);
	DBMS_OUTPUT.PUT_LINE ('Property Id : ' || PropId || ', Owner Name : ' || OwName || ', Owner Nid : ' || OwNid);
END;
/
SHOW ERRORS;

BEGIN
	getOwner;
END;
/

--- PL/SQL Functions ---

--- Function to get average rent amount ---
SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION avgRent RETURN NUMBER IS
	avg_amount Properties.rentAmount%type;

BEGIN 
	SELECT AVG(rentAmount) INTO avg_amount
	FROM Properties;
	RETURN avg_amount;
END;
/

BEGIN 
	DBMS_OUTPUT.PUT_LINE ('The average rent amount is: ' || avgRent);
END;
/

--- Function to get total rent amount ---
SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION totalRent RETURN NUMBER IS
	total_amount Properties.rentAmount%type;

BEGIN 
	SELECT SUM(rentAmount) INTO total_amount
	FROM Properties;
	RETURN total_amount;
END;
/

BEGIN 
	DBMS_OUTPUT.PUT_LINE ('The total rent amount is: ' || totalRent);
END;
/

--- Function to get annual rent amount with property tax included ---
SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION annualRent(
	amount Properties.rentAmount%type,
	tax NUMBER
)
RETURN NUMBER IS

BEGIN 
	RETURN ROUND((amount+(amount*tax*0.01))*12,2);
END;
/

BEGIN 
	DBMS_OUTPUT.PUT_LINE ('The annual rent amount(tax included) is: ' || annualRent(15000,5));
END;
/


--- Calling all functions together ---
BEGIN 
	DBMS_OUTPUT.PUT_LINE ('The average rent amount is: ' || avgRent);
	DBMS_OUTPUT.PUT_LINE ('The total rent amount is: ' || totalRent);
	DBMS_OUTPUT.PUT_LINE ('The annual rent amount(tax included) is: ' || annualRent(15000,5));
END;
/


-------------------------------------------------------------------------------LAB 9 SQLs-------------------------------------------------------------------------------

SELECT * FROM Properties;
COMMIT;

ALTER TABLE Properties ADD rent_grade CHAR(10);

--- ADDING TRIGGER FOR CONDITION ---
CREATE OR REPLACE TRIGGER trGrade
BEFORE INSERT OR UPDATE ON rent_grade
FOR EACH ROW

BEGIN
	IF :NEW.rentAmount >= 30000 
		THEN NEW.rent_grade := 'A';g
	ELSIF :NEW.rentAmount >= 20000 AND :NEW.rentAmount < 30000
		THEN NEW.rent_grade := 'B';
	ELSIF :NEW.rentAmount >= 15000 AND :NEW.rentAmount < 20000
		THEN NEW.rent_grade := 'C';
	ELSIF :NEW.rentAmount < 15000 
		THEN NEW.rent_grade := 'D';
		END IF;
END trGrade;

INSERT INTO Properties(pId,rentAmount) VALUES (401,35000);
INSERT INTO Properties(pId,rentAmount) VALUES (402,25000);
INSERT INTO Properties(pId,rentAmount) VALUES (403,18000);
INSERT INTO Properties(pId,rentAmount) VALUES (404,9000);

SELECT * FROM Properties;

ROLLBACK;
