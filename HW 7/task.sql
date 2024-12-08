-- 1)
CREATE VIEW samsBills AS
SELECT
    w.first_name,
    w.surname,
    b.bill_date,
    b.cust_name,
    b.bill_total
FROM
    waiter w
JOIN bill b ON w.waiter_id = b.waiter_id
WHERE
    w.first_name = 'Sam'
AND w.surname = 'Pitt';


-- 2)
SELECT *
FROM samsBills
WHERE bill_total > 400;


-- 3)
CREATE VIEW roomTotals AS
SELECT
    r.room_name,
    SUM(b.bill_total) AS total_sum
FROM
    room r
JOIN bill b ON r.room_id = b.room_id
GROUP BY r.room_name;


-- 4)
CREATE VIEW teamTotals AS
SELECT
    CONCAT(w.first_name, ' ', w.surname) AS headwaiter_name,
    SUM(b.bill_total) AS total_sum
FROM
    waiter w
JOIN bill b ON w.waiter_id = b.waiter_id
GROUP BY CONCAT(w.first_name, ' ', w.surname);
k