class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :events, :foreign_key => "creator_id", :class_name => "Event", dependent: :destroy

  has_many :attendances, :foreign_key => "attendee_id", dependent: :destroy
  has_many :attended_events, :through => "attendances"

# these are used in the UsersController
  def upcoming_events
    self.attended_events.where("events.date > ?", Time.current)
  end

  def previous_events
    self.attended_events.where("events.date < ?", Time.current)
  end

end
