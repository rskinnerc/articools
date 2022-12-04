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
      expect(page).to have_selector('.article', count: 3)
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

    it 'updates the trends list when a user submits a search by blurring from the query input' do
      visit root_path
      sleep 0.3
      fill_in 'query', with: 'Something Else'
      find('h1').click
      fill_in 'query', with: ''
      expect(page).to have_content('Something Else', count: 1)
    end

    it 'updates a trend\'s count when a user submits te same query twice' do
      visit root_path
      sleep 0.3
      fill_in 'query', with: 'Something Else'
      find('h1').click
      fill_in 'query', with: ''
      expect(page).to have_content('You searched 1 times', count: 1)
      fill_in 'query', with: 'Something Else'
      find('h1').click
      fill_in 'query', with: ''
      expect(page).to have_content('You searched 2 times', count: 1)
    end

    it 'keeps the user\'s trends list when the user refreshes the page' do
      visit root_path
      sleep 0.3
      fill_in 'query', with: 'Something Else'
      find('h1').click
      fill_in 'query', with: ''
      expect(page).to have_content('Something Else', count: 1)
      visit root_path
      expect(page).to have_content('Something Else', count: 1)
    end
  end
end
