create table Animals(
    Animal_Id NUMBER(6) PRIMARY KEY NOT NULL,
    Animal_Name CHAR(50),
    Breed CHAR(50),
    Price NUMBER(8,2),
    Owner_Id NUMBER(6) NOT NULL,
    FOREIGN KEY (Owner_Id) REFERENCES Farmers(Owner_Id) ON DELETE CASCADE);

create table Farmers(
    Owner_Id NUMBER(6) PRIMARY KEY NOT NULL,
    F_name CHAR(50),
    L_name CHAR(50),
    No_Animals NUMBER(6),
    Farm_Location CHAR(50)
);

INSERT INTO Farmers VALUES (211, 'Garcia', 260, 'Mwangi','Kamakwa');

INSERT INTO Farmers VALUES (222, 'Parikh', NULL, 'Lyster', 'Kasarani');

INSERT INTO Farmers VALUES (233, 'Ethera', 308, 'Dlamini', 'Roysambu');

INSERT INTO Farmers VALUES (234, 'Eisenhauer', NULL, 'Kinyaiti', 'Kayole');

INSERT INTO Farmers VALUES (255, 'Bayer', 600, 'Achembe', 'Thika');

INSERT INTO Farmers VALUES (266, 'Molly', 768, 'Hamisi', 'Ruiru');

CREATE SEQUENCE ANIMALID_SEQ START WITH 1111 INCREMENT BY 101;

INSERT INTO Animals VALUES (ANIMALID_SEQ.NEXTVAL, 'Abondance', 'Freanch', 70000, 233);

INSERT INTO Animals VALUES (ANIMALID_SEQ.NEXTVAL, 'Kurganskaya', 'Russian ', 21000, 234);

INSERT INTO Animals VALUES (ANIMALID_SEQ.NEXTVAL, 'Hallikar', 'Indian', 17800, 211);

INSERT INTO Animals VALUES (ANIMALID_SEQ.NEXTVAL, 'Amritmahal', 'Indian', 30000, 255);

INSERT INTO Animals VALUES (ANIMALID_SEQ.NEXTVAL, 'Camargue', 'French', 59000, 211);

INSERT INTO Animals VALUES (ANIMALID_SEQ.NEXTVAL, 'Tarentaise', 'French', 66000, 266);

INSERT INTO Animals VALUES (ANIMALID_SEQ.NEXTVAL, 'Kankrej', 'Indian', 37000, 222);

INSERT INTO Animals VALUES (ANIMALID_SEQ.NEXTVAL, 'Voderwald', 'German', 23600, 266);

INSERT INTO Animals VALUES (ANIMALID_SEQ.NEXTVAL, 'Gelbvieh', 'German', 89000, 222);
 

select breed, price from Animals order by price desc;

SELECT Animal_Name FROM Animals  WHERE Animal_Name LIKE '%e' WHERE Animal_Name LIKE 'k%';

alter table Farmers add farm_size number(25);

SELECT MIN(Price) my_lowest,
MAX(Price) my_highest,
AVG(Price) my_average
FROM Animals; 

select F_name, L_name from Farmers where No_Animals IS NULL;

UPDATE Farmers SET Farm_Location = ‘Muiga’, No_Animals = 85000 WHERE Owner_Id = 211;

SELECT Animal_Name FROM Animals  WHERE Animal_Name LIKE '%__a___';

SELECT Animals,
COUNT(Price) AS myCount,
SUM(Price) AS mySum
FROM Animals
GROUP BY breed
HAVING COUNT() < 100000
ORDER BY Animals; 

Alter sequence ANIMALID_SEQ MAXVALUE 1000;

DELETE from Animals where Owner_Id = 266;

-- A query statement to change the name of the table Farmers to Wakulima
RENAME Farmers to Wakulima;

-- A query statement to create an index on the animals table on name and breed. 
CREATE INDEX Animalindex on Animals (Animal_Name, breed);

-- Query statements to create a procedure to increase the Price by 100. 
CREATE OR REPLACE PROCEDURE UPDATEPRIICE AS
BEGIN
UPDATE Animals SET Price=Price+100;
DBMS_OUTPUT.PUT_LINE(‘PAYEMNTS Modified!’);
End;
/