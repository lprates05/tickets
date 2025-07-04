class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :authorize_user

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

  def profile
    @user = current_user
    @listed_tickets = @user.listings
    @purchased_tickets = @user.purchases
  end

  def show; end

  def edit; end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to my_profile_path, notice: "Profile updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end 


  private

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_user
    redirect_to root_path, alert: "Access denied." unless current_user == @user
  end

  def user_params
    params.require(:user).permit(:name, :bio, :class_year, :profile_photo, :password, :password_confirmation)

  end

end
