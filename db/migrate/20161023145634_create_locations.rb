class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.text :description
      t.binary :image

      t.timestamps null: false
    end
  end
end
