class DayReminderJob < ApplicationJob
  queue_as :day

  def perform
    begin
      current_hour = Time.now.strftime("%H:%M")
      actual_day = Date.today.strftime("%A")

      reminders = Reminder.where(hour_of_execution: current_hour)

      return unless reminders.present?

      reminders.each do |reminder|
        schedules = JSON.parse(reminder.schedules)
        TelegramMessage.call(reminder) if schedules[actual_day].present?
      end
    rescue => exception
      cron_logger ||= Logger.new("#{Rails.root}/log/cron.log")

      cron_logger.info "\n"
      cron_logger.info "*********************************************************************\n"
      cron_logger.info "*               ERROR PERFOMING DAY REMINDER JOB                    *\n"
      cron_logger.info "*********************************************************************\n"

      cron_logger.info "-> Exception: #{exception.message} \n"
      cron_logger.info "-> BackTrace: #{exception.backtrace.join("\n")} \n"
      cron_logger.info "\n"
    end
  end
end
