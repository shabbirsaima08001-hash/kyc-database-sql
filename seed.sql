-- Fake data. No real people.
INSERT INTO risk_level VALUES (1,'LOW',24),(2,'MEDIUM',12),(3,'HIGH',6);

INSERT INTO customer VALUES
(1,'Marco Rossi','1985-03-12','marco.rossi@example.com','IT','Employee',1,'2023-01-10'),
(2,'Giulia Bianchi','1992-07-21','giulia.b@example.com','IT','Teacher',1,'2023-02-15'),
(3,'Ahmed Khan','1978-11-02','ahmed.khan@example.com','PK','Cash business owner',3,'2022-06-01'),
(4,'Sara Verdi','2000-05-30','sara.verdi@example.com','DE','Student',1,'2024-09-12'),
(5,'Luca Ferrari','1969-09-09','luca.f@example.com','IT','Politician',3,'2021-03-20'),
(6,'Fatima Ali','1990-01-17','fatima.ali@example.com','AE','Self-employed',2,'2024-01-05'),
(7,'Omar Haddad','1983-04-25','omar.h@example.com','IR','Crypto trader',3,'2025-02-11'),
(8,'Elena Conti','1996-12-03','elena.conti@example.com','FR','Employee',1,'2025-05-18'),
(9,'Paolo Greco','1975-08-14','paolo.greco@example.com','ES','Real estate agent',2,'2022-10-30'),
(10,'Nadia Sheikh','1988-06-06','nadia.s@example.com','PK','Employee',2,'2023-11-09');

INSERT INTO document VALUES
(1,1,'ID_CARD','AB1234567','2029-05-01'),
(2,2,'PASSPORT','YA7654321','2024-03-15'),
(3,3,'PASSPORT','PK9988776','2026-01-20'),
(4,4,'ID_CARD','DE5544332','2027-01-15'),
(5,5,'ID_CARD','AB1111222','2027-12-31'),
(6,6,'RESIDENCE_PERMIT','AE3332221','2025-06-30'),
(7,7,'PASSPORT','IR1212121','2031-02-02'),
(8,8,'ID_CARD','FR9090909','2028-04-04'),
(9,9,'ID_CARD','ES7070707','2025-01-01'),
(10,10,'PASSPORT','PK4545454','2029-09-19');

INSERT INTO kyc_check VALUES
(1,1,'ID_VERIFICATION','PASS','2023-01-10'),
(2,1,'SANCTIONS_SCREENING','PASS','2023-01-10'),
(3,2,'ID_VERIFICATION','PASS','2023-02-15'),
(4,3,'ID_VERIFICATION','PASS','2022-06-01'),
(5,3,'SANCTIONS_SCREENING','PENDING','2022-06-02'),
(6,4,'ID_VERIFICATION','FAIL','2024-09-12'),
(7,5,'SANCTIONS_SCREENING','PASS','2021-03-20'),
(8,6,'ADDRESS_PROOF','PENDING','2024-01-06'),
(9,7,'ID_VERIFICATION','PASS','2025-02-11'),
(10,7,'SANCTIONS_SCREENING','FAIL','2025-02-12'),
(11,8,'ID_VERIFICATION','PASS','2025-05-18'),
(12,9,'ID_VERIFICATION','PASS','2022-10-30');

INSERT INTO transaction_record VALUES
(1,1,350.00,'2026-01-05'),(2,1,1200.00,'2026-02-10'),
(3,3,9500.00,'2026-01-15'),(4,3,9800.00,'2026-01-16'),(5,3,9700.00,'2026-01-17'),
(6,5,25000.00,'2026-02-01'),(7,7,48000.00,'2026-02-03'),
(8,2,80.00,'2026-02-12'),(9,6,4200.00,'2026-02-14'),(10,9,15000.00,'2026-02-20');
