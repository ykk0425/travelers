class AddStartDateToPlans < ActiveRecord::Migration[6.1]
  def change
    add_column :plans, :start_date, :date
  end
end
