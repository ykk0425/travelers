class AddStayingEndToSpots < ActiveRecord::Migration[6.1]
  def change
    add_column :spots, :staying_end, :datetime
  end
end
