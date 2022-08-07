-- To calculate amount of each ride
select b.Booking_ID, ((b.Distance * t.cost_per_mile) * (1.0 - p.Discount*0.01)) as amount from Booking as b, type as t, Payment as p
where (Type_ID = (select Type_ID from Vehicle where Vehicle_Id = b.Vehicle_Id)) and (p.Payment_ID = b.Payment_ID );

-- To display chauffer details on Frontend
select b.Booking_ID, c.Name, c.Phone_no from Booking as b, Chauffer as c 
where (Chauffer_ID = (select Chauffer_ID from Vehicle where Vehicle_Id = b.Vehicle_Id));

-- All bookings on a day
select c.name, b.b_date, t.name as vehicle_type from customer as c, Booking as b, type as t
where (b.Customer_ID = c.Customer_ID) and 
(t.Type_ID = (select Type_ID from Vehicle where Vehicle_Id = b.Vehicle_Id)) and (b.b_date='2021-08-03');

-- count of mode of payment on a day
select p.mode,count(*) from Booking as b, payment as p
where (p.Payment_ID=b.Payment_ID) and (b.b_date='2021-08-01') group by p.mode;

-- cost comparison for different types of vehicles
select t.name, (b.Distance * t.cost_per_mile) as cost,p.Discount as  discount, ((b.Distance * t.cost_per_mile) * (1.0 - p.Discount*0.01)) as amount
from type as t,booking as b, payment as p
where (b.Booking_ID = 3214875) and (p.Payment_ID=b.Payment_ID);