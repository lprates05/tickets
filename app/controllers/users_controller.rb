class UsersController < ApplicationController
  before_action :set_user

  def listings
    @tickets = @user.listings
  end

  def purchases
    @tickets = @user.purchases
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end

