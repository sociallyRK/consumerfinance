require 'typhoeus'
require 'json'
require 'csv'

response = Typhoeus.get("https://api.consumerfinance.gov/data/hmda/slice/hmda_lar.json?#!/property_type=1,2&action_taken=1&select=as_of_year,loan_purpose_name,count&section=summary")
result = JSON.parse(response.body)
key_array = []
value_array = []

CSV.open("ConsumerFinance.csv", 'w') do  |csv| 
  result["results"][0].each_key { |key|
    key_array << key }

    csv << key_array

  result["results"].each do |element|
    key_array.each do |key|
      if element[key].nil?
        value_array << "N/A"
      else
       value_array << element[key]
      end
    end
   csv << value_array
   value_array = []
  end
end



