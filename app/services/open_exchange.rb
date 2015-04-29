class OpenExchange < ExchangeSource
  SOURCE_NAME = Rails.application.secrets.openexchange_source_name
  API_ID = Rails.application.secrets.openexchange_api_id
  SOURCE_URL = Rails.application.secrets.openexchange_url

  def initialize
    super(SOURCE_NAME)
  end

  def get_rate(base_currency, rate_currency)
    url = SOURCE_URL+"?app_id="+API_ID
    json_doc = JSON.parse(get_document(url))
    get_relative_rate(json_doc, base_currency, rate_currency)
  end

  private

  def get_relative_rate(json_doc, base_currency, rate_currency)
    base_rate = json_doc["rates"][base_currency]
    relative_rate = json_doc["rates"][rate_currency]
    rate = relative_rate / base_rate
  end
end
