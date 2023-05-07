# frozen_string_literal: true

# Purpose: Controller for telegram job trigger
class TelegramJobsController < ApplicationController
  def index
    ReminderJob.perform_now

    render json: { message: 'Executing Job.' }, status: :ok
  end
end
