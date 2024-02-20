use Project;
create table tracks
(
  tr_id int primary key auto_increment,
  tr_title varchar(100),
  tr_year int,
  tr_yearlyrank varchar(100),
  tr_dateentered date,
  tr_datepeaked date,
  tr_peakpos int,
  tr_artist_id varchar(100), 
  tr_weeksCH int, tr_weeks40 int, tr_weeks10 int, tr_weekspeak int
);
