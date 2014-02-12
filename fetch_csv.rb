
path=ARGV[1]

puts "we will load #{path} file in the database"
x = 0
CSV.foreach(path, {:headers => true, :return_headers => true, :header_converters => :symbol, :converters => :all} ) do |row|
	if x==0
		x+=1
	else
		begin
			obj =Dataset.create_obj_from_csv(row) 
		rescue Exception => e
			puts "Somthing is wrong in this record with id #{row[:id]}"
		end	
	end
end