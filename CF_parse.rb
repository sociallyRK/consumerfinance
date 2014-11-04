require 'typhoeus'
require 'json'

response = Typhoeus.get("https://api.consumerfinance.gov/data/hmda/slice/hmda_lar.json?#!/property_type=1,2&action_taken=1&select=as_of_year,loan_purpose_name,count&section=summary")
result = JSON.parse(response.body)


result["results"].each do |element|
  element.each_key {|key| 
  puts key.to_s + ": " +  result["results"][0][key].to_s}
  puts ""
end



