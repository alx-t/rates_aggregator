require "rails_helper"

describe "EcbInt" do

  let(:ecb_int) { EcbInt.new }

  it "EUR/EUR is 0 (not present)" do
    rate = ecb_int.get_rates("EUR", ["EUR"])
    expect(rate["ecb.int"]["EUR"]).to eq(0)
  end

  it "EUR/USD is > 1.1" do
    rate = ecb_int.get_rates("EUR", ["USD"])
    expect(rate["ecb.int"]["USD"]).to be > 1.1
  end
end
