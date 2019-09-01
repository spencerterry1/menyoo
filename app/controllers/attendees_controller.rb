class AttendeesController < ApplicationController

  def new
    @attendee = Attendee.new()
  end

  def create
    @attendee = Attendee.find(params[:id])
  end

  def destroy
  end

end
