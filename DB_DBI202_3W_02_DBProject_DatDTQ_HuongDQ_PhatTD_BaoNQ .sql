CREATE DATABASE LAZADA_ASSIGNMENT
GO
USE LAZADA_ASSIGNMENT
GO
--1. CREATE TABLE SUPPLIER
CREATE TABLE SUPPLIERS
(
	SUPPLIER_ID CHAR(10) NOT NULL PRIMARY KEY,
	SUPPLIER_NAME NVARCHAR(200)
)
GO
--2. CREATE TABLE CATEGORY
CREATE TABLE CATEGORY
(
	CATEGORY_ID INT NOT NULL PRIMARY KEY,
	CATEGORY_NAME NVARCHAR(200)
)
GO
--3. CREATE TABLE PRODUCT
CREATE TABLE PRODUCT
(
	PRODUCT_ID CHAR(10) NOT NULL PRIMARY KEY,
	PRODUCT_NAME NVARCHAR(200),
	QUANTITY INT NOT NULL, 
	PRICE MONEY NOT NULL, 
	PRODUCTION_DATE DATE, 
	EXPIRATION_DATE DATE,
	VOUCHER NVARCHAR(200),
	THE_EVENT NVARCHAR(200),
	SUPPLIER_ID CHAR(10) NOT NULL,
	CATEGORY_ID INT NOT NULL,
	CONSTRAINT PK_SUPPLIER_ID FOREIGN KEY (SUPPLIER_ID) REFERENCES SUPPLIERS,
	CONSTRAINT PK_CATEGORY_ID FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORY
)
GO
--4. CREATE TABLE CUSTOMER
CREATE TABLE CUSTOMERS
(
	CUSTOMER_ID INT NOT NULL PRIMARY KEY,
	CUSTOMER_NAME NVARCHAR(200),
	SEX NVARCHAR(200),
	PHONE INT NOT NULL,
	EMAIL NVARCHAR(200),
	THE_ADDRESS NVARCHAR(200) NOT NULL
)
GO
--5. CREATE TABLE ORDER
CREATE TABLE ORDER_CUSTOMER
(
	ORDER_ID CHAR(10) NOT NULL PRIMARY KEY,
	CUSTOMER_ID INT NOT NULL,
	QUANTITY INT NOT NULL,
	PRICE MONEY NOT NULL,
	TOTAL_PRICE MONEY NOT NULL,
	THE_STATUS NVARCHAR(200),
	CONSTRAINT PK_CUSTOMER_ID0 FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS,
)

GO


--6. CREATE TABLE ORDER_DETAIL
CREATE TABLE ORDER_DETAIL
(
	ORDER_ID CHAR(10) NOT NULL,
	PRODUCT_ID CHAR(10) NOT NULL,
	PURCHASE_DATE DATE,
	DELIVERY_DATE DATE,
	CONSTRAINT PK_ORDER_PRODUCT PRIMARY KEY (ORDER_ID, PRODUCT_ID),
	CONSTRAINT PK_PRODUCT_ID FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT,
	CONSTRAINT PK_ORDER_ID0 FOREIGN KEY (ORDER_ID) REFERENCES ORDER_CUSTOMER
)
GO
--7. CREATE TABLE FEEDBACK
CREATE TABLE FEEDBACK_CUSTOMER
(
	FEEDBACK_ID INT NOT NULL PRIMARY KEY,
	CONTENT NVARCHAR(200),
	RATE INT,
	SUPPLIER_ID CHAR(10) NOT NULL,
	CUSTOMER_ID INT NOT NULL,
	ORDER_ID CHAR(10) NOT NULL,
	CONSTRAINT PK2_SUPPLIER_ID1 FOREIGN KEY (SUPPLIER_ID) REFERENCES SUPPLIERS,
	CONSTRAINT PK2_CUSTOMER_ID1 FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS,
	CONSTRAINT PK2_ORDER_ID1 FOREIGN KEY (ORDER_ID) REFERENCES ORDER_CUSTOMER
)
GO
--import data product
INSERT INTO PRODUCT (PRODUCT_ID, PRODUCT_NAME, QUANTITY, PRICE, PRODUCTION_DATE, EXPIRATION_DATE, VOUCHER, THE_EVENT, SUPPLIER_ID, CATEGORY_ID)
VALUES
('SF342102', N'Sữa hộp Vinamilk 200ml', 100, 15000, '2023-01-15', '2024-06-30', 'VOUCHER123', 'Back to School Sale', 'LL99', 004),
('SW204535', N'Áo Dài Cách Tân Hở Vai', 50, 25000, '2023-02-20', '2024-09-15', 'VOUCHER456', 'Summer Promotion', 'UL55', 007),
('SF057346', N'Chả cá hấp Thanh Hóa', 30, 80000, '2023-03-10', '2024-07-31', NULL, NULL, 'LL99', 004),
('SF045632', N'Nước ngọt Pepsi 330ml', 80, 12000, '2023-04-05', '2024-10-30', 'VOUCHER789', NULL, 'LL99', 004),
('SF553281', N'Bánh mì gối nhân xúc xích', 20, 30000, '2023-05-25', '2024-08-20', NULL, 'Clearance Sale', 'LL99', 004),
('SA113403', N'Cầu dao tự động', 40, 50000, '2023-06-12', '2025-06-12', 'VOUCHERABC', 'Summer Sale', 'ME62', 002),
('SH166723', N'Máy giặt Panasonic 8kg', 10, 8000000, '2023-07-03', '2026-07-03', NULL, NULL, 'PN32', 003),
('SK181700', N'Giày Air force 1 trẻ em', 15, 4000000, '2023-08-18', '2025-08-18', 'VOUCHERXYZ', 'Year End Sale', 'GK00', 008),
('SM181756', N'Áo sơ mi nam Uniqlo', 60, 700000, '2023-09-09', '2025-09-09', NULL, 'Flash Sale', 'YM52', 006),
('SE165677', N'Quạt điều hòa Mitsubishi 5 cánh', 5, 2500000, '2023-10-30', '2026-10-30', NULL, 'Summer Clearance', 'MX12', 001),
('SAM164545', N'Xe máy Honda Winer X', 25, 120000000, '2023-11-17', '2025-11-17', 'VOUCHERDEF', NULL, 'HD77', 010),
('SL158856', N'Đèn led 3D hình pha lê', 8, 150000, '2023-12-08', '2025-12-08', NULL, 'Winter Sale', 'XQD21', 005),
('SH192000', N'Ghế massage cao cấp', 3, 25000000, '2024-01-01', '2027-01-01', 'VOUCHERGHI', 'New Year Promotion', 'PN32', 003),
('SA181701', N'Máy ảnh Canon EOS 80D', 7, 1500000, '2024-02-14', '2026-02-14', NULL, NULL, 'ME62', 002),
('SH181766', N'Bếp từ Electrolux', 12, 6000000, '2024-03-25', '2027-03-25', 'VOUCHERJKL', 'Spring Sale', 'PN32', 003),
('SE171670', N'Laptop Asus Gaming', 18, 4000000, '2024-04-10', '2026-04-10', NULL, 'Mid-Year Clearance', 'MX12', 001),
('SS190000', N'Bộ đồ thể thao Manchester United ', 22, 200000, '2024-05-03', '2026-05-03', NULL, 'Summer Sale', 'LT60', 009),
('SA188892', N'Ổ cắm thông minh TP-Link', 32, 300000, '2024-06-20', '2026-06-20', 'VOUCHERMNO', NULL, 'ME62', 002)

--import data supplier
INSERT INTO SUPPLIERS (SUPPLIER_ID, SUPPLIER_NAME)
VALUES
('HD77', N'Công ty Honda Việt Nam'), --sam
('XQD21', N'Công ty LED XQD'), -- sl
('LT60', N'Công ty TNHH thể thao Long Thành'), --ss
('YM52', N'Công ty TNHH YaMe Việt Nam'), --sm
('GK00', N'Gap kids Brand'), --sk
('LL99', N'Công ty TNHH Lock&Lock Việt Nam'), --sf
('PN32', N'Công ty TNHH Panasonic Việt Nam'),-- sh
('MX12', N'Cửa hàng điện máy Điện Máy Xanh'),-- se
('UL55', N'Cửa hàng thời trang Uniqlo'), --sw
('ME62', N'Công ty TNHH Mitsubishi Electric Việt Nam') --sa
-- Se thiết bị điện tử sa phụ kiện điện tử sh thiết bị gia dụng, SF ĐÔf ăn thức UỐNG sl lifestyle 
--sw thời trang nữ sm thoi trang nam sk thời trang kids ss đồ thể thao

--import data category
INSERT INTO CATEGORY (CATEGORY_ID, CATEGORY_NAME)
VALUES
(001, N'Thiết bị điện tử'),
(002, N'Phụ kiện điện tử'),
(003, N'Thiết bị gia dụng'),
(004, N'đồ ăn & đồ uống'),
(005, N'lifestyle'),
(006, N'Thời trang nam'),
(007, N'Thời trang nữ'),
(008, N'Đồ trẻ em'),
(009, N'thể thao'),
(010, N'Moto & Xe máy')


--import data CUSTOMER
INSERT INTO CUSTOMERS (CUSTOMER_ID, CUSTOMER_NAME, SEX, PHONE, EMAIL, THE_ADDRESS)
VALUES
(1, N'Lữ Đặng Duy An', N'Nam', 0723555662, N'ludangduyan@example.com', N'123 Đường ABC, Quận XYZ, Thành phố Hồ Chí Minh'),
(2, N'Trần Thị Kim Liên', N'Nữ', 0723555613, N'tranthikimlien@example.com', N'456 Đường DEF, Quận UVW, Thành phố Hà Nội'),
(3, N'Lê Võ Cao Minh', N'Nam', 0723555624, N'levocaominh@example.com', N'789 Đường GHI, Quận MNO, Thành phố Đà Nẵng'),
(4, N'Phạm Đinh Minh Khuê', N'Nữ', 0723555635, N'phamdinhminhkhue@example.com', N'101 Đường JKL, Quận RST, Thành phố Cần Thơ'),
(5, N'Hoàng Văn Mai Châu', N'Nam', 0723555699, N'hoangvanmaichau@example.com', N'202 Đường UVW, Quận PQR, Thành phố Hải Phòng'),
(6, N'Đặng Thị Như Anh', N'Nữ', 0723555688, N'dangthinhuanh@example.com', N'303 Đường XYZ, Quận IJK, Thành phố Hà Tĩnh'),
(7, N'Nguyễn Lê Minh Việt', N'Nam', 0723555677, N'nguyenleminhviet@example.com', N'404 Đường MNO, Quận GHI, Thành phố Nha Trang'),
(8, N'Lê Nguyễn Kim Đan', N'Nữ', 0723555666, N'lenguyenkimdan@example.com', N'505 Đường RST, Quận DEF, Thành phố Đà Lạt'),
(9, N'Trần Đặng Quốc Hùng', N'Nam', 0723555655, N'trandangquochung@example.com', N'606 Đường KLM, Quận ABC, Thành phố Phan Thiết'),
(10, N'Nguyễn Bùi Hoàng Anh', N'Nữ', 0723555644, N'nguyenbuihoanganh@example.com', N'707 Đường OPQ, Quận STU, Thành phố Hạ Long'),
(11, N'Lê Nguyễn Công Nghĩa', N'Nam', 0723555633, N'lenguyencongnghia@example.com', N'808 Đường NOP, Quận WXY, Thành phố Vũng Tàu'),
(12, N'Nguyễn Phạm Thanh Tâm', N'Nữ', 0723555622, N'nguyenphamthanhtam@example.com', N'909 Đường HIJ, Quận LMN, Thành phố Quy Nhơn'),
(13, N'Phạm Đỗ Quốc Hưng', N'Nam', 0723555611, N'phamdoquochung@example.com', N'1010 Đường BCD, Quận UVW, Thành phố Hà Giang')


INSERT INTO ORDER_CUSTOMER (ORDER_ID, CUSTOMER_ID, QUANTITY, PRICE, TOTAL_PRICE, THE_STATUS)
VALUES
('AB1', 1, 2, 15000, 30000, N'Đã thanh toán'),
('AB2', 3, 1, 25000, 25000, N'Chưa thanh toán'),
('AB3', 5, 3, 80000, 240000, N'Đang xử lý'),
('AB4', 10, 2, 12000, 24000, N'Chưa thanh toán'),
('AB5', 13, 1, 30000, 30000, N'Đã thanh toán'),
('AB6', 2, 4, 50000, 200000, N'Đã thanh toán'),
('AB7', 7, 1, 8000000, 8000000, N'Chưa thanh toán'),
('AB8', 12, 2, 4000000, 8000000, N'Đã thanh toán'),
('AB9', 8, 1, 700000, 700000, N'Chưa thanh toán'),
('AB10', 4, 3, 200000, 1000000, N'Đang xử lý'),
('AB11', 11, 1, 120000000, 120000000, N'Chưa thanh toán'),
('AB12', 9, 1, 1500000, 1500000, N'Đã thanh toán'),
('AB13', 6, 2, 4000000, 8000000, N'Đang xử lý')


--import data ORDER_DETAIL
INSERT INTO ORDER_DETAIL (ORDER_ID, PRODUCT_ID, PURCHASE_DATE, DELIVERY_DATE)
VALUES
('AB1', 'SF342102', '2024-04-01', '2024-04-03'),
('AB2', 'SW204535', '2024-04-02', '2024-04-05'),
('AB3', 'SF057346', '2024-04-03', '2024-04-06'),
('AB4', 'SF045632', '2024-04-04', '2024-04-07'),
('AB5', 'SF553281', '2024-04-05', '2024-04-08'),
('AB6', 'SA113403', '2024-04-06', '2024-04-09'),
('AB7', 'SH166723', '2024-04-07', '2024-04-10'),
('AB8', 'SK181700', '2024-04-08', '2024-04-11'),
('AB9', 'SM181756', '2024-04-09', '2024-04-12'),
('AB10', 'SS190000', '2024-04-10', '2024-04-13'),
('AB11', 'SAM164545', '2024-04-11', '2024-04-14'),
('AB12', 'SA181701', '2024-04-12', '2024-04-15'),
('AB13', 'SE171670', '2024-04-13', '2024-04-16')


--IMPORT DATA FEEDBACK
INSERT INTO FEEDBACK_CUSTOMER(FEEDBACK_ID, CONTENT, RATE, SUPPLIER_ID, CUSTOMER_ID, ORDER_ID)
VALUES
(110, N'Sản phẩm rất tốt, tôi rất hài lòng!', 5, 'LL99', 1, 'AB1'),
(111, N'Bánh quy thơm ngon, giao hàng nhanh chóng.', 4, 'ME62', 2, 'AB6'),
(112, N'Hàng đúng mẫu mã, giao hàng đúng hẹn.', 5, 'UL55', 3, 'AB2'),
(113, N'Đóng gói sản phẩm kém, cần cải thiện.', 2, 'LT60', 4, 'AB10'),
(114, N'Giao hàng chậm, sản phẩm không như mong đợi.', 5, 'LL99', 5, 'AB3'),
(115, N'Dịch vụ rất tốt, nhân viên nhiệt tình.', 5, 'MX12', 6, 'AB13'),
(116, N'Sản phẩm đến trễ, nhưng chất lượng ok.', 4, 'PN32', 7, 'AB7'),
(117, N'Giao hàng đúng hẹn, sản phẩm tốt.', 5, 'YM52', 8, 'AB9'),
(118, N'Sản phẩm không như mô tả, cần cải thiện.', 2, 'LT60', 9, 'AB12'),
(119, N'Giao hàng nhanh, sản phẩm đúng chất lượng.', 5, 'LL99', 10, 'AB4'),
(1110, N'Chất lượng sản phẩm tốt, dịch vụ hài lòng.', 5, 'HD77', 11, 'AB11'),
(1111, N'Giao hàng chậm, nhưng sản phẩm ok.', 4, 'GK00', 12, 'AB8'),
(1112, N'Sản phẩm chất lượng, giao hàng đúng hẹn.', 5, 'LL99', 13, 'AB5')

SELECT * FROM CATEGORY
SELECT * FROM SUPPLIERS
SELECT * FROM PRODUCT
SELECT * FROM CUSTOMERS
SELECT * FROM ORDER_CUSTOMER
SELECT * FROM ORDER_DETAIL
SELECT * FROM FEEDBACK_CUSTOMER

--trigger
--1. DELETE
--CẬP NHẬT HÀNG TỒN KHO SAU KHI MỘT ĐƠN HÀNG ĐƯỢC XỬ LÝ
CREATE TRIGGER CAPNHAT_HANGTON ON 


--2. INSERT
--
drop trigger TRG_CAPNHAT_HANGTON