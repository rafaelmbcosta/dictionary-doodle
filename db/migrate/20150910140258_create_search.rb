class CreateSearch < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :word
    end
  end
end
