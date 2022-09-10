require 'swagger_helper'

RSpec.describe 'api/v1/url_entries', type: :request do
  path '/api/v1/url_entries' do
    post 'Creates an URL entry with the shortened and the original URL' do
      tags 'url entry'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          url: { type: :string }
        },
        required: ['url']
      }

      before { |example| submit_request(example.metadata) }

      response 201, 'url entry created' do
        let(:params) { { url: 'https://www.google.com' } }

        it 'creates an url entry' do
          result = JSON.parse(response.body, symbolize_names: true)

          expect(result[:url]).to eq('https://www.google.com')
        end
      end
    end
  end
end
