require "rails_helper"

RSpec.describe Search, :type => :model do

  describe "Associations" do
    it { should have_many :entries }
  end

  let!(:successful_search) { FactoryGirl.build(:search, word: 'car') }
  let!(:successful_response) { Search.access_webservice_information(successful_search.word) }
  let!(:fail_search) { FactoryGirl.build(:search, word: 'ferrim') }
  let!(:fail_response) { Search.access_webservice_information(fail_search.word) }

  #Service is stubbed (see rails helper)
  describe "Scope 'access_webservice_information'" do
      it "if search matches, it should return and hash with entries" do
        expect(successful_response).to be_instance_of(Hash)
        expect(successful_response["entry_list"]).to include("entry")
      end

      it "if search fails, it should return suggestions" do
        expect(fail_response["entry_list"]).to include("suggestion")
      end
    end

  describe "Scope 'save_data'" do
    it "saves if service finds any entry" do
      expect(Search.save_data(successful_search.word, successful_response)).to eq(true)
      search = Search.all.where("word = ?", successful_search.word).first
      entries = Entry.all.where("search_id = ?", search.id)
      expect(entries).not_to be_empty
    end
  end

  describe "Scope 'find_word'" do
    it "Word is found on database" do
      search = FactoryGirl.create(:search_with_entries)
      response = Search.find_word(search.word)
      expect(response["found"]).to eq(true)
      expect(response["data"]).to be_instance_of(Search)
    end

    it "Word not found on database, but is found on webservice" do
      response = Search.find_word(successful_search.word)
      expect(response["found"]).to eq(true)
      expect(response["data"]).to be_instance_of(Search)
    end

    it "Word not found neither database and webservice " do
      response = Search.find_word(fail_search.word)
      expect(response["found"]).to eq(false)
      expect(response["data"]).to include("suggestion")
    end




  end

end
