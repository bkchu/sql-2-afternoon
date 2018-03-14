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