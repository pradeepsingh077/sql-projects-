create database ola
Use ola

# Retrieve all successful bookings:

create view successful_bookings as 
Select * From Bookings where Booking_Status = 'Success';

Select * From successful_bookings;

#2. Find the average ride distance fro each vechicle type:

Create View ride_distance_for_each_vehicle as 
Select Vehicle_Type, avg(Ride_Distance) as avg_distance
From Bookings 
Group by 1;

Select * From ride_distance_for_each_vehicle;

#3. Get the total number of canceled rides by customers:
Create view Canceled_ride_by_customers as
Select Count(*) From Bookings 
where Booking_Status = 'Canceled by Customers';

Select * from canceled_ride_by_customers;

#4 . List the top 5 customers who booked the highest number of rides:
Create view Top_5_Customers as
Select Customer_ID, Count(Booking_ID) as total_rides 
From Bookings
group by 1
order by 2 Desc limit 5; 

Select * From Top_5_Customers;

#5 Get the number of rides canceled by drivers due to personal and car-related issues:
Create View canceled_by_drivers_P_C_Issues AS
Select count(*) From bookings
Where Canceled_Rides_by_Driver = 'Personal & Car related issue';

Select * From canceled_by_drivers_P_C_Issues;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create view max_min_driver_rat as
Select Max(Driver_Ratings) as max_rating,
Min(Driver_Ratings) as min_rating
From Bookings
where Vehicle_Type = 'Prime Sedan';

Select * From max_min_driver_rat;

#7. Retrieve all rides where payment was made using upi:
Create view Payment_method as
Select * From Bookings
where Payment_Method = 'UPI';

Select * From Payment_Method;

#8. Find average customer ratings per vehicle type:
Create view avg_customer_rating as 
Select Vehicle_Type, Avg(Customer_Rating) AS avg_customer_rating
From Bookings
Group by 1;

Select * from avg_customer_rating;

#9. Calculate the total bookings value of rides completed successfully:

create view Total_bookings_value as
Select Sum(Booking_Value) as total_Successful_value
From Bookings
where Booking_Status = 'Success';

Select * From Total_bookings_value;

#10. List all incomplete rides along with the reason:

Create view Incomplete_Rides as
Select Booking_ID, Incomplete_Rides_Reason From Bookings
where Incomplete_Rides ='Yes';

Select * From Incomplete_Rides;