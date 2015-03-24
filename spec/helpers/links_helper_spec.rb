require 'rails_helper'

RSpec.describe LinksHelper, type: :helper do
  describe "#display_name" do
    it "displays the shortened url inclusive of the domain name" do
      link = FactoryGirl.create(:link, :url => "https://in.yahoo.com/?p=us")
      expect(helper.display_name(link)).to eq(LinksHelper::BASE_URL + "/" +"#{link.shortened_url}")
    end
  end
end
