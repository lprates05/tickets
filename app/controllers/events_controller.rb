class EventsController < ApplicationController
  
  before_action :authorize_admin!, only: [:edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @tickets = @event.tickets.where(buyer_id: nil) # Only unsold tickets
  end

  def new
    @event = Event.new
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: "Event updated successfully."
    else
      render :edit, alert: "There was a problem updating the event."
    end
  end

  def edit
    @event = Event.find(params[:id])  
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy(event_params)
        redirect_to @event
    else
        render :show, alert: "Unable to delete event"
    end

  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to new_ticket_path, notice: "Event created! You can now list your ticket."
    else
      render :new
    end

    if params[:category].present?
      @tickets = @tickets.joins(:event).where(events: { category: params[:category] })
    end
  end

  private

  def authorize_admin!
    unless current_user&.admin?
      redirect_to events_path, alert: "You are not authorized to perform this action."
    end
  end

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
