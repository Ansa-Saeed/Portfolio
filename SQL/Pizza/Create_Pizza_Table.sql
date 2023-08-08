-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.pizza_sales
(
    pizza_id integer,
    order_id integer,
    pizza_name_id character varying COLLATE pg_catalog."default",
    quantity integer,
    order_date date,
    order_time time without time zone,
    unit_price double precision,
    total_price double precision,
    pizza_size character varying COLLATE pg_catalog."default",
    pizza_category character varying COLLATE pg_catalog."default",
    pizza_ingredient character varying COLLATE pg_catalog."default",
    pizza_name character varying COLLATE pg_catalog."default"
);
END;