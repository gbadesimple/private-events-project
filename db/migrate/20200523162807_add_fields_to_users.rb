class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :created_events, :integer
  end
end
