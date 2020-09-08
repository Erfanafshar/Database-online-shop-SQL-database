/*CREATE DATABASE NikShop;
USE NikShop;*/

CREATE TABLE users(
id INTEGER AUTO_INCREMENT, 
first_name TEXT NOT NULL,
last_name TEXT NOT NULL, 
national_code TEXT NOT NULL,
phone_number TEXT,
city TEXT,
address TEXT,
PRIMARY KEY (id)
);

CREATE TABLE goods(
id INTEGER AUTO_INCREMENT, 
name TEXT NOT NULL, 
current_number INTEGER, 
buy_price REAL,
sell_price REAL,
manufacturer_id INTEGER,
PRIMARY KEY (id),
FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(id)
);

CREATE TABLE factors(
id INTEGER AUTO_INCREMENT, 
user_id INTEGER,
buy_date DATE,
PRIMARY KEY (id),
FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE factor_goods(
id INTEGER AUTO_INCREMENT,
factor_id INTEGER, 
good_id INTEGER,
good_number INTEGER NOT NULL,
score INTEGER, 			
PRIMARY KEY (id),
FOREIGN KEY (factor_id) REFERENCES factors(id),
FOREIGN KEY (good_id) REFERENCES good(id)
);

CREATE TABLE manufacturers(
id INTEGER AUTO_INCREMENT, 
national_code TEXT NOT NULL, 
first_name TEXT NOT NULL,
last_name TEXT NOT NULL,
phone_number TEXT,
PRIMARY KEY (id)
);
