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