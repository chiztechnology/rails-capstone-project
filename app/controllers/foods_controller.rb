class FoodsController < ApplicationController
  # GET /foods
  def index
    @foods = Food.all
  end

  # GET /foods/1
  def show
    @food = Food.find(params[:id])
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.new(food_params)
    respond_to do |f|
      if @food.save
        f.html { redirect_to my_foods_path, notice: 'Food was successfully added' }
      else
        f.html { render :new }
      end
    end
  end

  def destroy
    @food = Food.find(params[:id]).destroy
    respond_to do |f|
      f.html { redirect_to my_foods_path, notice: 'Food was successfully removed' }
    end
  end

  def my_foods
    @foods = current_user.foods.includes(:user)
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
