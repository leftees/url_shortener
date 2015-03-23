require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  describe '#create' do
    context "given a valid uri" do
      it "successfully creates the link record and saves it to the DB" do
        expect {post :create, "link"=>{"url"=>"https://in.yahoo.com/?p=us"}}.to change(Link, :count).by(1)
      end
    end

    context "given an invalid uri" do
      it "doesn't save to DB" do
        expect {post :create, "link"=>{"url"=>"google.com"}}.to change(Link, :count).by(0)
      end
    end
  end

  describe '#show' do
    context "given a user hits a valid shortened uri via a browser" do
      it "redirects to the original uri with an appropriate redirect response status" do
        link = FactoryGirl.create(:link, :url => "https://in.yahoo.com/?p=us")
        get :show, "shortened_url"=> "#{link.shortened_url}"
        expect(response.status).to eq(302)
      end
    end
  end
end
