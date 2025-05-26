class EventsController < ApplicationController
  
  def index
  @events = Event.all
end

  
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to new_ticket_path, notice: "Event created! You can now list your ticket."
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :name,
      :category,
      :start_date,
      :end_date,
      :start_time,
      :end_time,
      :timezone,
      :event_photo
    )
  end
end
