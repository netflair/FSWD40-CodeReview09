-- show staff and customers and thier driveing license issue date and car_type
SELECT person.first_name, person.last_name, license.issue_date,license.car_type FROM person
LEFT JOIN license on person.person_id= license.license_id

-- show reservations 
SELECT person.first_name, person.last_name, reservation.from_date, reservation.to_date FROM person
LEFT JOIN reservation on person.person_id= reservation.reservation_id

-- show invoice sums from customers
SELECT person.first_name, person.last_name, inv_sum FROM person
LEFT JOIN invoice on person.person_id = invoice.invoice_id
WHERE invoice.inv_sum IS NOT NULL

-- show rentals of cars 
SELECT from_date, to_date, brand, class FROM rental
JOIN person
LEFT JOIN car on person.person_id = car.car_id

-- show staff 
SELECT fk_person_id, first_name, last_name FROM staff
LEFT JOIN person on person.person_id = staff.staff_id