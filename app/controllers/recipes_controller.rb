class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    @food_recipe = RecipeFood.where(recipe_id: @recipe.id).includes([:food])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(public: !@recipe.public)
    redirect_to recipe_path(@recipe)
  end

  def toggle_shopping_tag
    @recipe = Recipe.find(params[:id])
    @recipe.toggle_shopping_tag!
    redirect_to recipe_path(@recipe)
  end

  def create
    @recipe = Recipe.create(recipe_params.merge(user_id: current_user.id))

    respond_to do |format|
      format.html do
        if @recipe.save
          redirect_to recipes_path
        else
          redirect_to new_recipe_path
        end
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    begin
      @recipe.destroy!
      flash[:notice] = 'Recipe deleted successfully.'
    rescue ActiveRecord::RecordNotFound => e
      flash[:alert] = "Failed to delete recipe: #{e.message}"
    end

    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end
end
