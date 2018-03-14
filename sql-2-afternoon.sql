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
WHERE g.name = 'Pop' OR g.name= 'Rock'
GROUP BY g.name