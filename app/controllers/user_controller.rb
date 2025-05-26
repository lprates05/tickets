class UsersController < ApplicationController
  def listings
    @tickets = current_user.listings
  end

  def purchases
    @tickets = current_user.purchases
  end
end
