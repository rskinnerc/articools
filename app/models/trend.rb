class Trend < ApplicationRecord
  validates :user_id, :query, presence: true
end
