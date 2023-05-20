require 'rails_helper'

RSpec.describe 'foods/my_recipes', type: :feature do
  include Warden::Test::Helpers

  before do
    @user = User.create(name: 'francisco', email: 'francisco@gmail.com', password: '123456',
                        password_confirmation: '123456')
    @user.skip_confirmation!
    @user.save
    login_as(@user, scope: :user)
    @recipe = Recipe.create(user: @user, name: 'Lasagna', description: 'Steps to make great Lasagna',
                            preparation_time: 60, cooking_time: 45, public: true)
    @recipe2 = Recipe.create(user: @user, name: 'Pasta', description: 'Steps to make great Lasagna',
                             preparation_time: 60, cooking_time: 45, public: true)
    visit my_recipes_path(@user)
  end

  it 'displays recipe names' do
    expect(page).to have_content(@recipe.name)
    expect(page).to have_content(@recipe2.name)
  end

  it 'displays recipe description' do
    expect(page).to have_content(@recipe.description)
    expect(page).to have_content(@recipe2.description)
  end

  it 'displays a delete button for each recipe' do
    expect(page).to have_css("form[action='#{recipe_path(@recipe)}'][method='post']")
    expect(page).to have_button('Remove')
  end

  it 'displays a New Recipe button' do
    expect(page).to have_link('New Recipe', href: new_recipe_path)
  end
end
