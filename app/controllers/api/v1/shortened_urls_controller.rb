# frozen_string_literal: true

module API
  module V1
    class ShortenedUrlsController < ApplicationController
      def create
        ::ShortenedUrl::Create
          .call(effective_url: permitted_params[:url], domain_name: permitted_params[:domain_name])
          .on_success { |result| render_json(result[:shortened_url], status: :created) }
          .on_failure(:invalid_url) { |result| render_error(:url, result) }
          .on_failure(:key_gen_error) { |result| render_error(:key, result) }
      rescue ActionController::ParameterMissing => exception
        render(json: { error: exception.message}, status: :bad_request)
      end

      private

      def permitted_params
        params.permit(:url).with_defaults(domain_name: domain_name)
      end

      def domain_name
        return "#{request.protocol}#{request.host}" if request.port.blank?

        "#{request.protocol}#{request.host}:#{request.port}"
      end

      def render_json(data, status:)
        render(json: data.as_json, status: status)
      end

      def render_error(attribute, result)
        render(json: { attribute => result[:error] }, status: :unprocessable_entity)
      end
    end
  end
end
