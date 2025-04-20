class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.integer :user_id
      t.string :title
      t.integer :review
      t.date :date
      t.text :body

      t.timestamps
    end
  end
end
