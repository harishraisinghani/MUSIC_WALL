class AddReviewContent < ActiveRecord::Migration
  def change
    change_table :reviews do |t|
      t.string :content
    end
  end
end
