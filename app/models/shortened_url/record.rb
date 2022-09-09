# frozen_string_literal: true

class ShortenedUrl
  class Record < ApplicationRecord
    self.table_name = 'shortened_urls'

    validates :key, presence: true
    validates :shortened_url, presence: true
    validates :original_url, presence: true
  end
end
