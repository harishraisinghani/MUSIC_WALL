class DeleteMessages < ActiveRecord::Migration
  def change
    change_table :messages do |t|
      t.remove   :title
      t.remove   :author
      t.remove   :url
      t.remove :created_at
      t.remove :updated_at
    end
  end
end
