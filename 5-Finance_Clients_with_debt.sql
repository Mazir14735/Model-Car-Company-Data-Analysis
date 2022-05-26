SELECT ordered, a.customerNumber, payed, (ordered-payed) as difference
from
(Select SUM(OD.priceEach * OD.quantityOrdered)as ordered, O.customerNumber
FROM orderdetails OD
JOIN orders O
ON OD.orderNumber = O.orderNumber
group by O.customerNumber
)a
join (select sum(amount) as payed, customerNumber 
from payments
group by customerNumber
)b
on a.customerNumber = b.customerNumber
where (ordered-payed) > 0