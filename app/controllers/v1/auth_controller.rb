# frozen_string_literal: true

module V1
  class AuthController < ApplicationController
    skip_before_action :authenticate!
    def create
      @user = User.find_by(username: login_params[:username])
      if @user
        time = Time.now + 24.hours.to_i
        token = JsonWebToken.encode({ user_id: @user.id }, time)
        render json: { token: token, exp: time.strftime('%d-%m-%Y %H:%M'),
                       username: @user.username }
      else
        render json: { error: 'unauthorized' }, status: :forbidden
      end
    end
    private
    def login_params
      params.permit(:username)
    end
  end
end
