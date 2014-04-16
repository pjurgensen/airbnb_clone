class UsersController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def home
  end

  def show

  end

private
  def set_question
    @user = User.find(params[:id])
  end
end
