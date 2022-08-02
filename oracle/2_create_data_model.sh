curl -LJO https://raw.githubusercontent.com/gvenzl/sample-data/master/countries-cities-currencies/install.sql

sqlplus -s test/test@//localhost/XEPDB1 @install.sql

rm install.sql
