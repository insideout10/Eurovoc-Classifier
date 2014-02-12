_Prerequisites_

* ruby v 2.0 
* gems required [activerecord,mysql2,json]

How to install gems.

```sh
gem install activerecord
gem install mysql2
gem install json
```

also please create database named "eurovoc" and change the password you will find database connection data in data.rb file

```ruby
ActiveRecord::Base.establish_connection(
  adapter:  'mysql2', # or 'postgresql' or 'sqlite3'
  host:     'localhost',
  database: 'eurovoc',
  username: 'root',
  password: ''
)
```
also please add your key and you analysis-id in analysis.rb file

```
path="https://api.redlink.io/1.0-ALPHA/analysis/<Add analysis Id>/enhance?key=<Get Your Key from Redlink.co>"

```


To fetch data from online resource 
```sh
./main "fetch_online" "http://beta.opendatahub.it/opendatahub/api/rest/dataset"
```

To fetch data from csv file
```sh
./main "fetch_csv" "path/to/file.csv"
```

To analyze data
```sh
./main "analysis"
```

if you want to analysis specfic number of records use
```sh
./main "analysis" "1"
```
which 1 is the number of records you want to analysis
