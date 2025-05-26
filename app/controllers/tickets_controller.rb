class TicketsController < ApplicationController
  
  before_action :authorize_ticket_owner!, only: [:edit, :update, :destroy]
  before_action :ensure_ticket_is_available, only: [:edit, :update, :destroy]

  include Rails.application.routes.url_helpers


  def index
    @events = Event.all
    @categories = Event.distinct.pluck(:category)

    @tickets = Ticket.all

    if params[:available_only] != "0"
      @tickets = @tickets.where(status: "available")
    end

    if params[:event_id].present?
      @tickets = @tickets.where(event_id: params[:event_id])
    end

    if params[:event_name].present?
      @tickets = @tickets.joins(:event).where("LOWER(events.name) LIKE ?", "%#{params[:event_name].downcase}%")
    end


    if params[:date].present?
      @tickets = @tickets.joins(:event).where(events: { date: params[:date] })
    end

    if params[:category].present?
      @tickets = @tickets.joins(:event).where(events: { category: params[:category] })
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

  def purchase
    @ticket = Ticket.find(params[:id])
    if @ticket.buyer_id.nil? && @ticket.seller_id != current_user.id
      @ticket.update(buyer_id: current_user.id, status: "sold")
      redirect_to purchases_user_path(current_user), notice: "Ticket purchased successfully."
    else
      redirect_to tickets_path, alert: "This ticket is not available."
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.seller_id == current_user.id
      if @ticket.update(ticket_params)
        redirect_to listings_user_path(current_user), notice: "Ticket updated successfully."
      else
        render :edit
      end
    else
      redirect_to root_path, alert: "You’re not authorized to edit this ticket."
    end
  end


  def destroy
    @ticket = Ticket.find(params[:id])
    if @ticket.seller_id == current_user.id
      @ticket.destroy
      redirect_to listings_user_path(current_user), notice: "Ticket deleted successfully."
    else
      redirect_to root_path, alert: "You're not authorized to delete this ticket."
    end
  end

  private

  def authorize_ticket_owner!
    ticket = Ticket.find(params[:id])
    unless ticket.seller_id == current_user.id
      redirect_to root_path, alert: "You are not authorized to do that."
    end
  end

  def ticket_params
    params.require(:ticket).permit(:price, :ticket_restrictions, :ticket_photo, :event_id)
  end

  def ensure_ticket_is_available
  @ticket = Ticket.find(params[:id])
  unless @ticket.status == "available"
    redirect_to listings_user_path(current_user), alert: "You can only edit or delete available tickets."
  end
end


end
