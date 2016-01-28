class SessionsController < ApplicationController

  def create
    user_email    = params[:user][:email]
    user_password = params[:user][:password]

    user          = user_email.present? && User.find_by(email: user_email)

    if user.present? && user.valid_password?(user_password)
      user.generate_auth_token
      user.save
      render json: user, show_auth_token: true, status: 200
    else
      render json: { errors: 'Invalid email or password' }, status: 422
    end
  end


  def destroy
    user = User.find_by(auth_token: params[:id])
    user.generate_auth_token
    user.save
    head 204
  end

end
