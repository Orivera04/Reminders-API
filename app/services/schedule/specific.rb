# frozen_string_literal: true

# Module Schedule: This module is responsible of sending the reminders
module Schedule
  # This class is responsible of sending all the reminders of type specific
  class Specific < ApplicationService
    def initialize(reminder)
      @reminder = reminder
      @current_hour = Time.now.strftime('%H:%M')
      @current_day = Date.today.day.to_s
    end

    def call
      begin
        execute
      rescue StandardError => e
        telegram_logger ||= Logger.new("#{Rails.root}/log/telegram.log")

        telegram_logger.info "\n"
        telegram_logger.info "*****************************************************\n"
        telegram_logger.info "*       ERROR: SENDING MESSAGE                      *\n"
        telegram_logger.info "******************************************************\n"
        telegram_logger.info "-> Exception: #{e.message} \n"
        telegram_logger.info "-> BackTrace: #{e.backtrace.join("\n")} \n"
        telegram_logger.info "\n"

        nil
      end
    end

    def execute
      reminder_schedule = @reminder.schedules

      return unless reminder_schedule['day_of_month'] == @current_day &&
                    reminder_schedule['hour_of_execution'] == @current_hour

      Telegram::SendMessage.call(@reminder)
    end
  end
end
