class EcbInt < ExchangeSource
  SOURCE_NAME = Rails.application.secrets.ecb_int_source_name
  SOURCE_URL = Rails.application.secrets.ecb_int_url

  def get_rates(base_currency, relative_currencies)
    xml_doc = get_document(SOURCE_URL)
    items = xml_doc.xpath("//cube//cube//cube")
    rates = {}
    relative_currencies.each do |currency|
      items.each do |item|
        if currency == item["currency"]
          rates[currency] = item["rate"].to_f
          break
        else
          rates[currency] = 0
        end
      end
    end
    { SOURCE_NAME => rates }
  end
end
