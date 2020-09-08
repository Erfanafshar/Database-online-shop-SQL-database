/*CREATE DATABASE NikShop;
USE NikShop;*/

/* Queries */

/* 1 */
Select * FROM users WHERE city = "Tehran";

/* 2 */
SELECT * FROM users WHERE phone_number LIKE "0912%";

/* 3 */
SELECT goods.id, name, current_number, buy_price, sell_price, manufacturers.first_name, manufacturers.last_name 
FROM goods INNER JOIN manufacturers ON goods.manufacturer_id = manufacturers.id AND national_code = "1234567890";

/* 4 */
SELECT goods.id, goods.name, AVG(score) avg_score
FROM factor_goods INNER JOIN goods ON goods.id = factor_goods.good_id 
GROUP BY good_id HAVING avg_score BETWEEN 3 AND 4;

/* 5 */
UPDATE goods SET sell_price = sell_price * 1.1;
SELECT * FROM goods ORDER BY sell_price;

/* 6 */
SELECT bb.name FROM manufacturers 
INNER JOIN 
(SELECT goods.name, goods.manufacturer_id FROM goods 
INNER JOIN 
(SELECT factor_goods.good_id ,AVG(factor_goods.score) avgs FROM factor_goods 
GROUP BY good_id
HAVING avgs > 3) aa
ON goods.id = aa.good_id) bb
ON manufacturers.id = bb.manufacturer_id
WHERE manufacturers.first_name = "sajad";

/* 7 */
SELECT factors.* FROM factors 
INNER JOIN users ON users.id = factors.user_id AND users.national_code = "1122334455";

/* 8 */
SELECT manufacturers.* FROM manufacturers 
INNER JOIN goods ON manufacturers.id = goods.manufacturer_id
WHERE goods.id in (
SELECT factor_goods.good_id FROM factors
INNER JOIN factor_goods ON factors.id = factor_goods.factor_id
INNER JOIN users ON factors.user_id = users.id AND users.national_code = "1122334455");

/* 9 */
SELECT goods.* FROM factor_goods 
INNER JOIN goods ON goods.id = factor_goods.good_id
INNER JOIN factors ON factors.id = factor_goods.factor_id AND buy_date > "2020-1-1";

/* 10 */
SELECT * FROM goods WHERE (goods.sell_price - goods.buy_price) > 5;

/* 11 */
SELECT DISTINCT users.* FROM factor_goods
INNER JOIN factors ON factor_goods.factor_id = factors.id
INNER JOIN goods ON goods.id = factor_goods.good_id AND goods.name = "Galaxy S10"
INNER JOIN users ON users.id = factors.user_id;

/* 12 */
SELECT goods.* FROM goods 
INNER JOIN
(SELECT factor_goods.good_id, AVG(factor_goods.score) avgs FROM factor_goods 
GROUP BY good_id
HAVING avgs > (SELECT AVG(factor_goods.score) FROM factor_goods)) aa
ON goods.id = aa.good_id;

/* 13 */
SELECT goods.name FROM goods 
INNER JOIN 
(SELECT bb.good_id FROM 
(SELECT factor_goods.good_id , AVG(factor_goods.score) avgss FROM factor_goods 
GROUP BY factor_goods.good_id) bb
INNER JOIN 
(SELECT MAX(aa.avgs) mavgs FROM
(SELECT AVG(factor_goods.score) avgs FROM factor_goods 
GROUP BY factor_goods.good_id) aa) cc
ON bb.avgss = cc.mavgs) dd
ON dd.good_id = goods.id;

/* 14 */
SELECT goods.name, COUNT(*) num FROM factor_goods 	
INNER JOIN goods ON goods.id = factor_goods.good_id 
GROUP BY factor_goods.good_id
ORDER BY num DESC;

/* 15 */
SELECT users.* FROM users INNER JOIN 
(SELECT aa.user_id, aa.ca, bb.cb FROM
(SELECT factors.user_id, COUNT(factor_goods.good_id) ca FROM factors
INNER JOIN factor_goods 
ON factor_goods.factor_id = factors.id
GROUP BY factors.user_id) aa
INNER JOIN 
(SELECT factors.user_id, COUNT(DISTINCT factor_goods.good_id) cb FROM factors
INNER JOIN factor_goods 
ON factor_goods.factor_id = factors.id
GROUP BY factors.user_id) bb
ON aa.user_id = bb.user_id
WHERE aa.ca - bb.cb > 0) cc
ON cc.user_id = users.id;

/* 16 */
SELECT goods.* FROM goods INNER JOIN 
(SELECT aa.good_id FROM 
(SELECT factor_goods.good_id , COUNT(factors.user_id) ca FROM factor_goods
INNER JOIN factors ON factor_goods.factor_id = factors.id 
GROUP BY factor_goods.good_id) aa
INNER JOIN 
(SELECT factor_goods.good_id , COUNT(DISTINCT factors.user_id) cb FROM factor_goods
INNER JOIN factors ON factor_goods.factor_id = factors.id 
GROUP BY factor_goods.good_id) bb
ON aa.good_id = bb.good_id
WHERE aa.ca - bb.cb > 0) dd
ON dd.good_id = goods.id;

/* 17 */
SELECT manufacturers.first_name, manufacturers.last_name FROM manufacturers 
INNER JOIN 
(SELECT goods.manufacturer_id, COUNT(*) cnt FROM goods
INNER JOIN 
(SELECT factor_goods.good_id FROM factor_goods 
INNER JOIN factors ON factor_goods.factor_id = factors.id
WHERE factors.buy_date > "2020-1-1") aa
ON goods.id = aa.good_id
GROUP BY goods.manufacturer_id
ORDER BY cnt DESC) bb
ON manufacturers.id = bb.manufacturer_id;

/* 18 */
SELECT factors.*, SUM(aa.tp) AS sm FROM factors 
INNER JOIN 
(SELECT factor_goods.factor_id, factor_goods.good_number * goods.sell_price AS tp FROM factor_goods 
INNER JOIN goods ON factor_goods.good_id = goods.id) aa
ON factors.id = aa.factor_id
GROUP BY factors.id
ORDER BY sm DESC;

/* 19 */
SELECT factors.*, SUM(aa.tp) AS sm FROM factors 
INNER JOIN 
(SELECT factor_goods.factor_id, factor_goods.good_number * (goods.sell_price - goods.buy_price) AS tp FROM factor_goods 
INNER JOIN goods ON factor_goods.good_id = goods.id) aa
ON factors.id = aa.factor_id
GROUP BY factors.id
ORDER BY sm DESC;


/* Views */

/* 1 */
CREATE VIEW num1 AS 
SELECT aa.name,aa.first_name,aa.last_name,bb.cod FROM 
(SELECT goods.id, goods.name, manufacturers.first_name, manufacturers.last_name
FROM goods
INNER JOIN manufacturers ON goods.manufacturer_id = manufacturers.id) aa
INNER JOIN
(SELECT aa.good_id, COUNT(DISTINCT aa.user_id) cod FROM 
(SELECT factor_goods.good_id, factors.user_id FROM factors 
INNER JOIN factor_goods 
ON factors.id = factor_goods.factor_id) aa 
GROUP BY aa.good_id) bb
ON aa.id = bb.good_id;


/* 2 */
CREATE VIEW num2 AS
SELECT manufacturers.first_name, manufacturers.last_name, manufacturers.national_code FROM manufacturers 
INNER JOIN 
(SELECT goods.manufacturer_id, COUNT(*) cnt FROM goods GROUP BY goods.manufacturer_id HAVING cnt > 1) aa
ON manufacturers.id = aa.manufacturer_id;