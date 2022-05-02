use App_Nutrition;

CREATE TABLE users(
id_1 integer auto_increment PRIMARY KEY,
username VARCHAR (200) UNIQUE NOT NULL,
pasword varchar (20) NOT NULL,
confirm_pas varchar(20) not null,
email varchar(200) not null,
confirm_ema varchar(200) not null,
create_at timestamp default now() 
);

INSERT INTO users (username, pasword, confirm_pas, email, confirm_ema) VALUES
('albert', 'ooooo', 'ooooo', 'oooo@hotmai', 'oooo@hotmai'),
('john', 'iiiii', 'iiiii', 'iiii@hotmai', 'iiii@hotmai'),
('maria', 'uuuu', 'uuuu', 'uuuu@hotmai', 'uuuu@hotmai'),
('silvia', 'cccc', 'cccc', 'cccc@hotmai', 'cccc@hotmai'),
('william', 'uuuiiu', 'yyyy', 'uiuiu@hotmai', 'uiuiu@hotmai');

create table unchang(
id_2 integer auto_increment PRIMARY KEY,
sex enum ('male', 'female') not null,
date_of_birth date not null,
create_at timestamp default now(),
id_users integer not null,
foreign key (id_users) references users(id_1)
);

INSERT INTO unchang (sex, date_of_birth, id_users) VALUES
('male','1990-04-29', 1),
('male', '1991-12-31',3),
('female', '1967-10-31',2),
('female', '2001-02-22',5),
('male', '1980-07-11',4);




CREATE table weight (
id_3 integer auto_increment PRIMARY KEY,
weight integer not null,
create_at timestamp default now(),
id_users integer not null,
foreign key (id_users) references users(id_1)
);

INSERT INTO weight (weight, id_users) VALUES
(75, 1),
(68,3),
(70,2),
(80,5),
(59,3);

CREATE table length (
id_4 integer auto_increment PRIMARY KEY,
length integer not null,
create_at timestamp default now(),
id_users integer not null,
foreign key (id_users) references users(id_1)
);

INSERT INTO length (length, id_users) VALUES
(179, 1),
(183,3),
(163,2),
(190,5),
(174,4);

create table Energy_exp (
id_5 integer auto_increment PRIMARY KEY,
energy_lev enum ('sedentary', 'medium', 'high', 'professional') not null,
create_at timestamp default now(),
id_users integer not null,
foreign key (id_users) references users(id_1)
);

INSERT INTO Energy_exp  (energy_lev, id_users) VALUES
('professional', 1),
('medium',3),
('high',2),
('sedentary',5),
('sedentary',4);

create table Goals (
id_6 integer auto_increment PRIMARY KEY,
energy_lev enum ('slim', 'gain', 'healt') not null,
create_at timestamp default now(),
id_users integer not null,
foreign key (id_users) references users(id_1)
);

INSERT INTO Goals (energy_lev, id_users) VALUES
('healt', 1),
('slim',3),
('slim',2),
('gain',5),
('healt',4);

create table Diet(
id_7 integer auto_increment PRIMARY KEY,
Diet enum ('vegan', 'vegetarian', 'celiac', 'lactose_int', 'fish_only', 'everyting') not null,
create_at timestamp default now(),
id_users integer not null,
foreign key (id_users) references users(id_1)
);

INSERT INTO Diet (Diet, id_users) VALUES
('everyting', 1),
('vegetarian',3),
('celiac',2),
('fish_only',5),
('vegan',4);

create table Difficulty(
id_8 integer auto_increment PRIMARY KEY,
Difficulty enum ('easy', 'medium', 'difficult') not null,
create_at timestamp default now(),
id_users integer not null,
foreign key (id_users) references users(id_1)
);

INSERT INTO Difficulty (Difficulty, id_users) VALUES
('difficult', 1),
('easy',3),
('easy',2),
('medium',5),
('easy',4);

create table Time_rec(
id_9 integer auto_increment PRIMARY KEY,
Time_rec enum ('few', 'medium', 'lot') not null,
create_at timestamp default now(),
id_users integer not null,
foreign key (id_users) references users(id_1)
);

INSERT INTO Time_rec (Time_rec, id_users) VALUES
('lot', 1),
('lot',3),
('few',2),
('medium',5),
('few',4);

create table shape (
id_11 integer auto_increment PRIMARY KEY,
body_shape enum ('normal', 'lean', 'muscle', 'overweight','obese1', 'obeses2') not null,
create_at timestamp default now(),
id_users integer not null,
foreign key (id_users) references users(id_1)
);

INSERT INTO shape (body_shape, id_users) VALUES
('muscle', 1),
('overweight',3),
('normal',2),
('lean',5),
('obeses2',4);


/*-------PROCED TRIAL---------------------------*/
delimiter //
CREATE PROCEDURE TEST()
       BEGIN
         select * from users;
       END//
delimiter ;
       
CALL TEST()

/*-------------------------USERS BUTTON----------------------------*/

delimiter //
create procedure insert_demo(IN username VARCHAR (200),IN pasword varchar (20),confirm_pas varchar(20), email varchar(200),confirm_ema varchar(200))
   begin
   insert into users(username, pasword, confirm_pas, email, confirm_ema) values(username, pasword, confirm_pas, email, confirm_ema);
   end
   //

delimiter ;
CALL insert_demo('Bitch', 'jsjsj', 'jsjsj', 'ppppp@hotmai', 'ppppp@hotmai');


/*-------------------------BMR BUTTON----------------------------*/

delimiter //
create procedure insert_BMR(IN id_users integer, sex VARCHAR (200),IN date_of_birth date, IN weight integer, IN  length integer, IN body_shape varchar(200))
   begin
   insert into unchang(sex, id_users, date_of_birth) values(sex, id_users, date_of_birth);
   
   insert into weight (weight, id_users) values(weight, id_users);
   
   insert into length (length , id_users) values(length , id_users);
   
   insert into shape (body_shape , id_users) values(body_shape , id_users);
   COMMIT;
   end
   //

delimiter ;

CALL insert_BMR(6, 'female', '1990-04-30', 72, 178,'muscle');

select* from unchang; 
select* from weight; 
select* from length ; 
select* from length ; 

/*-------------------------NEEDS BUTTON ----------------------------*/

delimiter //
create procedure insert_NEEDS1(IN id_users integer, energy_lev VARCHAR (200),IN goals VARCHAR (200), IN Diet VARCHAR (200), IN  Difficulty VARCHAR (200), IN Time_rec varchar(200))
   begin
   insert into Energy_exp (energy_lev, id_users) values(energy_lev, id_users);
   
   insert into Goals (energy_lev, id_users) values(goals, id_users);
   
   insert into Diet (Diet , id_users) values(Diet , id_users);
   
   insert into Difficulty (Difficulty , id_users) values(Difficulty, id_users);
   
   insert into Time_rec (Time_rec , id_users) values(Time_rec, id_users);
   COMMIT;
   end
   //

delimiter ;

CALL insert_NEEDS1(6, 'professional', 'healt', 'lactose_int', 'medium','few');

select * from Energy_exp;
select * from Goals;
select * from Diet;
select * from Difficulty;
select * from Time_rec;












