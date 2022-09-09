# frozen_string_literal: true

FactoryBot.define do
  key = Faker::Alphanumeric.alphanumeric(number: 10)

  factory :shortened_url, class: '::ShortenedUrl::Record' do
    key { key }
    shortened_url { Faker::Internet.url(path: "/#{key}") }
    original_url { Faker::Internet.url }
  end
end
