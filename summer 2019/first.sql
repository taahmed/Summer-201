select personlastname, personfirstname, personemail
from person
join employee using(personkey);

create table employee2
(
 	EmployeeID serial primary key,
	personlastname text, 
	personfirstname text,
	personemail text
);
select * from employee2;

Create  table Granttype2
(
	Granttypename text,
	Granttypeonetimemax numeric,
	Granttypelifetimemax numeric	
);
select * from Granttype2;

Select SUM(Granttypeonetimemax) from Granttype2;

with j as
(
 Select personfirstname, personlastname, positionname
    from person
    join employee using (personkey)
    join employeeposition using (employeekey)
 join jobposition using (positionkey)
)
Select json_agg(j) from j;