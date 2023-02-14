create database train_station_db
create table train(
train_id  int identity primary key,
max_speed int not null, 
wagons int not null,
max_capacty int not null,
);
create table train_class(
wagons_id int identity primary key,
classes varchar(30), 
max_capacity int not null,
)
create table passengers(
passenger_id varchar(30) primary key,
first_name varchar(30) not null,
last_name varchar(30) not null,
gender varchar(10) not null ,
phone varchar(30) not null,
email varchar(30) not null,
address_ varchar(30) not null
)

create table ticket_booking(
ticket_id varchar primary key,
price int not null,
date_ date not null,
source_ varchar not null,
destination varchar not null,
)
create table announcement(
announcement_id varchar primary key,
arrival_name varchar not null,
arrival_time date not null,
departure_time date not null,
delay_ date ,
)
create table station(
station_id varchar primary key,
station_name varchar not null,
zip_code varchar,
)

create table route (
rooute_id varchar primary key,
source_id  varchar not null,
destination_id varchar not null,
distance varchar not null,
duration varchar not null,
)
create table cancelation(
cancelation_id varchar primary key,
)

create table employee(
emplowee_id int primary key,
first_name varchar(30) not null,
last_name varchar(30) not null,
phone_num int not null,
address_ varchar(50) not null,
age int not null,
gender varchar(20) not null,
)

-------------------------------------------------------relations--------------------------------------------------------------
--many to many ----
create table train_station(
train_station varchar primary key,
station_id varchar foreign key (station_id) references station (station_id) ,
train_id  int identity foreign key (train_id) references train (train_id),
)
-----------------------------------------------------------------------------------------------------------------
alter table ticket_booking
add passenger_id varchar;

alter table ticket_booking
alter column passenger_id varchar(30);

alter table ticket_booking
add constraint ticket_passenger_fk foreign key (passenger_id) references passengers (passenger_id)

alter table cancelation
add passenger_id varchar(30);

alter table cancelation
add constraint cancelation_passenger_fk foreign key (passenger_id) references passengers (passenger_id);

alter table train_class
add train_id varchar;

alter table train_class
drop column train_id;

alter table train_class
add train_id int;

alter table train_class
add constraint train_trainclass_fk foreign key (train_id) references train (train_id);

alter table train
add announcement_id varchar;

alter table train
add constraint train_annoncement_fk foreign key (announcement_id) references announcement  (announcement_id);

alter table ticket_booking
add train_id int;

alter table ticket_booking
add constraint train_booking_fk foreign key (train_id) references train (train_id);
 
 alter table station 
 add rooute_id varchar 

 alter table  station 
 add constraint route_station_fk  foreign key (rooute_id) references route (rooute_id);

 alter table train
 add rooute_id varchar
 
 alter table train
 add constraint train_route_fk foreign key (rooute_id ) references route (rooute_id )

 alter table passengers 
 add train_id int

 alter table passengers 
 add constraint passenger_trainclass_fk foreign key (train_id) references train (train_id)
 
 create table time_table(
 time_ int primary key
 )

 alter table train
 add time_ int 

 alter table train
 add constraint train_time_fk foreign key (time_) references time_table (time_)
  
 alter table time_table
 add announcement_id varchar

  alter table time_table 
  add constraint time_announcment_fk foreign key (announcement_id) references announcement (announcement_id)

  insert into train_class(wagons,classes,max_capacity)
  values(1,'first_class',30)
  
  insert into train_class(classes,max_capacity)
  values('second_class',30)

  alter table employee
  add station_id varchar

  alter table employee 
  add constraint employee_station_fk foreign key (station_id) references station (station_id)
