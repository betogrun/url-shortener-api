# frozen_string_literal: true

class UrlEntry
  class Key
    attr_reader :value

    def initialize(value = nil)
      @value = value || SecureRandom.alphanumeric(7)
    end

    def valid?
      /[:alnum:]/.match?(value) && value.size == 7
    end
  end
end
