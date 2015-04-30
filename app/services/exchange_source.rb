require "open-uri"
require "nokogiri"

class ExchangeSource

  private

  def get_document(url)
    doc = Nokogiri::HTML(open(url))
  end
end
