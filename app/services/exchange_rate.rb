class ExchangeRate
  BASE_CURRENCY = "EUR"
  RELATIVE_CURRENCIES = %W(USD AUD NOK)

  def self.get_exchange_rates
    get_rates
  end

  private

  def self.get_rates
    rate_sources = get_rate_sources
    exchange_rates = {}
    rate_sources.each do |source|
      exchange_rates.merge!(source.get_rates(BASE_CURRENCY, RELATIVE_CURRENCIES))
    end
    exchange_rates
  end

  def self.get_rate_sources
    rate_sources = []
    rate_sources << OpenExchange.new << Appspot.new << EcbInt.new
  end
end
