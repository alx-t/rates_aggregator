require "rails_helper"

describe "EcbInt" do

  let(:ecb_int) { EcbInt.new }

  it "source name is present" do
    expect(ecb_int.source_name).to eq("ecb.int")
  end

  it "EUR/EUR is 0 (not present)" do
    expect(ecb_int.get_rate("EUR", "EUR")).to eq(0)
  end

  it "EUR/USD is > 1.1" do
    expect(ecb_int.get_rate("EUR", "USD")).to be > 1.1
  end
end
