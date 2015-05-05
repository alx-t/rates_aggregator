class ExchangeRate
  BASE_CURRENCY = "EUR"
  RELATIVE_CURRENCIES = %W(USD AUD NOK)

  def self.get_exchange_rates
    get_rates
  end

  private

  def self.get_rates
    rate_sources = get_rate_sources
    exchange_rates = []
    rate_sources.each do |source|
      exchange_rates << source.get_rates
    end
    exchange_rates
  end

  def self.get_rate_sources
    rate_sources = []
    rate_sources <<
      OpenExchange.new(BASE_CURRENCY, RELATIVE_CURRENCIES) <<
      Appspot.new(BASE_CURRENCY, RELATIVE_CURRENCIES) <<
      EcbInt.new(BASE_CURRENCY, RELATIVE_CURRENCIES)
  end
end
