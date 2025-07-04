class Spot < ApplicationRecord
  belongs_to :plan 
  has_many :routes, inverse_of: :spot, dependent: :destroy
  accepts_nested_attributes_for :routes, allow_destroy: true, reject_if: :all_blank
  has_many_attached :images

  validates :name, presence: true, length: { maximum: 100 }
  validates :staying_start, presence: true
  validates :staying_end, presence: true
  validates :visit_order, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode

  validate :start_end_check

  def start_end_check
    errors.add(:staying_end, "は滞在開始時間より前の時間では登録できません。") unless
    self.staying_start <= self.staying_end 
  end
end
