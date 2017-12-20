DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS purchases;
DROP TABLE IF EXISTS stock;
DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS genres;

CREATE TABLE artists (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  type VARCHAR(255)
);

CREATE TABLE genres (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE albums (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  year INT2,
  artist_id INT4 REFERENCES artists(id),
  genre_id INT4 REFERENCES genres(id)
);

CREATE TABLE stock (
  id SERIAL4 PRIMARY KEY,
  album_id INT4 REFERENCES albums(id),
  quantity INT4,
  low_stock_level INT4,
  high_stock_level INT4,
  buy_price MONEY,
  sell_price MONEY
);

CREATE TABLE purchases (
  id SERIAL4 PRIMARY KEY,
  stock_id INT4 REFERENCES stock(id) ON DELETE CASCADE,
  order_time TIMESTAMP WITHOUT TIME ZONE,
  quantity INT4,
  delivery_time TIMESTAMP WITHOUT TIME ZONE,
  cost INT4
);

CREATE TABLE sales (
  id SERIAL4 PRIMARY KEY,
  stock_id INT4 REFERENCES stock(id),
  time TIMESTAMP WITHOUT TIME ZONE,
  quantity INT4,
  price INT4
);
