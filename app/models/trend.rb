class Trend < ApplicationRecord
  validates :user_id, :query, presence: true

  after_create_commit { broadcast_prepend_to user_id, target: :trends }
  after_update_commit { broadcast_replace_to user_id, target: "trend_#{id}" }

  def increment_query_count
    self.query_count += 1
    save
  end
end
