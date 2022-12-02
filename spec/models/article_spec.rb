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
end
