CREATE DATABASE TurSirketiDB
GO
USE TurSirketiDB

CREATE TABLE GidilecekYerler(
GidilecekYerID int PRIMARY KEY IDENTITY,
GidelecekYerAdi varchar(30),
Ucret money
)

CREATE TABLE Diller(
DilID int PRIMARY KEY IDENTITY,
DilAdi varchar(20)
)

CREATE TABLE Turistler(
TuristID int PRIMARY KEY IDENTITY,
AdSoyad varchar(30) not null,
Cinsiyet varchar(10),
DogumTarihi datetime,
Uyruk varchar(20),
UlkeAdi varchar(20),
GeldigiTarih datetime,
)

CREATE TABLE Rehberler(
RehberID int PRIMARY KEY IDENTITY,
AdSoyad varchar(30) not null,
Cinsiyet varchar(10),
TelNo varchar(30),
)

CREATE TABLE Odeme(
OdemeID int PRIMARY KEY IDENTITY,
OdemeSekli varchar(20),
TuristID int REFERENCES Turistler(TuristID)
)

CREATE TABLE Faturalar(
FaturaID int PRIMARY KEY IDENTITY,
FaturaNo int ,
TuristID int REFERENCES Turistler(TuristID)
)

CREATE TABLE FaturaDetay(
FaturaDetayID int PRIMARY KEY IDENTITY,
BiletTürü VARCHAR(15),
Indirim real,
Fiyat money,
BiletAdet int,
ParaBirimi varchar(10),
FaturaTarihi datetime,
FaturaID int REFERENCES Faturalar(FaturaID),
GidilecekYerID int REFERENCES GidilecekYerler(GidilecekYerID),
OdemeID int REFERENCES Odeme(OdemeID)
)

CREATE TABLE Turistler_Diller(
TuristID int REFERENCES Turistler(TuristID),
DilID int REFERENCES Diller(DilID),
PRIMARY KEY (TuristID,DilID)
)

CREATE TABLE Rehberler_Diller(
RehberID int REFERENCES Rehberler(RehberID),
DilID int REFERENCES Diller(DilID),
PRIMARY KEY (RehberID,DilID)
)

CREATE TABLE Turitler_Rehberler_GidilecekYerler(
TuristID int REFERENCES Turistler(TuristID),
RehberID int REFERENCES Rehberler(RehberID),
GidilecekYerID int REFERENCES GidilecekYerler(GidilecekYerID),
PRIMARY KEY (RehberID,TuristID,GidilecekYerID)
)

--------------------------------------------------------------------

INSERT INTO GidilecekYerler(GidelecekYerAdi,Ucret) VALUES('Ayasofya',120), ('Yerebatan Sarnýcý',150),('Pierre Loti',180), ('Kýz kulesi',140),('Adalar',180),('Dolmabahçe Sarayý',185),('Miniatürk',145), ('Sultan Ahmet Camii',140),('Rumeli Hisarý',160),('Dolmabahçe Sarayý',170),('Mýsýr Çarþýsý',200),('Anadolu Hisarý',240),('Eyüp Sultan Camii',250),('Atatürk Arboretumu',180),('Kapalý Çarþý',300)

INSERT INTO Diller VALUES  ('Ýtalyanca'), ('Fince'), ('Ýngilizce'),('Yunanca'), ('Almanca'),('Japonca'),('Ukraynaca'),('Arnavutça')

INSERT INTO Turistler(AdSoyad,Cinsiyet,DogumTarihi,Uyruk,UlkeAdi,GeldigiTarih) VALUES
('Levi Acevedo', 'Kadýn', '2001-11-06', 'Japanese', 'Italy', '2022-01-11'),
('Basil Aguilar', 'Erkek', '2005-04-22', 'Greek', 'Greek', '2022-11-08'),
('Zenaida Holder', 'Erkek', '1990-09-01', 'Finnish', 'Greek', '2022-04-02'),
('Illana Browning', 'Kadýn', '2001-01-28', 'Greek', 'English', '2023-01-05'),
('Raja Duke', 'Erkek', '1993-07-27', 'Dutch', 'Dutch', '2021-08-09'),
('Isaiah Valdez', 'Erkek', '2012-01-16', 'Finnish', 'Finnish', '2022-08-09'),
('Gray Marshall', 'Kadýn', '1990-11-21', 'Japanese', 'Japanese', '2022-07-08'),
('Ora Fletcher', 'Kadýn', '2008-01-19', 'English', 'English', '2023-03-04'),
('Lavinia Lloyd', 'Kadýn', '1996-10-26', 'English', 'English', '2021-06-03'),
('Jenna Williams', 'Kadýn', '1992-05-01', 'Greek', 'Greek', '2022-06-11'),
('Christian Nash', 'Erkek', '1990-09-08', 'English', 'English', '2022-05-02'),
('Basil Aguilar', 'Erkek', '2009-04-22', 'Greek', 'Greek', '2021-09-09'),
('Brianna Everett', 'Erkek', '1988-03-09', 'Japanese', 'Japanese', '2022-09-04'),
('Geoffrey Knowles', 'Erkek', '1995-02-17', 'Ukrainian', 'Ukrainian', '2022-06-01'),
('Quinn Hamilton', 'Erkek', '2002-07-10', 'English', 'English', '2021-04-12')


INSERT INTO Rehberler(AdSoyad,Cinsiyet,TelNo) VALUES
('Ozan Temiz','Erkek','5556544343'),
('Bahar Sevgin','Kadýn','5556544344'),
('Ömer Uçar','Erkek','5556544345'),
('Sevgi Çakmak','Kadýn','5556544346'),
('Linda Callahan','Kadýn','5556544344')

INSERT INTO Turitler_Rehberler_GidilecekYerler(TuristID, RehberID, GidilecekYerID) VALUES(1,1,1)
INSERT INTO Turitler_Rehberler_GidilecekYerler(TuristID, RehberID, GidilecekYerID) VALUES(1,1,2)
INSERT INTO Turitler_Rehberler_GidilecekYerler(TuristID, RehberID, GidilecekYerID) VALUES(2,2,3)
INSERT INTO Turitler_Rehberler_GidilecekYerler(TuristID, RehberID, GidilecekYerID) VALUES(2,2,4)
INSERT INTO Turitler_Rehberler_GidilecekYerler(TuristID, RehberID, GidilecekYerID) VALUES(3,3,5)
INSERT INTO Turitler_Rehberler_GidilecekYerler(TuristID, RehberID, GidilecekYerID) VALUES(3,3,1)
INSERT INTO Turitler_Rehberler_GidilecekYerler(TuristID, RehberID, GidilecekYerID) VALUES(3,3,6)
INSERT INTO Turitler_Rehberler_GidilecekYerler(TuristID, RehberID, GidilecekYerID) VALUES(4,4,7)
INSERT INTO Turitler_Rehberler_GidilecekYerler(TuristID, RehberID, GidilecekYerID)VALUES(4,4,8)
INSERT INTO Turitler_Rehberler_GidilecekYerler(TuristID, RehberID, GidilecekYerID)VALUES(5,2,9)
INSERT INTO Turitler_Rehberler_GidilecekYerler(TuristID, RehberID, GidilecekYerID)VALUES(6,1,6)
INSERT INTO Turitler_Rehberler_GidilecekYerler(TuristID, RehberID, GidilecekYerID)VALUES(6,1,11)
INSERT INTO Turitler_Rehberler_GidilecekYerler(TuristID, RehberID, GidilecekYerID)VALUES(7,5,9)
INSERT INTO Turitler_Rehberler_GidilecekYerler(TuristID, RehberID, GidilecekYerID)VALUES(7,5,4)
INSERT INTO Turitler_Rehberler_GidilecekYerler(TuristID, RehberID, GidilecekYerID)VALUES(8,2,12)
INSERT INTO Turitler_Rehberler_GidilecekYerler(TuristID, RehberID, GidilecekYerID)VALUES(8,2,13)
INSERT INTO Turitler_Rehberler_GidilecekYerler(TuristID, RehberID, GidilecekYerID)VALUES(9,1,3)
INSERT INTO Turitler_Rehberler_GidilecekYerler(TuristID, RehberID, GidilecekYerID)VALUES(9,1,4)
INSERT INTO Turitler_Rehberler_GidilecekYerler(TuristID, RehberID, GidilecekYerID)VALUES(10,3,14)
INSERT INTO Turitler_Rehberler_GidilecekYerler(TuristID, RehberID, GidilecekYerID)VALUES(10,3,6)
INSERT INTO Turitler_Rehberler_GidilecekYerler(TuristID, RehberID, GidilecekYerID)VALUES(11,3,15)
INSERT INTO Turitler_Rehberler_GidilecekYerler(TuristID, RehberID, GidilecekYerID)VALUES(11,3,11)
INSERT INTO Turitler_Rehberler_GidilecekYerler(TuristID, RehberID, GidilecekYerID)VALUES(2,4,14)
INSERT INTO Turitler_Rehberler_GidilecekYerler(TuristID, RehberID, GidilecekYerID)VALUES(12,5,3)
INSERT INTO Turitler_Rehberler_GidilecekYerler(TuristID, RehberID, GidilecekYerID)VALUES(12,5,4)
INSERT INTO Turitler_Rehberler_GidilecekYerler(TuristID, RehberID, GidilecekYerID)VALUES(13,5,11)
INSERT INTO Turitler_Rehberler_GidilecekYerler(TuristID, RehberID, GidilecekYerID)VALUES(13,5,14)
INSERT INTO Turitler_Rehberler_GidilecekYerler(TuristID, RehberID, GidilecekYerID)VALUES(14,4,7)
INSERT INTO Turitler_Rehberler_GidilecekYerler(TuristID, RehberID, GidilecekYerID)VALUES(14,4,4)

INSERT INTO Turistler_Diller(TuristID,DilID) VALUES (1,1)
INSERT INTO Turistler_Diller(TuristID,DilID) VALUES (1,6)
INSERT INTO Turistler_Diller(TuristID,DilID) VALUES (2,4)
INSERT INTO Turistler_Diller(TuristID,DilID) VALUES (3,2)
INSERT INTO Turistler_Diller(TuristID,DilID) VALUES (3,4)
INSERT INTO Turistler_Diller(TuristID,DilID) VALUES (4,4)
INSERT INTO Turistler_Diller(TuristID,DilID) VALUES (4,3)
INSERT INTO Turistler_Diller(TuristID,DilID) VALUES (5,5)
INSERT INTO Turistler_Diller(TuristID,DilID) VALUES (6,2)
INSERT INTO Turistler_Diller(TuristID,DilID) VALUES (7,6)
INSERT INTO Turistler_Diller(TuristID,DilID) VALUES (8,3)
INSERT INTO Turistler_Diller(TuristID,DilID) VALUES (9,3)
INSERT INTO Turistler_Diller(TuristID,DilID) VALUES (10,4)
INSERT INTO Turistler_Diller(TuristID,DilID) VALUES (11,3)
INSERT INTO Turistler_Diller(TuristID,DilID) VALUES (12,6)
INSERT INTO Turistler_Diller(TuristID,DilID) VALUES (13,7)
INSERT INTO Turistler_Diller(TuristID,DilID) VALUES (14,3)

INSERT INTO Rehberler_Diller(RehberID,DilID) VALUES(1,1)
INSERT INTO Rehberler_Diller(RehberID,DilID) VALUES(1,2)
INSERT INTO Rehberler_Diller(RehberID,DilID) VALUES(1,3)
INSERT INTO Rehberler_Diller(RehberID,DilID) VALUES(2,4)
INSERT INTO Rehberler_Diller(RehberID,DilID) VALUES(2,3)
INSERT INTO Rehberler_Diller(RehberID,DilID) VALUES(2,5)
INSERT INTO Rehberler_Diller(RehberID,DilID) VALUES(3,4)
INSERT INTO Rehberler_Diller(RehberID,DilID) VALUES(3,3)
INSERT INTO Rehberler_Diller(RehberID,DilID) VALUES(4,4)
INSERT INTO Rehberler_Diller(RehberID,DilID) VALUES(4,3)
INSERT INTO Rehberler_Diller(RehberID,DilID) VALUES(5,6)
INSERT INTO Rehberler_Diller(RehberID,DilID) VALUES(5,7)

INSERT INTO Faturalar (FaturaNo, TuristID)
VALUES
(12345, 1),
(12346, 1),
(12347, 2),
(12348, 2),
(12349, 3),
(12350, 3),
(12351, 3),
(12352, 4),
(12353, 4),
(12354, 5),
(12355, 6),
(12356, 6),
(12357, 7),
(12358, 7),
(12359, 8),
(12360, 8),
(12361, 9),
(12362, 9),
(12363, 10),
(12364, 10),
(12365, 11),
(12366, 11),
(12367, 2),
(12368, 12),
(12369, 12),
(12370, 13),
(12371, 13),
(12372, 14),
(12373, 14)

INSERT INTO Odeme(OdemeSekli,TuristID) VALUES 
('Nakit', 1),
('Nakit', 1),
('Kredi', 2),
('Kredi', 2),
('Nakit', 3),
('Nakit', 3),
('Nakit', 3),
('Kredi', 4),
('Kredi', 4),
('Kredi', 5),
('Kredi', 6),
('Kredi', 6),
('Nakit', 7),
('Nakit', 7),
('Kredi', 8),
('Kredi', 8),
('Nakit', 9),
('Nakit', 9),
('Kredi', 10),
('Kredi', 10),
('Nakit', 11),
('Nakit', 11),
('Kredi', 2),
('Nakit', 12),
('Nakit', 12),
('Nakit', 13),
('Nakit', 13),
('Kredi', 14),
('Kredi', 14)


INSERT INTO FaturaDetay (BiletTürü, Indirim, Fiyat, BiletAdet, ParaBirimi, FaturaTarihi, FaturaID, GidilecekYerID)
VALUES('Tam',     0.00, 120.00,  2, 'JPY', '2024-02-10',  1,  1)
INSERT INTO FaturaDetay (BiletTürü, Indirim, Fiyat, BiletAdet, ParaBirimi, FaturaTarihi, FaturaID, GidilecekYerID)
VALUES('Yarým',   0.50, 150.00,  3, 'JPY', '2024-02-15',  2,  2)
INSERT INTO FaturaDetay (BiletTürü, Indirim, Fiyat, BiletAdet, ParaBirimi, FaturaTarihi, FaturaID, GidilecekYerID)
VALUES('Tam',     0.00, 180.00,  1, 'EUR', '2024-02-13',  3,  3)
INSERT INTO FaturaDetay (BiletTürü, Indirim, Fiyat, BiletAdet, ParaBirimi, FaturaTarihi, FaturaID, GidilecekYerID)
VALUES('Yarým',   0.50, 140.00,  4, 'EUR', '2024-02-14',  4,  4)
INSERT INTO FaturaDetay (BiletTürü, Indirim, Fiyat, BiletAdet, ParaBirimi, FaturaTarihi, FaturaID, GidilecekYerID)
VALUES('Tam',     0.00, 180.00,  2, 'FIM', '2024-02-15',  5,  5)
INSERT INTO FaturaDetay (BiletTürü, Indirim, Fiyat, BiletAdet, ParaBirimi, FaturaTarihi, FaturaID, GidilecekYerID)
VALUES('Tam',     0.00, 120.00,  3, 'FIM', '2024-02-18',  6,  1)
INSERT INTO FaturaDetay (BiletTürü, Indirim, Fiyat, BiletAdet, ParaBirimi, FaturaTarihi, FaturaID, GidilecekYerID)
VALUES('Yarým',   0.50, 185.00,  5, 'FIM', '2024-02-17',  7,  6)
INSERT INTO FaturaDetay (BiletTürü, Indirim, Fiyat, BiletAdet, ParaBirimi, FaturaTarihi, FaturaID, GidilecekYerID)
VALUES('Yarým',  0.50, 145.00,  2, 'EUR', '2024-02-19',  8,  7)
INSERT INTO FaturaDetay (BiletTürü, Indirim, Fiyat, BiletAdet, ParaBirimi, FaturaTarihi, FaturaID, GidilecekYerID)
VALUES('Tam',     0.00, 140.00,  3, 'EUR', '2024-02-07',  9,  8)
INSERT INTO FaturaDetay (BiletTürü, Indirim, Fiyat, BiletAdet, ParaBirimi, FaturaTarihi, FaturaID, GidilecekYerID)
VALUES('Tam',     0.00, 160.00,  4, 'EUR', '2024-02-05', 10,  9)
INSERT INTO FaturaDetay (BiletTürü, Indirim, Fiyat, BiletAdet, ParaBirimi, FaturaTarihi, FaturaID, GidilecekYerID)
VALUES('Yarým',   0.50, 170.00,  2, 'FIM', '2024-02-06', 11, 10)
INSERT INTO FaturaDetay (BiletTürü, Indirim, Fiyat, BiletAdet, ParaBirimi, FaturaTarihi, FaturaID, GidilecekYerID)
VALUES('Tam',     0.00, 200.00,  3, 'FIM', '2024-02-01', 12, 11)
INSERT INTO FaturaDetay (BiletTürü, Indirim, Fiyat, BiletAdet, ParaBirimi, FaturaTarihi, FaturaID, GidilecekYerID)
VALUES('Yarým',  0.50, 160.00,  2, 'JPY', '2024-02-02', 13,  9)
INSERT INTO FaturaDetay (BiletTürü, Indirim, Fiyat, BiletAdet, ParaBirimi, FaturaTarihi, FaturaID, GidilecekYerID)
VALUES('Tam',     0.00, 140.00,  4, 'JPY', '2024-02-04', 14,  4)
INSERT INTO FaturaDetay (BiletTürü, Indirim, Fiyat, BiletAdet, ParaBirimi, FaturaTarihi, FaturaID, GidilecekYerID)
VALUES('Tam',     0.00, 240.00,  3, 'GBP', '2024-02-03', 15, 12)
INSERT INTO FaturaDetay (BiletTürü, Indirim, Fiyat, BiletAdet, ParaBirimi, FaturaTarihi, FaturaID, GidilecekYerID)
VALUES('Yarým',   0.50, 250.00,  2, 'GBP', '2024-02-11', 16, 13)
INSERT INTO FaturaDetay (BiletTürü, Indirim, Fiyat, BiletAdet, ParaBirimi, FaturaTarihi, FaturaID, GidilecekYerID)
VALUES('Tam',     0.00, 180.00,  1, 'GBP', '2024-02-08', 17,  3)
INSERT INTO FaturaDetay (BiletTürü, Indirim, Fiyat, BiletAdet, ParaBirimi, FaturaTarihi, FaturaID, GidilecekYerID)
VALUES('Tam',     0.00, 140.00,  1, 'GBP', '2024-04-01', 18,  4)
INSERT INTO FaturaDetay (BiletTürü, Indirim, Fiyat, BiletAdet, ParaBirimi, FaturaTarihi, FaturaID, GidilecekYerID)
VALUES('Yarým',  0.50, 180.00,  5, 'EUR', '2024-02-05', 19, 14)
INSERT INTO FaturaDetay (BiletTürü, Indirim, Fiyat, BiletAdet, ParaBirimi, FaturaTarihi, FaturaID, GidilecekYerID)
VALUES('Tam',     0.00, 185.00,  4, 'EUR', '2024-04-06', 20,  6)
INSERT INTO FaturaDetay (BiletTürü, Indirim, Fiyat, BiletAdet, ParaBirimi, FaturaTarihi, FaturaID, GidilecekYerID)
VALUES('Yarým',  0.50, 300.00,  6, 'JPY', '2024-05-08', 21, 15)
INSERT INTO FaturaDetay (BiletTürü, Indirim, Fiyat, BiletAdet, ParaBirimi, FaturaTarihi, FaturaID, GidilecekYerID)
VALUES('Tam',     0.00, 200.00,  8, 'JPY', '2024-12-04', 22, 11)
INSERT INTO FaturaDetay (BiletTürü, Indirim, Fiyat, BiletAdet, ParaBirimi, FaturaTarihi, FaturaID, GidilecekYerID)
VALUES('Yarým',   0.50, 180.00,  2, 'EUR', '2024-12-14', 23, 14)
INSERT INTO FaturaDetay (BiletTürü, Indirim, Fiyat, BiletAdet, ParaBirimi, FaturaTarihi, FaturaID, GidilecekYerID)
VALUES('Tam',     0.00, 180.00,  4, 'JPY', '2024-01-15', 24,  3)
INSERT INTO FaturaDetay (BiletTürü, Indirim, Fiyat, BiletAdet, ParaBirimi, FaturaTarihi, FaturaID, GidilecekYerID)
VALUES('Yarým',  0.50, 140.00,  1, 'JPY', '2024-02-17', 25,  4)
INSERT INTO FaturaDetay (BiletTürü, Indirim, Fiyat, BiletAdet, ParaBirimi, FaturaTarihi, FaturaID, GidilecekYerID)
VALUES('Tam',     0.00, 200.00,  6, 'GRV', '2024-04-17', 26, 11)
INSERT INTO FaturaDetay (BiletTürü, Indirim, Fiyat, BiletAdet, ParaBirimi, FaturaTarihi, FaturaID, GidilecekYerID)
VALUES('Yarým', 0.50, 180.00,  2, 'GRV', '2024-05-17', 27, 14 )
INSERT INTO FaturaDetay (BiletTürü, Indirim, Fiyat, BiletAdet, ParaBirimi, FaturaTarihi, FaturaID, GidilecekYerID)
VALUES('Tam',    0.00, 145.00,  7, 'GBP', '2024-05-06', 28,  7)
INSERT INTO FaturaDetay (BiletTürü, Indirim, Fiyat, BiletAdet, ParaBirimi, FaturaTarihi, FaturaID, GidilecekYerID)
VALUES('Yarým',  0.50, 140.00,  2, 'GBP', '2024-05-18', 29,  4)




