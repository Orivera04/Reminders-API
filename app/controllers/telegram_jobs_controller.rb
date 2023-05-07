# frozen_string_literal: true

# Purpose: Controller for telegram job trigger
class TelegramJobsController < ApplicationController
  def create
    ReminderJob.perform_later

    render json: { message: 'Executing Job.' }, status: :ok
  end
end
