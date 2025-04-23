class AddStayingStartToSpots < ActiveRecord::Migration[6.1]
  def change
    add_column :spots, :staying_start, :datetime
  end
end
