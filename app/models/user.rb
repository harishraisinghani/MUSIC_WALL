class User < ActiveRecord::Base
  #include BCrypt

  has_many :tracks
  has_many :upvotes
  has_many :reviews

  validates :email, uniqueness: true
  validates_format_of :email, :with => /.+@.+\.+/i

end
