class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :category_id
      t.string :title
      t.text :introduction
      t.string :image_id
      t.integer :customer_id
      t.timestamps
    end
  end
end
