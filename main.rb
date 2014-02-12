#!/usr/bin/env ruby
require "./data"
require 'CSV'
require 'net/http'
require 'net/https'
require 'rexml/document'

argument = ARGV[0]

if argument == "fetch_online" 
	
	require "./fetch_online"
	#require "./analysis"

elsif argument == "fetch_csv"

	require "./fetch_csv"
	#require "./analysis"
	
elsif argument == "analysis"
	
	require "./analysis"

elsif argument == "help"
	
	puts "help for you you have three options "
	
	puts "1- fetch_online"
	puts "2- fetch_csv"
	puts "3- analysis"
	puts "\n"
	puts "if you choosed fetch_online then you must give the application the path for dataset"
	puts './main "fetch_online" "http://beta.opendatahub.it/opendatahub/api/rest/dataset" '
	puts "\n"

	puts "if you choosed fetch_csv then you must give the application the path for the csv wich contain the dataset"
	puts './main "fetch_csv" "http://beta.opendatahub.it/opendatahub/api/rest/dataset" '
	puts "\n"

	puts "if you choosed analysis then you may give the application a limit for ex: if you type"
	puts './main "analysis" "1" '
	puts "then you will just analysis the first record \n"
	puts "if you didn't add number then the application will analysis all the records in the database"

end