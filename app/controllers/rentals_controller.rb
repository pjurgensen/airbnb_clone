class RentalsController < ApplicationController
  before_filter :find_rental, only: [:show, :edit, :update, :destroy]

  def index
    @rentals = Rental.all
    @search = params[:query]
    if @search == nil
      render('index.html.erb')
    else
      @search_results = Rental.basic_search(@search)
      render 'search.html.erb'
    end
  end

  def search
    @search_results = Rental.basic_search(@search)
  end

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.create(rental_params)
    if @rental.save
      # UserMailer.rental_created(current_user, @rental).deliver
      flash[:notice] = "Your rental was created successfully!"
      redirect_to rental_path(@rental)
    else
      flash[:alert] = "Your rental was not saved - please try again"
      render 'new'
    end
  end

  def show
    @reservation = Reservation.new
  end

  def edit
  end

  def update
    if @rental.update(rental_params)
      # UserMailer.rental_created(current_user, @rental).deliver
      flash[:notice] = "Your rental was updated successfully!"
      redirect_to rental_path(@rental)
    else
      flash[:alert] = "Your rental was not updated - please try again"
      render 'edit'
    end
  end

  def destroy
    @rental.destroy
    redirect_to user_path(current_user)
  end

private

  def rental_params
    params.require(:rental).permit(:title, :rental_type, :description, :location, :user_id)
  end

  def find_rental
    @rental = Rental.find(params[:id])
  end
end

