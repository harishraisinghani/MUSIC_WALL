class AddUserReference < ActiveRecord::Migration
  def change
    add_reference :upvotes, :user
    add_reference :upvotes, :track
    add_reference :tracks, :user
  end
end
