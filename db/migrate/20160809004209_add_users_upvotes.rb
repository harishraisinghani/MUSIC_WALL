class AddUsersUpvotes < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.timestamp
    end

    create_table :upvotes do |t|
      t.integer :likes
      t.timestamp
    end
  end
end
