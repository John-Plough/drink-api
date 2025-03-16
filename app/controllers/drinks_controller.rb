class DrinksController < ApplicationController
  def index
    @drinks = Drink.all
    render :index
  end

  def create
    @drink = Drink.create(
      name: params[:name],
      color: params[:color]
    )
    render :show
  end

  def show
    @drink = Drink.find_by(id: params[:id])
    render :show
  end
end
