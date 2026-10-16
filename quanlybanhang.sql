```sql
CREATE DATABASE IF NOT EXISTS QuanLyBanHang;
USE QuanLyBanHang;

-- 1. Bang Customer: luu thong tin khach hang
CREATE TABLE Customer (
    cID INT NOT NULL AUTO_INCREMENT,
    cName VARCHAR(50) NOT NULL,
    cAge TINYINT,
    PRIMARY KEY (cID)
);

-- 2. Bang Product: luu thong tin san pham
CREATE TABLE Product (
    pID INT NOT NULL AUTO_INCREMENT,
    pName VARCHAR(50) NOT NULL,
    pPrice DECIMAL(10, 2) NOT NULL DEFAULT 0,
    PRIMARY KEY (pID),
    CHECK (pPrice >= 0)
);

-- 3. Bang Order: luu thong tin hoa don
CREATE TABLE `Order` (
    oID INT NOT NULL AUTO_INCREMENT,
    cID INT NOT NULL,
    oDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (oID),
    FOREIGN KEY (cID) REFERENCES Customer(cID)
);

-- 4. Bang Orderdetail: luu chi tiet san pham trong hoa don
CREATE TABLE Orderdetail (
    oID INT NOT NULL,
    pID INT NOT NULL,
    odQTY INT NOT NULL DEFAULT 1,
    PRIMARY KEY (oID, pID),
    FOREIGN KEY (oID) REFERENCES `Order`(oID),
    FOREIGN KEY (pID) REFERENCES Product(pID),
    CHECK (odQTY >= 1)
);
```