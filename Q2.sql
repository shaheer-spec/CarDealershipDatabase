Use cardealershipdatabase;

select d.dealership_id, v.make, v.model, v.vehicleType
from dealerships d
inner join inventory i on d.dealership_id = i.dealership_id
inner join vehicles v on i.vin = v.vin
where d.dealership_id = 1