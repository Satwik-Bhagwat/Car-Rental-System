CREATE TABLE Login
(
  Login_ID INT NOT NULL,
  Username varchar NOT NULL,
  Password varchar NOT NULL,
  PRIMARY KEY (Login_ID)
);

CREATE TABLE Payment
(
  Payment_ID INT NOT NULL,
  Discount INT NOT NULL,
  Mode varchar NOT NULL,
  PRIMARY KEY (Payment_ID)
);

CREATE TABLE Type
(
  Type_ID INT NOT NULL,
  Name varchar NOT NULL,
  cost_per_mile INT NOT NULL,
  PRIMARY KEY (Type_ID)
);

CREATE TABLE Chauffer
(
  Chauffer_ID INT NOT NULL,
  Name varchar NOT NULL,
  Phone_no varchar NOT NULL,
  Gender varchar NOT NULL,
  PRIMARY KEY (Chauffer_ID)
);

CREATE TABLE Customer
(
  Customer_ID INT NOT NULL,
  Name varchar NOT NULL,
  Email_id varchar NOT NULL,
  Gender varchar NOT NULL,
  Login_ID INT NOT NULL,
  PRIMARY KEY (Customer_ID),
  FOREIGN KEY (Login_ID) REFERENCES Login(Login_ID)
);

CREATE TABLE Vehicle
(
  Vehicle_Id INT NOT NULL,
  Vehicle_reg_no varchar NOT NULL,
  Model_name varchar NOT NULL,
  Availability varchar NOT NULL,
  Type_ID INT NOT NULL,
  Chauffer_ID INT NOT NULL,
  PRIMARY KEY (Vehicle_Id),
  FOREIGN KEY (Chauffer_ID) REFERENCES Chauffer(Chauffer_ID),
  FOREIGN KEY (Type_ID) REFERENCES Type(Type_ID)
);

CREATE TABLE Booking
(
  Booking_ID INT NOT NULL,
  destination varchar NOT NULL,
  pickup varchar NOT NULL,
  B_date date NOT NULL,
  B_time time NOT NULL,
  Distance INT NOT NULL,
  Customer_ID INT NOT NULL,
  Payment_ID INT NOT NULL,
  Vehicle_Id INT NOT NULL,
  PRIMARY KEY (Booking_ID),
  FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
  FOREIGN KEY (Payment_ID) REFERENCES Payment(Payment_ID),
  FOREIGN KEY (Vehicle_Id) REFERENCES Vehicle(Vehicle_Id)
);