class AddAddressToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :address, :string
  end
end
