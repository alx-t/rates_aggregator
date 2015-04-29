require "rails_helper"

describe "Appspot" do

  let(:appspot) { Appspot.new }

  it "source name is present" do
    expect(appspot.source_name).to eq("appspot.com")
  end

  it "EUR/EUR is 0 (not present)" do
    expect(appspot.get_rate("EUR", "EUR")).to eq(0)
  end

  it "EUR/USD is > 1.0" do
    expect(appspot.get_rate("EUR", "USD")).to be > 1.0
  end
end
