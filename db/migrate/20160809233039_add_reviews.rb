class AddReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.timestamp
    end
    
    add_reference :reviews, :user
    add_reference :reviews, :track
  end
end
