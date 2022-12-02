class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  def self.search(search); end
end
