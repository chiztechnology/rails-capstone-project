require 'rails_helper'

RSpec.describe 'recipes/show', type: :feature do
  include Warden::Test::Helpers

  before do
    @user = User.create(name: 'francisco', email: 'francisco@gmail.com', password: '123456',
                        password_confirmation: '123456')
    @user.skip_confirmation!
    @user.save
    login_as(@user, scope: :user)
    @food = Food.create(name: 'mango', measurement_unit: 'lbs', price: 1, quantity: 5, user: @user)
    @recipe = Recipe.create(user: @user, name: 'Lasagna', description: 'Steps to make great Lasagna',
                            preparation_time: 60, cooking_time: 45, public: true)
    @recipe_food = RecipeFood.create(quantity: 1, recipe: @recipe, food: @food)
    visit recipe_path(@recipe)
  end

  it 'displays ingredient names' do
    expect(page).to have_content(@food.name)
  end

  it 'displays ingredient price' do
    expect(page).to have_content(@food.price)
  end

  it 'displays recipe info' do
    expect(page).to have_content(@recipe.name)
    expect(page).to have_content(@recipe.preparation_time)
    expect(page).to have_content(@recipe.description)
    expect(page).to have_content(@recipe.cooking_time)
    expect(page).to have_checked_field('public')
  end

  it 'displays a add ingredient button' do
    expect(page).to have_link('Add Ingredients', href: new_recipe_recipe_food_path(@recipe))
  end

  it 'displays a generate shopping list button' do
    expect(page).to have_link('Generate Shopping List', href: recipe_shopping_list_path(@recipe))
  end

  it 'displays a modify button for each ingredient' do
    expect(page).to have_link('Modify', href: edit_recipe_recipe_food_path(@recipe, @recipe_food))
  end

  it 'displays a modify button for each ingredient' do
    expect(page).to have_link('Remove', href: recipe_recipe_food_path(@recipe, @recipe_food))
  end
end
