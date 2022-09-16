# frozen_string_literal: true

class ShortenedUrl
  class Record < ApplicationRecord
    self.table_name = 'shortened_urls'

    validates :key, presence: true
    validates :compact_url, presence: true
    validates :effective_url, presence: true
  end
end
