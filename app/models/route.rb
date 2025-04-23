class Route < ApplicationRecord
  belongs_to :spot

  enum transportation: {
    walk: 0, train: 1, bus: 2, car: 3, ship: 4, bicycle: 5, airplane: 6
  }
end
