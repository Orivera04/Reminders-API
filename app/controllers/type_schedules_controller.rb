# frozen_string_literal: true

# Purpose: Controller for type schedules
class TypeSchedulesController < ApplicationController
  def index
    render json: TypeSchedule.all
  end
end
