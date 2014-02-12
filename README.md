prerequisites

ruby v 2.0 
gems required [activerecord,mysql2,json]

How to install gems.

gem install activerecord
gem install mysql2
gem install json

also please create database named "erouvoc" and change the password you will find database connection data in data.rb file

ActiveRecord::Base.establish_connection(
  adapter:  'mysql2', # or 'postgresql' or 'sqlite3'
  host:     'localhost',
  database: 'erouvoc',
  username: 'root',
  password: ''
)

for fetch data from online resource 
./main "fetch_online" "http://beta.opendatahub.it/opendatahub/api/rest/dataset"

for fetch data from csv file
./main "fetch_csv" "path/to/file.csv"

for analysis data
./main "analysis"

if you want to analysis specfic number of records use
./main "analysis" "1"
wich 1 is the number of records you want to analysis