class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  def self.search(search)
    where('lower(title) LIKE ?', '%' + sanitize_sql_like(search.downcase) + '%')
  end
end
