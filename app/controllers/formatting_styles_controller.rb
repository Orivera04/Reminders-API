# frozen_string_literal: true

# Purpose: Controller for formatting styles
class FormattingStylesController < ApplicationController
  def index
    render json: FormattingStyle.all
  end
end
