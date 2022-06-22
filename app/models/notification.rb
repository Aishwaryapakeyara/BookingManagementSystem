class Notification < ApplicationRecord
  belongs_to :notifiable, polymorphic: true

  def display_name
    notifiable_type.eql?('Event') ? notifiable.name : notifiable.event.name
  end
end
