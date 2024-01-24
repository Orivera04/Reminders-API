# frozen_string_literal: true

# Purpose: Controller for reminders
class RemindersController < ApplicationController
  def index
    reminders = RemindersSerializer.new(Reminder.all.order(id: :asc)).serializable_hash
    render json: reminders, status: :ok
  end

  def show
    reminder = Reminder.find_by(id: params[:id])

    if reminder
      reminder.schedules = Hash[reminder.schedules.sort_by { |day, time| (Date.parse(day).wday - 1) % 7 }] if reminder.type_schedule_id == TypeSchedule::DAILY
      render json: reminder, status: :ok
    else
      render json: { error: 'Reminder not found.'}, status: :not_found
    end
  end

  def create
    reminder = Reminder.new(reminders_params)

    if reminder.save!
      render json: { message: 'Reminder created successfully.', record: reminder }, status: :ok
    else
      render json: { error: 'Error creating Reminder.', record: reminder }, status: :bad_request
    end
  end

  def update
    reminder = Reminder.find_by(id: params[:id])
    reminder.attributes = reminders_params || {}

    if reminder.save!
      render json: { message: 'Reminder updated successfully.', record: reminder }, status: :ok
    else
      render json: { error: 'Error updating Reminder.', record: reminder }, status: :bad_request
    end
  end

  def destroy
    reminder = Reminder.find_by(id: params[:id])

    if reminder.destroy!
      render json: { message: 'Reminder deleted successfully.', record: reminder }, status: :ok
    else
      render json: { error: 'Error deleting Reminder.', record: setting }, status: :bad_request
    end
  end

  private

  def reminders_params
    params.require(:reminder)
          .permit(:chat_id, :message, :type_schedule_id, :setting_id, schedules: {})

  end
end
