 CREATE TABLE customer
(
cust_id   INT PRIMARY KEY,
cust_name VARCHAR(20) NOT NULL
);
CREATE TABLE item
(
item_id INT PRIMARY KEY, 
item_name VARCHAR(25), 
price INT
);

CREATE TABLE sale
(
bill_no   INT PRIMARY KEY,
bill_date DATE NOT NULL,
cust_id   INT NOT NULL,
item_id   INT NOT NULL,
qty_sold  NUMERIC(6,3) NOT NULL,
FOREIGN KEY(item_id) 
REFERENCES item(item_id),
FOREIGN KEY (cust_id) 
REFERENCES customer(cust_id)
  );
  
  INSERT INTO customer VALUES
  (1,'Rekha'),
  (2,'Rani'),
  (3,'Rocky'),
  (4,'Xin'),
  (5,'Kim');

   
  INSERT INTO item VALUES( 1, 'Rusk', 120),(2,'banana',50),(3,'handwash',60),(4,'cake',420),(5,'sweets',25);

  INSERT INTO sale VALUES ( 10, '2020-10-01', 1, 1, 3), ( 11, '2020-10-01', 1, 3, 2),
   ( 12, '2020-10-01', 1, 5, 7),   ( 13, '2018-10-01', 4, 4, 1),  
   ( 14, '2018-10-11', 4, 2, 2),  ( 15, '2018-09-29', 5, 1, 5),( 16, '2019-12-25', 3, 1, 5),( 17, '1995-06-21', 5, 4, 4),
  ( 18,'2002-04-01', 4, 5, 5),( 19, '2020-02-12', 1, 2, 1);
  
  select * from sale;
  
 3. SELECT *FROM customer,item,sale WHERE price      > 200 AND sale.item_id = item.item_id AND 
 sale.cust_id = customer.cust_id;
 4. SELECT C.cust_id,cust_name,SC.COUNT,SC.bill_date FROM CUSTOMER C,
(SELECT COUNT(ITEM_ID) AS COUNT,bill_date,cust_id FROM SALE GROUP BY bill_date) SC WHERE C.cust_id=SC.cust_id;

5 SELECT cust_name,  COUNT(item_id), bill_date  FROM customer c,  sale s WHERE c.cust_id = s.cust_id
 GROUP BY cust_name,  bill_date HAVING extract(YEAR FROM bill_date) = 2018;
6 SELECT item_name FROM item,  sale WHERE sale.item_id = item.item_id AND sale.cust_id   = 5;
7 
SELECT item_name,S.bill_date FROM ITEM I,SALE S WHERE I.item_id=S.item_id AND S.bill_date=CURDATE();
8 SELECT item_name,qty_sold,   price,(qty_sold * price) AS total_amount  FROM customer,   item,   sale
 WHERE cust_name  = 'Rekha' AND sale.item_id = item.item_id AND sale.cust_id = customer.cust_id;
[10:00 PM, 6/15/2021] Abhirami: CREATE TABLE STUDENT_INFO(Sid  INT UNIQUE ,Stud_name   VARCHAR(20) NOT NULL,
      stude_score numeric(5,2) DEFAULT 20);

ALTER TABLE STUDENT_INFO ADD PRIMARY KEY (Sid);
DESCRIBE STUDENT_INFO;
INSERT INTO STUDENT_INFO VALUES(1,'ANU',198),(2,'ALPU',123),(3,'ANISH',190),(4,'ALB',200);
UPDATE STUDENT_INFO SET Stude_score = Stude_score + 5 WHERE Stude_score > 150;
SELECT *FROM STUDENT_INFO;
CREATE TABLE worker
    (
   Worker_ID    INT,
        first_name   VARCHAR(15),
        last_name    VARCHAR(15),
        salary       NUMERIC(8),
        joining_date DATE,
        department   VARCHAR (15)
      );

CREATE TABLE bonus
( Worker_ID INT, bonus_date DATE, 
    bonus_amount NUMERIC(6) );
ALTER TABLE worker ADD PRIMARY KEY (Worker_ID);
    
ALTER TABLE bonus ADD CONSTRAINT fk_cod_csd 
      FOREIGN KEY(Worker_ID) REFERENCES 
     worker(Worker_ID) ON DELETE CASCADE ;
INSERT INTO worker VALUES (1,'monika','arora',100000,'2014-02-20','hr'),(2,'niharika','verma',80000,'2014-06-11','admin'),
(3,'vishal','singhal',300000,'2014-02-20','hr'),(4,'amithabh','singh',500000,'2014-02-20','admin'),
(5,'vivek','bhati',500000,'2014-06-11','admin'),
(6,'vipul','diwan',200000,'2014-06-11','account'),
(7,'satich','kumar',75000,'2014-01-20','admin');
INSERT INTO worker VALUES(8,'Geetika','Chauhan',90000,'2014-04-11','admin');
select *from worker;
INSERT INTO bonus VALUES (1,'2016-02-20',5000),(2,'2016-06-11',3000),(3,'2016-02-20',4000),(1,'2016-02-20',4500),
(2,'2016-06-11',3500);
select *from bonus;
SELECT first_name AS worker_name FROM worker;
SELECT * FROM worker ORDER BY trim(first_name) ASC ;
SELECT * FROM worker WHERE trim(first_name) != 'vipul' AND trim(first_name)   != 'satich';
select *from worker where department='admin';
SELECT * FROM worker WHERE salary BETWEEN 100000 AND 500000;
SELECT upper(first_name) FROM worker;
SELECT distinct department FROM worker;
SELECT SUBSTR(first_name,  1, 3) AS small FROM worker;
SELECT rtrim(first_name) FROM worker;
SELECT ltrim(department) FROM worker;
SELECT distinct department, LENGTH(department) FROM worker ;
SELECT REPLACE(first_name, 'a', 'A') AS fname FROM worker;
SELECT first_name,last_name,department,salary,bonus_amount  FROM worker,bonus WHERE worker.worker_id = bonus.worker_id AND bonus_amount  > 4000 ;
DELETE from worker WHERE worker_id=7;
SELECT * FROM worker;
ALTER TABLE bonus DROP CONSTRAINT fk_cod_csd;
ALTER TABLE bonus ADD CONSTRAINT fk_cod_na FOREIGN KEY(Worker_ID) 
REFERENCES worker(Worker_ID) ON DELETE no action ;
DELETE from worker WHERE worker_id=8;
SELECT * FROM worker;