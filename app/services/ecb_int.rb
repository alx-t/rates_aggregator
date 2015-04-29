class EcbInt < ExchangeSource
  SOURCE_NAME = Rails.application.secrets.ecb_int_source_name
  SOURCE_URL = Rails.application.secrets.ecb_int_url

  def initialize
    super(SOURCE_NAME)
  end

  def get_rate(base_currency, rate_currency)
    xml_doc = get_document(SOURCE_URL)
    items = xml_doc.xpath("//cube//cube//cube")
    items.each do |item|
      return item["rate"].to_f if rate_currency == item["currency"]
    end
  end
end
