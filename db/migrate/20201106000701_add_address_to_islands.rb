class AddAddressToIslands < ActiveRecord::Migration[6.0]
  def change
    add_column :islands, :address, :string
  end
end
