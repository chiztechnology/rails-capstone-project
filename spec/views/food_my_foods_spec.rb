require 'rails_helper'

RSpec.describe 'foods/my_foods', type: :feature do
  include Warden::Test::Helpers

  before do
    @user = User.create(name: 'francisco', email: 'francisco@gmail.com', password: '123456',
                        password_confirmation: '123456')
    @user.skip_confirmation!
    @user.save
    login_as(@user, scope: :user)
    @food = Food.create(name: 'mango', measurement_unit: 'lbs', price: 1, quantity: 5, user: @user)
    @food2 = Food.create(name: 'cherry', measurement_unit: 'lbs', price: 1, quantity: 5, user: @user)
    visit my_foods_path(@user)
  end

  it 'displays food names' do
    expect(page).to have_content(@food.name)
    expect(page).to have_content(@food2.name)
  end

  it 'displays measurement units ' do
    expect(page).to have_content(@food.measurement_unit)
    expect(page).to have_content(@food2.measurement_unit)
  end

  it 'displays food prices ' do
    expect(page).to have_content(@food.price)
    expect(page).to have_content(@food2.price)
  end

  it 'displays food quantity ' do
    expect(page).to have_content(@food.quantity)
    expect(page).to have_content(@food2.quantity)
  end

  it 'displays a delete button for each food' do
    expect(page).to have_css("form[action='#{food_path(@food)}'][method='post']")
    expect(page).to have_button('Delete')
  end

  it 'displays a add food button' do
    expect(page).to have_link('Add Food', href: new_food_path)
  end
end
