# frozen_string_literal: true

FactoryBot.define do
  key = Faker::Alphanumeric.alphanumeric(number: 7)

  factory :shortened_url, class: '::ShortenedUrl::Record' do
    key { key }
    compact_url { Faker::Internet.url(path: "/#{key}") }
    effective_url { Faker::Internet.url }
  end
end
