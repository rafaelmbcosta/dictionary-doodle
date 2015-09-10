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

end
