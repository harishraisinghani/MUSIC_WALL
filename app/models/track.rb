class Track < ActiveRecord::Base

  belongs_to :user
  has_many :upvotes

  validates :title, presence: true, length: {minimum: 3}
  validates :author, presence: true, length: {minimum: 3}

  #def get_num_votes
   # upvotes.find(:id).count
  #end
end