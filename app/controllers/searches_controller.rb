class SearchesController < ApplicationController

  def index
  end

  def find_word
    #@result = Search.find_word(params["search"]["word"])
    @result = {"found" => true, "data" => Search.first}
    respond_to do |format|
      format.js
    end
  end
end
