class AddCurrentProjectToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :current_project, :string
  end
end
