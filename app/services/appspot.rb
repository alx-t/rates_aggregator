class Appspot < ExchangeSource
  SOURCE_NAME = Rails.application.secrets.appspot_source_name
  API_ID = Rails.application.secrets.appspot_api_id
  SOURCE_URL = Rails.application.secrets.appspot_url

  def get_rates(base_currency, relative_currencies)
    rates = {}
    relative_currencies.each do |currency|
      url = "#{SOURCE_URL}/#{base_currency}/#{currency}.json?key=#{API_ID}"
      json_doc = JSON.parse(get_document(url))
      rates[currency] = json_doc["rate"] || 0
    end
    { SOURCE_NAME => rates }
  end
end
