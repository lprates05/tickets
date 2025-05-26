class UsersController < ApplicationController
  before_action :set_user

  def listings
    if @user != current_user
      redirect_to root_path, alert: "You’re not authorized to view this page."
      return
    end

    @tickets = Ticket.where(seller_id: @user.id)
  end

  def purchases
    if @user != current_user
      redirect_to root_path, alert: "You’re not authorized to view this page."
      return
    end

    @tickets = Ticket.where(buyer_id: @user.id)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
