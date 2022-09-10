# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UrlEntry::Record, type: :model do
  subject { build(:url_entry) }

  describe 'validations' do
    describe 'key' do
      it { is_expected.to validate_presence_of(:key) }
    end

    describe 'shortened_url' do
      it { is_expected.to validate_presence_of(:shortened_url) }
    end

    describe 'url' do
      it { is_expected.to validate_presence_of(:url) }
    end
  end
end
