Use cardealershipdatabase;

Select d.dealership_id, d.`name`, d.address, d.phone
from dealerships d
inner join inventory i on d.dealership_id = i.dealership_id
inner join vehicles v on i.vin = v.vin
where v.vin = '1C4RJFAG1FC912345'