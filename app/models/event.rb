class Event < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true


  belongs_to :creator, :class_name => "User"

  has_many :attendances, :foreign_key => "attended_event_id"
  has_many :attendees, :through => "attendances", :source => "attendee"


end
