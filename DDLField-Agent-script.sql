create database field_agent;

use field_agent;

create table agency (
	agency_id int primary key auto_increment,
    short_name varchar(25) not null,
    long_name varchar(250) not null
);

/*
create table [table name] (
    [column name 1] [data type] [(not )null]? [modifiers...]?,
    [column name 2] [data type] [(not )null]? [modifiers...]?,
    [column name 3] [data type] [(not )null]? [modifiers...]?,
    [column name n] [data type] [(not )null]? [modifiers...]?
);

Elements marked with `?` are optional
*/

create table location (
	location_id int primary key auto_increment,
    `name` varchar(25) not null,
    address varchar(125) not null,
    city varchar(50) not null,
    country_code varchar(5) not null,
    postal_code varchar(15) not null,
    agency_id int not null,
    constraint fk_location_agency_id
		foreign key (agency_id)
        references agency(agency_id)
);

create table agent (
	agent_id int primary key auto_increment,
    first_name varchar(25) not null,
    middle_name varchar(25) null,
    last_name varchar(25) not null,
    dob date null,
    identifier varchar(50) not null,
    activation_dtae date not null,
    is_active bit not null default 1,
    agency_id int not null,
    constraint fk_agent_agency_id
		foreign key (agency_id)
        references agency(agency_id),
	constraint uq_agent_identifier_agency_id
		unique (identifier, agency_id)
);

create table agency_agent (
	agency_id int not null,
    agent_id int not null,
    identifier varchar(50) not null,
    activation_date date not null,
    is_active bit not null default 1,
    constraint pk_agency_agent
		primary key (agency_id, agent_id),
	constraint fk_agency_agent_agency_id
		foreign key (agency_id)
        references agency (agency_id),
	constraint fk_agency_agent_agent_id
		foreign key (agent_id)
        references agent(agent_id),
	constraint uq_agency_agent_identifier_agency_id
		unique (identifier, agency_id)
);

alter table agent
	drop index uq_agent_identifier_agency_id,
    drop foreign key fk_agent_agency_id,
    drop column agency_id,
    drop column is_active,
    drop column activation_dtae,
    drop column identifier;
    
alter table agent
	modify first_name varchar(50) not null,
    modify last_name varchar(50) not null,
    add column height_in_inches int not null;

create table agent_alias (
	identifier varchar(25) primary key,
    agent_id int not null,
    `name` varchar(25) not null,
	persona varchar(250) not null,
	constraint fk_agent_id
		foreign key (agent_id)
        references agent(agent_id),
	constraint uq_identifier_agent_id
		unique (identifier, agent_id)
);

create table mission (
	mission_id int primary key auto_increment,
    code_name varchar(50) not null,
    notes text,
    start_date date not null,
    projected_end_date date not null,
    actual_end_date date null,
    operational_cost decimal(10,2) not null,
    agency_id int not null,
    constraint fk_mission_agency_id
		foreign key(agency_id)
        references agency(agency_id)
);

create table mission_agent (
	mission_id int not null,
    agent_id int not null,
    constraint pk_mission_agent
		primary key(mission_id, agent_id),
	constraint fk_mission_agent_mission_id
		foreign key (mission_id)
        references mission(mission_id),
	constraint fk_mission_agent_agent_id
		foreign key (agent_id)
        references agent(agent_id)
);

create table security_clearance (
	security_clearance_id int primary key auto_increment,
    `name` varchar(50) not null
);

alter table agency_agent
	add column security_clearance_id int not null,
    add constraint fk_agency_agent_security_clearance_id
		foreign key (security_clearance_id)
        references security_clearance(security_clearance_id);
        
drop database if exists field_agent;
create database field_agent;
use field_agent;

-- create tables and relationships
create table agency (
    agency_id int primary key auto_increment,
    short_name varchar(25) not null,
    long_name varchar(250) not null
);

create table location (
    location_id int primary key auto_increment,
    `name` varchar(25) not null,
    address varchar(125) not null,
    city varchar(50) not null,
    country_code varchar(5) not null,
    postal_code varchar(15) not null,
    agency_id int not null,
    constraint fk_location_agency_id
        foreign key (agency_id)
        references agency(agency_id)
);

create table agent (
    agent_id int primary key auto_increment,
    first_name varchar(50) not null,
    middle_name varchar(50) null,
    last_name varchar(50) not null,
    dob date null,
    height_in_inches int not null
);

create table security_clearance (
    security_clearance_id int primary key auto_increment,
    `name` varchar(50) not null
);

create table mission (
    mission_id int primary key auto_increment,
    code_name varchar(50) not null,
    notes text,
    start_date date not null,
    projected_end_date date not null,
    actual_end_date date null,
    operational_cost decimal(10,2) not null,
    agency_id int not null,
    constraint fk_mission_agency_id
        foreign key(agency_id)
        references agency(agency_id)
);

create table agency_agent (
    agency_id int not null,
    agent_id int not null,
    identifier varchar(50) not null,
    security_clearance_id int not null,
    activation_date date not null,
    is_active bit not null default 1,
    constraint pk_agency_agent
        primary key (agency_id, agent_id),
    constraint fk_agency_agent_agency_id
        foreign key (agency_id)
        references agency(agency_id),
    constraint fk_agency_agent_agent_id
        foreign key (agent_id)
        references agent(agent_id),
    constraint fk_agency_agent_security_clearance_id
        foreign key (security_clearance_id)
        references security_clearance(security_clearance_id),
    constraint uq_agency_agent_identifier_agency_id
        unique (identifier, agency_id)
);

create table mission_agent (
    mission_id int not null,
    agent_id int not null,
    constraint pk_mission_agent 
        primary key(mission_id, agent_id),
    constraint fk_mission_agent_mission_id
        foreign key (mission_id)
        references mission(mission_id),
    constraint fk_mission_agent_agent_id
        foreign key (agent_id)
        references agent(agent_id)
);

create table alias (
    alias_id int not null,
    `name` varchar(125) not null,
    persona varchar(2048) null,
    agent_id int not null,
    constraint fk_alias_agent_id
        foreign key (agent_id)
        references agent(agent_id)
);
        















