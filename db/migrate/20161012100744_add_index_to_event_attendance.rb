class AddIndexToEventAttendance < ActiveRecord::Migration[5.0]
  def change
  	add_index :event_attendances, :event_attendee_id
  	add_index :event_attendances, :attended_event_id
  	add_index :event_attendances, [:event_attendee_id, :attended_event_id], unique: true, :name => 'my_index'
  end
end
