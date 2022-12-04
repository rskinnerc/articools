require 'rails_helper'

RSpec.describe 'Searches', type: :system do
  fixtures :articles
  before do
    driven_by(:selenium_chrome_headless)
  end

  describe 'GET /' do
    it 'renders the index template' do
      visit root_path
      expect(page).to have_content('Articools')
    end

    it 'renders the latest 3 articles' do
      visit root_path
      expect(page).to have_selector('.article', count: 2)
    end

    it 'renders the search form' do
      visit root_path
      expect(page).to have_selector('form')
    end

    it 'renders the search results when the user types' do
      visit root_path
      sleep 0.3
      fill_in 'query', with: 'Second'
      expect(page).to have_selector('.result', count: 1)
    end

    it 'renders the search results when the user types two different strings' do
      visit root_path
      sleep 0.3
      fill_in 'query', with: 'First'
      expect(page).to have_selector('.result', count: 1)
      sleep 0.3
      fill_in 'query', with: 'Second'
      expect(page).to have_selector('.result', count: 1)
    end
  end
end
