CREATE USER facilityadmin WITH PASSWORD 'faci1ityAdmin';
CREATE DATABASE facility_booking;
ALTER DATABASE facility_booking OWNER TO facilityadmin;
\c facility_booking
CREATE EXTENSION pgcrypto;
CREATE SCHEMA booking;
ALTER SCHEMA booking OWNER TO facilityadmin;

CREATE TABLE booking.booking_config
(
	id SERIAL,
	key text NOT NULL,
	value text,
	CONSTRAINT booking_config_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE booking.booking_config OWNER to facilityadmin;

/*Default Config*/
INSERT INTO booking.booking_config(key, value) VALUES ('max_hr_per_booking', '2');
INSERT INTO booking.booking_config(key, value) VALUES ('max_bookahead', '15');
INSERT INTO booking.booking_config(key, value) VALUES ('booking_start_time', '08:00');
INSERT INTO booking.booking_config(key, value) VALUES ('booking_end_time', '18:00');

CREATE TABLE booking.booking
(
	id SERIAL,
	user_id text,
	email text,
	purpose text,
	facility_id integer,
	start_dt timestamptz,
	end_dt timestamptz,
	transaction_dt timestamptz,
	CONSTRAINT booking_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE booking.booking OWNER to facilityadmin;

CREATE TABLE booking.facility_detail
(
	id SERIAL,
	name text UNIQUE,
	level text,
	description text,
	status text,
	transaction_dt timestamptz,
	CONSTRAINT facility_detail_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE booking.facility_detail OWNER to facilityadmin;

CREATE TABLE booking.account
(
    id SERIAL,
    user_id text NOT NULL UNIQUE,
	admin boolean,
	email text,
    password text NOT NULL,
	CONSTRAINT account_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE booking.account OWNER to facilityadmin;

/*Mockup Data*/
INSERT INTO booking.account(user_id, admin, email, password) VALUES ('admin', true, 'admin@mail.com', crypt('P@ssw0rd123', gen_salt('bf')));
INSERT INTO booking.account(user_id, admin, email, password) VALUES ('john', false, 'john@mail.com', crypt('P@ssw0rd123', gen_salt('bf')));
INSERT INTO booking.account(user_id, admin, email, password) VALUES ('james', false, 'james@mail.com', crypt('P@ssw0rd123', gen_salt('bf')));
INSERT INTO booking.account(user_id, admin, email, password) VALUES ('peter', false, 'peter@mail.com', crypt('P@ssw0rd123', gen_salt('bf')));
INSERT INTO booking.facility_detail VALUES (1, 'Meeting Room L1-01', 'L1', 'Meeting Room', 'OPEN', '2021-02-02 13:43:13.158954+00');
INSERT INTO booking.facility_detail VALUES (2, 'Meeting Room L1-02', 'L1', 'Meeting Room', 'OPEN', '2021-02-02 13:43:33.93617+00');
INSERT INTO booking.facility_detail VALUES (3, 'Meeting Room L2-01', 'L2', 'Meeting Room', 'MAINTENANCE', '2021-02-02 13:43:57.982175+00');
INSERT INTO booking.facility_detail VALUES (4, 'Meeting Room L2-02', 'L2', 'Meeting Room', 'OPEN', '2021-02-02 13:44:13.422796+00');
INSERT INTO booking.facility_detail VALUES (5, 'Training Room L1-01', 'L1', 'Training Room', 'OPEN', '2021-02-02 13:45:12.221773+00');
INSERT INTO booking.facility_detail VALUES (6, 'Training Room L1-02', 'L1', 'Training Room', 'OPEN', '2021-02-02 13:45:30.445954+00');