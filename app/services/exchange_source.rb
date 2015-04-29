require "open-uri"
require "nokogiri"

class ExchangeSource

  attr_reader :source_name

  def initialize(source_name)
    @source_name = source_name
  end

  def get_rate(base_currency, rate_currency)
  end

  protected

  def get_document(url)
    doc = Nokogiri::HTML(open(url))
  end
end
