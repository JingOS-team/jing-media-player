CREATE TABLE ARTISTS
(
artist   TEXT  ,
artwork TEXT ,
wiki    TEXT,
PRIMARY KEY(artist)
);

CREATE TABLE ALBUMS
(
album   TEXT ,
artist  TEXT,
artwork TEXT,
wiki    TEXT,
PRIMARY KEY(album, artist),
FOREIGN KEY(artist) REFERENCES artists(artist)
);

CREATE TABLE TAGS
(
tag TEXT NOT NULL,
context TEXT NOT NULL,

PRIMARY KEY(tag, context)
);

CREATE TABLE MOODS
(
mood TEXT PRIMARY KEY
);

CREATE TABLE PLAYLISTS
(
playlist TEXT PRIMARY KEY,
adddate DATE NOT NULL
);

CREATE TABLE SOURCES_TYPES
(
id INTEGER PRIMARY KEY,
name TEXT NOT NULL
);

CREATE TABLE FOLDERS
(
url TEXT PRIMARY KEY,
adddate DATE NOT NULL
);

CREATE TABLE SOURCES
(
url TEXT PRIMARY KEY ,
sourcetype INTEGER NOT NULL,
FOREIGN KEY(sourcetype) REFERENCES SOURCES_TYPES(id)
);

CREATE TABLE TRACKS
(
url TEXT ,
source TEXT  ,
track   INTEGER ,
title   TEXT NOT NULL,
artist  TEXT NOT NULL,
album    TEXT NOT NULL,
duration    INTEGER  ,
comment     TEXT,
count      INTEGER  ,
fav    INTEGER NOT NULL,
rate       INTEGER NOT NULL,
releasedate DATE ,
adddate     DATE NOT NULL,
lyrics     TEXT NOT NULL,
genre      TEXT,
color        TEXT,
wiki    TEXT NOT NULL,
PRIMARY KEY (url),
FOREIGN KEY(source) REFERENCES SOURCES(url),
FOREIGN KEY(album, artist) REFERENCES albums(album, artist)
);

CREATE TABLE VIDEOS
(
url TEXT ,
source TEXT  ,
title   TEXT NOT NULL,
duration    INTEGER  ,
genre      TEXT,
count      INTEGER  ,
releasedate DATE ,
adddate     DATE NOT NULL,
PRIMARY KEY (url),
FOREIGN KEY(source) REFERENCES SOURCES(url)
);

CREATE TABLE TRACKS_MOODS
(
mood  TEXT NOT NULL ,
url TEXT NOT NULL ,
FOREIGN KEY(mood) REFERENCES MOODS(mood),
FOREIGN KEY(url) REFERENCES TRACKS(url)
);

CREATE TABLE TRACKS_TAGS
(
tag  TEXT NOT NULL ,
context TEXT NOT NULL ,
url TEXT NOT NULL ,
PRIMARY KEY (tag, context, url),
FOREIGN KEY(tag, context) REFERENCES TAGS(tag, context),
FOREIGN KEY(url) REFERENCES TRACKS(url)
);

CREATE TABLE ARTISTS_TAGS
(
tag  TEXT NOT NULL ,
context TEXT NOT NULL,
artist TEXT NOT NULL ,
PRIMARY KEY (tag, context, artist),
FOREIGN KEY(tag, context) REFERENCES TAGS(tag, context),
FOREIGN KEY(artist) REFERENCES ARTISTS(artist)
);

CREATE TABLE ALBUMS_TAGS
(
tag  TEXT NOT NULL ,
context TEXT NOT NULL,
album TEXT NOT NULL ,
artist TEXT NOT NULL,
PRIMARY KEY (tag, context, album, artist),
FOREIGN KEY(tag, context) REFERENCES TAGS(tag, context),
FOREIGN KEY(album, artist) REFERENCES ALBUMS(album, artist)
);

CREATE TABLE PLAYLISTS_MOODS
(
playlist  TEXT NOT NULL ,
mood TEXT NOT NULL ,
PRIMARY KEY (playlist, mood),
FOREIGN KEY(playlist) REFERENCES PLAYLISTS(playlist),
FOREIGN KEY(mood) REFERENCES MOODS(mood)
);

CREATE TABLE TRACKS_PLAYLISTS
(
playlist TEXT NOT NULL ,
url      TEXT NOT NULL ,
adddate DATE NOT NULL,
PRIMARY KEY (playlist, url),
FOREIGN KEY(playlist) REFERENCES PLAYLISTS(playlist),
FOREIGN KEY(url) REFERENCES TRACKS(url)
);


CREATE TABLE LOG
(
id INTEGER NOT NULL,
adddate DATE NOT NULL,
PRIMARY KEY(id)
);

--First insertions

INSERT INTO SOURCES_TYPES VALUES (1,"LOCAL");
INSERT INTO SOURCES_TYPES VALUES (2,"ONLINE");
INSERT INTO SOURCES_TYPES VALUES (3,"DEVICE");
