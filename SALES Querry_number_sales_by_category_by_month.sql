SELECT date_format(O.orderDate, '%m %Y') as mois, 
(P.productLine) as Category ,
IFNULL(SUM(OD.quantityOrdered),0) as Quantity
FROM Products P 
Join	orders O
LEFT JOIN orderdetails OD
ON   P.productCode = OD.productCode AND O.orderNumber = OD.orderNumber
group by category, mois
order by month(year(mois))
