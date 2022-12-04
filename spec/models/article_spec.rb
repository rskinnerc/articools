require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'is valid with valid attributes' do
    article = Article.new(title: 'Title', body: 'Text')
    expect(article).to be_valid
  end

  it 'is not valid without a title' do
    article = Article.new(title: nil)
    expect(article).to_not be_valid
  end

  it 'is not valid without a body' do
    article = Article.new(body: nil)
    expect(article).to_not be_valid
  end

  it 'should have a search method' do
    expect(Article).to respond_to(:search)
  end

  it 'should return articles that match the search term' do
    findable = Article.create(title: 'Title', body: 'Text')
    not_findable = Article.create(title: 'Something', body: 'Something text')

    expect(Article.search('Title')).to include(findable)
    expect(Article.search('Title')).to_not include(not_findable)
    expect(Article.search('not expected')).to_not include(findable)
  end
end
