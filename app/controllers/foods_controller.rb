class FoodsController < ApplicationController
  def index
    @foods = current_user.foods.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.create(food_params.merge(user_id: current_user.id))

    respond_to do |format|
      format.html do
        if @food.save
          redirect_to foods_path
        else
          redirect_to new_food_path
        end
      end
    end
  end

  def destroy
    @food = Food.find(params[:id])

    if @food.destroy
      flash[:notice] = 'Food deleted successfully.'
    else
      flash[:alert] = 'Failed to delete food.'
    end

    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
