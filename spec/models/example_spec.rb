require "rails_helper"

RSpec.describe Example, :type => :model do

  describe "Associations" do
    it { should belong_to :entry }
  end

end
