class Booking < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_many :notifications, as: :notifiable, dependent: :destroy
  enum status: { Failed: 0, Success: 1, Pending: 2} 

  after_create :create_notification
  private
  def create_notification
    self.notifications.create(message: "Booking for #{self.event.name} created")
  end
end
#you can set default value for status as pending
#also you can change the status of the boooking usin the key value for eg booking.confirmed!, or booking.pending! or u can check using booking.confirmed?
#event.bookings.sum(:capactiy) : for capacity in the bookings
#location.capacity - event.bookings.sum(:capactiy)