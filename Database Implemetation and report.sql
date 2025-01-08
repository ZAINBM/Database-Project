create domain ID as varchar(5) not null;

create domain address as varchar(30) not null; 

create domain email_validate as varchar(255)	
check( value like '%@%' and value like '%.com%' and length(value)<=255);

create domain number_check as varchar(25)
check( value ~ '^\+?[0-9]{10,20}$');

create domain amt_validate as Numeric
check ( value>=0);

create domain status as varchar(20)
check( value in('Available','Unavailable'));

CREATE TABLE admin (
  admin_id ID,
  username varchar(20) NOT NULL,
  password varchar(20) NOT NULL,
  date date NOT NULL,
  local_address address NOT NULL,
  email email_validate NOT NULL,
  phone_number number_check NOT NULL,
  PRIMARY KEY (admin_id)
);

-- Insert meaningful data into the admin table
INSERT INTO admin (admin_id, username, password, date, local_address, email, phone_number)
VALUES
  ('1', 'john_doe', 'password123', current_date, '123 Main St, Cityville', 'john.doe@email.com', '+1234567890'),
  ('2', 'alice_smith', 'securepass', current_date, '456 Oak Ave, Townsville', 'alice.smith@email.com', '+9876543210'),
  ('3', 'bob_jackson', 'bob123', current_date, '789 Pine Blvd, Villagetown', 'bob.jackson@email.com', '+1122334455'),
  ('4', 'sara_miller', 'sara_pass', current_date, '111 Elm St, Hamletville', 'sara.miller@email.com', '+9988776655'),
  ('5', 'michael_white', 'mikepass', current_date, '222 Birch Rd, Countryside', 'michael.white@email.com', '+1122334455'),
  ('6', 'emily_jones', 'emily567', current_date, '333 Cedar Ln, Suburbia', 'emily.jones@email.com', '+9988776655'),
  ('7', 'peter_clark', 'peterpass', current_date, '444 Maple Ct, Urbanville', 'peter.clark@email.com', '+1122334455'),
  ('8', 'linda_brown', 'linda123', current_date, '555 Walnut Dr, Metropolis', 'linda.brown@email.com', '+9988776655'),
  ('9', 'david_taylor', 'davidpass', current_date, '666 Oak Ave, Cityburg', 'david.taylor@email.com', '+1122334455'),
  ('10', 'olivia_wilson', 'olivia_pass', current_date, '777 Pine St, Downtown', 'olivia.wilson@email.com', '+9988776655');
  
  
  
  CREATE TABLE cashier (
  cashier_id  ID,
  first_name varchar(15) NOT NULL,
  last_name varchar(15) NOT NULL,
  postal_address address,
  phone  number_check NOT NULL,
  email email_validate NOT NULL,
  username varchar(20) NOT NULL,
  password varchar(20) NOT NULL,
  date date NOT NULL, 
  admin_id ID,
  PRIMARY KEY (cashier_id),
  FOREIGN KEY (admin_id) REFERENCES admin (admin_id) ON DELETE CASCADE ON UPDATE CASCADE
) ;


-- Insert meaningful data into the cashier table
INSERT INTO cashier (cashier_id, first_name, last_name, postal_address, phone, email, username, password, date, admin_id) VALUES
('c1', 'John', 'Doe', '123 Main St', '+12355512340', 'john@pharm.com', 'john_cashier', 'password1', current_date, 1),
('c2', 'Jane', 'Smith', '456 Oak St', '+12435555678', 'jane@pharm.com', 'jane_cashier', 'password2', current_date, 2),
('c3', 'Bob', 'Johnson', '789 Elm St', '+11355559876', 'bob@pharm.com', 'bob_cashier', 'password3', current_date, 3),
('c4', 'Alice', 'Williams', '101 Pine St','+11985554321', 'alice@pharm.com', 'alice_cashier', 'password4', current_date, 4),
('c5', 'Charlie', 'Brown', '202 Cedar St', '+12785558765', 'charlie@pharm.com', 'charlie_cashier', 'password5', current_date, 5),
('c6', 'Eva', 'Miller', '303 Birch St', '+12955552109', 'eva@pharm.com', 'eva_cashier', 'password6', current_date, 6),
('c7', 'David', 'Lee', '404 Maple St', '+12425553456', 'david@pharm.com', 'david_cashier', 'password7', current_date, 7),
('c8', 'Sophia', 'Martin', '505 Spruce St', '+11165556789', 'sophia@pharm.com', 'sophia_cashier', 'password8', current_date, 8),
('c9', 'Michael', 'Clark', '606 Walnut St', '+11195551235', 'michael@pharm.com', 'michael_cashier', 'password9', current_date, 9),
('c10', 'Olivia', 'Turner', '707 Pineapple St', '+11095555432', 'olivia@pharm.com', 'olivia_cashier', 'password10', current_date, 10);


CREATE TABLE manager (
  manager_id ID,
  first_name varchar(15) NOT NULL,
  last_name varchar(15) NOT NULL,
  postal_address address,
  phone number_check NOT NULL,
  email email_validate NOT NULL,
  username varchar(20) NOT NULL,
  password varchar(20) NOT NULL,
  date date NOT NULL,
  admin_id ID,
  PRIMARY KEY (manager_id),
  FOREIGN KEY (admin_id) REFERENCES admin (admin_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO manager (manager_id, first_name, last_name, postal_address, phone, email, username, password, date, admin_id)
VALUES
  ('m1', 'Alex', 'Johnson', '123 Pine St', '+1234567890', 'alex@email.com', 'alex_manager', 'pass123', current_date, 1),
  ('m2', 'Samantha', 'Miller', '456 Oak St', '+9876543210', 'samantha@email.com', 'samantha_manager', 'securepass', current_date, 2),
  ('m3', 'Daniel', 'Wilson', '789 Elm St', '+1122334455', 'daniel@email.com', 'daniel_manager', 'danielpass', current_date, 3),
  ('m4', 'Emma', 'Brown', '101 Pine St', '+9988776655', 'emma@email.com', 'emma_manager', 'password123', current_date, 4),
  ('m5', 'Robert', 'Jones', '202 Cedar St', '+1122334455', 'robert@email.com', 'robert_manager', 'robertpass', current_date, 5),
  ('m6', 'Sophie', 'Clark', '303 Birch St', '+9988776655', 'sophie@email.com', 'sophie_manager', 'sophiepass', current_date, 6),
  ('m7', 'William', 'White', '404 Maple St', '+1122334455', 'william@email.com', 'william_manager', 'williampass', current_date, 7),
  ('m8', 'Mia', 'Thomas', '505 Spruce St', '+9988776655', 'mia@email.com', 'mia_manager', 'miapass', current_date, 8),
  ('m9', 'Ethan', 'Davis', '606 Walnut St', '+1122334455', 'ethan@email.com', 'ethan_manager', 'ethanpass', current_date, 9),
  ('m10', 'Ava', 'Taylor', '707 Pineapple St', '+9988776655', 'ava@email.com', 'ava_manager', 'avapass', current_date, 10);
  
  CREATE TABLE stock (
  stock_id ID ,
  drug_name varchar(30) NOT NULL,
  category varchar(230) NOT NULL,
  description varchar(50) NOT NULL,
  company varchar(50) NOT NULL,
  supplier varchar(50) NOT NULL,
  quantity int NOT NULL,
  cost int NOT NULL,
  status status NOT NULL,
  date_supplied date NOT NULL,
  manager_id ID,
  PRIMARY KEY (stock_id),
  FOREIGN KEY (manager_id) REFERENCES manager (manager_id) ON DELETE CASCADE ON UPDATE CASCADE
);



INSERT INTO stock (stock_id, drug_name, category, description, company, supplier, quantity, cost, status, date_supplied, manager_id) VALUES
('s1', 'Paracetamol', 'Painkiller', 'Effective for mild to moderate pain relief', 'ABC Pharma', 'Supplier1', 130, 50, 'Available', '2023-11-01', 'm1'),
('s2', 'Amoxicillin', 'Antibiotic', 'Used to treat bacterial infections', 'XYZ Pharmaceuticals', 'Supplier2', 150, 65, 'Available', '2023-11-02', 'm2'),
('s3', 'Ibuprofen', 'Painkiller', 'Reduces inflammation and relieves pain', 'DEF Medications', 'Supplier3', 200, 100, 'Unavailable', '2023-11-03', 'm3'),
('s4', 'Omeprazole', 'Antacid', 'Reduces stomach acid', 'PQR Pharmaceuticals', 'Supplier4', 120, 60, 'Available', '2023-11-04', 'm4'),
('s5', 'Aspirin', 'Painkiller', 'Commonly used to reduce fever and inflammation', 'LMN Medicines', 'Supplier5', 180, 90, 'Available', '2023-11-05', 'm5'),
('s6', 'Simvastatin', 'Cholesterol Medication', 'Lowers cholesterol and triglycerides', 'UVW Pharma', 'Supplier6', 230, 120, 'Unavailable', '2023-11-06', 'm6'),
('s7', 'Metformin', 'Antidiabetic', 'Helps in managing type 2 diabetes', 'RST Pharmaceuticals', 'Supplier7', 300, 150, 'Available', '2023-11-07', 'm7'),
('s8', 'Warfarin', 'Anticoagulant', 'Prevents blood clots', 'EFG Medications', 'Supplier8', 90, 45, 'Available', '2023-11-08', 'm8'),
('s9', 'Lisinopril', 'Hypertension Medication', 'Lowers high blood pressure', 'HIJ Pharma', 'Supplier9', 180, 80, 'Unavailable', '2023-11-09', 'm9'),
('s10', 'Atorvastatin', 'Cholesterol Medication', 'Lowers bad cholesterol', 'KLM Pharmaceuticals', 'Supplier10', 213, 100, 'Available', '2023-11-10', 'm10');



CREATE TABLE customer (
  customer_id ID,
  customer_name varchar(30) NOT NULL,
  age int NOT NULL,
  sex varchar(6) NOT NULL,
  postal_address address,
  phone number_check NOT NULL,
  PRIMARY KEY (customer_id)
);
  
  
-- Insert meaningful data into the customer table
INSERT INTO customer (customer_id, customer_name, age, sex, postal_address, phone)
VALUES
  ('cus1', 'Alice Johnson', 28, 'Female', '123 Oak St, Cityville', '+1234567890'),
  ('cus2', 'Bob Smith', 35, 'Male', '456 Pine Ave, Townsville', '+9876543210'),
  ('cus3', 'Charlie Brown', 42, 'Male', '789 Maple Blvd, Villagetown', '+1122334455'),
  ('cus4', 'Diana Miller', 31, 'Female', '111 Cedar St, Hamletville', '+9988776655'),
  ('cus5', 'Emma White', 25, 'Female', '222 Elm Rd, Countryside', '+1122334455'),
  ('cus6', 'Frank Clark', 39, 'Male', '333 Birch Ln, Suburbia', '+9988776655'),
  ('cus7', 'Grace Turner', 45, 'Female', '444 Pine Ct, Urbanville', '+1122334455'),
  ('cus8', 'Henry Davis', 33, 'Male', '555 Walnut Dr, Metropolis', '+9988776655'),
  ('cus9', 'Isabel Taylor', 28, 'Female', '666 Oak Ave, Cityburg', '+1122334455'),
  ('cus10', 'Jack Wilson', 36, 'Male', '777 Spruce St, Downtown', '+9988776655');
  
CREATE TABLE pharmacist (
  pharmacist_id ID,
  first_name varchar(15) NOT NULL,
  last_name varchar(15) NOT NULL,
  postal_address address,
  phone number_check NOT NULL,
  email email_validate NOT NULL,
  username varchar(10) NOT NULL,
  password varchar(10) NOT NULL,
  date date NOT NULL,
  admin_id ID,
  PRIMARY KEY (pharmacist_id),  
  FOREIGN KEY (admin_id) REFERENCES admin (admin_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO pharmacist (pharmacist_id, first_name, last_name, postal_address, phone, email, username, password, date, admin_id) VALUES
('p1', 'Johnny', 'Doy', '123 Main St', '+1234567890', 'john@email.com', 'johnny', 'password1', current_date, 1),
('p2', 'Alice', 'Smith', '456 Elm St', '+1876543210', 'alice@email.com', 'alice', 'password2', current_date, 2),
('p3', 'Brain', 'John', '789 Oak St', '+1559505555', 'bob@email.com', 'brain', 'password3', current_date, 4),
('p4', 'Emily', 'Davis', '111 Pine St', '+1473440933', 'emily@email.com', 'emily', 'password4', current_date, 3),
('p5', 'Michael', 'Wilson', '222 Cedar St', '2289782222', 'michael@email.com', 'michael', 'password5', current_date, 6),
('p6', 'Somy', 'Brown', '333 Birch St', '+1111671091', 'sophia@email.com', 'somy', 'password6', current_date, 5),
('p7', 'William', 'Garcia', '444 Maple St', '+1474844554', 'william@email.com', 'william', 'password7', current_date, 7),
('p8', 'Olive', 'Martinez', '555 Walnut St', '+2908883488', 'olivia@email.com', 'olive', 'password8', current_date, 9),
('p9', 'James', 'Rodriguez', '666 Cherry St', '+2999490897', 'james@email.com', 'james', 'password9', current_date, 10),
('p10', 'Sophie', 'Lopez', '777 Poplar St', '+2096840000', 'sophie@email.com', 'sophie', 'password10', current_date, 8);

CREATE TABLE prescription 
(
  pres_id ID,
  drug_id ID,
  dose varchar(15) NOT NULL,
  quantity int NOT NULL,
  pharmacist_id ID,
  customer_id ID,
  PRIMARY KEY (pres_id),
  FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (drug_id) REFERENCES stock (stock_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (pharmacist_id) REFERENCES pharmacist (pharmacist_id) ON DELETE CASCADE ON UPDATE CASCADE 
);

INSERT INTO prescription (pres_id, drug_id, dose, quantity, pharmacist_id, customer_id) VALUES
('ps1', 's1', '10mg', 30, 'p1', 'cus1'),
('ps2', 's3', '500mg', 20, 'p2', 'cus2'),
('ps3', 's5', '50mg', 15, 'p3', 'cus3'),
('ps4', 's2', '250mg', 25, 'p4', 'cus4'),
('ps5', 's7', '1000mg', 10, 'p5', 'cus5'),
('ps6', 's6', '20mg', 35, 'p6', 'cus6'),
('ps7', 's4', '40mg', 28, 'p7', 'cus7'),
('ps8', 's9', '80mg', 22, 'p8', 'cus8'),
('ps9', 's8', '5mg', 18, 'p9', 'cus9'),
('ps10', 's1', '10mg', 5, 'p1', 'cus10'),
('ps11', 's5', '20 mg', 4, 'p9', 'cus9');

CREATE TABLE invoice (
  invoice_id integer NOT NULL,
  receiptNo ID,
  served_by ID,
  date date NOT NULL,
  SERIAL PRIMARY KEY (invoice_id),
  FOREIGN KEY (receiptNo) REFERENCES receipts (receiptNo) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (served_by) REFERENCES cashier (cashier_id) ON DELETE CASCADE ON UPDATE CASCADE
);



INSERT INTO invoice (invoice_id, receiptNo, served_by, date) VALUES
(1, 'r101', 'c1', '2023-12-01'),
(2, 'r102', 'c2', '2023-12-01'),
(3, 'r103', 'c3', '2023-12-01'),
(4, 'r104', 'c4', '2023-12-01'),
(5, 'r105', 'c5', '2023-12-01'),
(6, 'r106', 'c6', '2023-12-01'),
(7, 'r107', 'c7', '2023-12-01'),
(8, 'r108', 'c8', '2023-12-01'),
(20, 'r109', 'c1', '2023-12-01'),
(21, 'r110', 'c1', '2023-12-03'),
(24, 'r111', 'c9', '2023-12-03');
  
  

CREATE TABLE invoice_details (
  invoice_id integer NOT NULL,
  dose varchar(15) NOT NULL,
  cost amt_validate NOT NULL,
  quantity amt_validate NOT NULL,
  PRIMARY KEY (invoice_id),
  FOREIGN KEY (invoice_id) REFERENCES invoice (invoice_id) ON DELETE CASCADE ON UPDATE CASCADE 
);

INSERT INTO invoice_details (invoice_id, dose, cost, quantity) VALUES
(1, '5mg', 50, 10),
(2, '3mg', 30, 5),
(3, '7mg', 70, 15),
(4, '2mg', 20, 8),
(5, '6mg', 60, 12),
(6, '4mg', 40, 6),
(7, '9mg', 90, 20),
(8, '1mg', 10, 4),
(21, '10mg', 430, 5),
(24, '20 mg', 89, 4);



CREATE TABLE receipts (
  receiptNo ID,
  total amt_validate NOT NULL,
  date date NOT NULL,
  pres_id ID,
  PRIMARY KEY (receiptNo),
  FOREIGN KEY (pres_id) REFERENCES prescription (pres_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO receipts (receiptNo, total, date, pres_id) VALUES
('r101', 50, current_date, 'ps1'),
('r102', 75, current_date, 'ps2'),
('r103', 100, current_date, 'ps3'),
('r104', 120, current_date, 'ps4'),
('r105', 90, current_date, 'ps5'),
('r106', 110, current_date, 'ps6'),
('r107', 60, current_date, 'ps7'),
('r108', 80, current_date, 'ps8'),
('r109', 600, current_date, 'ps9'),
('r110', 430, current_date, 'ps10'),
('r111', 89, current_date, 'ps11');



CREATE TABLE pays (
  pay_id ID,
  payment_type varchar(20),
  amt int,
  receiptNo ID,
  cust_id varchar(5),
  PRIMARY KEY (pay_id),
  FOREIGN KEY (receiptNo) REFERENCES receipts (receiptNo) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (cust_id) REFERENCES customer (customer_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO pays (pay_id, payment_type, amt, receiptNo) VALUES
('pay1', 'Credit Card', 30, 'r101', 'cus1'),
('pay2', 'Cash', 20, 'r102', 'cus2'),
('pay3', 'Debit Card', 50, 'r103', 'cus3'),
('pay4', 'Cash', 45, 'r104', 'cus4'),
('pay5', 'Credit Card', 80, 'r105', 'cus5'),
('pay6', 'Cash', 25, 'r106', 'cus6'),
('pay7', 'Debit Card', 100, 'r107', 'cus7'),
('pay8', 'Cash', 150, 'r108', 'cus8'),
('pay9', 'Credit Card', 600, 'r109', 'cus9'),
('pay10', 'Credit Card', 430, 'r110', 'cus10'),
('pay11', 'Cash', 89, 'r111', 'cus9');



---Whenever a new row is inserted or an existing row is updated in the invoice table, the trigger will fire, calling the update_invoice_date function. This function will update the date column of the new or updated row to the current date before the actual INSERT or UPDATE operation takes place.
CREATE TRIGGER tr_update_invoice_date
BEFORE INSERT OR UPDATE ON invoice
FOR EACH ROW EXECUTE FUNCTION update_invoice_date();

CREATE OR REPLACE FUNCTION update_invoice_date()
RETURNS TRIGGER AS $update_invoce_date$
BEGIN
    NEW.date := CURRENT_DATE;
    RETURN NEW;
END;
$update_invoce_date$ LANGUAGE plpgsql;



update invoice
set served_by='c2'
where served_by='c1'

select *
from invoice
where served_by='c1'

INSERT INTO invoice (invoice_id, customer_id, served_by, date)
VALUES
  ('inv11', 'cus1', 'c1', '2023-11-13'),
  ('inv12', 'cus1', 'c1', '2023-11-14');

select *
from invoice
where served_by='c1'


-----Unique Constarints

ALTER TABLE admin ADD CONSTRAINT admin_check
UNIQUE (admin_id);

ALTER TABLE manager ADD CONSTRAINT manager_check
UNIQUE (manager_id);

ALTER TABLE cashier ADD CONSTRAINT cashier_check
UNIQUE (cashier_id);

ALTER TABLE pharmacist ADD CONSTRAINT pharmacist_check
UNIQUE (pharmacist_id);

ALTER TABLE customer ADD CONSTRAINT customer_check
UNIQUE (customer_id);

ALTER TABLE prescription ADD CONSTRAINT prescription_check
UNIQUE (pres_id);


ALTER TABLE stock ADD CONSTRAINT stock_check
UNIQUE (stock_id);

ALTER TABLE invoice ADD CONSTRAINT invoice_check
UNIQUE (invoice_id);

ALTER TABLE receipts ADD CONSTRAINT receipts_check
UNIQUE (receiptNo);

ALTER TABLE pays ADD CONSTRAINT pay_id_check
UNIQUE (pay_id);


----Index Creation

CREATE INDEX idx_admin_id ON admin USING btree (admin_id);

CREATE INDEX idx_manager_id ON manager USING btree (manager_id);

CREATE INDEX idx_cashier_id ON cashier USING btree (cashier_id);

CREATE INDEX idx_pharmacist_id ON pharmacist USING btree (pharmacist_id);

CREATE INDEX idx_customer_id ON customer USING btree (customer_id);

CREATE INDEX idx_prescription_id ON prescription USING btree (pres_id);

CREATE INDEX idx_stock_id ON stock USING btree (stock_id);

CREATE INDEX idx_invoice_id ON invoice USING btree (invoice_id);

CREATE INDEX idx_receipts_id ON receipts USING btree (receiptNo_id);

CREATE INDEX idx_pays_id ON pays USING btree (pay_id);



-----Authorization------------------

-- Create roles for each table
CREATE ROLE admin_role;
CREATE ROLE cashier_role;
CREATE ROLE manager_role;
CREATE ROLE pharmacist_role;
CREATE ROLE users_for_admin;
CREATE ROLE users_for_manager;

-- Grant necessary permissions to each role on its corresponding table
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE admin TO admin_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE cashier TO cashier_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE manager TO manager_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE pharmacist TO pharmacist_role;


-- Assign roles to users
GRANT admin_role TO users_for_admin;
GRANT admin_role TO users_for_manager;
GRANT manager_role TO users_for_manager;

-- Revoke all permissions from manager_role on its corresponding table
REVOKE ALL PRIVILEGES ON TABLE manager FROM manager_role;


  