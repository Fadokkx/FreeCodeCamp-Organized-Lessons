create database universe;

create table galaxy (
  galaxy_id serial primary key not null,
  name varchar(30) not null unique, 
  distancefromearth_inlightyears real,
  galaxydesc text,
  dwarfplanetsinto numeric
);

insert into galaxy values (
  default, 'm1', 26670, 'aaaa', 101), 
  (default, 'a2', 2537000, 'bbbbbb',159), 
  (default, 'e3', 4500000, 'cccccc',234), 
  (default, 'b4', 100000000, 'ddddddd', 20), 
  (default, 't5', 172900000, 'eeeeeee', 790), 
  (default, 'c6', 11420000, 'ffffff', 1000);


create table star (
star_id serial primary key not null,
name varchar (30) unique not null,
distancefromearth_inlightyears int,
stardesc text,
galaxy_id integer,
foreign key (galaxy_id) references galaxy (galaxy_id));


insert into star values (
  default, 'a1', 1000, 'aaaaaaa', (SELECT galaxy_id FROM galaxy WHERE name = 'm1')),
  (default, 'e2', 400, 'eeeeeee', (SELECT galaxy_id FROM galaxy WHERE name = 'a2')),
  (default, 'v3', 5000, 'vvvvvv', (SELECT galaxy_id FROM galaxy WHERE name = 'e3')),
  (default, 'a4', 60, 'aaaaaaa', (SELECT galaxy_id FROM galaxy WHERE name = 'b4')),
  (default, 't5', 9000, 'ttttttttttttt', (SELECT galaxy_id FROM galaxy WHERE name = 't5')), 
  (default, 'a6', 3200, 'aaaaaaa', (SELECT galaxy_id FROM galaxy WHERE name = 'c6'));


create table planet (
  planet_id serial primary key not null, 
  name varchar (30) not null unique, 
  gravityinms² real,
  haswater boolean,
  discoveredin date,
  sizeinkm int,
  star_id integer, 
  foreign key (star_id) references star (star_id));


insert into planet values (
  1, 'e1', '9.80', true, '1100-03-11', '490', (SELECT star_id FROM star WHERE name = 'a1')),
  (2, 'm2', '4.50', false, '1500-11-28', '587', (SELECT star_id FROM star WHERE name = 'a1')),
  (3, 'v3', '12.10', false, '1600-10-10', '1890', (SELECT star_id FROM star WHERE name = 'v3')),
  (4, 'u4', '1.1', false, '1300-08-31', '100', (SELECT star_id FROM star WHERE name = 'a1')),
  (5, 's5', '14.4', false, '1200-01-01', '2123', (SELECT star_id FROM star WHERE name = 'a1')),
  (6, 'j6', '8.23', true, '1930-02-20', '600', (SELECT star_id FROM star WHERE name = 'a1')),
  (7, 'm7', '5.20', true, '1940-08-21', '300', (SELECT star_id FROM star WHERE name ='a4')),
  (8, 'l8', '10.1', false, '2000-12-12', NULL, (SELECT star_id FROM star WHERE name = 'e2')),
  (9, 'f9', '4.3', false, '2004-03-11', '1000', (SELECT star_id FROM star WHERE name = 'e2')),
  (10, 'g10', '2.2', false, '1993-12-09', '200', (SELECT star_id FROM star WHERE name = 'a6')),
  (11, 'p11', '1.1', false, '1973-12-16', '228', (SELECT star_id FROM star WHERE name = 't5')), 
  (12, 'q12', '2.4', true, '1242-05-30', '57', (SELECT star_id FROM star WHERE name = 'a1'));

  create table moon (
  moon_id serial primary key not null, 
  name varchar (30) not null unique,
  gravityinms² real,
  sizeinkm real,
  moondesc text not null,
  planet_id integer,
  foreign key (planet_id) references planet (planet_id));

  insert into moon values 
  (default, 'm1', 3.92, 210.3, 'aaaaaaa', (SELECT planet_id FROM planet WHERE name = 'e1')),
  (default, 'm2', 3.5, 200.1, 'bbbbbb', (SELECT planet_id FROM planet WHERE name = 'm2')),
  (default, 'm3', 2.1, 42.1, 'ccccc', (SELECT planet_id FROM planet WHERE name = 'v3')),
  (default, 'p4', 1.1, 2.2, 'ddddd', (SELECT planet_id FROM planet WHERE name = 's5')),
  (default, 'e33', null, null, 'eeeee', (SELECT planet_id FROM planet WHERE name = 'j6')),
  (default, 'a23', null, null, 'fffff', (SELECT planet_id FROM planet WHERE name = 'j6')),
  (default, 'b3a', null, null, 'ggggg', (SELECT planet_id FROM planet WHERE name = 'j6')),
  (default, 'b2b', null, null, 'hhhhh', (SELECT planet_id FROM planet WHERE name = 'j6')),
  (default, 'c4p', null, null, 'jjjjj', (SELECT planet_id FROM planet WHERE name = 'j6')),
  (default, 'dd1', null, null, 'kkkkk', (SELECT planet_id FROM planet WHERE name = 'j6')),
  (default, 'bc1', null, null, 'lllll', (SELECT planet_id FROM planet WHERE name = 'j6')),
  (default, 'e3', null, null, 'mmmm', (SELECT planet_id FROM planet WHERE name = 'j6')),
  (default, 'ae2', null, null, 'nnnn', (SELECT planet_id FROM planet WHERE name = 'j6')),
  (default, 'bzq', null, null, 'oooo', (SELECT planet_id FROM planet WHERE name = 'j6')),
  (default, 'b5f', null, null, 'pppp', (SELECT planet_id FROM planet WHERE name = 'j6')),
  (default, 'gt2', null, null, 'qqqqq', (SELECT planet_id FROM planet WHERE name = 'j6')),
  (default, 'dr3', null, null, 'rrrr', (SELECT planet_id FROM planet WHERE name = 'j6')),
  (default, 'g3x', null, null, 'ssss', (SELECT planet_id FROM planet WHERE name = 'j6')),
  (default, 'bgd', null, null, 'tttt', (SELECT planet_id FROM planet WHERE name = 'f9')),
  (default, 'lna', null, null, 'uuuuu', (SELECT planet_id from planet WHERE name = 'l8'));

  create table dwarfplanet (
  dwarfplanet_id serial primary key not null, 
  name varchar (30) not null unique,
  gravityinms² real, 
  discoveredin date default null,
  haswater boolean 
);

INSERT INTO dwarfplanet VALUES (1,'P23',0.1151,'1930-02-18',true),
(2,'E1',0.2326,'2005-01-05',false),
(3,'C2',0.946,'1801-01-01', false),
(4,'G3',0.1230,'2007-07-17',false),
(5,'M4',0.715,'2005-03-31',true),
(6,'H5',0.816,'2004-12-28',false);

