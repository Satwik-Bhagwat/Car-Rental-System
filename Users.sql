-- SuperAdmin has access to complete database
create user SuperAdmin with password 'SuperAdmin123';

grant all on car_rental_system to SuperAdmin;

-- AuthorizationAdmin has access to customer details and login
create user AuthorizationAdmin with password 'AuthorizationAdmin123';

grant insert,delete,select on Login to AuthorizationAdmin;
grant all on Customer to AuthorizationAdmin;

-- ChaufferAdmin has access to chauffer details,vehicles and vehicle type
create user ChaufferAdmin with password 'ChaufferAdmin123';

grant all on Chauffer,Vehicle,type to ChaufferAdmin;

-- BookingAdmin has access to booking details and payment
create user BookingAdmin with password 'BookingAdmin123';

grant select,insert on Booking,Payment to BookingAdmin;