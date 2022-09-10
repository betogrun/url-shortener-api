require 'swagger_helper'

RSpec.describe 'api/v1/url_entries', type: :request do
  path '/api/v1/url_entries' do
    post 'Creates a shortned url' do
      tags 'url entry'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          url: { type: :string }
        },
        required: ['url']
      }

      response 201, 'url entry created' do
        let(:params) { { url: 'https://www.google.com' } }

        before do |example|
          submit_request(example.metadata)
        end

        it 'creates an url entry' do
          result = JSON.parse(response.body, symbolize_names: true)

          expect(result[:url]).to eq('https://www.google.com')
        end
      end
    end
  end
end
