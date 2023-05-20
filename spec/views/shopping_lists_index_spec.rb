require 'rails_helper'

RSpec.describe 'shopping lists/index', type: :feature do
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
    visit recipe_shopping_list_path(@recipe)
  end

  it 'displays ingredient names' do
    expect(page).to have_content(@food.name)
  end

  it 'displays the correct quantity for each ingredient' do
    expect(page).to have_content(@recipe_food.quantity)
  end

  it 'displays the total price of all ingredients' do
    expect(page).to have_content(number_to_currency(@food.price * @recipe_food.quantity))
  end
end
