# frozen_string_literal: true

# ReminderJob: This class is responsible of sending the reminders
class ReminderJob < ApplicationJob
  queue_as :reminder

  def perform
    begin
      reminders = Reminder.all

      reminders.each do |reminder|
        case reminder.type_schedule_id
        when TypeSchedule::DAILY
          Schedule::Daily.call(reminder)
        when TypeSchedule::SPECIFIC
          Schedule::Specific.call(reminder)
        end
      end
    rescue StandardError => e
      cron_logger ||= Logger.new("#{Rails.root}/log/cron.log")

      cron_logger.info "-> Exception: #{e.message} \n"
      cron_logger.info "-> BackTrace: #{e.backtrace.join("\n")} \n"
      cron_logger.info "\n\n\n"
    end
  end
end
