limit=ARGV[1]
if limit.nil?
	limit=0
else
	limit=limit.to_i
end


all=Dataset.all
print "this process may take some time please be patiant"

all.each_with_index do |e,i|
	#my path 
	path="https://api.redlink.io/1.0-ALPHA/analysis/eu/enhance?key=j3dMN8spIzMYwfu5udTt0uN2A4f2AnpUd6e5eaef"
	#david path
	#path="https://api.redlink.io/1.0-ALPHA/analysis/eurovoc/enhance?key=nbtyge7E2hzJ1OGjz0Ip6Aetk3sFSI3fcdd69303"
	#puts limit.class
	uri = URI.parse(path)
	https = Net::HTTP.new(uri.host,uri.port)
	https.use_ssl = true
	req = Net::HTTP::Post.new(uri.request_uri)
	req['content-type']='text/plain'
	req['Accept'] = "application/json"
	#req['Accept'] = "application/rdf+xml"
	req.body ="#{e}"
	#puts e
	#puts req.to_yaml
	begin
		res = https.request(req)
		identifiers = []
		#puts "Response #{res.code} #{res.message}: #{res.body}"
		print "."
		data = JSON.parse(res.body)
		if data['@graph']
			data['@graph'].each do |v|
				if v['identifier']
						e.identifier=v['identifier']
						e.save
					end
				end
		end
	rescue Exception => error
	end
	if limit==(i+1)
		break
	end
end