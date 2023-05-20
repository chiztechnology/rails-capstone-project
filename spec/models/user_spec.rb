require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: 'francisco', email: 'francisco@gmail.com', encrypted_password: '123456')
    @food = Food.new(name: 'mango', measurement_unit: 'lbs', price: 1, quantity: 5, user: @user)
    @recipe = Recipe.new(user: @user, name: 'Lasagna', description: 'Steps to make great Lasagna',
                         preparation_time: 60, cooking_time: 45, public: true)
    @recipe_food = RecipeFood.new(quantity: 1, recipe: @recipe, food: @food)
    @user.save
  end

  context 'Association tests' do
    it 'Should have many recipes' do
      @user = User.reflect_on_association(:recipes)
      expect(@user.macro).to eq(:has_many)
    end

    it 'Should have many foods' do
      @user = User.reflect_on_association(:foods)
      expect(@user.macro).to eq(:has_many)
    end
  end
end
