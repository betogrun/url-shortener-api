# frozen_string_literal: true

class ShortenedUrl
  class Create < Micro::Case
    attribute :effective_url, default: proc(&::ShortenedUrl::EffectiveUrl)
    attribute :domain_name
    attribute :repository, default: Repository

    def call!
      validate_effective_url
        .then(:generate_key)
        .then(:persist_shortened_url)
    end

    private

    def validate_effective_url
      return Success() if effective_url.valid?

      Failure(:invalid_url, result: { error: 'invalid url' })
    end

    def generate_key
      key = repository.generate_key

      return Success(result: { key: key }) if key

      Failure(:key_gen_error, result: { error: 'key generation error' })
    end

    def persist_shortened_url(key:, **)
      shortened_url = repository
        .create(key: key, compact_url: CompactUrl.new(key, domain_name), effective_url: effective_url)

      Success(result: { shortened_url: shortened_url })
    end
  end
end
