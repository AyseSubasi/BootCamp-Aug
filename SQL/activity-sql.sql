
create database if not exists lab_groupby_db;
#create database lab_groupby_db character set utf8mb4 collate utf8mb4_099_ai_ci;

create table if not exists teams (
team_id int primary key auto_increment, name varchar(45) not null, city varchar(45) not null, coach_full_name varchar (45), captain_id int 
);

##creating table with foreign key

create table if not exists players
( player_id int primary key auto_increment, player_name varchar(45) not null,
player_position varchar (45), skill_level varchar (15), team_id int, 
foreign key (team_id) references teams(team_id));


## filing table

insert into teams ( name, city, coach_full_name,captain_id) values(
"Boston_Eagles" , "BOSTON" , "Lars", 1);

insert into teams ( name, city, coach_full_name,captain_id) values(
"Heratha Berlin", "Berlin", "Ronald", 1);

insert into players
( player_name, player_position, skill_level, team_id) values ("Ayse", "LLW","A", 3) ## error need to drop foreign key 

## deleting foreign key
ALTER TABLE players drop foreign key players_ibfk_1; 

#for deleting records DML
delete from players where team_id = 3;

drop table players;

select `Renew Offer Type` from lab_db.data_marketing_customer_analysis_round2

give me the frist 10 accounts - > 


## prcedure 
use bank;

DELIMITER // 
create procedure det_district_id_by_account (in account_id int, out district_id int)
begin
select district_id = account_id
where account_id = account_id;
end // 
DELIMITER ; 
call get_district_id_by_account (7, @district); 

select @district 


