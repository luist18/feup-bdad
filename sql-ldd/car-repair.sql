PRAGMA foreign_keys = ON;

/* Brand relation */
DROP TABLE IF EXISTS brand;

CREATE TABLE brand (
  id INTEGER, /* This will autoincrement since id is a primary key */
  name TEXT NOT NULL,
  CONSTRAINT brand_pk PRIMARY KEY (id)
);

/* Model relation */
DROP TABLE IF EXISTS model;

CREATE TABLE model (
  id INTEGER, /* This will autoincrement since id is a primary key */
  name TEXT NOT NULL,
  brand_id INTEGER,
  CONSTRAINT model_pk PRIMARY KEY (id),
  CONSTRAINT model_brand_fk FOREIGN KEY (brand_id) REFERENCES brand
);

/* Zipcode relation */
DROP TABLE IF EXISTS zipcode;

CREATE TABLE zipcode (
  zipcode TEXT,
  place TEXT NOT NULL,
  CONSTRAINT zipcode_pk PRIMARY KEY (zipcode)
);

/* Client relation */
DROP TABLE IF EXISTS client;

CREATE TABLE client (
  id INTEGER,
  name TEXT NOT NULL,
  address TEXT,
  zipcode TEXT,
  phone INTEGER,
  CONSTRAINT client_pk PRIMARY KEY (id),
  CONSTRAINT client_zipcode_fk FOREIGN KEY (zipcode) REFERENCES zipcode
);

/* Car relation */
DROP TABLE IF EXISTS car;

CREATE TABLE car (
  id INTEGER,
  number_plate TEXT UNIQUE NOT NULL,
  model_id INTEGER,
  client_id INTEGER,
  CONSTRAINT car_pk PRIMARY KEY (id)
  CONSTRAINT car_model_fk FOREIGN KEY (model_id) REFERENCES model,
  CONSTRAINT car_client_fk FOREIGN KEY (client_id) REFERENCES client
);

/* Repair relation */
DROP TABLE IF EXISTS repair;

CREATE TABLE repair (
  id INTEGER,
  begin_date DATETIME NOT NULL,
  end_date DATETIME NOT NULL,
  client_id INTEGER,
  car_id INTEGER,
  CONSTRAINT repair_pk PRIMARY KEY (id)
  CONSTRAINT repair_client_fk FOREIGN KEY (client_id) REFERENCES client,
  CONSTRAINT repair_car_fk FOREIGN KEY (car_id) REFERENCES car,
  CONSTRAINT date_check CHECK (end_date > begin_date)
);

/* Car part relation */
DROP TABLE IF EXISTS car_part;

CREATE TABLE car_part (
  id INTEGER,
  code TEXT UNIQUE NOT NULL,
  designation TEXT,
  unit_cost REAL NOT NULL,
  quantity INTEGER NOT NULL,
  CONSTRAINT car_part_pk PRIMARY KEY (id),
  CONSTRAINT unit_cost_check CHECK (unit_cost > 0),
  CONSTRAINT quantity_check CHECK (quantity >= 0)
);

/* Repair part relation */
DROP TABLE IF EXISTS repair_car_part;

CREATE TABLE repair_car_part (
  repair_id INTEGER,
  part_id INTEGER,
  quantity INTEGER NOT NULL,
  CONSTRAINT repair_car_part_pk PRIMARY KEY (repair_id, part_id),
  CONSTRAINT repair_car_part_repair_fk FOREIGN KEY (repair_id) REFERENCES repair,
  CONSTRAINT repair_car_part_part_fk FOREIGN KEY (part_id) REFERENCES part,
  CONSTRAINT quantity_check CHECK (quantity >= 0)
);

/* Car part model relation */
DROP TABLE IF EXISTS car_part_model;

CREATE TABLE car_part_model (
  part_id INTEGER,
  model_id INTEGER,
  CONSTRAINT car_part_model_pk PRIMARY KEY (part_id, model_id),
  CONSTRAINT car_part_model_part_fk FOREIGN KEY (part_id) REFERENCES part,
  CONSTRAINT car_part_model_model_fk FOREIGN KEY (model_id) REFERENCES model
);

/* Specialty relation */
DROP TABLE IF EXISTS specialty;

CREATE TABLE specialty (
  id INTEGER,
  name TEXT NOT NULL,
  hourly_cost REAL NOT NULL,
  CONSTRAINT specialty_pk PRIMARY KEY (id),
  CONSTRAINT hourly_cost_check CHECK (hourly_cost > 0)
);

/* Worker relation */
DROP TABLE IF EXISTS worker;

CREATE TABLE worker (
  id INTEGER,
  name TEXT NOT NULL,
  address TEXT,
  zipcode TEXT,
  phone INTEGER,
  specialty_id INTEGER,
  CONSTRAINT worker_pk PRIMARY KEY (id),
  CONSTRAINT worker_zipcode_fk FOREIGN KEY (zipcode) REFERENCES zipcode
);

/* Worker repair relation */
DROP TABLE IF EXISTS worker_repair;

CREATE TABLE worker_repair (
  worker_id INTEGER,
  repair_id INTEGER,
  hours_taken REAL NOT NULL,
  CONSTRAINT worker_repair_pk PRIMARY KEY (worker_id, repair_id),
  CONSTRAINT worker_repair_worker_fk FOREIGN KEY (worker_id) REFERENCES worker,
  CONSTRAINT worker_repair_repair_fk FOREIGN KEY (repair_id) REFERENCES repair,
  CONSTRAINT hours_taken_check CHECK (hours_taken > 0)
);