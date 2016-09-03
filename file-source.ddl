/subsystem=teiid:db-store(ddl="create database foo")
/subsystem=teiid:db-store(vdb-name=foo, vdb-version=1, ddl="create foreign data wrapper file")
/subsystem=teiid:db-store(vdb-name=foo, vdb-version=1, ddl="create server \"text-connector\" type 'file' foreign data wrapper file options(ParentDirectory '/home/rareddy/testing/marketdata')")
/subsystem=teiid:db-store(vdb-name=foo, vdb-version=1, ddl="create schema MarketData server \"text-connector\"")
/subsystem=teiid:db-store(vdb-name=foo, vdb-version=1, schema=test, ddl="import foreign schema public from server \"text-connector\" into MarketData")

/subsystem=teiid:db-store(vdb-name=foo, vdb-version=1, ddl="create virtual schema Stocks")
/subsystem=teiid:db-store(vdb-name=foo, vdb-version=1, schema="Stocks", ddl="CREATE view StockPrices as SELECT SP.symbol as symbol, SP.price as price FROM (EXEC MarketData.getTextFiles('data.txt')) AS f, TEXTTABLE(f.file COLUMNS symbol string, price bigdecimal HEADER) AS SP")
