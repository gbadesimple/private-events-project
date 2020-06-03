class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.integer :event_invitee_id, null: false
      t.integer :invited_event_id, null: false

      t.timestamps
    end
  end
end
