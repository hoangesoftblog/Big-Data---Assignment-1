CREATE TABLE IF NOT EXISTS kafkapipeline.fakerdata (
  name TEXT,
  address TEXT,
  year INT,
  username TEXT,
  phone TEXT,
  workplace TEXT,
  email TEXT,
  birthdate DATE,
  isbn10 TEXT,
  favorite_color TEXT,
  PRIMARY KEY (name, address)
);