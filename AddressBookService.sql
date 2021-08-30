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