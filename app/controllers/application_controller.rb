class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :error_404

  private

  def error_404
    render 'application/error_404', status: 404
  end
end
