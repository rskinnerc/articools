require 'rails_helper'

RSpec.describe 'Searches', type: :system do
  before do
    driven_by(:selenium)
  end

  describe 'GET /' do
    it 'renders the index template' do
      visit root_path
      expect(page).to have_content('Articools')
    end

    it 'renders the latest 3 articles' do
      4.times { Article.create(title: 'Title', body: 'Text') }
      visit root_path
      expect(page).to have_selector('.article', count: 3)
    end

    it 'renders the search form' do
      visit root_path
      expect(page).to have_selector('form')
    end

    it 'renders the search results' do
      2.times { Article.create(title: 'Title', body: 'Text') }
      2.times { Article.create(title: 'Test', body: 'Text') }

      visit root_path
      fill_in 'query', with: 'Title', wait: 5
      expect(page).to have_selector('.result', count: 2)
    end
  end
end
