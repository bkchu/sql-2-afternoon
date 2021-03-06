-- joins
SELECT *
FROM Invoice i
JOIN InvoiceLine il
ON i.invoiceid = il.invoiceid
WHERE il.unitprice > 0.99

SELECT *
FROM Invoice i
JOIN InvoiceLine il
ON i.invoiceid = il.invoiceid
WHERE il.unitprice > 0.99

SELECT c.firstname, c.lastname, e.firstname, e.lastname
FROM Customer c
JOIN Employee e
ON c.supportrepid = e.employeeid

SELECT al.title, ar.name
FROM Album al
JOIN Artist ar
ON ar.artistid = al.artistid

SELECT pt.trackid 
FROM playlisttrack pt
JOIN playlist p
ON pt.playlistid = p.playlistid
WHERE p.name = 'Music';

SELECT t.name
FROM track t
JOIN playlisttrack pt
ON t.trackid = pt.trackid
WHERE pt.playlistid = 5

SELECT t.name, p.name 
FROM track t
JOIN playlisttrack pt
ON t.trackid = pt.trackid
JOIN playlist p
ON p.playlistid = pt.playlistid

SELECT t.name, a.title
FROM track t
JOIN album a
ON t.albumid = a.albumid
JOIN genre g
ON t.genreid = g.genreid
WHERE g.name = 'Alternative'

-- nested queries
SELECT * FROM invoice
WHERE invoiceid IN (
  SELECT invoiceid FROM invoiceline
  WHERE UnitPrice > 0.99
)

SELECT * FROM playlisttrack
WHERE playlistid IN (
	SELECT playlistid FROM playlist
  	WHERE name = 'Music'
)

SELECT * FROM track
WHERE trackid IN (
  SELECT trackid from playlisttrack
  WHERE playlistid = 5 )

SELECT * FROM track
WHERE genreid IN (
  SELECT genreid FROM genre
  WHERE name = 'Comedy'
  )

SELECT * FROM track
WHERE albumid IN (
  SELECT albumid FROM album
  WHERE title = 'Fireball'
  );

SELECT * FROM track
WHERE albumid IN (
  SELECT albumid FROM album
  WHERE artistid IN (
    SELECT artistid FROM artist
    WHERE name = 'Queen'
    )
  );

UPDATE customer
SET fax = null
WHERE fax IS NOT NULL

UPDATE customer
SET company = 'Self'
WHERE company IS NULL

UPDATE customer
SET lastname = 'Thompson'
WHERE firstname = 'Julia' AND lastname = 'Barnett'

UPDATE customer
SET supportrepid = 4
WHERE email = 'luisrojas@yahoo.cl'

UPDATE track 
SET composer = 'The darkness around us'
WHERE genreid = (
  SELECT genreid FROM genre
  WHERE name = 'Metal'
  ) AND composer IS NOT NULL

SELECT COUNT(*), g.name 
FROM track t
JOIN genre g ON t.genreid = g.genreid
GROUP BY g.name

SELECT COUNT(*), g.name
FROM track t
JOIN genre g ON t.genreid = g.genreid
WHERE g.name = 'Pop' OR g.name= 'Rock'
GROUP BY g.name

SELECT ar.name, COUNT(*)
FROM artist ar
JOIN album a ON ar.artistid = a.artistid
GROUP BY ar.artistid

SELECT DISTINCT composer FROM TRACK; 

SELECT DISTINCT billingpostalcode FROM invoice

SELECT DISTINCT company FROM customer

DELETE FROM practice_delete
WHERE type='bronze'

DELETE FROM practice_delete
WHERE type='silver'

DELETE FROM practice_delete
WHERE value = 150

create table user (
	id integer primary key,
  name varchar(30),
  	email varchar(30)
)
/* Products need a name and a price */
create table product (
	id integer primary key,
  	name varchar(30),
  	price float
)
/* Orders need a ref to product. */
create table orders (
	id integer primary key,
  	userid integer references user(id)
  	productid integer references product(id)
)
/* All 3 need primary keys. */

INSERT INTO user (name, email)
values ('brandon', 'bkchu@gmail.com'), ('nathan', 'nathan@gmail.com'), ('chris', 'chris@chriwf.com')

INSERT INTO product (name, price)
values ('cup', 3.99), ('mug', 9.99), ('barrel', 111.99);
INSERT INTO orders(userid, productid, quantity, receipt_num)
values
(1,1,5,1),
(1,2,5,1),
(1,3,5,1),
(2,1,6,2),
(2,2,6,2),
(2,3,6,2),
(3,1,3,3),
(3,2,3,3),
(3,3,3,3);

SELECT p.name
FROM Product p 
JOIN orders o
ON p.id = o.productid
WHERE o.receipt_num = 1

SELECT * FROM ORDERS

SELECT SUM(p.price * o.quantity)
FROM Product p
JOIN Orders o ON p.id = o.productid
WHERE o.receipt_num = 1

SELECT o.*, u.name FROM Orders o
JOIN user u ON u.id = o.userid
WHERE u.name = 'nathan'

SELECT COUNT(*), u.name FROM Orders o
JOIN user u ON u.id = o.userid
WHERE u.name ='brandon'