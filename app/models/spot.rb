class Spot < ApplicationRecord
  belongs_to :plan 
  has_many :routes, inverse_of: :spot, dependent: :destroy
  accepts__nested_attributes_for :spots, allow_destroy: true
end
