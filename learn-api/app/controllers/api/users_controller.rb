# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    def index
      users = User.all
      render json: { data: users }, status: :ok
    end

    def show
      username = params[:id]
      user = User.find_by(username: username)
      if user
        render json: { status: 'ok', message: 'Loaded User', data: user }, status: :ok
      else
        render json: { status: 500, message: 'User not found' }, status: :not_found
      end
    end

    def create
      user = User.new(user_params)
      if user.save
        payload = { user_id: user.id }
        token = encode_token(payload)
        render json: { data: token }, status: :ok
      else
        render json: { data: user.errors }, status: :not_found
      end
    end

    # def fav
    #   user = User.find_by(username: params[:id])
    #   courses = user.favorite_courses
    #   if courses.length.positive?
    #     render json: { status: 'SUCCESS', data: courses }, status: :ok
    #   else
    #     render json: { status: 'SUCCESS', data: 'No Favorite courses' }, status: :ok
    #   end
    # end

    private

    def user_params
      params.permit(:username, :password, :password_confirmation)
    end
  end
end
