/subsystem=teiid:db-store(ddl="create database foo")

/subsystem=teiid:db-store(vdb-name=foo, vdb-version=1, ddl="create foreign data wrapper REST type ws options (DefaultBinding 'HTTP')")

/subsystem=teiid:db-store(vdb-name=foo, vdb-version=1, ddl="create server \"ws-service\" type 'webservice' foreign data wrapper REST OPTIONS (EndPoint 'http://services.groupkt.com')")

/subsystem=teiid:db-store(vdb-name=foo, vdb-version=1, ddl="create schema OnWeb server \"ws-service\"")

/subsystem=teiid:db-store(vdb-name=foo, vdb-version=1, schema=test, ddl="import foreign schema public from server \"ws-service\" into OnWeb")

/subsystem=teiid:db-store(vdb-name=foo, vdb-version=1, ddl="create virtual schema test")

/subsystem=teiid:db-store(vdb-name=foo, vdb-version=1, schema=test, ddl="CREATE  VIEW Countries AS SELECT  name, alpha2_code,alpha3_code FROM 
	(EXEC OnWeb.invokeHttp(action=>'GET', endpoint=>'/country/get/all', stream=>'TRUE')) AS f, 
	 XMLTABLE('/root/RestResponse/result' PASSING JSONTOXML('root', f.result) COLUMNS 
		name string PATH 'name/text()', 
		alpha2_code string PATH 'alpha2_code/text()',
		alpha3_code string PATH 'alpha3_code/text()') AS A")
