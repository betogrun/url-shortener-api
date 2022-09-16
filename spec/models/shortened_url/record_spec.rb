# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShortenedUrl::Record, type: :model do
  subject { build(:shortened_url) }

  describe 'validations' do
    describe 'key' do
      it { is_expected.to validate_presence_of(:key) }
    end

    describe 'compact_url' do
      it { is_expected.to validate_presence_of(:compact_url) }
    end

    describe 'effective_url' do
      it { is_expected.to validate_presence_of(:effective_url) }
    end
  end
end
