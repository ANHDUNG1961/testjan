 ---------PRACTICAL DATABASE TEMPLATE -------------
—-----------------
EMPLOYEE MANAGEMENT is a part of human resource management. The employee management problem of my company in Vietnam could previously be expressed as follows:
I set up 6 tables including: phongban, diadiem, nhanvien, dean, thannhan, phan cong.
—-------------------
----command to create table 'phongban' for database, primary key = maphg  -----


CREAT TABLE quanlynhanvien.phongban
(
        tenphg          varchar(40),
        maphg           int,
        trphg           varchar(9),
        ng_nhanchuc     date,
        CONSTRAINT pk_maphg, diadiem 

CREAT TABLE quanlynhanvien.diadiem_phg
(
         maphg int,

         diadiem varchar(50),

         CONSTRAINT pk_diadiemphg PRIMARY KEY (maphg, diadiem)

);
----------
-- command to create table 'nhanvien' for database, primary key = manv 

CREAT TABLE quanlynhanvien.nhanvien
(
         honv varchar(20),
         tenlot varchar(20),
         namenv varchar(20),
         manv varchar(9),
         ngsinh date,
         dchi varchar(100),
         fade varchar(3),
         luong float,
         ma_nql varchar(9),
         phg int,

         CONSTRAINT pk_nhanvien PRIMARY KEY (manv)
);

-- command to create 'dean' state for database, primary key = mada —

CREAT TABLE quanlynhanvien.dean
(
         tenda varchar(100),
         mada int,
         ddiem_da varchar(50),
         Phong int,

         CONSTRAINT pk_dean PRIMARY KEY (mada)

);

-- command to create table 'thannhan' for database, primary key = ma_nvien, tentn 
—
CREAT TABLE quanlynhanvien.thannhan
(
         ma_nvien varchar(9),
         tentn varchar(50),
         fade varchar(3),
         ngsinh date,
         arounde varchar(20),

         CONSTRAINT pk_thannhan PRIMARY KEY (ma_nvien, tentn)

);

-- command to create table 'phancong' for database, primary key = ma_nvien, soda
—
CREAT TABLE quanlynhanvien.phancong
(
         ma_nvien varchar(9),
         soda int,
         time date,

         CONSTRAINT pk_phancong PRIMARY KEY (ma_nvien, soda)

);

------------finished creating boards for the database 

—---
There are two ways to create constraints in SQL, the first is to add the constraint when creating the table using the CREATE TABLE statement. The second way to create a constraint is to use the ALTER TABLE statement, which is often used to edit an existing constraint or add a new one.
Here we use the second method.
—------

—---TO CREATE FOREIGN KEYS FOR THE TABLES—-

-- 1. create foreign key for two table 'phongban' and 'ddiem_phg' (one- to -many)
ALTER TABLE diadiem_phg  ADD  CONSTRAINT fk_phongban_ddiem_phg FOREIGN KEY (maphg) REFERENCES phongban(maphg)

-- 2. create foreign medicine for 2 states 'nhanvien - phong ban' (many-to-one)

ALTER TABLE nhanvien ADD  CONSTRAINT fk_nhanvien_phongban FOREIGN KEY (phg) REFERENCES  phongban(maphg)

-- 3. create external department for 2 states 'staff - department (officer 1 - n) need to change again (ma_nql or manv)

ALTER TABLE phongban ADD CONSTRAINT fk_phongban_nhanvien FOREIGN KEY (trphg) REFERENCES  nhanvien(manv)

-- 4. Create a foreign policy for 2 states 'thannhan - nhanvien' (quan he 1-n)

ALTER TABLE thannhan  ADD CONSTRAINT fk_thannhan_nhanvien FOREIGN KEY (ma_nvien) REFERENCES  nhanvien(manv)

-- 5. create foreign science for 2 states 'phancong - nhanvien' (quan he 1-n)

ALTER TABLE phancong ADD CONSTRAINT fk_phancong_nhanvien FOREIGN KEY (ma_nvien) REFERENCES nhanvien(manv)

-- 6. create foreign science for 2 states 'phancong - dean' (quan he 1-n)

ALTER TABLE  phancong ADD CONSTRAINT fk_phancong_dean FOREIGN KEY (soda) REFERENCES  dean(mada)

-- 7. I'll give advice to the employee

ALTER TABLE nhanvien ADD CONSTRAINTt fk_nhanvien_nhanvien FOREIGN KEY (ma_nql) REFERENCES  nhanvien(manv)
----------------------

------INPUT DATA FOR THE TABLES-----

-- 1. Enter the data for 'phongban' table

INSERT INTO quanlynhanvien.phongban (namephg, maphg, trphg, ng_nhanchuc) VALUES

         ('Manager',1,NULL,'1971-06-19'),

         ('Organization',2,NULL,'2001-01-15'),

         ('Executive',4,NULL,'1985-01-01'),

         ('Research',5,NULL,'1978-05-22')

-- 2. Enter the data for 'diadiem_phg'

INSERT INTO quanlynhanvien.diadiem_phg (maphg, diadiem)VALUES

         (1,'Vung Tau'),

         (2,'HCMC'),

         (2,'Nha Trang'),

         (4,'HCMC'),

         (5,'Hanoi'),

         (5,'HCMC')

       

-- 3 Enter the data for table 'nhanvien'

INSERT INTO quanlynhanvien.nhanvien (honv, tenlot, namenv, manv, ngsinh, dchi, pha, luong, ma_nql, phg) VALUES

         ('Cao','Si','Ki','123123456','1986-08-09','123 Le Loi - District 1 - HCMC','Male',15000,NULL,5),

         ('Dinh','Ba','Tien','123456789','1955-01-09','731 Tran Hung Dao - District 1 - HCMC','Nam',30000,NULL,5),

         ('Truong','Le','Doan','147852369','1986-05-15','22/41/1 Nguyen hue-Dítric 1-HCMC','Male',20000,NULL, 5),  
         ('LE', 'ANH','DUNG','123112345','1961-07-25', 9 Xa Dan - Dítrict 3 - Hanoi', 'Male',35000, NULL, 1),
--------------------------------------------

--------------Frequently Asked Questions-----

--1.List employees (MANV,HONV, TENLOT,TENNV) working in 'NC' department
SELECT MANV, HONV, TENLOT, TENNV
FROM NHANVIEN
WHERE PHONG = 'NC'

--2.List employees with salary over 3,000,000
SELECT MANV, HONV, TENLOT, TENNV
FROM NHANVIEN
WHERE MLUONG > 3000000

--3 List the full names of employees and the names of the –departments they belong to with salaries from 2,000,000 to 3,000,000
SELECT HONV+' ' +TENLOT+''+TENNV AS 'TENNV',PHONG
FROM NHANVIEN
WHERE MLUONG BETWEEN 2000000 AND 3000000

--4. List the full names of employees in "HCMC"
SELECT HONV+' ' +TENLOT+''+TENNV AS 'TENNV'
FROM NHANVIEN
WHERE DCHI LIKE'%HCMC'

--5. List date of birth and address of 'Dinh Ba Tien' employee
SELECT NOWSINH,DCHI
FROM NHANVIEN
WHERE HONV ='Dinh' and TENLOT='Ba' and TENNV='Tien'

--6. List of relatives under 18 years old of employees with code —'NV001'
SELECT HONV+' ' +TENLOT+''+TENNV AS 'TENNV'
FROM NHANVIEN
WHERE YEAR(GETDATE())-YEAR(NGAYSINH)<18 and MANV ='001'

--7. lists all female employees over 30 years old
SELECT HONV+' ' +TENLOT+' '+TENNV AS 'TENNV'
FROM NHANVIEN
WHERE YEAR(GETDATE())-YEAR(SAYSINH)>30 and PHAI='NU'

--8. For each department, list the department name and department —location
SELECT TENPHG, DIADIEM
FROM PHONGBAN PB,DIADIEM_PHG DD
WHERE PB.MAPHG = DD.MAPHG

--9. List the heads of each department
SELECT MAPHG, HONV+' ' +TENLOT+' '+TENNV AS 'TENNV'
FROM PHONGBAN AS PB,NHANVIEN AS NV
WHERE PB.TRPHG=NV.MANV

--10. list TENDA, MADA, DDIEM_DA, PHONG, TENPHG, MAPHG, TRPHG, NGNC
SELECT TENDA, MADA, DDIEM_DA,DA.PHONG,TENPHG,PB.MAPHG,TRPHG,NGNC
FROM PHONGBAN PB, DEAN DA, DIADIEM_PHG DD
WHERE PB.MAPHG=DA.PHONG and PB.MAPHG =DD.MAPHG
		  
--11. List the names and addresses of all employees of the "Nghien —cuu" department
SELECT HONV+' ' +TENLOT+' '+TENNV AS 'TENNV', DCHI
FROM PHONGBAN PB,NHANVIEN NV
WHERE PB.MAPHG=NV.PHONG and TENPHG='NGHIEN CUU'
		  
--12. List the codes and names of employees in the "Nghien Cuu" —department participating in the "Chinese News" project with —working hours of 20 hours/week.
SELECT NV.MANV,HONV+' ' +TENLOT+' '+TENNV AS 'TENNV'
FROM PHONGBAN PB,NHANVIEN NV,DEAN DA,PHANCONG PC
WHERE PB.MAPHG=NV.PHONG and PB.MAPHG=DA.PHONG and DA.MADA=PC.MADA and PC.MANV=NV.MANV and
TENPHG='NGIEN CUU' and TENDA ='TIN HOC HOA 1' and THOIGIAN =20

--13. List the names of female employees and the names of their –relatives
SELECT NV.MANV, HONV+' ' +NV.TENLOT+' '+NV.TENNV AS 'TEN NHAN', TN.TENTN AS 'TEN THAN'
FROM THANNHAN TN, NHANVIEN NV
WHERE NV.MANV=TN.MANV
--14. For all projects in "Ha Noi", list the project code (MADA), the —project's department code (PHONG), and the school's name —(HONV<tenlot,name).
--as well as the person's address (DCHI) and date of birth (NGSINH).
SELECT DA.MADA, DA.PHONG, HONV+' '+TENLOT+' '+TENNV AS 'TEN TRUONG PHONG', DCHI, NGHINH
FROM PHONGBAN PB,NHANVIEN NV,DEAN DA,PHANCONG PC
WHERE PB.MAPHG=DA.PHONG and DA.MADA=PC.MADA and PC.MANV=PB.TRPHG and PB.TRPHG=NV.MANV and
DDIEM_DA ='HANOI'

--15. For each employee, list the employee's full name and the full name of that employee's direct manager
SELECT N1.HONV, N1.TENNV, N2.HONV AS HONQL, N2.TENNV AS TENNQL
FROM NHANVIEN N1 LEFT JOIN NHANVIEN N2 ON N1.MA_NQL = N2.MANV

--16.For each project, list the project name (TENDA) and the total number of working hours per week for all employees participating in that project.
SELECT DA.MADA,TENDA, SUM(THOIGIAN) AS TONG_TG
FROM DEAN DA, PHHANCONG PC, NHANVIEN NV
WHERE NV.MANV=PC.MANV and PC.MADA=DA.MADA
GROUP BY DA.MADA,TENDA

--17.For each employee, list the employee's full name and how many –relatives the employee has.
SELECT NV.MANV,HONV,TENNV, COUNT(MATN) AS TONG_TN
FROM NHANVIEN NV, THANNHAN TN
WHERE NV.MANV=TN.MANV
GROUP BY NV.MANV,HONV,TENNV
--18. FOR each department, list the department name (TENPHG) and the average salary of the employees working for that department.
SELECT MAPHG,TENPHG, AVG(MLUONG) AS LUONG_tb
FROM NHANVIEN NV,PHONGBAN PB
WHERE NV.PHONG=PB.MAPHG
GROUP BY MAPHG,TENPHG

--19. Shows the average salary of all female employees
SELECT AVG(MLUONG) AS LUONG_tb
FROM NHANVIEN
WHERE PHAI='NU'

--20.For departments with an average salary of over 30,000, list the –department name and the number of employees in that department.
SELECT MAPHG,TENPHG,COUNT(MANV) AS SO_LUONG, AVG(MLUONG) AS LUONG_tb
FROM NHANVIEN NV,PHONGBAN PB
WHERE NV.PHONG=PB.MAPHG
GROUP BY MAPHG,TENPHG
HAVING AVG(MLUONG) >30000

