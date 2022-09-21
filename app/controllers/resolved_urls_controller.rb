# frozen_string_literal: true

class ResolvedUrlsController < ApplicationController
  def show
    ShortenedUrl::Resolve.call(key: permitted_params[:key])
      .on_success { |result| redirect_to(result[:effective_url], allow_other_host: true) }
      .on_failure(:invalid_key) { render_error('invalid_key', status: :unprocessable_entity) }
      .on_failure(:record_not_found) { render_error('not_found', status: :not_found) }
  end

  private

  def permitted_params
    params.permit(:key)
  end

  def render_error(resource, status:)
    send_file(Rails.public_path.join("#{resource}.html"), type: 'text/html; charset=utf-8', status: status)
  end
end
