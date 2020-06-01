class Event < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true


  belongs_to :creator, :class_name => "User"

  has_many :attendances, :foreign_key => "attended_event_id", dependent: :destroy
  has_many :attendees, :through => "attendances", :source => "attendee"

=begin
  def self.past
    where("date < ?", Time.current).order(date: :DESC)
  end
=end

# refactorting theabove code
scope :past, -> { where( "date < ?", Time.current ) }

=begin
  def self.future
    where("date > ?", Time.current).order(date: :DESC)
  end
=end

# refactoring the above code
scope :future, -> { where( "date > ?", Time.current ) }
end
