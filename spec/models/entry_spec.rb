require "rails_helper"

RSpec.describe Entry, :type => :model do

  describe "Associations" do
    it { should belong_to :search }
    it { should have_many :examples }
  end

end
