class OpenExchange < ExchangeSource
  SOURCE_NAME = Rails.application.secrets.openexchange_source_name
  API_ID = Rails.application.secrets.openexchange_api_id
  SOURCE_URL = Rails.application.secrets.openexchange_url

  private

  def set_class_variables
    @url = SOURCE_URL+"?app_id="+API_ID
    @json_doc = JSON.parse(get_document(@url))
    @rate.title = SOURCE_NAME
  end

  def calculate_rates
    @relative_currencies.each do |currency|
      base_rate = @json_doc["rates"][@base_currency]
      relative_rate = @json_doc["rates"][currency]
      rate = relative_rate / base_rate
      @rate.rates[currency] = rate
    end
  end
end
