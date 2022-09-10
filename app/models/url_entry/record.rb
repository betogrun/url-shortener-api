# frozen_string_literal: true

class UrlEntry
  class Record < ApplicationRecord
    self.table_name = 'url_entries'

    validates :key, presence: true
    validates :shortened_url, presence: true
    validates :url, presence: true
  end
end
