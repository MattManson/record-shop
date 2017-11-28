DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists(
  id serial4 PRIMARY KEY,
  name VARCHAR(255),
  logo VARCHAR(255)
);

CREATE TABLE albums(
  id serial4 PRIMARY KEY,
  title VARCHAR(255),
  artist INT4 REFERENCES artists(id) ON DELETE CASCADE,
  quantity INT4,
  buy_price INT4,
  sell_price INT4,
  genre VARCHAR(255)
);
