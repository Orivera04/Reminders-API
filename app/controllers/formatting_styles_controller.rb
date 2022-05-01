class FormattingStylesController < ApplicationController

  def index
      render json: FormattingStyle.all
  end
end
