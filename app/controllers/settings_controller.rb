# frozen_string_literal: true

# Purpose: Controller for settings
class SettingsController < ApplicationController
  def index
    settings = Setting.all
    render json: settings, status: :ok
  end

  def show
    setting = Setting.find_by(id: params[:id])

    if setting
      render json: setting, status: :ok
    else
      render json: { error: 'Setting not found.'}, status: :not_found
    end
  end

  def create
    setting = Setting.new(settings_params)

    if setting.save!
      render json: { message: 'Setting created successfully.', record: setting  }, status: :ok
    else
      render json: { error: 'Error creating Setting.', record: setting }, status: :bad_request
    end
  end

  def update
    setting = Setting.find_by(id: params[:id])
    setting.attributes = settings_params || {}

    if setting.save!
      render json: { message: 'Setting updated successfully.', record: setting }, status: :ok
    else
      render json: { error: 'Error updating Setting.', record: setting }, status: :bad_request
    end
  end

  def destroy
    setting = Setting.find_by(id: params[:id])

    if setting.destroy!
      render json: { message: 'Setting deleted successfully.', record: setting }, status: :ok
    else
      render json: { error: 'Error deleting Setting.', record: setting }, status: :bad_request
    end
  end

  private

  def settings_params
    params.permit(:token_bot_api, :formatting_style_id)
  end
end
