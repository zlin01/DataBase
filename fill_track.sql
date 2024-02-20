use Project;

insert into tracks (tr_title, tr_year, tr_yearlyrank, tr_dateentered,
		tr_weeksCH, tr_weeks40, tr_weeks10, tr_weekspeak,
		tr_peakpos, tr_datepeaked, tr_artist_id)
select 
		tracktitle, year, prefix, dateentered, 
        weeksCHART, weeksTOP40, weeksTOP10, weeksPEAK,
		PeakPos, datepeaked, p_id

from top100, people
where
     (top100.artist = people.person);