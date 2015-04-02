require 'rubygems'
require 'json-schema'
require 'json'

IP_json_schema={"$ref" => "IPPrefix.json#/definition"}

data = File.read('input.json')
json_data = JSON.parse(data)


# puts json_data
if JSON::Validator.validate(IP_json_schema, json_data)
	puts "yes" 
else
	puts "No"	
end 