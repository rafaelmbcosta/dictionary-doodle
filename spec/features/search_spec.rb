#encoding: utf-8
require "rails_helper"

describe "View screen" do
  scenario "When entering the search screen I expect to see 'Dicionário'" do
    visit "/"
    expect(page).to have_text("Dicionário")
  end

end

