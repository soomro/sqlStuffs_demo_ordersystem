e1

Select Book_copies.No_Of_Copies from Book_copies 
join Book on
 Book.BookId = Book_copies.BookId And
 books.title = 'The Lost Tribe'
join Library_Branch on 
Book_copies.BranchId = Library_Branch.branchId
And BranchName.BranchName = 'Sharpstown'


e2


Select Book_copies.No_Of_Copies , book_Copies.branchID ,Library_Branch.BranchName from Book_copies 
join Book on
 Book.BookId = Book_copies.BookId And
 books.title = 'The Lost Tribe'
 join Library_Branch on 
Book_copies.BranchId = Library_Branch.branchId

e3

select Borrower.Name
from Borrower
join Book_Loans on
Borrower.CardNo = Book_Loans.CardNo
Where
-------------------------------------
WHERE	NOT EXISTS (SELECT *
				FROM BOOK_LOANS L
				WHERE B.CardNo = L.CardNo );
				/////////////////
	CardNo NOT IN (SELECT CardNo
					FROM BOOK_LOANS );


-------------------------------------///////////////////////
book_loans.dateout = '' // Mouhammad
book_loans.dateout = null  // waseem
--------------------------------------

e4

select Book.title ,borrower.name , borrower.adress
from borrower
join Book_loans
on 
Borrower.CardNo = Book_Loans.CardNo
And Book_Loans.DueDate = 'Today'
inner join Librar_Branch
on
Library_Branch.BranchId = Book_Loans.BranchId
And Libray_Branch.BranchName = 'Sharptown'  -- Waseem
Where Libray_Branch.BranchName = 'Sharptown'  -- Mouhammad
join Book
on Book_Loans.BookId = Book.BookId;

e5

select library_branch.Branchname , count(book_loans.dateout)
-------------------
from Library_branch
inner join book_loans on
Book_loans.branchId = Library_branch.branchId
where book_loans.dateout != '' -- Mouhammad
And book_loans.dateout != null  -- Waseem

select library_branch.Branchname , count(book_loans.BookId)
from Library_branch
inner join book_loans on
Book_loans.branchId = Library_branch.branchId
And book_loans.dateout != null  -- Waseem

e6


select borrower.name , borrower.adress , Book_copies.no_of_copies
from borrower
join Book_Loans on
Borrower.CardNo = Book_Loans.CardNo

join Library_Branch on
 Library_Branch.BranchId = Book_Loans.BranchId

join Book_Copies on
Book_Copies.BranchId = Library_Branch.BranchId

where 
count(book_loan.dateout) > 5
************************************
6.	SELECT	B.Name, B.Address, COUNT(*)
FROM		BORROWER B, BOOK_LOANS L
WHERE	B.CardNo = L.CardNo
GROUP BY	B.CardNo, B.Name, B.Address
HAVING	COUNT(*) > 5;


e7

select Book.Title, Book_copies.No_Of_Copies
from Book join
book_Authors
on
Book.BookId = Book_Authors.BookId And
Book_Authors.AuthorName = 'Stephen King'
join Book_Copies on
Book_Copies.BookId = Book.BookId
join Library_Branch on
Book_Copies.BranchId = Library_Branch.BranchId And
Library_branch.BranchName = 'Central'



e8

Select Employee.Fname, Employee.LName
from
Employee
join Department on 
Employee.Dno = Department.DNumber And
Employee.Dno = 5
join Project on
Department.DNumber = Project.Dnum And
Project.Pname = 'ProductX'
join Works_on on 
Project.Pnumber = Works_On.Pno And
Works_On.hours > 10;


e9

Select Project.PName, Employee.Fname, Employee.LName, Works_On.Hours
from
Project 
join Works_On On
Project.Pnumber = Works_On.Pno
join Employee On
Employee.SSN = Works_On.ESSN
********************************
9.	SELECT		PNAME, SUM (HOURS)
FROM		PROJECT, WORKS_ON
WHERE		PNUMBER=PNO
GROUP BY	PNAME;


e10
Select Project.PName, Employee.Fname, Employee.LName
from
Project 
join Works_On On
Project.Pnumber = Works_On.Pno And
Works_on.Hours <> 0
join Employee On
Employee.SSN = Works_On.ESSN
-----------------------------
SELECT	LNAME, FNAME
FROM	EMPLOYEE
WHERE	NOT EXISTS (SELECT PNUMBER
			FROM 	PROJECT
			WHERE 	NOT EXISTS (SELECT *
					FROM WORKS_ON
					WHERE PNUMBER=PNO AND ESSN=SSN ) );
---------------------------
e11
Select Project.PName, Employee.Fname, Employee.LName
from
Project 
join Works_On On
Project.Pnumber = Works_On.Pno And
Works_on.Hours = 0
join Employee On
Employee.SSN = Works_On.ESSN
-------------------------
SELECT		LNAME, FNAME
FROM		EMPLOYEE
WHERE		SSN NOT IN ( SELECT ESSN
				          FROM WORKS_ON);

-----------------------
e12
Select Employee.Fname, Employee.LName, Employee.Address
from Employee 
join Department on
Employee.Dno = Department.DNumber
join Dept_Locations on
Department.DNumber = Dept_Locations.DNumber And
Dept_Locations.DLocation <> 'Houston'
join Project on
Department.DNumber = Project.Dnum And
Project.PLocation = 'Houston'
join Works_On On
Project.Pnumber = Works_On.Pno
--------------------
SELECT	 LNAME, FNAME, ADDRESS 
FROM	EMPLOYEE
WHERE	EXISTS ( SELECT * 
		FROM WORKS_ON, PROJECT
		WHERE SSN=ESSN AND PNO=PNUMBER AND PLOCATION='Houston' )
		AND 
		NOT EXISTS ( SELECT * 
		FROM DEPT_LOCATIONS
		WHERE DNO=DNUMBER AND DLOCATION='Houston' );
------------------------


e13
Select Employee.LName 
from
Employee
join Depatment on
Employee.SSN = Department.MGRSSN 
join Dependent on
Employee.SSN = Dependent.ESSN And
-------------------------------------///////////////////////////
Dependent.Dependent_Name = null -- Waseem
Dependent.Dependent_Name = '' -- Waseem


e14

select Employee.Fname, Employee.LName
from employee
where employee.salary > avg(employee.salary)
order by employee.salary desc

E15

select Employee.Fname, Employee.LName
from employee
join Department on
Employee.Dno = Department.DNumber
where employee.salary > avg(employee.salary)
order by employee.salary 


