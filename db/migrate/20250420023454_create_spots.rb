class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.integer :plan_id
      t.string :name
      t.text :explanation
      t.integer :staying_time
      t.string :image
      t.integer :visit_order
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
