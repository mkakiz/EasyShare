class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :post, foreign_key: true
      t.string :name, null: false
      t.text :comment, null: false
      t.integer :user_id
      t.timestamps
    end
  end
end
