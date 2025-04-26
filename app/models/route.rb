class Route < ApplicationRecord
  belongs_to :spot

  enum transportation: {
    walk: 0, train: 1, bus: 2, car: 3, ship: 4, bicycle: 5, airplane: 6
  }

  validates :departure, presence: true
  validates :arrival, presence: true
  validates :visit_order,  presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :travel_time,  presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

end
