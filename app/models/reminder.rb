# frozen_string_literal: true

# Purpose: Model for reminder
class Reminder < ApplicationRecord
  validates :chat_id, presence: true

  belongs_to :type_schedule
  belongs_to :setting
end
