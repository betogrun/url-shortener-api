# frozen_string_literal: true

class ShortenedUrl
  class Key
    attr_reader :value

    def initialize(value = nil)
      @value = value || "#{SecureRandom.alphanumeric(6)}#{rand(1..9)}"
    end

    def self.to_proc
      ->(value) { new(value) }
    end

    def valid?
      /[[:alnum:]]/.match?(value) && value.size == 7
    end
  end
end
