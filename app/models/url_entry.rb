# frozen_string_literal: true

class UrlEntry
  def initialize(id, key, shortened_url, url)
    @id = id
    @key = key
    @shortened_url = shortened_url
    @url = url
  end
end
