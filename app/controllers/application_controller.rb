class ApplicationController < ActionController::Base
  include Response
  include ExceptionHandler
  before_action :authenticate!

  private

  # rubocop:disable Lint/DuplicateBranch
  def authenticate!
    header = request.headers['Authorization']
    header = header.split.last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
  # rubocop:enable Lint/DuplicateBranch
end
