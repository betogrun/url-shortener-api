# frozen_string_literal: true

class ShortenedUrl
  attr_reader :id, :key, :compact_url, :effective_url

  def initialize(id, key, compact_url, effective_url)
    @id = id
    @key = key
    @compact_url = compact_url
    @effective_url = effective_url
  end
end
