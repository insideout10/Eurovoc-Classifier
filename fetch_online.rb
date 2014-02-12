url = ARGV[1]
puts "program starting now we will get data from this #{url}"
begin
	datasets_ids = Dataset.list_of_dataset_ids(url)	
rescue Exception => e
	puts e.message
	abort("We cant access opendatahub right now please check your internet connection or opendatahub is accessiable")
end		
list_of_symantic_data=[]
threads = []	
puts "size of #{datasets_ids.size}"
datasets_ids.each_with_index do |e,i|
	threads << Thread.new(e,i) do |e,i|
		sleep 5000
		begin 
			json_obj = Dataset.get_dataset_id(e,url)
			obj = Dataset.create_obj_from_json(json_obj,e)
			#obj.save
			list_of_symantic_data<< obj
		rescue Exception => error  
	  	puts error.message 
	  	Error.create_obj(e)
		end
		puts "#{i} out of #{datasets_ids.size}"
	end
	if(i == 100 )
		break
	end
end
threads.each { |aThread|  aThread.join }