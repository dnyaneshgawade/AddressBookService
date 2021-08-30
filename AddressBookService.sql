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
