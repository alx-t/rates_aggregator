require "rails_helper"

describe "OpenExchange" do

  let(:open_exchange) { OpenExchange.new }

  it "source name is present" do
    expect(open_exchange.source_name).to eq("openexchangerates.org")
  end

  it "EUR/EUR is 1.0" do
    expect(open_exchange.get_rate("EUR", "EUR")).to eq(1.0)
  end

  it "EUR/USD is > 1.1" do
    expect(open_exchange.get_rate("EUR", "USD")).to be > 1.1
  end
end
