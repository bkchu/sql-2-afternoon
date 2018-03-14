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