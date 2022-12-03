class Trend < ApplicationRecord
  validates :user_id, :query, presence: true

  def increment_query_count
    self.query_count += 1
    save
  end
end
