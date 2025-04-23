class AddEndDateToPlans < ActiveRecord::Migration[6.1]
  def change
    add_column :plans, :end_date, :date
  end
end
