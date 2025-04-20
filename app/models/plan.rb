class Plan < ApplicationRecord
  belongs_to :user
  has_many :spots, inverse_of: :plan, dependent: :destroy
  accepts_nested_attributes_for :spots, allow_destroy: true
end
