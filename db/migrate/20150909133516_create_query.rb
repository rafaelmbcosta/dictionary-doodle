class CreateQuery < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string :word
      t.timestamps
    end
  end
end
