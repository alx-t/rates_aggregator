class ExchangeRate
  BASE_CURRENCY = "EUR"
  RELATIVE_CURRENCIES = %W(USD AUD NOK)

  def self.get_exchange_rate
    get_rates(get_rate_sources())
  end

  private

  def self.get_rate_sources
    rate_sources = []
    rate_sources << OpenExchange.new << Appspot.new << EcbInt.new
  end

  def self.get_rates(rate_sources)
    exchange_rates = {}
    rate_sources.each do |source|
      rate  = {}
      RELATIVE_CURRENCIES.each do |currency|
        rate["#{currency}"] = source.get_rate(BASE_CURRENCY, currency)
      end
      exchange_rates["#{source.source_name}"] = rate
    end
    exchange_rates
  end
end
