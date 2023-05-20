require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @user = User.create(name: 'francisco', email: 'francisco@gmail.com', encrypted_password: '123456')
    @food = Food.new(name: 'mango', measurement_unit: 'lbs', price: 1, quantity: 5, user: @user)
    @recipe = Recipe.new(user: @user, name: 'Lasagna', description: 'Steps to make great Lasagna',
                         preparation_time: 60, cooking_time: 45, public: true)
    @recipe_food = RecipeFood.new(quantity: 1, recipe: @recipe, food: @food)
  end

  context 'Validation tests' do
    it 'Validation should be successful' do
      expect(@food).to be_valid
    end

    it 'Food should have a name' do
      expect(@food.name).to be_present
    end

    it 'Food should have a measurement unit' do
      expect(@food.measurement_unit).to be_present
    end

    it 'Food should have a price' do
      expect(@food.price).to be_present
    end

    it 'Food should have a valid price' do
      expect(@food.price).to be >= 0
    end

    it 'Food price should be numeric' do
      expect(@food.price).to be_a_kind_of(Numeric)
    end

    it 'Food should have a quantity' do
      expect(@food.quantity).to be_present
    end

    it 'Food quantity should be numeric' do
      expect(@food.quantity).to be_a_kind_of(Numeric)
    end

    it 'Food should have a valid quantity' do
      expect(@food.quantity).to be >= 0
    end

    it 'Food should have a user' do
      expect(@food.user).to be_present
    end
  end

  context 'Association tests' do
    it 'Food should belong to a user' do
      @food = Food.reflect_on_association(:user)
      expect(@food.macro).to eq(:belongs_to)
    end

    it 'Food should have many RecipeFoods' do
      @food = Food.reflect_on_association(:recipe_foods)
      expect(@food.macro).to eq(:has_many)
    end
  end
end
