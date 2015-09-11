class SearchesController < ApplicationController

  def index
  end

  def find_word
    @result = Search.find_word(params["search"]["word"])
    respond_to do |format|
      format.js
    end
  end
end
