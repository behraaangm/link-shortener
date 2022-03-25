class Link < ApplicationRecord
  validates :short_url, presence: true, uniqueness: true
  validates :original_url, presence: true

end
