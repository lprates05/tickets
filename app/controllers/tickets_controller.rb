class TicketsController < ApplicationController
  
  def index
  @tickets = Ticket.includes(:event, :seller).where(status: "available")
  end

  def new
    @ticket = Ticket.new
    @events = Event.all
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.seller = User.first  # TEMP: replace with current_user when Devise is set up
    @ticket.status = "available"

    if @ticket.save
      redirect_to tickets_path, notice: "Ticket listed successfully!"
    else
      render :new
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:price, :ticket_restrictions, :ticket_photo, :event_id)
  end

end
