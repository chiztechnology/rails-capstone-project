class RecipeFoodsController < ApplicationController
  def index
    @food_recipes = RecipeFood.all
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @food_recipe = RecipeFood.new
    respond_to do |format|
      format.html { render :new, locals: { recipe: @recipe, food_recipe: @food_recipe } }
    end
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @food_recipe = RecipeFood.find(params[:id])
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @food_recipe = RecipeFood.new(strong_params)
    @food_recipe.recipe = @recipe
    respond_to do |format|
      if @food_recipe.save!
        format.html do
          flash[:success] = 'Food recipe saved successfully'
          redirect_to recipe_path(params[:recipe_id])
        end
      else
        format.html do
          flash.now[:error] = 'Error: Food recipe could not be saved'
          render :new, locals: { recipe: @recipe, food_recipe: @food_recipe }
        end
      end
    end
  end

  def update
    @food_recipe = RecipeFood.find(params[:id])

    begin
      @food_recipe.update!(modify_recipe_foods_param)
      flash[:notice] = 'You have updated the recipe food.'
    rescue ActiveRecord::RecordInvalid => e
      flash[:alert] = "Failed to update recipe food: #{e.message}"
    end

    redirect_to recipe_path(params[:recipe_id])
  end

  def destroy
    @food_recipe = RecipeFood.find(params[:id])

    begin
      @recipe = @food_recipe.recipe
      @food_recipe.destroy!
      flash[:notice] = 'You have deleted the recipe food.'
    rescue ActiveRecord::RecordNotFound => e
      flash[:alert] = "Failed to delete recipe food: #{e.message}"
    end

    redirect_to recipe_recipe_food_path(@recipe)
  end

  private

  def modify_recipe_foods_param
    params.require(:edit_food_recipe).permit(:quantity, :food_id)
  end

  def strong_params
    params.require(:food_recipe).permit(:quantity, :food_id)
  end
end
