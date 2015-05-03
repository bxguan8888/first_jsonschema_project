require 'rubygems'
require 'json-schema'
require 'json'

IP_json_schema={
	"type" => "object",
	"properties" => {
		"suncToken"=> {"type" => "string"},
		"createDate"=>{"type" => "string"},
		"prefixes" => {
			"type" => "array",
			"items" => {
				"oneOf"=> [
					# {"$ref" => "IPPrefix/InternetEC2.json#/definition"},
					# {"$ref" => "IPPrefix/BorderEC2.json#/definition"},
					# {"$ref" => "IPPrefix/AZEC2.json#/definition"},
					# {"$ref" => "IPPrefix/CLOUDFRONT.json#/definition"},
					# {"$ref" => "IPPrefix/DX.json#/definition"},
					# {"$ref" => "IPPrefix/INGEST.json#/definition"},
					# {"$ref" => "IPPrefix/PROD.json#/definition"},
					{"$ref" => "IPPrefix/ROUTE53.json#/definition"},
					{"$ref" => "IPPrefix/generic.json#/definition"}
				]
				# "type" => {"$ref" => "IPPrefix/generic.json#/definition"}

			}
		}
	},
	"additionalProperties" => {"type" => "false"}
}







# IP_json_schema={"$ref" => "IPPrefix.json#/definition"}

data = File.read('input.json')
json_data = JSON.parse(data)


# # puts json_data
# if JSON::Validator.validate(IP_json_schema, json_data)
# 	puts "yes" 
# else
# 	puts "No"	
# end 


# begin
#   JSON::Validator.validate!(IP_json_schema, json_data)
# rescue JSON::Schema::ValidationError
#   puts $!.message
# end



errors = JSON::Validator.fully_validate(IP_json_schema, json_data)
if errors.empty?
	puts true
else
	raise StandardError, "fuck!"
end