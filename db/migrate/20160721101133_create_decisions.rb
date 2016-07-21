class CreateDecisions < ActiveRecord::Migration[5.0]
  def change
    create_table :decisions do |t|
      t.integer :by_user
      t.integer :on_user
      t.boolean :liked

      t.timestamps
    end
  end
end
