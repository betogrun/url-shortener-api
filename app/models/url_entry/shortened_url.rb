# frozen_string_literal: true

class UrlEntry
  class ShortenedUrl
    def initialize(host, key)
      @host = host
      @key = key
    end

    def value
      "#{host}/#{key}"
    end
  end
end
