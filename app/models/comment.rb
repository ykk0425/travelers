class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  validates :text, presence: true
end
