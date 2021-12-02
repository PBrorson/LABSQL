-- Har jobbat ihop med Johan i Nyköping. 

select Spacecraft,
    [Launch date],
    [Carrier rocket],
    Operator,
    [Mission type]
into SuccessfulMissions
from MoonMissions
where Outcome = 'Successful'; 
GO

UPDATE 
 SuccessfulMissions
SET
   Operator = trim(Operator)  
GO

update  SuccessfulMissions
set Spacecraft = 
trim( left(Spacecraft , 
CHARINDEX('(', Spacecraft + '(')-1 ) )
from SuccessfulMissions;

GO

select
    Operator ,
    [Mission type],
count(Operator + [Mission type]) 
as [Mission count]
from SuccessfulMissions
group by Operator, [Mission type]
having count(Operator + [Mission type]) > 1
GO


select ID, UserName, [Password],
concat(FirstName ,' ',LastName) as Name,
case when convert(int,SUBSTRING(id, 10,1) % 2) = 0
then 'Female' else 'Male'  END as Gender,Email,Phone
into NewUsers
from Users;
Go

select UserName, COUNT(UserName )AS double
from NewUsers
group by UserName
having count(UserName ) > 1
GO

update NewUsers
set UserName =  substring(Name, 2,4 )
where UserName  in ('felber', 'sigpet') 

GO

DELETE FROM NewUsers 
WHERE LEFT(ID,2) < 70;
GO

insert into NewUsers
    (ID,UserName,[Password],Name,Gender,Email,Phone)
values
    ('880808-1234', 'bruwa', '3a11a11a11a111122221a11abc1a1111',
        'Bruce Wayne', 'Male', 'thebatman@darkknight.com', '0712-345678' );
GO
