deploy --force ~/testing/jdbcdrivers/postgresql-9.4-1201.jdbc41.jar
/subsystem=teiid:db-store(ddl="create database foo")

/subsystem=teiid:db-store(vdb-name=foo, vdb-version=1, ddl="create foreign data wrapper postgresql")

/subsystem=teiid:db-store(vdb-name=foo, vdb-version=1, ddl="create server pgsql type 'postgresql-9.4-1201.jdbc41.jar' version 'one' foreign data wrapper postgresql options(\"connection-url\" 'jdbc:postgresql://localhost/test', \"user-name\" 'rareddy', password 'mm')")

/subsystem=teiid:db-store(vdb-name=foo, vdb-version=1, ddl="create schema test server pgsql")

/subsystem=teiid:db-store(vdb-name=foo, vdb-version=1, schema=test, ddl="import foreign schema public from server pgsql into test")

/subsystem=teiid:db-store(vdb-name=foo, vdb-version=1, schema=test, ddl="create role admin with jaas role odata")

/subsystem=teiid:db-store(vdb-name=foo, vdb-version=1, schema=test, ddl="GRANT SELECT ON TABLE test.public.customers TO admin")
