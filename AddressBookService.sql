-- UC1- Creating a Address Book Service Database

create database AddressBookService

use AddressBookService

--UC2- Ability to create a Address Book Table with first and last names, address, city, state, zip, phone number and email as its attributes


create table AddressBook
(
	FirstName varchar(20) not null,
	LastName varchar(20) not null,
	Address varchar(20) not null,
	City varchar(20) not null,
	State varchar(20) not null,
	Zip float not null,
	PhoneNumber float not null,
	Email varchar(50) not null
)


--UC3- Ability to insert new Contacts to Address Book

Insert into AddressBook(FirstName,LastName,Address,City,State,Zip,PhoneNumber,Email)
values
('Akshay','Patil','Chennai','Chennai','Tamil Nadu',400000,9999900000,'Akshay@gmail.com'),
('Dnyanesh','Gawade','pune','Pune','Maharashtra',411060,7878787878,'dnyanesh@gmail.com'),
('Saumya','Deshmukh','Mulund','Mumbai','Maharashtra',410006,9898989898,'Saumya@gmail.com'),
('Onkar','Kulkarni','Panjim','Panjim','Goa',100000,9999999999,'onkar@gmail.com')




--UC4- Ability to edit existing contact person using their name

Update  AddressBook
set City='Wasco' where FirstName='Onkar'




--UC5- Ability to delete a person using person's name

delete from AddressBook where FirstName='Akshay'




--UC6- Ability to Retrieve Person belonging to a City or State from the Address Book

select * from AddressBook where City='Mumbai' or State='Maharashtra' order by FirstName



--UC7-Ability to understand the size of address book by City and State

select City,count(City) as NoOfAddressBelongsToCity from AddressBook group by City order by City



--UC8- Ability to retrieve entries sorted alphabetically by Person’s name for a given city

select * from AddressBook where City='Mumbai' order by FirstName



--UC9- Ability to identify each Address Book with name and Type.

create table AddressType 
(
	TypeId int identity(1,1) not null primary key,
	Type varchar(20) not null
)

insert into AddressType (Type)
values 
('Family'),
('Friends'),
('Profession')

alter table AddressBook add TypeId int Foreign key references AddressType(TypeId)  

Update  AddressBook set TypeId=1 where FirstName='Dnyanesh'
Update  AddressBook set TypeId=2 where FirstName='Akshay'
Update  AddressBook set TypeId=3 where FirstName='Onkar'
Update  AddressBook set TypeId=1 where FirstName='Saumya'

select * from AddressBook 
select * from AddressType





--UC10-Ability to get number of contact persons i.e. count by type

select Type, count(FirstName) as NoOfAddressBelongsToType from AddressBook 
join AddressType 
on AddressBook.TypeId=AddressType.TypeId
group by Type



--UC11- Ability to add person to both Friend and Family

Insert into AddressBook(FirstName,LastName,Address,City,State,Zip,PhoneNumber,Email,TypeId)
values
('Saurabh','Patil','Magarpatta','Pune','Maharashtra',400011,9098989898,'saurabh@gmail.com',1),
('Rutuja','Pai','Thane','Mumbai','Maharashtra',400001,9099999999,'rutuja@gmail.com',2)




--UC12- Draw the ER Diagram for Address Book Service DB

create table ContactInfo
(
	ContactId int identity(1,1) primary key,
	FirstName varchar(20) not null,
	LastName varchar(20) not null,
	PhoneNumber float not null,
	Email varchar(50) not null,
	TypeId int not null foreign key References AddressType(TypeId)
)

create table ContactAddress 
(
	ContactId int identity(1,1) foreign key References ContactInfo(ContactId),
	Address varchar(20) not null,
	City varchar(20) not null,
	State varchar(20) not null,
	Zip float not null
)


insert into ContactInfo (FirstName,LastName,PhoneNumber,Email,TypeId)
values 
('Akshay','Patil',9999900000,'Akshay@gmail.com',1),
('Dnyanesh','Gawade',7878787878,'dnyanesh@gmail.com',2),
('Saumya','Deshmukh',9898989898,'Saumya@gmail.com',3),
('Onkar','Kulkarni',9999999999,'onkar@gmail.com',3),
('Saurabh','Patil',9098989898,'saurabh@gmail.com',1),
('Rutuja','Pai',9099999999,'rutuja@gmail.com',2)


insert into ContactAddress(Address,City,State,Zip)
values
('Chennai','Chennai','Tamil Nadu',400000),
('pune','Pune','Maharashtra',411060),
('Mulund','Mumbai','Maharashtra',410006),
('Panjim','Panjim','Goa',100000),
('Magarpatta','Pune','Maharashtra',400011),
('Thane','Mumbai','Maharashtra',400001)





--UC13- Ensure all retrieve queries done especially in UC 6, UC 7, UC 8 and UC 10 are working with new table structure

Select * from ContactInfo
Select * from ContactAddress
Select * From AddressType

update ContactAddress set Address='Wasco' where ContactId=4


select City,count(FirstName) as  NoOfAddressBelongsToCity from ContactInfo i 
join ContactAddress a 
on i.ContactId=a.ContactId 
join AddressType t 
on i.TypeId=t.TypeId 
group by City order by City


select * from ContactInfo i 
join ContactAddress a 
on i.ContactId=a.ContactId 
join AddressType t 
on i.TypeId=t.TypeId 
where City='Mumbai' order by a.ContactId



select Type, count(FirstName) as NoOfAddressBelongsToType from ContactInfo i 
join ContactAddress a 
on i.ContactId=a.ContactId 
join AddressType t 
on i.TypeId=t.TypeId 
group by Type

