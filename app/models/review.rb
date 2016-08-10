class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :track

  validates :user, presence: true
  validates :track, presence: true, uniqueness: { scope: :user, message: "only one review per user" }
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :content, length: { in: 4..500 } 

end