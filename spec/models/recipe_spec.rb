require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { FactoryBot.create(:user) }

  describe 'validations' do
    it 'is valid with a name, preparation time, cooking time, and user_id' do
      recipe = Recipe.new(name: 'Test Recipe', preparation_time: 10, cooking_time: 20, description: 'tomato and pasta',
                          user_id: user.id)
      expect(recipe).to be_valid
    end

    it 'is invalid without a name' do
      recipe = Recipe.new(name: nil, preparation_time: 10, cooking_time: 20, user_id: user.id)
      expect(recipe).to_not be_valid
      expect(recipe.errors[:name]).to include("can't be blank")
    end

    it 'is invalid with a negative preparation time' do
      recipe = Recipe.new(name: 'Test Recipe', preparation_time: -10, cooking_time: 20, user_id: user.id)
      expect(recipe).to_not be_valid
      expect(recipe.errors[:preparation_time]).to include('must be greater than or equal to 0')
    end

    it 'is invalid with a negative cooking time' do
      recipe = Recipe.new(name: 'Test Recipe', preparation_time: 10, cooking_time: -20, user_id: user.id)
      expect(recipe).to_not be_valid
      expect(recipe.errors[:cooking_time]).to include('must be greater than or equal to 0')
    end

    it 'is invalid without a user_id' do
      recipe = Recipe.new(name: 'Test Recipe', preparation_time: 10, cooking_time: 20, user_id: nil)
      expect(recipe).to_not be_valid
    end
  end
end
