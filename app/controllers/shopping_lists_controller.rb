class ShoppingListsController < ApplicationController
  def index
    @recipes = current_user.recipes
    @total_missing_count = 0
    @total_missing_price = 0
    @missing_foods = []
    @recipe_foods = RecipeFood.where(recipes: @recipes)

    @recipe_foods.each do |recipe_food|
      missing_quantity = recipe_food.food.quantity - recipe_food.quantity
      @missing_foods << recipe_food
      @total_missing_count += 1
      @total_missing_price += missing_quantity * recipe_food.food.price
    end
  end
end
