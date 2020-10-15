drop database if exists Music;
create database Music;
use Music;

create table artist (
	artist_id int primary key auto_increment,
    `name` varchar(25) not null,
    member varchar(25) null
);

create table album (
	album_id int primary key auto_increment,
    title varchar(50) not null,
    release_date date not null,
    label varchar(50) null,
    artist_id int not null,
    constraint fk_album_artist_id
		foreign key (artist_id)
        references artist(artist_id)
);

/*
create table artist_album (
	artist_id int not null,
    album_id int not null,
    constraint pk_artist_album
		primary key (artist_id, album_id),
	constraint fk_artist_album_artist
		foreign key (artist_id)
        references artist(artist_id),
	constraint fk_artist_album_album
		foreign key (album_id)
        references album(album_id)
);
*/

create table track (
	track_id int primary key auto_increment,
    title varchar(25) not null,
	length time not null
);

create table album_track (
	album_id int not null,
    track_id int not null,
    order_id int not null,
    constraint pk_album_track
		primary key (album_id, track_id),
	constraint fk_album_track_album_id
		foreign key (album_id)
        references album(album_id),
	constraint fk_album_track_track_id
		foreign key (track_id)
		references track(track_id),
	constraint uq_order_album_track
		unique (order_id, album_id)
);

create table artist_track (
	artist_id int not null,
    track_id int not null,
    track_writer varchar(250) not null,
    featured_artist int null,
    constraint pk_artist_track
		primary key (artist_id, track_id),
	constraint fk_artist_track_artist
		foreign key (artist_id)
        references artist(artist_id),
	constraint fk_artist_track_track
		foreign key (track_id)
        references track(track_id)
);



    
    
    
    
    