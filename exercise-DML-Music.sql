use Music;

insert into artist (name) 
	values 
    ("Beyonce"),
    ("Frank Ocean"),
    ("Jay-Z"),
    ("Jack White"),
    ("Kendrick Lamar");
    
select * from artist;

insert into album (title, release_date, artist_id)
	values
    ("Beyonce", "2013-12-13", 1),
    ("Lemonade", "2016-08-23", 1),
    ("Blonde", "2016-08-20", 2);

select * from artist
left outer join album on album.artist_id = artist.artist_id;

insert into track (title, length)
	values 
    ("Pretty Hurts", "4:17"),
    ("Drunk in Love", "5:23"),
    ("Super-Power", "4:36"),
    ("Don't Hurt Yourself", "3:53"),
    ("Sorry", "3:52"),
    ("Freedom", "5:53"),
    ("Nikes", "5:14"),
    ("White Ferrari", "4:08"),
    ("Godspeed", "2:57");

select * from track;

insert into album_track (album_id, track_id, order_id)
	values
    (1, 1, 1),
    (1, 2, 3),
    (1, 3, 12),
    (2, 4, 3),
    (2, 5, 4),
    (2, 6, 10),
    (3, 7, 2),
    (3, 8, 15),
    (3, 9, 17);
    
select * from artist
left outer join album on album.artist_id = artist.artist_id
left outer join album_track on album_track.album_id = album.album_id
left outer join track on album_track.track_id = track.track_id;

insert into artist_track (artist_id, track_id, track_writer, featured_artist)
	values
    (1, 1, "Beyonce Knowles, Joshua Coleman, Sia Furler", null),
    (1, 2, "Knowles, Brian Soko, Jerome Harmon, Shawn Carter, Andre Eric Proctor, Rasool Diaz, Timothy Mosley, Noel Fisher", 3),
    (1, 3, "Knowles, Pharrel Williams, Frank Ocean", 2),
    (1, 4, "Beyonce, Jack White, Diana Gordon", 4),
    (1, 5, "Beyoncé, Gordon, Rhoden", null),
    (1, 6, "Beyoncé, Jonathan Coffer, Carla Williams, Arrow Benjamin, Kendrick Duckworth", 5),
    (2, 7, "Christopher Breaux", null),
    (2, 8, "Breaux, Kanye West, Malay Ho", null),
    (2, 9, "Breaux, Ho", null);
    
select * from artist
left outer join artist_track on artist_track.artist_id = artist.artist_id
left outer join track on track.track_id = artist_track.track_id;


update album set
	release_date = "2016-04-23"
where album_id = 2;

update track set
	title = "Superpower"
where track_id = 3;

update track set
	length = "4:49"
where track_id = 6;

update album_track set
	order_id = 1
where track_id = 7;

update album_track set
	order_id = 14
where track_id = 8;

update album_track set
	order_id = 16
where track_id = 9;


