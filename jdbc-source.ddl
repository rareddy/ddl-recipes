create foreign data wrapper postgresql;

create server pgsql type 'postgresql-9.4-1201.jdbc41.jar' 
    version 'one' foreign data wrapper postgresql options("connection-url" 'jdbc:postgresql://localhost/test', 
    "user-name" 'rareddy', password 'mm')

create schema test server pgsql

import foreign schema public from server pgsql into test
	OPTIONS (	importer.useFullSchemaName 'fase',
			importer.tableTypes 'TABLE,VIEW')

select * from customers
