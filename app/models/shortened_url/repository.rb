# frozen_string_literal: true

class ShortenedUrl
  module Repository
    module_function

    BuildShortenedUrl = ->(record) do
      ::ShortenedUrl.new(record.id, record.key, record.compact_url, record.effective_url)
    end
    private_constant :BuildShortenedUrl

    def create(key:, compact_url:, effective_url:)
      Record
        .create({ key: key.value, compact_url: compact_url.value, effective_url: effective_url.value })
        .then(&BuildShortenedUrl)
    end

    def generate_key
      key = nil
      Timeout.timeout(5) do
        loop do
          key = ::ShortenedUrl::Key.new
          break unless Record.exists?(key: key.value)
        end
      end

      key
    rescue Timeout::Error
      nil
    end
  end
end
