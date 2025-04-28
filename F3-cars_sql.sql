use car_data;

CREATE TABLE car_dataset (
    Car_ID INT PRIMARY KEY,
    Brand VARCHAR(50),
    Model VARCHAR(100),
    Year INT,
    Fuel_Type VARCHAR(20),
    Transmission VARCHAR(20),
    Price FLOAT,
    Mileage VARCHAR(20),
    Engine_CC INT,
    Seating_Capacity INT,
    Service_Cost VARCHAR(50)
);

-- Unique car brands
SELECT COUNT(DISTINCT Brand) AS Unique_Brands FROM car_dataset;

-- Top 3 Average Car Price by Brand.
SELECT Brand, 
       ROUND(AVG(Price), 2) AS Avg_Price
FROM car_dataset
GROUP BY Brand
ORDER BY Avg_Price DESC
limit 3;

-- Average Price by Fuel Types
SELECT Fuel_Type, 
       COUNT(*) AS Count, 
       ROUND(AVG(Price), 2) AS Avg_Price
FROM car_dataset
GROUP BY Fuel_Type
ORDER BY Count DESC;

-- Distribution between manual and automatic transmissions
SELECT Transmission, 
       COUNT(*) AS Total_Cars, 
       ROUND(AVG(Price), 2) AS Avg_Price
FROM car_dataset
GROUP BY Transmission;

-- Yearly Price Trend
SELECT Year, 
       COUNT(*) AS Cars_Registered, 
       ROUND(AVG(Price), 2) AS Avg_Price
FROM car_dataset
GROUP BY Year
ORDER BY Year DESC;

-- Top 5 Mileage Brands
SELECT Brand, 
       ROUND(AVG(Mileage), 2) AS Avg_Mileage
FROM car_dataset
GROUP BY Brand
ORDER BY Avg_Mileage DESC
LIMIT 5;

-- Popular Seating Capacity
SELECT Seating_Capacity, 
       COUNT(*) AS Number_of_Cars,
       round(avg(Price),2) AS Avg_Price
FROM car_dataset
GROUP BY Seating_Capacity
ORDER BY Number_of_Cars DESC
limit 3;

-- combinations of fuel type and transmission
SELECT Fuel_Type, Transmission, 
       COUNT(*) AS Count, 
       ROUND(AVG(Price), 2) AS Avg_Price
FROM car_dataset
GROUP BY Fuel_Type, Transmission
ORDER BY Count DESC;

-- Affordable High-Mileage Cars
SELECT Brand, Model, Year, Price, Mileage
FROM car_dataset
WHERE Mileage > 20 AND Price < 500000
ORDER BY Mileage DESC, Price ASC
LIMIT 10;

-- Service Cost vs Engine Capacity
SELECT 
    ROUND(Engine_CC, -2) AS Engine_Group,
    ROUND(AVG(Service_Cost), 2) AS Avg_Service_Cost
FROM car_dataset
GROUP BY Engine_Group
ORDER BY Engine_Group;