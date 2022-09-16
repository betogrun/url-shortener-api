# frozen_string_literal: true

class ShortenedUrl
  class Resolve < Micro::Case
    attribute :key, default: proc(&::ShortenedUrl::Key)
    attribute :repository, default: Repository

    def call!
      return Failure(:invalid_key) unless key.valid?

      shortened_url = repository.find_shortened_url(key: key)

      return Failure(:record_not_found) unless shortened_url

      Success(result: { effective_url: shortened_url.effective_url })
    end
  end
end
