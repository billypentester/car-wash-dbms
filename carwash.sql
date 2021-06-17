-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-06-16 13:26:56.13

-- tables
-- Table: Vehicle
CREATE TABLE Vehicle (
    number_plate int  NOT NULL,
    brand Varchar(20)  NULL,
    model Varchar(20)  NULL,
    Vehicle_category Varchar(20)  NULL,
    price int  NULL,
    client_id int  NOT NULL,
    CONSTRAINT Vehicle_pk PRIMARY KEY  (number_plate)
);

-- Table: booking
CREATE TABLE booking (
    booking_id int  NOT NULL,
    date int  NULL,
    status int  NULL,
    client_id int  NOT NULL,
    number_plate int  NOT NULL,
    service_id int  NOT NULL,
    price int  NOT NULL,
    CONSTRAINT booking_pk PRIMARY KEY  (booking_id)
);

-- Table: client
CREATE TABLE client (
    client_id int  NOT NULL,
    first_name varchar(20)  NULL,
    last_name varchar(20)  NULL,
    Phone_no int  NULL,
    address varchar(20)  NULL,
    Email varchar(20)  NULL,
    CONSTRAINT client_id PRIMARY KEY  (client_id)
);

-- Table: client_history
CREATE TABLE client_history (
    client_id int  NOT NULL,
    service_id int  NOT NULL,
    CONSTRAINT client_history_pk PRIMARY KEY  (client_id)
);

-- Table: employee
CREATE TABLE employee (
    emp_id int  NOT NULL,
    first_name varchar(20)  NULL,
    last_name varchar(20)  NULL,
    Phone_no int  NULL,
    address varchar(20)  NULL,
    Email varchar(20)  NULL,
    Service_expertise varchar(20)  NULL,
    store_id int  NOT NULL,
    service_id int  NOT NULL,
    CONSTRAINT emp_id PRIMARY KEY  (emp_id)
);

-- Table: hours
CREATE TABLE hours (
    week_day Varchar(20)  NOT NULL,
    available_hours int  NULL,
    CONSTRAINT hours_pk PRIMARY KEY  (week_day)
);

-- Table: invoice
CREATE TABLE invoice (
    inovice_no int  NOT NULL,
    client_id int  NOT NULL,
    number_plate int  NOT NULL,
    service_id int  NOT NULL,
    note Varchar(20)  NULL,
    price int  NOT NULL,
    date int  NOT NULL,
    CONSTRAINT invoice_pk PRIMARY KEY  (inovice_no)
);

-- Table: owner
CREATE TABLE owner (
    admin_id int  NOT NULL,
    first_name varchar(20)  NULL,
    last_name varchar(20)  NULL,
    Phone_no int  NULL,
    address varchar(20)  NULL,
    Email varchar(20)  NULL,
    CONSTRAINT owner_id PRIMARY KEY  (admin_id)
);

-- Table: service
CREATE TABLE service (
    service_id int  NOT NULL,
    service_type int  NULL,
    price int  NULL,
    CONSTRAINT service_pk PRIMARY KEY  (service_id)
);

-- Table: store
CREATE TABLE store (
    store_id int  NOT NULL,
    store_location Varchar(20)  NULL,
    phone_no int  NULL,
    week_day Varchar(20)  NOT NULL,
    admin_id int  NOT NULL,
    CONSTRAINT store_pk PRIMARY KEY  (store_id)
);

-- Table: transaction
CREATE TABLE "transaction" (
    trans_id int  NOT NULL,
    invoice_inovice_no int  NOT NULL,
    date int  NOT NULL,
    CONSTRAINT transaction_pk PRIMARY KEY  (trans_id)
);

-- Table: vehicle_history
CREATE TABLE vehicle_history (
    number_plate int  NOT NULL,
    service_id int  NOT NULL,
    CONSTRAINT vehicle_history_pk PRIMARY KEY  (number_plate)
);

-- foreign keys
-- Reference: Vehicle_details_client (table: Vehicle)
ALTER TABLE Vehicle ADD CONSTRAINT Vehicle_details_client
    FOREIGN KEY (client_id)
    REFERENCES client (client_id);

-- Reference: booking_Vehicle_details (table: booking)
ALTER TABLE booking ADD CONSTRAINT booking_Vehicle_details
    FOREIGN KEY (number_plate)
    REFERENCES Vehicle (number_plate);

-- Reference: booking_client (table: booking)
ALTER TABLE booking ADD CONSTRAINT booking_client
    FOREIGN KEY (client_id)
    REFERENCES client (client_id);

-- Reference: booking_service (table: booking)
ALTER TABLE booking ADD CONSTRAINT booking_service
    FOREIGN KEY (service_id)
    REFERENCES service (service_id);

-- Reference: employee_service (table: employee)
ALTER TABLE employee ADD CONSTRAINT employee_service
    FOREIGN KEY (service_id)
    REFERENCES service (service_id);

-- Reference: employee_store (table: employee)
ALTER TABLE employee ADD CONSTRAINT employee_store
    FOREIGN KEY (store_id)
    REFERENCES store (store_id);

-- Reference: invoice_Vehicle_details (table: invoice)
ALTER TABLE invoice ADD CONSTRAINT invoice_Vehicle_details
    FOREIGN KEY (number_plate)
    REFERENCES Vehicle (number_plate);

-- Reference: invoice_client (table: invoice)
ALTER TABLE invoice ADD CONSTRAINT invoice_client
    FOREIGN KEY (client_id)
    REFERENCES client (client_id);

-- Reference: invoice_service (table: invoice)
ALTER TABLE invoice ADD CONSTRAINT invoice_service
    FOREIGN KEY (service_id)
    REFERENCES service (service_id);

-- Reference: service_history_client (table: client_history)
ALTER TABLE client_history ADD CONSTRAINT service_history_client
    FOREIGN KEY (client_id)
    REFERENCES client (client_id);

-- Reference: service_history_service (table: client_history)
ALTER TABLE client_history ADD CONSTRAINT service_history_service
    FOREIGN KEY (service_id)
    REFERENCES service (service_id);

-- Reference: store_hours (table: store)
ALTER TABLE store ADD CONSTRAINT store_hours
    FOREIGN KEY (week_day)
    REFERENCES hours (week_day);

-- Reference: store_owner (table: store)
ALTER TABLE store ADD CONSTRAINT store_owner
    FOREIGN KEY (admin_id)
    REFERENCES owner (admin_id);

-- Reference: transaction_invoice (table: transaction)
ALTER TABLE "transaction" ADD CONSTRAINT transaction_invoice
    FOREIGN KEY (invoice_inovice_no)
    REFERENCES invoice (inovice_no);

-- Reference: vehicle_history_Vehicle (table: vehicle_history)
ALTER TABLE vehicle_history ADD CONSTRAINT vehicle_history_Vehicle
    FOREIGN KEY (number_plate)
    REFERENCES Vehicle (number_plate);

-- Reference: vehicle_history_service (table: vehicle_history)
ALTER TABLE vehicle_history ADD CONSTRAINT vehicle_history_service
    FOREIGN KEY (service_id)
    REFERENCES service (service_id);

-- End of file.

