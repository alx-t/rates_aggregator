require "open-uri"
require "nokogiri"

class ExchangeSource

  def initialize(base_currency, relative_currencies)
    @base_currency = base_currency
    @relative_currencies = relative_currencies
    @rate = Rate.new
  end

  def get_rates
    set_class_variables
    calculate_rates
    @rate
  end

  private

  def get_document(url)
    doc = Nokogiri::HTML(open(url))
  end
end
