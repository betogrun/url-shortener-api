# frozen_string_literal: true

class UrlEntry
  module Repository
    module_function

    BuildUrlEntry = ->(record) { ::UrlEntry.new(record.id, record.key, record.shortened_url, record.url) }
    private_constant :BuildUrlEntry

    def create(key:, shortened_url:, url:)
      Record
        .create({ key: key.value, shortened_url: shortened_url, url: url.value })
        .then(&BuildUrlEntry)
    end

    def generate_key
      key = nil
      Timeout.timeout(5) do
        loop do
          key = ::UrlEntry::Key.new
          break unless Record.exists?(key: key.value)
        end
      end

      key
    end
  end
end
