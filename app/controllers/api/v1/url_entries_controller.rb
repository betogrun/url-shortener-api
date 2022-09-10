# frozen_string_literal: true

module API
  module V1
    class UrlEntriesController < ApplicationController
      def create
        render(json: { url: permitted_params[:url] }, status: :created)
      end

      private

      def permitted_params
        params.permit(:url)
      end
    end
  end
end
