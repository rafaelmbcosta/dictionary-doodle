class CreateMeaning < ActiveRecord::Migration
  def change
    create_table :meanings do |t|
      t.string :word
      t.query :relation
      t.timestamps
    end
  end
end
