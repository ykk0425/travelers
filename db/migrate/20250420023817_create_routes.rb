class CreateRoutes < ActiveRecord::Migration[6.1]
  def change
    create_table :routes do |t|
      t.integer :spot_id
      t.string :departure
      t.string :arrival
      t.integer :travel_time
      t.integer :transportation
      t.text :description
      t.integer :visit_order

      t.timestamps
    end
  end
end
