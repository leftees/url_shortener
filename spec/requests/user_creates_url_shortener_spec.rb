require 'rails_helper'

RSpec.describe "Create New Url Shortener Page", type: :request do
  describe "Url Shortener feature" do
    context "given a valid uri" do
      it "should create new url shortener" do
        visit new_link_path
        fill_in "Url", with: "https://news.ycombinator.com/"
        click_button "Create Link"
        expect(page).to have_content('Shortenened URLs')
      end
    end

    context "given a invalid uri" do
      it "should remain on the create new url shortener page" do
        visit new_link_path
        fill_in "Url", with: "ycombinator.com/"
        click_button "Create Link"
        expect(page).to have_content('Enter the url which you want to shorten')
      end
    end
  end

end
