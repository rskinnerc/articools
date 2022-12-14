require 'rails_helper'

RSpec.describe Trend, type: :model do
  it 'is valid with valid attributes' do
    trend = Trend.new(user_id: 'userid', query: 'query')
    expect(trend).to be_valid
  end

  it 'is not valid without a user_id' do
    trend = Trend.new(user_id: nil, query: 'query')
    expect(trend).to_not be_valid
  end

  it 'is not valid without a query' do
    trend = Trend.new(user_id: 'userid', query: nil)
    expect(trend).to_not be_valid
  end

  it 'should have a query_count that defaults to 0' do
    trend = Trend.new(user_id: 'userid', query: 'query')
    expect(trend.query_count).to eq(0)
  end
end
