INSERT into LOGIN values(83465, 'user1', 'passwd1');
INSERT into LOGIN values(83165, 'user2', 'passwd2');
INSERT into LOGIN values(73465, 'user3', 'passwd3');
INSERT into LOGIN values(93465, 'user4', 'passwd4');
INSERT into LOGIN values(81465, 'user5', 'passwd5');
INSERT into LOGIN values(83405, 'user6', 'passwd6');
INSERT into LOGIN values(83415, 'user7', 'passwd7');
INSERT into LOGIN values(13465, 'user8', 'passwd8');
INSERT into LOGIN values(43465, 'user9', 'passwd9');
INSERT into LOGIN values(83495, 'user10', 'passwd10');

INSERT into CHAUFFER values(9834, 'Ajay Jha', '9548384851', 'Male');
INSERT into CHAUFFER values(6834, 'Birendar Ahluwalia', '9548684851', 'Male');
INSERT into CHAUFFER values(7834, 'Jayanti Goel', '9448384851', 'Female');
INSERT into CHAUFFER values(9934, 'Abhay Pandey', '9548784851', 'Male');
INSERT into CHAUFFER values(9804, 'Nithya Goswami', '9548394851', 'Male');
INSERT into CHAUFFER values(9787, 'Tony Spark', '980987453', 'Male');

INSERT into TYPE values(12, 'Auto', 10);
INSERT into TYPE values(13, 'Mini', 15);
INSERT into TYPE values(14, 'Sedan', 25);
INSERT into TYPE values(15, 'Prime', 40);

INSERT into PAYMENT values(9857463, 3, 'Cash');
INSERT into PAYMENT values(1857463, 5, 'Gpay');
INSERT into PAYMENT values(9157463, 5, 'Gpay');
INSERT into PAYMENT values(9857163, 3, 'Cash');
INSERT into PAYMENT values(9857263, 5, 'Gpay');
INSERT into PAYMENT values(8527463, 3, 'Cash');
INSERT into PAYMENT values(4857463, 3, 'Cash');
INSERT into PAYMENT values(9457463, 5, 'Paytm');
INSERT into PAYMENT values(9057463, 5, 'Gpay');
INSERT into PAYMENT values(9057403, 5, 'Gpay');

INSERT into CUSTOMER values(1234561, 'Shreevathsa', 'sbk@gmail.com', 'Male', 83465);
INSERT into CUSTOMER values(1234562, 'Akash', 'akash@gmail.com', 'Male', 83165);
INSERT into CUSTOMER values(1234563, 'Akshay', 'aksahy@gmail.com', 'Male', 73465);
INSERT into CUSTOMER values(1234564, 'Chandan', 'chandan@gmail.com', 'Male', 93465);
INSERT into CUSTOMER values(1234565, 'Shobha', 'shobha@gmail.com', 'Male', 81465);
INSERT into CUSTOMER values(1234566, 'Ananya', 'ananya@gmail.com', 'Female', 83405);
INSERT into CUSTOMER values(1234567, 'Aaradhya', 'aaradhya@gmail.com', 'Female', 83415);
INSERT into CUSTOMER values(1234568, 'Fatima', 'fatima@gmail.com', 'Female', 13465);
INSERT into CUSTOMER values(1234569, 'Darshan', 'darshan@gmail.com', 'Male', 43465);
INSERT into CUSTOMER values(1234560, 'Lokesh', 'lokesh@gmail.com', 'Male', 83495);

INSERT into VEHICLE values(6745, 'KA42P4321', 'Swift', 'Yes', 13, 9834);
INSERT into VEHICLE values(8745, 'KA42P4321', 'Alto', 'Yes', 13, 7834);
INSERT into VEHICLE values(6743, 'KA12M4727', 'Auto', 'Yes', 12, 6834);
INSERT into VEHICLE values(6742, 'KA13M5321', 'Innova', 'Yes', 14, 9804);
INSERT into VEHICLE values(6741, 'KA23P6324', 'Skoda rapid', 'Yes', 13, 9934);
INSERT into VEHICLE values(6746, 'KA42P4326', 'Lambo', 'Yes', 15, 9787);

INSERT into BOOKING values(3214875, 'Dest1', 'Pickup1', '2021-08-01', '08:45:12', 13, 1234561, 9857463, 6745);
INSERT into BOOKING values(3212875, 'Dest2', 'Pickup2', '2021-08-01', '09:45:12', 12, 1234562, 1857463, 6743);
INSERT into BOOKING values(3224875, 'Dest3', 'Pickup3', '2021-08-01', '10:45:12', 13, 1234563, 9157463, 6741);
INSERT into BOOKING values(3214825, 'Dest4', 'Pickup4', '2021-08-02', '07:25:12', 14, 1234564, 9857163, 6742);
INSERT into BOOKING values(3214874, 'Dest5', 'Pickup5', '2021-08-02', '06:45:12', 13, 1234565, 9857263, 6745);
INSERT into BOOKING values(3214475, 'Dest6', 'Pickup6', '2021-08-02', '08:45:12', 13, 1234566, 8527463, 8745);
INSERT into BOOKING values(3214877, 'Dest7', 'Pickup7', '2021-08-03', '08:45:12', 13, 1234567, 4857463, 6741);
INSERT into BOOKING values(3274875, 'Dest8', 'Pickup8', '2021-08-03', '08:45:12', 13, 1234568, 9457463, 6741);
INSERT into BOOKING values(3914875, 'Dest9', 'Pickup9', '2021-08-03', '08:45:12', 12, 1234569, 9057463, 6743);
INSERT into BOOKING values(3214075, 'Dest10', 'Pickup10', '2021-08-03', '08:45:12', 12, 1234560, 9057403, 6743);