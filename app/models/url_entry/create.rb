# frozen_string_literal: true

class UrlEntry
  class Create < Micro::Case
    attribute :url, default: proc(&::UrlEntry::Url)
    attribute :domain_name
    attribute :repository, default: Repository

    def call!
      return Failure(:invalid_url, result: { error: 'invalid url' }) unless url.valid?

      key = repository.generate_key
      url_entry = repository.create(key: key, shortened_url: "#{domain_name}/#{key.value}", url: url)

      Success(result: { url_entry: url_entry })
    end
  end
end
