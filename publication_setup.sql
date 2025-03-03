CREATE PUBLICATION deb_pub FOR TABLE
    public.users;
ALTER PUBLICATION deb_pub ADD table debezium_signal;

ALTER TABLE public.users REPLICA IDENTITY FULL;
SELECT PG_CREATE_LOGICAL_REPLICATION_SLOT('deb_slot', 'pgoutput');
CREATE ROLE deb_user WITH REPLICATION LOGIN;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO deb_user;
GRANT ALL ON TABLE public.debezium_signal TO deb_user;
