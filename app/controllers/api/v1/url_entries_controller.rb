# frozen_string_literal: true

module API
  module V1
    class UrlEntriesController < ApplicationController
      def create
        ::UrlEntry::Create
          .call(url: permitted_params[:url], domain_name: permitted_params[:domain_name])
          .on_success { |result| render_json(result[:url_entry], status: :created) }
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
    end
  end
end
