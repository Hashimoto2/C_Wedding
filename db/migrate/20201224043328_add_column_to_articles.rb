class AddColumnToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :image2_id, :string
    add_column :articles, :introduction2, :string
  end
end
