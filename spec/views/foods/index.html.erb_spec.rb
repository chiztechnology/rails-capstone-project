require 'rails_helper'

RSpec.feature 'Food show page', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
    visit foods_path
  end

  scenario 'Displays Food List' do
    expect(page).to have_content('Create Food')
    expect(page).to have_content('No Food Added')
  end
end
