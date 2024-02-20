use Project;
CREATE TABLE wrote (
    wr_track_id INT NOT NULL,
    wr_seq INT NOT NULL,
    wr_p_id INT NOT NULL,
    PRIMARY KEY (wr_track_id , wr_seq),
    CONSTRAINT wr_track_fk FOREIGN KEY (wr_track_id)
        REFERENCES tracks (tr_id),
    CONSTRAINT wr_people_fk FOREIGN KEY (wr_p_id)
        REFERENCES people (p_id)
);

insert into wrote (wr_track_id,wr_seq,wr_p_id)
  select tr_id, 1, p_id from tracks, people, top100
  where (tr_year= year) and (tr_yearlyrank = prefix)
          and
          (writtenby1 is not null) and (writtenby1 <> '') and
          (writtenby1 = person) and
          (tr_title = tracktitle)
UNION
  select tr_id, 2, p_id from tracks, people, top100
  where (tr_year= year) and (tr_yearlyrank = prefix)
          and
          (writtenby2 is not null) and (writtenby2 <> '') and
          (writtenby2 = person) and
          (tr_title = tracktitle)
UNION
  select tr_id, 3, p_id from tracks, people, top100
  where (tr_year= year) and (tr_yearlyrank = prefix)
          and
          (writtenby3 is not null) and (writtenby3 <> '') and
          (writtenby3 = person) and
          (tr_title = tracktitle)
UNION
  select tr_id, 4, p_id from tracks, people, top100
  where (tr_year= year) and (tr_yearlyrank = prefix)
          and
          (writtenby4 is not null) and (writtenby4 <> '') and
          (writtenby4 = person) and
          (tr_title = tracktitle)
UNION
  select tr_id, 5, p_id from tracks, people, top100
  where (tr_year= year) and (tr_yearlyrank = prefix)
          and
          (writtenby5 is not null) and (writtenby5 <> '') and
          (writtenby5 = person) and
          (tr_title = tracktitle)
UNION
  select tr_id, 6, p_id from tracks, people, top100
  where (tr_year= year) and (tr_yearlyrank = prefix)
          and
          (writtenby6 is not null) and (writtenby6 <> '') and
          (writtenby6 = person) and
          (tr_title = tracktitle)
UNION
  select tr_id, 7, p_id from tracks, people, top100
  where (tr_year= year) and (tr_yearlyrank = prefix)
          and
          (writtenby7 is not null) and (writtenby7 <> '') and
          (writtenby7 = person) and
          (tr_title = tracktitle)
UNION
  select tr_id, 8, p_id from tracks, people, top100
  where (tr_year= year) and (tr_yearlyrank = prefix)
          and
          (writtenby8 is not null) and (writtenby8 <> '') and
          (writtenby8 = person) and
          (tr_title = tracktitle)
;
