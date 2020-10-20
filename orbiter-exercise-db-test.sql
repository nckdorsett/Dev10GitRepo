drop database if exists orbiters_test;
create database orbiters_test;
use orbiters_test;

create table orbiter_type (
	orbiter_type_id int primary key auto_increment,
    orbiter_thing varchar(50)
);

create table orbiter (
	orbiter_id int primary key auto_increment,
    `name` varchar(100) not null,
    orbiter_type_id int not null,
    sponsor varchar(100) null,
    constraint fk_orbiter_type_id
		foreign key (orbiter_type_id)
        references orbiter_type(orbiter_type_id)
);

insert into orbiter_type (orbiter_thing)
values 
	('MODULE'),
    ('MODULE_WITH_DOCK'),
    ('SHUTTLE'),
    ('ASTRONAUT'),
    ('VENUSIAN');
    
delimiter //
create procedure set_known_good_state()
begin

	truncate table orbiter;

	insert into orbiter (`name`, orbiter_type_id, sponsor)
    values 
		('A1', 1, 'SpaceX'),
        ('D-B1', 2, 'SpaceX'),
        ('Shuttle #01', 3, 'Blue Origin'),
        ('Margarita Mordanti', 4, 'State Farm');
end //
delimiter ;



