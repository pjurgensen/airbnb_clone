class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @rentals = Rental.where(user_id: @user.id)
  end

end
