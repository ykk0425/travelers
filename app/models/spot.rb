class Spot < ApplicationRecord
  belongs_to :plan 
  has_many :routes, inverse_of: :spot, dependent: :destroy
  accepts_nested_attributes_for :routes, allow_destroy: true
end
