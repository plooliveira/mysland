class AddImageToIslands < ActiveRecord::Migration[6.0]
  def change
    add_column :islands, :image, :string
  end
end
