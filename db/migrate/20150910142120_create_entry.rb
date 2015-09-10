class CreateEntry < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :word
      t.string :grammar_group
      t.references :search, index: true, foreign_key: true
    end
  end
end
