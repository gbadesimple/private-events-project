class AddFieldsToAttendances < ActiveRecord::Migration[6.0]
  def change
    add_column :attendances, :attendee_id, :integer
  end
end
