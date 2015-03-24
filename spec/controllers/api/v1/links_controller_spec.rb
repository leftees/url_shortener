require 'rails_helper'

RSpec.describe Api::V1::LinksController, type: :controller do

  describe '#create' do
    context "given a valid uri" do
      it "successfully creates the link record and saves it to the DB" do
        expect {post :create, "url"=>"https://in.yahoo.com/?p=us", :format => 'json'}.to change(Link, :count).by(1)
      end

      it "returns a created(201) response code on successful creation of a new link record" do
        post :create, "url"=>"https://in.yahoo.com/?p=us", :format => 'json'
        expect(response.status).to  eq(201)
      end

    end

    context "given an invalid uri" do
      it "doesn't save to DB" do
        expect {post :create, "url"=>"google.com", :format => 'json'}.to change(Link, :count).by(0)
      end
    end
  end

end