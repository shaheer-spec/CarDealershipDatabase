Use cardealershipdatabase;

select s.contract_id, s.vin, s.price, s.sale_date
from sales_contracts s
inner join inventory i on s.vin = i.vin
inner join dealerships d on i.dealership_id = d.dealership_id
where d.dealership_id = 1 and
s.sale_date > '2023-04-15' and s.sale_date < '2023-06-15'