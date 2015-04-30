require "rails_helper"

describe "Appspot" do

  let(:appspot) { Appspot.new }

  it "EUR/EUR is 0 (not present)" do
    rate = appspot.get_rates("EUR", ["EUR"])
    expect(rate["appspot.com"]["EUR"]).to eq(0)
  end

  it "EUR/USD is > 1.0" do
    rate = appspot.get_rates("EUR", ["USD"])
    expect(rate["appspot.com"]["USD"]).to be > 1.0
  end
end
