use Project;

create table people
(
  p_id int primary key auto_increment,
  person varchar(100) not null
);

insert into people (person)
  select writtenby1 from top100
    where writtenby1 is not null
UNION
  select writtenby2 from top100
    where writtenby2 is not null
UNION
  select writtenby3 from top100
    where writtenby3 is not null
UNION
  select writtenby4 from top100
    where writtenby4 is not null
UNION
  select writtenby5 from top100
    where writtenby5 is not null
UNION
  select writtenby6 from top100
    where writtenby6 is not null
UNION
  select writtenby7 from top100
    where writtenby7 is not null
UNION
  select writtenby8 from top100
    where writtenby8 is not null
UNION
  select artist from top100
     where artist is not null;
