require 'rubygems'
require 'json-schema'
require 'json'


# IP_json_schema2={"$ref" => "IPPrefix/InternetEC2.json#/definition"}
IP_json_schema2={"$ref" => "IPPrefix.json#/definition"}

# json_data = {"name" => "boxuan" , "age" => 14, "friends" => ["rc", "fan", "chao"]}
data = File.read('input.json')
json_data = JSON.parse(data)


# # puts json_data
# if JSON::Validator.validate(IP_json_schema, json_data)
# 	puts "yes" 
# else
# 	puts "No"	
# end 


begin
  JSON::Validator.validate!(IP_json_schema2, json_data)
rescue JSON::Schema::ValidationError
  puts $!.message
end


# require 'rubygems'
# require 'json-schema'

# schema = {
#   "type" => "object",
#   "required" => ["a","b"],
#   "properties" => {
#     "a" => {"type" => "integer"},
#     "b" => {"type" => "string"}
#   }
# }

# data = {
#   "a" => "taco"
# }

# errors = JSON::Validator.fully_validate(schema, data)
# puts errors




# IP_json_schema={
# 	"type" => "object",
# 	"properties" => {
# 		"suncToken"=> {"type" => "string"},         #TODO(boxuguan): add value constraint				"createDate" => {"type" => "string"},
# 		"prefixes" => {
# 			"type" => "array",
# 			"items" => {
# 				"oneOf"=>[
# 					{"$ref" => "IPPrefix/InternetEC2.json#/definition"},
# 					{"$ref" => "IPPrefix/BorderEC2.json#/definition"},
# 					{"$ref" => "IPPrefix/AZEC2.json#/definition"},
# 					{"$ref" => "IPPrefix/CLOUDFRONT.json#/definition"},
# 					{"$ref" => "IPPrefix/DX.json#/definition"},
# 					{"$ref" => "IPPrefix/INGEST.json#/definition"},
# 					{"$ref" => "IPPrefix/PROD.json#/definition"},
# 					{"$ref" => "IPPrefix/ROUTE53.json#/definition"}
# 				]
# 			}
# 		}
# 	}
# }
