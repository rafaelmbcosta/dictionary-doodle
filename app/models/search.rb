class Search < ActiveRecord::Base

  has_many :entries, class_name: 'Entry'

  # Return a hash containing the translation sugestions
  # return should be in the format: {"entry_list"=>{"version"=>"1.0", "suggestion"=>["sugestion1", "sugestion2"]}}
  def self.access_webservice_information(word)
    complement = "key=22db59d8-2b84-4309-849e-50978735b453"
    address = "http://www.dictionaryapi.com/api/v1/references/collegiate/xml/"
    uri = URI("#{address}#{word}?#{complement}")
    response = Net::HTTP.get(uri)
    return Hash.from_xml(response)
  end

  def self.save_data(word, data_hash)
    search = Search.new(word: word)
    data_hash["entry_list"]["entry"].each do |data_entry|
      entry = Entry.new(word: data_entry["ew"].to_s, grammar_group: data_entry["fl"].to_s)
      if data_entry["def"]["dt"].instance_of?(Array)
        data_entry["def"]["dt"].each do |data_example|
          example = Example.new(text: data_example)
          entry.examples << example
        end
      else
        entry.examples << Example.new(text: data_entry["def"]["dt"])
      end
      search.entries << entry
    end
    return search.save
  end

  # find word in database
  # if it doesn't find, get from webservice
  # if it doesn't find on webservice, put a flag 'found' = false and return the suggestions
  # made it recursive so i have the same return
  def self.find_word(word)
    result = Hash.new
    search = Search.all.where("word = ?", word).first
    if search.nil?
      response = access_webservice_information(word)
      #word not on database but is found on the webservice
      if response["entry_list"].include?("entry")
        save_data(word, response)
        return find_word(word)
      else
        #word is neither on database and webservice
        result["found"] = false
        result["data"] = response["entry_list"]
        return result
      end
    else
      #word is in database and will be passed through data
      result["found"] = true
      result["data"] = search
    end
    return result
  end
end
