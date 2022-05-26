SELECT * from
(SELECT SUM(OD.priceEach*OD.quantityOrdered) AS turnover, 
date_format(O.orderDate,'%Y') as periode,
C.country
from orderdetails OD
join customers C
join orders O 
on OD.orderNumber = O.orderNumber and O.customerNumber = C.customerNumber
group by country, periode) a
where periode = 2021
