# frozen_string_literal: true

class ApplicationController < ActionController::API
  def encode_token(payload)
    JWT.encode(payload, 'my_secret')
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    return unless auth_header

    token = auth_header.split(' ')[1]
    begin
      JWT.decode(token, 'my_secret', true, algorithm: 'HS256')
    rescue JWT::DecodeError
      []
    end
  end

  def session_user
    decoded_hash = decoded_token
    return if decoded_hash.empty?

    user_id = decoded_hash[0]['user_id']
    @user = User.find_by(id: user_id)
  end
end
