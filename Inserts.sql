/*CREATE DATABASE NikShop;
USE NikShop;*/

INSERT INTO users(first_name, last_name, national_code, phone_number, city, address) 
VALUES("Erfan", "Afshar", "0023441235", "09374819483", "Tehran", "Kh Azadi, k yas, p15" );
INSERT INTO users(first_name, last_name, national_code, phone_number, city, address) 
VALUES("Zahra", "Hassani", "1122334455", "09124845383", "Abadan", "Kh Shariati, k Golha, p122" );
INSERT INTO users(first_name, last_name, national_code, phone_number, city, address) 
VALUES("Ali", "Moradi", "1245412351", "09124898483", "Ahwaz", "Kh Valiasr, k Izad, p21" );
INSERT INTO users(first_name, last_name, national_code, phone_number, city, address) 
VALUES("Sam", "Shiri", "4128112351", "09194819192", "Tehran", "Kh Fars, k Salimi, p31" );
INSERT INTO users(first_name, last_name, national_code, phone_number, city, address) 
VALUES("Shahin", "Vali", "0025422901", "09351233001", "Shiraz", "Kh Saedi, k Kave, p1" );

INSERT INTO manufacturers(national_code, first_name, last_name, phone_number) 
VALUES("0022041232", "Sajad", "Naderi", "09128891245");
INSERT INTO manufacturers(national_code, first_name, last_name, phone_number) 
VALUES("1234567890", "Karen", "Riazi", "09371124250");
INSERT INTO manufacturers(national_code, first_name, last_name, phone_number) 
VALUES("1238819390", "Jila", "Mozi", "09391235645");
INSERT INTO manufacturers(national_code, first_name, last_name, phone_number) 
VALUES("1947189912", "Mohsen", "Ghanad", "09121237565");
INSERT INTO manufacturers(national_code, first_name, last_name, phone_number) 
VALUES("1237199201", "Hassan", "Bahari", "09191212345");

INSERT INTO goods(name, current_number, buy_price, sell_price, manufacturer_id)
VALUES("Galaxy S8", 10, 3.2, 6.5, 1);
INSERT INTO goods(name, current_number, buy_price, sell_price, manufacturer_id)
VALUES("Galaxy S20", 123, 13.2, 16.9, 2);
INSERT INTO goods(name, current_number, buy_price, sell_price, manufacturer_id)
VALUES("Galaxy S10", 102, 10.2, 13.5, 1);
INSERT INTO goods(name, current_number, buy_price, sell_price, manufacturer_id)
VALUES("Iphone X", 1220, 10.0, 15.5, 2);
INSERT INTO goods(name, current_number, buy_price, sell_price, manufacturer_id)
VALUES("Iphone 11", 187, 17.9, 25.9, 3);

INSERT INTO factors(user_id, buy_date) 
VALUES(1, "2020-1-2");
INSERT INTO factors(user_id, buy_date) 
VALUES(2, "2019-3-2");
INSERT INTO factors(user_id, buy_date) 
VALUES(1, "2020-2-3");
INSERT INTO factors(user_id, buy_date) 
VALUES(3, "2020-4-13");
INSERT INTO factors(user_id, buy_date) 
VALUES(2, "2019-6-23");

INSERT INTO factor_goods(factor_id, good_id, good_number, score) 
VALUES(1, 3, 5, 2);
INSERT INTO factor_goods(factor_id, good_id, good_number, score) 
VALUES(2, 4, 2, 4);
INSERT INTO factor_goods(factor_id, good_id, good_number, score) 
VALUES(3, 3, 10, 1);
INSERT INTO factor_goods(factor_id, good_id, good_number, score) 
VALUES(4, 1, 7, 5);
INSERT INTO factor_goods(factor_id, good_id, good_number, score) 
VALUES(5, 5, 16, 3);
INSERT INTO factor_goods(factor_id, good_id, good_number, score) 
VALUES(2, 3, 3, 4);
INSERT INTO factor_goods(factor_id, good_id, good_number, score) 
VALUES(3, 4, 11, 5);

/* TESTING */
/*
SELECT * FROM users;
SELECT * FROM manufacturers;
SELECT * FROM goods;
SELECT * FROM factors;
SELECT * FROM factor_goods;
*/