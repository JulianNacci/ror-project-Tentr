class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :edit, :update]
  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(attr_restaurants)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def attr_restaurants
    params.require(:restaurant).permit(:name, :phone_number, :address, :category)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
