# frozen_string_literal: true

class ShortenedUrl
  class CompactUrl
    def initialize(key, domain_name)
      @key = key
      @domain_name = domain_name
    end

    def value
      "#{@domain_name}/#{@key.value}"
    end
  end
end
