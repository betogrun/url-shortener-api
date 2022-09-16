require 'swagger_helper'

RSpec.describe 'api/v1/shortened_urls' do
  path '/api/v1/shortened_urls' do
    post 'Creates the shortened URL' do
      tags 'shortened url'
      consumes 'application/json'
      parameter(
        name: :params,
        in: :body, schema: {
          properties: {
            url: { type: :string }
          },
          required: ['url']
        }
      )

      before { |example| submit_request(example.metadata) }

      response 201, 'shortened url created' do
        let(:params) { { url: 'https://www.google.com'} }

        it 'creates a shortened url' do
          result = JSON.parse(response.body, symbolize_names: true)

          expect(result[:id]).not_to be_nil
          expect(result[:key]).to match(/[[:alnum:]]/)
          expect(result[:compact_url]).to match(URI::DEFAULT_PARSER.make_regexp)
          expect(result[:effective_url]).to eq('https://www.google.com')
        end
      end

      response 422, 'url is invalid' do
        let(:params) { { url: 'www.nope' } }

        it 'returns the invalid url error message' do
          result = JSON.parse(response.body, symbolize_names: true)

          expect(result[:url]).to eq('invalid url')
        end
      end
    end
  end
end
