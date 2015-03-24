require 'rails_helper'

RSpec.describe Link, type: :model do

  describe "#ensure_valid_uri" do
    context "given a valid uri" do
      it "should create a new link record" do
        FactoryGirl.create(:link, :url => "https://in.yahoo.com/?p=us")
        expect(Link.count).to eq(1)
      end
    end

    context "given an invalid uri" do
      it "should not create a new link record and raise an appropriate exception" do
        expect {FactoryGirl.create(:link, :url => "google.com")}.to raise_error(ActiveRecord::RecordNotSaved)
      end
    end
  end

end
