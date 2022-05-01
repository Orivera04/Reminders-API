class ConfigurationController < ApplicationController

  def index
    render json: Configuration.all
  end

  private

  def configurations_params
    params.require(:configurations).permit(:name, :age)
  end
end
