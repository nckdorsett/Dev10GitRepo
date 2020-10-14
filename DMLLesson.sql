use field_agent;

insert into agency (short_name, long_name)
	values ('NSA', 'National Security Agency');
    
select * from agency;

insert into agency (short_name, long_name)
	values ('ACME', 'Agency to Classify & Monitor Evildoers');
    
select * from agency;

delete from agency
where agency_id = 2;

select * from agency;

insert into agency (agency_id, short_name, long_name)
	values (50, 'GAS', 'Galactic Alliance Security');
    
select * from agency;

insert into agency (short_name, long_name)
	values ("MASK", "Mobile Armored Strike Kommand");
    
select * from agency;

insert into agent
(first_name, middle_name, last_name, dob, height_in_inches)
values
('Hazel','C','Sauven','1954-09-16',76),
('Claudian','C','O''Lynn','1956-11-09',41),
('Winn','V','Puckrin','1999-10-21',60),
('Kiab','U','Whitham','1960-07-29',52),
('Min','E','Dearle','1967-04-18',44),
('Urban','H','Carwithen','1996-12-22',58),
('Ulises','B','Muhammad','2008-04-01',80),
('Phylys','Y','Howitt','1979-03-28',68);

insert into security_clearance values
	(1, "Top Secret");
    
insert into agency_agent
	(agency_id, agent_id, identifier, security_clearance_id, activation_date)
    select
		agency.agency_id,								-- agency_id
        agent.agent_id,									-- agent_id
        concat(agency.agency_id, "-", agent.agent_id),	-- identifier
        1,												-- security_clearance_id
        date_add(agent.dob, interval 10 year)			-- activation_date
	from agency
    inner join agent;
    
select * from agency_agent;

update agency set
	long_name = 'Nascent Science Agency'
where agency_id = 1;

update agent set
	middle_name = 'K',
    dob = '2002-04-09'
where agent_id = 7;

update agency_agent set
	identifier = "003",
    activation_date = "2012-9-19",
    is_active = false
where agency_id = 1
and agent_id = 1;

delete from agency_agent
where agency_id = 1 and agent_id =2;

delete from agency_agent
where agency_id = 3 and agent_id = 2;

delete from agency_agent
where agency_id = 50 and agent_id = 2;

delete from agency_agent
where agency_id = 51 and agent_id = 2;

delete from agent where agent_id = 2;

select * from agent;


