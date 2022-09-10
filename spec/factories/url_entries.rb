# frozen_string_literal: true

FactoryBot.define do
  key = Faker::Alphanumeric.alphanumeric(number: 10)

  factory :url_entry, class: '::UrlEntry::Record' do
    key { key }
    shortened_url { Faker::Internet.url(path: "/#{key}") }
    url { Faker::Internet.url }
  end
end
