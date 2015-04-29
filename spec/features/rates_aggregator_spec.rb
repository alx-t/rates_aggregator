require "rails_helper"

describe "Rates aggregator" do

  context "check ui" do
    before(:each) do
      visit root_path
    end

    it "when current date" do
      date = Time.now.strftime("%d/%m/%Y")
      expect(page).to have_content "Exhange rates on #{date}"
    end

    it "when there is a appspot.com source" do
      expect(page).to have_content "appspot.com"
    end

    it "when there is a USD currency" do
      expect(page).to have_content "USD"
    end
  end
end
