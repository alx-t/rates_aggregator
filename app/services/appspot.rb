class Appspot < ExchangeSource
  SOURCE_NAME = Rails.application.secrets.appspot_source_name
  API_ID = Rails.application.secrets.appspot_api_id
  SOURCE_URL = Rails.application.secrets.appspot_url

  def initialize
    super(SOURCE_NAME)
  end

  def get_rate(base_currency, rate_currency)
    url = "#{SOURCE_URL}/#{base_currency}/#{rate_currency}.json?key=#{API_ID}"
    json_doc = JSON.parse(get_document(url))
    rate = json_doc["rate"] ? json_doc["rate"] : 0
  end
end
