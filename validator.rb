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
	"additionalProperties" => false
}




prefixes = {
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




# data = File.read('input.json')
# json_data = JSON.parse(data)

# errors = JSON::Validator.fully_validate(IP_json_schema, json_data)
# if errors.empty?
# 	puts true
# else
# 	raise StandardError,  (puts errors)
# end



data = File.read('input.json')
json_data = JSON.parse(data)

# #method 1 to load json schema
# prefixes = File.read('prefix.json')
# prefixes = JSON.parse(prefixes)

#method 2 to load json schema
prefixes = {"$ref" => "prefix.json#/prefixes"}

puts prefixes

errors = JSON::Validator.fully_validate(prefixes, json_data)
if errors.empty?
	puts true
else
	raise StandardError,  (puts errors)
end


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



