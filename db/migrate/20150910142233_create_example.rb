class CreateExample < ActiveRecord::Migration
  def change
    create_table :examples do |t|
      t.string :text
      t.references :entry, index: true, foreign_key: true
    end
  end
end
