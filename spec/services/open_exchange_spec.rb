require "rails_helper"

describe "OpenExchange" do

  let(:open_exchange) { OpenExchange.new }

  it "EUR/EUR is 1.0" do
    rate = open_exchange.get_rates("EUR", ["EUR"])
    expect(rate["openexchangerates.org"]["EUR"]).to eq(1.0)
  end

  it "EUR/USD is > 1.1" do
    rate = open_exchange.get_rates("EUR", ["USD"])
    expect(rate["openexchangerates.org"]["USD"]).to be > 1.1
  end
end
