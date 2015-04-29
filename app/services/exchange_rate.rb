class ExchangeRate
  BASE_CURRENCY = "EUR"
  RELATIVE_CURRENCIES = %W(USD AUD NOK)

  def initialize
    @rate_sources = get_rate_sources
  end

  def get_exchange_rate
    exchange_rates = []
    @rate_sources.each do |source|
      rate  = []
      RELATIVE_CURRENCIES.each do |currency|
        rate << { "#{currency}" => source.get_rate(BASE_CURRENCY, currency) }
      end
      exchange_rates << { "#{source.source_name}" => rate }
    end
    exchange_rates
  end

  private

  def get_rate_sources
    rate_sources = []
    rate_sources << OpenExchange.new << Appspot.new << EcbInt.new
  end
end
