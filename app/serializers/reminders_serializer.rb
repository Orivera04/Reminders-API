# frozen_string_literal: true

# Purpose: Serializer for reminders
class RemindersSerializer
  include JSONAPI::Serializer

  attributes :id, :chat_id, :message

  attribute :type_schedule do |reminder|
    reminder.type_schedule.name
  end

  attribute :setting_name do |reminder|
    reminder.setting.description
  end
end
