require 'net/http'
require 'json'
require 'active_record'
require 'mysql2' # or 'pg' or 'sqlite3'

# Change the following to reflect your database settings
ActiveRecord::Base.establish_connection(
  adapter:  'mysql2', # or 'postgresql' or 'sqlite3'
  host:     'localhost',
  database: 'erouvoc',
  username: 'root',
  password: ''
)
begin
	ActiveRecord::Schema.define do
    	create_table :datasets do |table|
        	table.column :title, :text
        	table.column :notes, :text
        	table.column :tags, :text
        	table.column :name, :string
        	table.column :identifier, :string
    	end
    	
    	create_table :errors do |table|
        	table.column :title, :string
    	end

	end
rescue Exception => e
		
end

class Dataset < ActiveRecord::Base

	def self.list_of_dataset_ids(data_uri)
		uri = URI(data_uri)
		JSON.parse(Net::HTTP.get(uri)) # => String
	end

	def self.get_dataset_id(id,data_uri)
		uri=""
		if data_uri[-1, 1]=="/"
			uri = URI("#{data_uri}#{id}")
		else
			uri = URI("#{data_uri}/#{id}")
		end
		JSON.parse(Net::HTTP.get(uri))
	end
	
	def self.create_obj_from_json(json_obj,name)
		#puts json_obj
		json_obj['tags']="" if json_obj['tags'].empty?
		obj = Dataset.new(:title => json_obj['title'],:notes => json_obj['notes'],:tags => json_obj['tags'],:name => name)
		obj.save
		ActiveRecord::Base.connection.close
	end

	def self.create_obj_from_csv(csv_obj)
		obj = Dataset.new(:title => csv_obj[:title],:notes => csv_obj[:notes],:tags => csv_obj[:tags],:name => csv_obj[:name])
		obj.save
		ActiveRecord::Base.connection.close
	end
	
	
	def to_s
    "#{title}. #{notes} ( #{tags} )"
  end

end

class Error < ActiveRecord::Base
	def self.create_obj(title)
		dataset_error=Error.new(title: title)
  	dataset_error.save
		ActiveRecord::Base.connection.close
	end
end