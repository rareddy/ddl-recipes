/subsystem=teiid:db-store(ddl="create database foo")

/subsystem=teiid:db-store(vdb-name=foo, vdb-version=1, ddl="create foreign data wrapper excel")

/subsystem=teiid:db-store(vdb-name=foo, vdb-version=1, ddl="SET NAMESPACE 'http://www.teiid.org/translator/excel/2014' AS teiid_excel")

/subsystem=teiid:db-store(vdb-name=foo, vdb-version=1, ddl="create server excelfile type 'file' foreign data wrapper excel options(ParentDirectory '/home/rareddy/testing/vdbs/excelfiles')")

/subsystem=teiid:db-store(vdb-name=foo, vdb-version=1, ddl="create schema test server excelfile")

/subsystem=teiid:db-store(vdb-name=foo, vdb-version=1, schema=test, ddl="import foreign schema public from server excelfile into test OPTIONS(importer.headerRowNumber 1, importer.ExcelFileName 'sample.xls')")



