class DestinationsController < ApplicationController

  def index
    @destinations = Destination.all
  end

  def show
    current_destination
  end

  private

  def current_destination
    @destination = Destination.all.find(params[:id])
  end

end
