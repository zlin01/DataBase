use Project;

show create table tracks;
show create table people;
show create table `position`;
show create table wrote;
show create table top100;

DESC tracks;
DESC people;
DESC `position`;
DESC wrote;
DESC top100;
# queries 1
select tr_yearlyrank, tr_title, tr_artist_id, tr_dateentered
from tracks, people, position 
where po_date = '1968-09-07' 
AND (Tracks.tr_artist_id = People.p_id)
AND (Tracks.tr_id = position.po_track_id)
order by po_pos;

# queries 2
select DISTINCT tr_title as `Song Title`, people.person AS `artist`
from tracks, people, position
where YEAR(po_date) = '1970' 
AND (Tracks.tr_artist_id = People.p_id)
AND (Tracks.tr_id = position.po_track_id)
AND (position.po_pos = 10 )
order by tr_title ASC;

# Queries 3
select DISTINCT tr_title as `Song Title`, people.person AS `Composer`, po_pos as `highest position`
from tracks, people, position, wrote
where tr_year = 1972 
AND (wrote.wr_p_id = People.p_id)
AND (wrote.wr_track_id = tracks.tr_id)
AND (Tracks.tr_id = position.po_track_id)
AND (position.po_pos = 1 )
order by tr_title ASC;

# Queries 4
select DISTINCT tr_title as `Song Title`, people.person AS `Artist`, 
tr_datepeaked as `Date Peaked`, po_pos as `highest position`
from tracks, people, position
where tr_year = 1969 
AND (Tracks.tr_artist_id = People.p_id)
AND (Tracks.tr_id = position.po_track_id)
AND (position.po_pos = 1 )
order by tr_datepeaked ASC;

# Queries 5
select DISTINCT tr_title as `Song Title`, people.person AS `Artist`, 
MIN(po_pos) as `highest position`
from tracks, people, position, wrote
where tr_year = 1973 
AND (Tracks.tr_artist_id = People.p_id)
AND (wrote.wr_p_id = Tracks.tr_artist_id)
AND (Tracks.tr_id = position.po_track_id)
AND (Tracks.tr_id = wr_track_id)
AND (position.po_pos <= 20)
GROUP BY tr_title
order by people.person ASC;

# Queries 6
select DISTINCT tr_title as `Song Title`, count(tr_title) as `Longest position`, 
people.person AS `Artist`, po_date
from tracks, people, position
where YEAR(po_date) = '1972'
AND (Tracks.tr_artist_id = People.p_id)
AND (Tracks.tr_id = position.po_track_id)
GROUP BY tr_title
Order by count(tr_title) DESC
Limit 2;
# tr_weeksCH < (SELECT max(tr_weeksCH) FROM tracks)

# queries 7
select DISTINCT tr_title as `Song Title`, people.person AS `artist`
from tracks, people, position
where YEAR(po_date) = '1969'
AND (month(po_date)) = '07' 
AND (Tracks.tr_artist_id = People.p_id)
AND (Tracks.tr_id = position.po_track_id)
AND (position.po_pos <= 10 )
order by people.person ASC;

#### queries 8
select DISTINCT A.tr_title as `Song Title`, people.person AS `artist`
from tracks as A, tracks as B, people, position
where A.tr_year = '1969' and B.tr_year = '1969'
AND (A.tr_artist_id = People.p_id)
AND (A.tr_id = position.po_track_id)
AND (A.tr_title = B.tr_title)
AND (A.tr_artist_id <> B.tr_artist_id)
order by A.tr_title ASC;

# queries 9
select DISTINCT tr_title as `Song Title`, people.person AS `artist`, po_date as `Date`
from tracks, people, position
where YEAR(po_date) = '1964'
AND (month(po_date) = '04')
AND (day(po_date) <= 10)
AND (day(po_date) >= 04)  
AND (Tracks.tr_artist_id = People.p_id)
AND (Tracks.tr_id = position.po_track_id)
AND (position.po_pos <= 40 )
order by po_pos ASC;

# queries 10
select DISTINCT tr_title as `Song Title`, people.person AS `artist`, tr_datepeaked as `Date Peaked`
from tracks, people, position
where tr_year = '1968'
AND (Tracks.tr_artist_id = People.p_id)
AND (Tracks.tr_id = position.po_track_id)
AND (tr_peakpos BETWEEN 6 AND 10)
order by tr_datepeaked DESC;

# queries 11
select DISTINCT `t`.tr_yearlyrank,  `t`.tr_title,  `t`.tr_artist_id,  `t`.tr_dateentered, po_date
from tracks `t` inner join position `po` ON `t`.`tr_id` = `po`.`po_track_id` left JOIN `wrote` 
`c` ON `c`.`wr_track_id` = `t`.`tr_id` left JOIN `people` `p` ON `p`.`p_id` = `c`.`wr_p_id` 
where po_date = '1968-09-07' 
order by po_pos ASC;

select DISTINCT tr_title as `Song Title`, people.person AS `Artist`, 
po_date as `Date`, po_pos as `highest position`
from tracks, people, position
where month(po_date) = 05 and day(po_date) = 20 
AND (year(po_date) between 1967 and 1974)
AND (Tracks.tr_artist_id = People.p_id)
AND (Tracks.tr_id = position.po_track_id)
AND (position.po_pos <= 10 )
order by po_pos ASC;

# Queries Grad 1
select DISTINCT tr_title as `Song Title`, people.person AS `Artist`, 
tr_datepeaked as `Date Peaked`, po_pos as `highest position`
from tracks, people, position
where year(po_date) = 1969 
AND (Tracks.tr_artist_id = People.p_id)
AND (Tracks.tr_id = position.po_track_id)
AND (position.po_pos = 1 )
order by tr_datepeaked ASC;

# Queries Grad 2
select tr_title as `Song Title`, group_concat(distinct people.person) AS `Composer`, 
#select tr_title as `Song Title`, people.person AS `Composer`, 
tr_datepeaked as `Date Peaked`, min(po_pos )as `highest position` , tr_id
, count(DISTINCT A.wr_p_id) as `times`
from tracks, people, position, wrote as A
where tr_year >= 1964 and tr_year <= 1969
AND (A.wr_p_id = People.p_id)
AND (A.wr_track_id = tracks.tr_id)
AND (Tracks.tr_id = position.po_track_id)
GROUP BY tr_id having `times` > 1
order by tr_datepeaked ASC, people.person
LIMIT 100;

SELECT *, MIN(`s`.`po_pos`) AS `Highest Position`, COUNT(DISTINCT `p`.`p_id`) AS `temp` FROM `tracks` `t` 
  INNER JOIN `wrote` `w` ON `t`.`tr_id`=`w`.`wr_track_id` 
  INNER JOIN `people` `p` ON `w`.`wr_p_id`=`p`.`p_id`
  INNER JOIN `position` `s` ON `t`.`tr_id`=`s`.`po_track_id`
WHERE `t`.`tr_id`=574
GROUP BY `t`.`tr_id` HAVING `temp` > 1;

# Queries Grad 3
select people.person AS `Artist`,
MIN(tracks.tr_dateentered) AS `start`, MAX(tracks.tr_dateentered) AS `end`
from tracks, people, position
where Tracks.tr_artist_id = People.p_id
AND (Tracks.tr_id = position.po_track_id)
AND (position.po_pos = 1 )
GROUP BY tracks.tr_artist_id
order by (`end` - `start`) DESC
LIMIT 10;

# Queries Grad 4
select DISTINCT tr_title as `Song Title`, people.person AS `Artist`, count(tr_title) as `Longest position`,
po_pos as `position`
from tracks, people, position
where (tr_year between 1970 and 1972)
AND (Tracks.tr_artist_id = People.p_id)
AND (Tracks.tr_id = position.po_track_id)
AND (position.po_pos = 1 )
GROUP BY tr_title
order by count(tr_title) DESC;