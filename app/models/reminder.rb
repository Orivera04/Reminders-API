class Reminder < ApplicationRecord
  validates :chat_id, presence: true

  belongs_to :type_schedule
end
