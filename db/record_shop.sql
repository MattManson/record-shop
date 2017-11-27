DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS genres;

CREATE TABLE genres(
  id serial4 PRIMARY KEY,
  genre VARCHAR(255)
);

CREATE TABLE artists(
  id serial4 PRIMARY KEY,
  name VARCHAR(255),
  logo VARCHAR(255),
  genre INT4 REFERENCES genres(id) ON DELETE CASCADE
);

CREATE TABLE albums(
  id serial4 PRIMARY KEY,
  title VARCHAR(255),
  artist INT4 REFERENCES artists(id) ON DELETE CASCADE,
  quantity INT4,
  buy_price FLOAT(2),
  sell_price FLOAT(2)
);
