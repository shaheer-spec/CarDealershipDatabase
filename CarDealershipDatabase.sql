Drop database if exists CarDealershipDatabase;

create database if not exists CarDealershipDatabase;

use CarDealershipDatabase;

DROP TABLE IF EXISTS sales_contracts;
DROP TABLE IF EXISTS lease_contracts;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS vehicles;
DROP TABLE IF EXISTS dealerships;

create table dealerships (
	dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    `name` varchar(50) not null,
    address varchar(50),
    phone varchar(12)
);

create table vehicles (
	vin varchar(17) primary key not null,
    make varchar(50),
    model varchar(50),
    `year` int,
    SOLD boolean,
    color varchar(50),
    vehicleType varchar(50),
    odometer int,
    price double not null
);

create table inventory(
	dealership_id int,
    vin varchar(17),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    foreign key (vin) references vehicles(vin)
);

create table sales_contracts (
	contract_id int auto_increment primary key,
    vin varchar(17),
    sale_date date,
    price decimal(10,2),
    foreign key (vin) references vehicles(vin)
);

create table lease_contracts (
	contract_id int auto_increment primary key,
    vin varchar(17),
    lease_start date,
    lease_end date,
    monthly_payment decimal(10,2),
    foreign key (vin) references vehicles(vin)
);

insert into dealerships (dealership_id, `name`, address, phone)
values 
(1, 'Auto Galaxy Motors', '1450 Sunset Blvd', '555-123-4567'),
(2, 'Prime Auto Sales', '2201 North Ridge Rd', '555-987-6543'),
(3, 'Highway Star Cars', '800 Industrial Parkway', '555-555-1212');

insert into vehicles (VIN, make, model, year, SOLD, color, vehicleType, odometer, price)
values
('1HGCM82633A00452', 'Honda', 'Accord', 2019, FALSE, 'Blue', 'Sedan', 35000, 18500.00),
('2T1BURHE5JC123456', 'Toyota', 'Corolla', 2018, TRUE, 'White', 'Sedan', 42000, 16500.00),
('1FTEW1E52JKD54321', 'Ford', 'F-150', 2020, FALSE, 'Black', 'Truck', 28000, 35000.00),
('5NPE24AF4HH678901', 'Hyundai', 'Sonata', 2017, FALSE, 'Silver', 'Sedan', 52000, 14500.00),
('3FA6P0H71HR251234', 'Ford', 'Fusion', 2018, TRUE, 'Gray', 'Sedan', 60000, 15500.00),
('1C4RJFAG1FC912345', 'Jeep', 'Grand Cherokee', 2019, TRUE, 'Red', 'SUV', 31000, 33000.00);

insert into inventory (dealership_id, VIN)
VALUES
(1, '1HGCM82633A00452'),
(1, '2T1BURHE5JC123456'),
(1, '1FTEW1E52JKD54321'),
(2, '5NPE24AF4HH678901'),
(2, '3FA6P0H71HR251234'),
(3, '1C4RJFAG1FC912345');

insert into sales_contracts (contract_id, VIN, sale_date, price)
VALUES
(1, '2T1BURHE5JC123456', '2023-05-14', 16500.00),
(2, '3FA6P0H71HR251234', '2023-07-02', 15500.00),
(3, '1C4RJFAG1FC912345', '2023-09-21', 33000.00);

INSERT INTO lease_contracts (contract_id, VIN, lease_start, lease_end, monthly_payment)
VALUES
(1, '1HGCM82633A00452', '2024-01-01', '2027-01-01', 299.99),
(2, '5NPE24AF4HH678901', '2024-03-15', '2027-03-15', 259.99);
