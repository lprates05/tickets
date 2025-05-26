class TicketsController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create]

  def index
    if params[:event_id].present?
      @event = Event.find(params[:event_id])
      @tickets = @event.tickets.where(buyer_id: nil)
    else
      @tickets = Ticket.where(buyer_id: nil)
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
  end


  def new
    @ticket = Ticket.new
    @events = Event.all
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.seller = current_user
    @ticket.status = "available"

    if @ticket.save
      redirect_to tickets_path, notice: "Ticket listed successfully!"
    else
      @events = Event.all
      render :new
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:price, :ticket_restrictions, :ticket_photo, :event_id)
  end

end
