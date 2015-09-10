require "rails_helper"

RSpec.describe Search, :type => :model do

  describe "Associations" do
    it { should have_many :entries }
  end

  let!(:successful_search) { FactoryGirl.create(:search, word: 'car') }
  let!(:successful_response) { Search.access_webservice_information(successful_search.word) }
  let!(:fail_search) { FactoryGirl.create(:search, word: 'ferrim') }
  let!(:fail_response) { Search.access_webservice_information(fail_search.word) }

  #Service is stubbed (see rails helper)
  describe "Scope 'access_webservice_information'" do
      it "if search matches, it should return and hash with entries" do
        expect(successful_response).to be_instance_of(Hash)
        expect(successful_response).to include("entry_list")
      end

      it "if search fails, it should return suggestions" do
        expect(fail_response["entry_list"]).to include("suggestion")
      end
    end

end
