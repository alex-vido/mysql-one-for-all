DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;
CREATE TABLE IF NOT EXISTS plans(
	plan_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(255) NOT NULL UNIQUE,
    price DECIMAL(4,2) NOT NULL
) ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS users(
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL UNIQUE,
    age INT,
    plan_id  INT, FOREIGN KEY (plan_id) REFERENCES plans(plan_id),
    plan_date DATE
) ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS artist(
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    artist_name VARCHAR(255) NOT NULL
) ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS albums(
    album_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    album_name VARCHAR(255) NOT NULL,
    artist_id INT NOT NULL, FOREIGN KEY (artist_id) REFERENCES artist(artist_id),
    release_year INT
) ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS songs(
	song_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    song_name VARCHAR(255) NOT NULL,
    album_id INT, FOREIGN KEY (album_id) REFERENCES albums(album_id),
    duration_sec INT
) ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS playback(
    user_id INT, FOREIGN KEY (user_id) REFERENCES users(user_id),
    song_id INT, FOREIGN KEY (song_id) REFERENCES songs(song_id),
    playback_date DATE,
    PRIMARY KEY (user_id, song_id)
) ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS following(
    user_id INT, FOREIGN KEY (user_id) REFERENCES users(user_id),
    artist_id INT, FOREIGN KEY (artist_id) REFERENCES artist(artist_id),
    PRIMARY KEY (user_id, artist_id)
) ENGINE = InnoDB;

INSERT INTO plans (type, price)
VALUES
    ('gratuito', 0),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);
INSERT INTO users (user_name, age, plan_id, plan_date)
VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 2, '2017-12-30'),
    ('Martin Fowler', 46, 2, '2017-01-17'),
    ('Sandi Metz', 58, 2, '2018-04-29'),
    ('Paulo Freire', 19, 2, '2018-02-14'),
    ('Bell Hooks', 26, 3, '2018-01-05'),
    ('Christopher Alexander', 85, 4, '2019-06-05'),
    ('Judith Butler', 45, 4, '2020-05-13'),
    ('Jorge Amado', 58, 4, '2017-02-17');
INSERT INTO artist (artist_name)
VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');
INSERT INTO albums (album_name, artist_id, release_year)
VALUES
    ('Renaissance', 1, 2022),
    ('Jazz', 2, 1978),
    ('Hot Space', 2, 1982),
    ('Falso Brilhante', 3, 1998),
    ('Vento de Maio', 3, 2001),
    ('QVVJFA?', 4, 2003),
    ('Somewhere Far Beyond', 5, 2007),
    ('I Put A Spell On You', 6, 2012);
INSERT INTO songs (song_name, album_id, duration_sec)
VALUES 
    ('BREAK MY SOUL', 1, 279),
    ("VIRGO'S GROOVE", 1, 369),
    ('ALIEN SUPERSTAR', 1, 116),
    ("Don't Stop Me Now", 2, 203),
    ("Under Pressure", 3, 152),
    ("Como Nossos Pais", 4, 105),
    ("O Medo de Amar é o Medo de Ser Livre", 5, 207),
    ("Samba em Paris", 6, 267),
    ("The Bard's Song", 7, 244),
    ("Feeling Good", 8, 100);
INSERT INTO playback(user_id, song_id, playback_date)
VALUES
    (1, 7, '2022-02-28 10:45:55'),
    (1, 2, '2020-05-02 05:30:35'),
    (1, 9, '2020-03-06 11:22:33'),
    (2, 9, '2022-08-05 08:05:17'),
    (2, 6, '2020-01-02 07:40:33'),
    (3, 9, '2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 18:38:30'),
    (4, 7, '2021-08-15 17:10:10'),
    (5, 7, '2021-08-15 17:10:10'),
    (5, 4, '2020-08-06 15:23:43'),
    (6, 6, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4, '2012-03-17 14:56:41'),
    (9, 8, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');
INSERT INTO following(user_id, artist_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);