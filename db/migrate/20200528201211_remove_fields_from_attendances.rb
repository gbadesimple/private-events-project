class RemoveFieldsFromAttendances < ActiveRecord::Migration[6.0]
  def change
    remove_column :attendances, :event_attended_id, :integer
    remove_column :attendances, :event_attendee_id, :integer
  end
end
