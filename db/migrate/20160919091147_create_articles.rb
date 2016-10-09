class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text

      # this line adds an integer column called `article_id`.
      t.references :article, index: true

      t.timestamps null: false
    end
  end
end
