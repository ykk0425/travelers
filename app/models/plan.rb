class Plan < ApplicationRecord
  belongs_to :user
  has_many :spots, inverse_of: :plan, dependent: :destroy
  accepts_nested_attributes_for :spots, allow_destroy: true, reject_if: :all_blank
  validates_associated :spots

  validates :title, presence: true, length: { maximum: 100 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_end_check

  def start_end_check
    errors.add(:end_date, "は旅行開始日より前の日付では登録できません。") unless
    self.start_date <= self.end_date 
  end
end
