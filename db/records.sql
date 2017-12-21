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
  artist_id INT4 REFERENCES artists(id) --ON DELETE SET NULL, --delete this if creating new table
  genre_id INT4 REFERENCES genres(id) --ON DELETE SET NULL --delete this if creating new table
);

-- CREATE TABLE albums_genres (
--   id SERIAL4 PRIMARY KEY,
  -- album_id INT4 REFERENCES albums(id) ON DELETE SET NULL,
--   genre_id INT4 REFERENCES genres(id) ON DELETE SET NULL
-- )

-- CREATE TABLE albums_artists (
--   id SERIAL4 PRIMARY KEY,
--   artist_id INT4 REFERENCES artists(id),
--   album_id REFERENCES albums(id)
-- )

CREATE TABLE stock ( --should rename stock_items throughout programme
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

-- CREATE TABLE suppliers (
--   id SERIAL4 PRIMARY KEY,
--   company VARCHAR(255),
--   contact person
--   address
--   postcode
--   phone
--   email
--   website
-- );

-- CREATE TABLE product_suppliers (
--   album_id INT4 REFERENCES albums(id),
--   supplier_id INT4 REFERENCES suppliers(id),
--   price MONEY,
--   postage MONEY,
--   status BOOLEAN --active/inactive
-- );
