class RemoveImageFromSpots < ActiveRecord::Migration[6.1]
  def change
    remove_column :spots, :image, :string
  end
end
