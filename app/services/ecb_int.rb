class EcbInt < ExchangeSource
  SOURCE_NAME = Rails.application.secrets.ecb_int_source_name
  SOURCE_URL = Rails.application.secrets.ecb_int_url

  private

  def set_class_variables
    xml_doc = get_document(SOURCE_URL)
    @items = xml_doc.xpath("//cube//cube//cube")
    @rate.title = SOURCE_NAME
  end

  def calculate_rates
    @relative_currencies.each do |currency|
      @items.each do |item|
        if currency == item["currency"]
          @rate.rates[currency] = item["rate"].to_f
          break
        else
          @rate.rates[currency] = 0
        end
      end
    end
  end
end
