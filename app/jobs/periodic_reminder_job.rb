class PeriodicReminderJob < ApplicationJob
  queue_as :periodic

  def perform(interval)
    begin
      actual_day = Date.today.strftime("%A")
      reminders = Reminder.where(interval_of_execution: interval)

      return unless reminders.present?

      reminders.each do |reminder|
        schedules = JSON.parse(reminder.schedules)
        TelegramMessage.call(reminder) if schedules[actual_day].present?
      end
    rescue => exception
      cron_logger ||= Logger.new("#{Rails.root}/log/cron.log")

      cron_logger.info "\n"
      cron_logger.info "**************************************************************************\n"
      cron_logger.info "*               ERROR PERFOMING PERIODIC REMINDER JOB                    *\n"
      cron_logger.info "**************************************************************************\n"

      cron_logger.info "-> Exception: #{exception.message} \n"
      cron_logger.info "-> BackTrace: #{exception.backtrace.join("\n")} \n"
      cron_logger.info "\n"
    end
  end
end
