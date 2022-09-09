# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShortenedUrl::Record, type: :model do
  subject { build(:shortened_url) }

  describe 'validations' do
    describe 'key' do
      it { is_expected.to validate_presence_of(:key) }
    end

    describe 'shortened_url' do
      it { is_expected.to validate_presence_of(:shortened_url) }
    end

    describe 'original_url' do
      it { is_expected.to validate_presence_of(:original_url) }
    end
  end
end
