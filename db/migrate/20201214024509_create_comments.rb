class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :article_id
      t.integer :customer_id
      t.text :comment
      t.integer :quantity
      t.float :rate
      t.timestamps
    end
  end
end
