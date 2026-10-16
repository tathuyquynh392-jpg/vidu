```sql
-- AUTORIDE DATABASE
CREATE DATABASE IF NOT EXISTS autoride_db;
USE autoride_db;

-- 1. Bang Cars
CREATE TABLE IF NOT EXISTS Cars (
    car_id INT AUTO_INCREMENT PRIMARY KEY,
    model_name VARCHAR(100) NOT NULL,
    license_plate VARCHAR(20) UNIQUE NOT NULL
);

-- 2. Bang Rentals
CREATE TABLE IF NOT EXISTS Rentals (
    rental_id INT AUTO_INCREMENT PRIMARY KEY,
    car_id INT NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    rent_date DATETIME NOT NULL,
    return_date DATETIME,
    status ENUM(
        'BOOKED',
        'ACTIVE',
        'COMPLETED',
        'CANCELLED'
    ) NOT NULL DEFAULT 'BOOKED',
    security_deposit DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    late_fee DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    damage_fee DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    FOREIGN KEY (car_id)
        REFERENCES Cars(car_id)
        ON DELETE RESTRICT
);

-- 3. Bang Inspections
CREATE TABLE IF NOT EXISTS Inspections (
    inspection_id INT AUTO_INCREMENT PRIMARY KEY,
    rental_id INT NOT NULL,
    inspection_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    damage_description TEXT NOT NULL,
    inspector_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (rental_id)
        REFERENCES Rentals(rental_id)
        ON DELETE RESTRICT
);

-- 4. Them xe mau
INSERT INTO Cars (model_name, license_plate)
VALUES ('Toyota Vios', 'AUTORIDE-001');

-- 5. Khach hang thue xe, dat coc 10 trieu
INSERT INTO Rentals (
    car_id,
    customer_name,
    rent_date,
    status,
    security_deposit,
    late_fee,
    damage_fee
)
VALUES (
    1,
    'Nguyen Van A',
    NOW(),
    'ACTIVE',
    10000000.00,
    0.00,
    0.00
);

-- 6. Ghi nhan kiem tra xe bi vo den pha trai
INSERT INTO Inspections (
    rental_id,
    damage_description,
    inspector_name
)
VALUES (
    1,
    'Vo den pha trai',
    'Nhan vien kiem tra'
);

-- 7. Cap nhat khi khach tra xe
UPDATE Rentals
SET
    return_date = NOW(),
    status = 'COMPLETED',
    late_fee = 0.00,
    damage_fee = 2000000.00
WHERE rental_id = 1;

-- 8. Tinh tien hoan lai
SELECT
    rental_id,
    customer_name,
    security_deposit,
    late_fee,
    damage_fee,
    security_deposit - late_fee - damage_fee AS refund_amount
FROM Rentals
WHERE rental_id = 1;

-- 9. Kiem tra bien ban kiem tra xe
SELECT
    r.customer_name,
    r.status,
    i.damage_description,
    i.inspector_name
FROM Rentals AS r
JOIN Inspections AS i
    ON r.rental_id = i.rental_id
WHERE r.rental_id = 1;
```