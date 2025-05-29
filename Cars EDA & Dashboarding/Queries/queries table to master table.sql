-- CREATING TABLES

create table car_data(
Car_ID varchar primary key,
Brand varchar,
Model varchar,
Year int,
Fuel_Type varchar,
Transmission varchar,
Color varchar,
Owner_Type varchar,
Mileage_kmpl float,
Price_Lakh float
)

create table insurance_data(
Car_ID varchar primary key,
Provider varchar,
Policy_Number varchar,
Expiry_Date date,
Status varchar
)

create table owners_data(
Car_ID varchar primary key,
Owner_Name varchar,
Contact varchar,
City varchar,
Purchase_Year int
)

create table sales_data(
Car_ID varchar primary key,
Sale_Price_Lakh float,
Sale_Date date,
Buyer_Name varchar
)

create table service_history(
Car_ID varchar primary key,
Service_Type varchar,
Service_Date date,
Service_Cost float,
Service_Center varchar
)


-- CREATING MASTER TABLE

select c.Car_ID,
c.Brand,
c.Model,
c.Year,
c.Fuel_Type,
c.Transmission,
c.Color,
c.Owner_Type,
c.Mileage_kmpl,
c.Price_Lakh,
i.Provider,
i.Policy_Number,
i.Expiry_Date,
i.Status,
o.Owner_Name,
o.Contact,
o.City,
o.Purchase_Year,
sd.Sale_Price_Lakh,
sd.Sale_Date,
sd.Buyer_Name,
sh.Service_Type,
sh.Service_Date,
sh.Service_Cost,
sh.Service_Center
into cars_master_table
from car_data as c
left join insurance_data as i on c.Car_ID=i.Car_ID
left join owners_data as o on c.Car_ID=o.Car_ID
left join sales_data as sd on c.Car_ID=sd.Car_ID
left join service_history as sh on c.Car_ID=sh.Car_ID
