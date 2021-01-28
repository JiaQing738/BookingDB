CREATE USER facilityadmin WITH PASSWORD 'faci1ityAdmin';
CREATE DATABASE facility_booking;
ALTER DATABASE facility_booking OWNER TO facilityadmin;
\c facility_booking
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
