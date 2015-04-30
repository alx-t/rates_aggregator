class OpenExchange < ExchangeSource
  SOURCE_NAME = Rails.application.secrets.openexchange_source_name
  API_ID = Rails.application.secrets.openexchange_api_id
  SOURCE_URL = Rails.application.secrets.openexchange_url

  def get_rates(base_currency, relative_currencies)
    url = SOURCE_URL+"?app_id="+API_ID
    json_doc = JSON.parse(get_document(url))
    get_relative_rates(json_doc, base_currency, relative_currencies)
  end

  private

  def get_relative_rates(json_doc, base_currency, relative_currencies)
    rates = {}
    relative_currencies.each do |currency|
      base_rate = json_doc["rates"][base_currency]
      relative_rate = json_doc["rates"][currency]
      rate = relative_rate / base_rate
      rates[currency] = rate
    end
    { SOURCE_NAME => rates }
  end
end
