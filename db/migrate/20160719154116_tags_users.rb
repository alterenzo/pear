class TagsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :tags_users, :id => false do |t|
      t.integer :user_id
      t.integer :tag_id
    end
  end
end
