class CreateStuffs < ActiveRecord::Migration
  def change
    create_table :stuffs do |t|
      t.string :name
      t.text :description
      t.binary :image
      t.references :location, index: true
      t.references :type, index: true

      t.timestamps null: false
    end
    add_foreign_key :stuffs, :locations
    add_foreign_key :stuffs, :types
  end
end
