class Event < ApplicationRecord
  belongs_to :category
  belongs_to :location
  has_many :bookings
  has_many :users, through: :bookings
  has_many :notifications, as: :notifiable, dependent: :destroy

  after_create :create_notifications
  private
  def create_notifications
    self.notifications.create(message: "#{self.name} event created ")
  end
end
