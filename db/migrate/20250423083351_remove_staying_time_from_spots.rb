class RemoveStayingTimeFromSpots < ActiveRecord::Migration[6.1]
  def change
    remove_column :spots, :staying, :integer
  end
end
