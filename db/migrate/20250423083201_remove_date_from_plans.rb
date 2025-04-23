class RemoveDateFromPlans < ActiveRecord::Migration[6.1]
  def change
    remove_column :plans, :date, :date
  end
end
