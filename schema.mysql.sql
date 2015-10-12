drop database if exists myapp;
create database myapp;
use myapp;
drop table if exists products;
create table products(id smallint auto_increment, name varchar(20), shortDesc varchar(50), descp varchar (200), price decimal(6,2), img varchar(40), primary key (id));
