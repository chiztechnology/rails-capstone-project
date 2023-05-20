require 'rails_helper'

RSpec.feature 'Recipe show page', type: :feature do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user:, public: false) }
  let(:food) { create(:food, name: 'milk', user:) }

  before do
    sign_in user
    visit recipe_path(recipe)
  end

  scenario 'User can view recipe details' do
    expect(page).to have_content(recipe.name)
    expect(page).to have_content("Preparation time: #{recipe.preparation_time} hour")
    expect(page).to have_content("Cooking time: #{recipe.cooking_time} hour")
    expect(page).to have_content(recipe.description)
  end

  scenario 'User can toggle recipe privacy' do
    expect(page).to have_content('Make Public')
  end

  scenario 'User can toggle recipe shopping tag' do
    expect(page).to have_content('Generate Shopping List')
  end

  scenario 'User can delete recipe food' do
    recipe_food = create(:recipe_food, recipe:, quantity: 1, food:)
    visit recipe_path(recipe)

    expect(page).to have_content(recipe_food.food.name)
    expect(page).to have_content('Delete')
  end
end
