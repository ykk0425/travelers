class RemoveStayingTimeFromSpots < ActiveRecord::Migration[6.1]
  def change
    remove_column :spots, :staying_time, :integer
  end
end
