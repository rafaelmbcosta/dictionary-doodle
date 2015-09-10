class CreateMeaning < ActiveRecord::Migration
  def change
    create_table :meanings do |t|
      t.string :word
      t.references :query, index: true, foreign_key: true
      t.timestamps
    end
  end
end
